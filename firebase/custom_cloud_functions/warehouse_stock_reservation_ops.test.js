const logic = require("./warehouse_stock_reservation.js");
const {
  reserveOrder,
  releaseOrder,
  syncAvailableForOrder,
} = require("./warehouse_stock_reservation_ops.js");

function assertEqual(actual, expected, label) {
  if (actual !== expected) {
    throw new Error(label + ": expected " + expected + " got " + actual);
  }
}

class MemoryDb {
  constructor() {
    this.docs = new Map();
  }

  doc(path) {
    const db = this;
    return {
      path,
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
        db.docs.set(path, Object.assign({}, prev, data));
      },
    };
  }

  collection(name) {
    const db = this;
    return {
      doc(id) {
        return db.doc(name + "/" + id);
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
                  id: path.split("/")[1],
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

async function seed() {
  const db = new MemoryDb();
  await db.doc("inventory/inv1").set({
    product_id: "AZYPRD1122",
    inventory_id: "INV1",
    stock_reserved: 0,
    stock_unavailable: 0,
    available_for_order: 1,
  });
  await db.doc("store_valley_inventory/AZYPRD1122_WH-KWT-MAIN").set({
    product_id: "AZYPRD1122",
    warehouse_id: "WH-KWT-MAIN",
    stored_quantity: 1,
    available: 1,
  });
  const order = {
    payment_status: "CAPTURED",
    order_items: {
      cart_items: [
        {
          product_id: "AZYPRD1122",
          quantity: 1,
          product_main_type: "ready",
          product_stock_info: {
            is_preferred_vendor: true,
            inventory_id: "INV1",
            inventory_ref: "inventory/inv1",
          },
        },
      ],
    },
  };
  await db.doc("orders/ord1").set({ ...order });
  await db.doc("orders/ord2").set({ ...order });
  return db;
}

(async () => {
  const db = await seed();
  const first = await reserveOrder(db, db.doc("orders/ord1"));
  assertEqual(first.ok, true, "first reserve ok");
  const invAfterFirst = (await db.doc("inventory/inv1").get()).data();
  assertEqual(invAfterFirst.stock_reserved, 1, "reserved after first");
  assertEqual(invAfterFirst.available_for_order, 0, "sellable after first");

  const second = await reserveOrder(db, db.doc("orders/ord2"));
  assertEqual(second.ok, false, "second reserve refused");
  assertEqual(second.code, "out_of_stock", "second out of stock");
  const failedStatus = (await db.doc("orders/ord2").get()).data();
  assertEqual(
    failedStatus.inventory_reservation_status,
    logic.STATUS.STOCK_FAILED,
    "second marked stock_failed",
  );

  const shipped = await releaseOrder(db, db.doc("orders/ord1"), {
    reason: "shipped",
    productIds: ["AZYPRD1122"],
  });
  assertEqual(shipped.ok, true, "ship release ok");
  const invAfterShip = (await db.doc("inventory/inv1").get()).data();
  assertEqual(invAfterShip.stock_reserved, 0, "reserved released on ship");
  assertEqual(
    invAfterShip.available_for_order,
    0,
    "ship does not restore sellable before webhook",
  );

  const cancelAfterShip = await releaseOrder(db, db.doc("orders/ord1"), {
    reason: "cancelled",
  });
  assertEqual(cancelAfterShip.skipped, true, "cancel after ship ignored");
  const invAfterCancel = (await db.doc("inventory/inv1").get()).data();
  assertEqual(invAfterCancel.stock_reserved, 0, "cancel after ship no reserved");

  await db.doc("store_valley_inventory/AZYPRD1122_WH-KWT-MAIN").update({
    stored_quantity: 0,
  });
  const webhookUpdated = await syncAvailableForOrder(db, "AZYPRD1122", 0);
  assertEqual(webhookUpdated, 1, "webhook inventory rows");
  const afterWebhook = (await db.doc("inventory/inv1").get()).data();
  assertEqual(afterWebhook.stock_reserved, 0, "webhook does not change reserved");
  assertEqual(afterWebhook.available_for_order, 0, "webhook sellable from stored");

  const dbCancel = await seed();
  await reserveOrder(dbCancel, dbCancel.doc("orders/ord1"));
  await releaseOrder(dbCancel, dbCancel.doc("orders/ord1"), {
    reason: "cancelled",
  });
  const afterPreShipCancel = (await dbCancel.doc("inventory/inv1").get()).data();
  assertEqual(afterPreShipCancel.stock_reserved, 0, "cancel before ship");
  assertEqual(afterPreShipCancel.available_for_order, 1, "sellable restored");

  console.log("warehouse_stock_reservation_ops ok");
})().catch((error) => {
  console.error(error);
  process.exit(1);
});
