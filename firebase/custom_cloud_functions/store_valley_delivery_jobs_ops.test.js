const jobs = require("./store_valley_delivery_jobs.js");
const {
  enqueueWarehouseDelivery,
  enqueueCustomDeliveries,
  processDeliveryJob,
} = require("./store_valley_delivery_jobs_ops.js");

function assertEqual(actual, expected, label) {
  if (actual !== expected) {
    throw new Error(label + ": expected " + JSON.stringify(expected) + " got " + JSON.stringify(actual));
  }
}

class MemoryDb {
  constructor() {
    this.docs = new Map();
    this.auto = 0;
  }

  doc(path) {
    const db = this;
    return {
      path,
      id: path.split("/").pop(),
      async get() {
        const data = db.docs.get(path);
        return {
          exists: data != null,
          id: path.split("/").pop(),
          ref: db.doc(path),
          data: () => (data ? { ...data } : undefined),
          get: (field) => (data ? data[field] : undefined),
        };
      },
      async set(data, opts) {
        const prev = db.docs.get(path) || {};
        db.docs.set(
          path,
          opts && opts.merge ? Object.assign({}, prev, data) : { ...data },
        );
      },
      async update(data) {
        const prev = db.docs.get(path);
        if (!prev) {
          throw new Error("missing " + path);
        }
        const next = Object.assign({}, prev);
        Object.keys(data).forEach((key) => {
          const value = data[key];
          if (value && value._arrayUnion) {
            next[key] = (prev[key] || []).concat(value._arrayUnion);
          } else {
            next[key] = value;
          }
        });
        db.docs.set(path, next);
      },
    };
  }

  collection(name) {
    const db = this;
    return {
      doc(id) {
        return db.doc(name + "/" + id);
      },
      async add(data) {
        db.auto += 1;
        const ref = db.doc(name + "/auto" + db.auto);
        await ref.set(data);
        return ref;
      },
      where(field, _op, value) {
        return {
          limit() {
            return this;
          },
          async get() {
            const docs = [];
            for (const [path, data] of db.docs.entries()) {
              if (path.startsWith(name + "/") && data[field] === value) {
                docs.push({
                  id: path.split("/").pop(),
                  exists: true,
                  ref: db.doc(path),
                  data: () => ({ ...data }),
                  get: (key) => data[key],
                });
              }
            }
            return { empty: docs.length === 0, docs };
          },
        };
      },
    };
  }

  async runTransaction(fn) {
    const tx = {
      get: (ref) => ref.get(),
      update: (ref, data) => ref.update(data),
      set: (ref, data, opts) => ref.set(data, opts),
    };
    return fn(tx);
  }
}

function fakeSv(getBody) {
  const calls = [];
  return {
    calls,
    async request(opts) {
      calls.push(opts);
      if (opts.method === "GET") {
        if (getBody) {
          return { status: 200, body: getBody };
        }
        return { status: 404, body: {} };
      }
      if (opts.path === "/orders") {
        return {
          status: 200,
          body: {
            order_id: "SV-WH-1",
            client_order_id: opts.body.client_order_id,
            status: "pending",
            original_source_location_id: "WH-KWT-MAIN",
            inventory_source: "warehouse",
          },
          pickup_otp: "461832",
        };
      }
      return {
        status: 200,
        body: {
          request_id: "SV-PKP-1",
          delivery_order_id: "SV-DEL-1",
          external_request_id: opts.body.external_request_id,
          status: "pending",
        },
      };
    },
  };
}

(async () => {
  const db = new MemoryDb();
  const order = {
    order_id: "ORD1",
    payment_status: "CAPTURED",
    customer_id: "cust1",
    inventory_reservation_status: "reserved",
    shipping_address: {
      address_line1: "Gulf Road",
      city: "Salmiya",
      shipping_name: "Customer",
      shipping_phone: "+96550000000",
      shipping_email: "c@example.com",
    },
    order_items: {
      cart_items: [
        {
          product_id: "AZYPRD1122",
          quantity: 1,
          product_main_type: "ready",
          product_stock_info: { is_preferred_vendor: true },
        },
        {
          product_id: "CUSTOM1",
          quantity: 1,
          product_main_type: "custom",
          product_designer_id: "uidA",
          product_pickup_info: {
            status: "Ready to Pickup",
            pickup_address: {
              address_line1: "Street 10",
              city: "Kuwait City",
              shipping_name: "Designer",
              shipping_phone: "+96550000001",
            },
          },
        },
      ],
    },
  };
  await db.doc("orders/ord1").set(order);
  await db.doc("store_valley_inventory/AZYPRD1122_WH-KWT-MAIN").set({
    product_id: "AZYPRD1122",
    sku: "AZY-DSN0001-DRESS-RED-M",
    designer_id: "DSN-KWT-0001",
    warehouse_id: "WH-KWT-MAIN",
  });
  await db.doc("users/uidA").set({
    designer_main_info: {
      designer_id: "DSN-KWT-0001",
      designer_pickup_address: {
        address_line1: "Street 10",
        city: "Kuwait City",
        shipping_name: "Designer",
        shipping_phone: "+96550000001",
      },
    },
  });

  await enqueueWarehouseDelivery(db, db.doc("orders/ord1"));
  await enqueueWarehouseDelivery(db, db.doc("orders/ord1"));
  const rm = (await db.doc("store_valley_delivery_jobs/ORD1-RM").get()).data();
  assertEqual(rm.status, jobs.STATUS.QUEUED, "warehouse job queued once");

  const sv = fakeSv();
  const processed = await processDeliveryJob(db, "ORD1-RM", { sv });
  assertEqual(processed.ok, true, "warehouse process ok");
  assertEqual(
    sv.calls.filter((call) => call.method === "POST").length,
    1,
    "one warehouse POST",
  );
  const post = sv.calls.find((call) => call.method === "POST");
  assertEqual(post.path, "/orders", "posts warehouse orders");
  assertEqual(post.body.items[0].sku, "AZY-DSN0001-DRESS-RED-M", "sku from inventory");
  const afterRm = (await db.doc("orders/ord1").get()).data();
  assertEqual(afterRm.ready_shipping_request_status, "REQUESTED", "ready status requested");
  assertEqual(processed.shouldReleaseShipped, true, "release shipped after warehouse accept");
  const warehouseLogistics = [...db.docs.entries()]
    .filter(([path]) => path.startsWith("logistics_response/"))
    .map(([, data]) => data)
    .find((data) => data.swftTrackID === "SV-WH-1");
  assertEqual(
    warehouseLogistics && warehouseLogistics.original_source_location_id,
    "WH-KWT-MAIN",
    "warehouse snapshot keeps original_source_location_id",
  );
  assertEqual(
    warehouseLogistics && warehouseLogistics.inventory_source,
    "warehouse",
    "warehouse snapshot keeps inventory_source",
  );
  assertEqual(
    warehouseLogistics && warehouseLogistics.pickup_otp,
    undefined,
    "warehouse snapshot does not carry the code",
  );
  assertEqual(
    warehouseLogistics && warehouseLogistics.has_code,
    true,
    "warehouse snapshot says a code exists",
  );
  assertEqual(
    warehouseLogistics && warehouseLogistics.otp_email,
    undefined,
    "warehouse snapshot carries no contact details",
  );
  assertEqual(
    afterRm.delivery_info_list[0].pickup_otp,
    undefined,
    "order delivery_info_list does not carry the code",
  );
  assertEqual(
    afterRm.delivery_info_list[0].has_code,
    true,
    "order delivery_info_list says a code exists",
  );
  const privateCode = (await db.doc("store_valley_codes/SV-WH-1").get()).data();
  assertEqual(privateCode && privateCode.code, "461832", "code is kept in the private store");
  assertEqual(privateCode && privateCode.otp_type, "delivery", "private record keeps the code type");
  assertEqual(privateCode && privateCode.phone, "+96550000000", "private record keeps who it was sent to");
  assertEqual(privateCode && privateCode.client_order_id, "ORD1-RM", "private record keeps the reference");
  assertEqual(privateCode && privateCode.delivery_order_id, "SV-WH-1", "private record keeps the delivery id");

  const svGet = fakeSv({
    order_id: "EXISTING",
    client_order_id: "ORD1-RM",
    status: "pending",
  });
  await db.doc("store_valley_delivery_jobs/ORD1-RM").set({
    kind: jobs.KIND.WAREHOUSE,
    status: jobs.STATUS.QUEUED,
    order_id: "ORD1",
    client_order_id: "ORD1-RM",
    attempts: 0,
  });
  await processDeliveryJob(db, "ORD1-RM", { sv: svGet });
  assertEqual(
    svGet.calls.filter((call) => call.method === "POST").length,
    0,
    "GET hit skips POST",
  );

  await enqueueCustomDeliveries(db, db.doc("orders/ord1"));
  const cm = (await db.doc("store_valley_delivery_jobs/ORD1-CM-uidA").get()).data();
  assertEqual(cm.status, jobs.STATUS.QUEUED, "custom job queued");
  const svPkp = fakeSv();
  const cmResult = await processDeliveryJob(db, "ORD1-CM-uidA", { sv: svPkp });
  assertEqual(cmResult.ok, true, "custom process ok");
  assertEqual(cmResult.shouldReleaseShipped, false, "custom does not release warehouse");
  const pkpPost = svPkp.calls.find((call) => call.method === "POST");
  assertEqual(pkpPost.path, "/pickup-requests", "posts pickup-requests");
  assertEqual(
    pkpPost.body.pickup_purpose,
    "custom_made_fulfillment",
    "custom pickup purpose",
  );
  const afterCm = (await db.doc("orders/ord1").get()).data();
  assertEqual(afterCm.custom_shipping_request_status, "REQUESTED", "custom status requested");
  const tracked = afterCm.order_items.cart_items.find((item) => item.product_id === "CUSTOM1");
  assertEqual(tracked.product_pickup_info.status, "processing", "item processing");
  assertEqual(
    tracked.product_pickup_info.delivery_tracking_id,
    "SV-DEL-1",
    "item tracking is delivery_order_id",
  );

  console.log("store_valley_delivery_jobs_ops.test.js ok");
})().catch((error) => {
  console.error(error);
  process.exit(1);
});
