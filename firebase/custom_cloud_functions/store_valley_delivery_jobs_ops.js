const jobs = require("./store_valley_delivery_jobs.js");
const ids = require("./store_valley_client_ids.js");
const logic = require("./warehouse_stock_reservation.js");
const { inventoryCacheDocId } = require("./store_valley_inventory_cache.js");
const {
  codeRecord,
  publicCodeMarker,
  saveCode,
} = require("./store_valley_codes.js");

function timestamp() {
  try {
    const admin = require("firebase-admin");
    if (admin.apps && admin.apps.length) {
      return admin.firestore.FieldValue.serverTimestamp();
    }
  } catch (_) {
    // tests and local unit runs have no initialized app
  }
  return new Date();
}

function arrayUnion(values) {
  try {
    const admin = require("firebase-admin");
    if (admin.apps && admin.apps.length) {
      return admin.firestore.FieldValue.arrayUnion(...values);
    }
  } catch (_) {
    // tests store the union as a plain array append
  }
  return { _arrayUnion: values };
}

async function jobsForOrder(db, orderId) {
  const snap = await db
    .collection(jobs.COLLECTION)
    .where("order_id", "==", String(orderId))
    .get();
  return snap.docs.map((doc) => {
    const data = doc.data() || {};
    return { id: doc.id, status: data.status, kind: data.kind };
  });
}

async function writeJobs(db, specs, orderPatch) {
  for (const spec of specs) {
    const ref = db.collection(jobs.COLLECTION).doc(spec.id);
    const existing = await ref.get();
    if (existing.exists) {
      const status = (existing.data() || {}).status;
      if (
        status === jobs.STATUS.QUEUED ||
        status === jobs.STATUS.PROCESSING ||
        status === jobs.STATUS.REQUESTED
      ) {
        continue;
      }
    }
    await ref.set(jobs.jobDocPayload(spec));
  }
  if (orderPatch && specs.length) {
    await orderPatch();
  }
}

function businessOrderId(orderRef, order) {
  return String((order && order.order_id) || orderRef.id);
}

async function enqueueWarehouseDelivery(db, orderRef) {
  const snap = await orderRef.get();
  if (!snap.exists) {
    return [];
  }
  const order = snap.data() || {};
  const orderId = businessOrderId(orderRef, order);
  const specs = jobs.warehouseJobsToEnqueue({
    orderId,
    order,
    reservationStatus: order.inventory_reservation_status,
    existingJobs: await jobsForOrder(db, orderId),
  });
  await writeJobs(db, specs, async () => {
    if (!order.ready_shipping_request_status) {
      await orderRef.update({
        ready_shipping_request_status: "QUEUED",
        updated_at: timestamp(),
      });
    }
  });
  return specs;
}

async function enqueueCustomDeliveries(db, orderRef) {
  const snap = await orderRef.get();
  if (!snap.exists) {
    return [];
  }
  const order = snap.data() || {};
  const orderId = businessOrderId(orderRef, order);
  const specs = jobs.customJobsToEnqueue({
    orderId,
    order,
    existingJobs: await jobsForOrder(db, orderId),
  });
  await writeJobs(db, specs, async () => {
    if (!order.custom_shipping_request_status) {
      await orderRef.update({
        custom_shipping_request_status: "QUEUED",
        updated_at: timestamp(),
      });
    }
  });
  return specs;
}

async function cancelQueuedJobs(db, orderId, kind) {
  const listed = await jobsForOrder(db, orderId);
  const cancelled = [];
  for (const job of listed) {
    if (kind && job.kind !== kind) {
      continue;
    }
    if (job.status !== jobs.STATUS.QUEUED && job.status !== jobs.STATUS.PROCESSING) {
      continue;
    }
    await db.collection(jobs.COLLECTION).doc(job.id).update({
      status: jobs.STATUS.CANCELLED,
      updated_at: timestamp(),
    });
    cancelled.push(job.id);
  }
  return cancelled;
}

async function findOrderSnap(db, orderId) {
  const byField = await db
    .collection("orders")
    .where("order_id", "==", String(orderId))
    .limit(1)
    .get();
  if (!byField.empty) {
    return byField.docs[0];
  }
  const direct = await db.collection("orders").doc(String(orderId)).get();
  return direct.exists ? direct : null;
}

async function inventoryByProductIds(db, productIds) {
  const map = {};
  for (const productId of productIds) {
    const snap = await db
      .collection("store_valley_inventory")
      .doc(inventoryCacheDocId(productId, jobs.DEFAULT_WAREHOUSE_ID))
      .get();
    if (snap.exists) {
      map[productId] = snap.data() || {};
    }
  }
  return map;
}

function trackingFromWarehouse(body) {
  return String((body && (body.order_id || body.client_order_id)) || "");
}

function trackingFromPickup(body) {
  return String(
    (body && (body.delivery_order_id || body.request_id || body.order_id)) ||
      "",
  );
}

async function persistLogisticsSnapshot(db, path, body, extras) {
  const trackingId =
    (body && (body.order_id || body.request_id || body.delivery_order_id)) || "";
  if (!trackingId) {
    return;
  }
  const pickupOtp = extras && extras.pickupOtp ? extras.pickupOtp : "";
  const notify = (extras && extras.notifyCustomer) || null;
  const snapshot = {
    swftTrackID: trackingId,
    id: trackingId,
    status: (body && body.status) || "",
    state: (body && body.status) || "",
    name: "store_valley",
    updated_at: timestamp(),
    request_id: (body && body.request_id) || null,
    external_request_id: (body && body.external_request_id) || null,
    delivery_order_id:
      (body && (body.delivery_order_id || body.order_id)) || null,
    original_source_location_id:
      (body && body.original_source_location_id) || null,
    inventory_source: (body && body.inventory_source) || null,
    return_destination_type:
      (body && body.return_destination_type) || null,
    client_order_id: (body && body.client_order_id) || null,
    resource_path: path,
  };
  if (pickupOtp) {
    // The code, and who it was sent to, are kept where no client can read them.
    await saveCode(
      db,
      codeRecord({
        trackingId,
        code: pickupOtp,
        notify,
        body,
        path,
        sentAt: timestamp(),
        now: timestamp(),
      }),
    );
    Object.assign(
      snapshot,
      publicCodeMarker({ now: timestamp(), otpType: notify && notify.otpType }),
    );
  }
  await db.collection("logistics_response").add(snapshot);
}

async function persistDeliveryDoc(db, orderSnap, fields) {
  return db.collection("delivery").add({
    created_at: timestamp(),
    updated_at: timestamp(),
    type: "order",
    status: "REQUESTED",
    order_ref: orderSnap.ref,
    ...fields,
  });
}

async function getExisting(sv, path) {
  const result = await sv.request({ method: "GET", path });
  const body = result.body || {};
  const found =
    result.status >= 200 &&
    result.status < 300 &&
    !!(body.order_id || body.request_id || body.delivery_order_id || body.client_order_id);
  return { found, body, status: result.status };
}

async function failJob(jobRef, message) {
  await jobRef.update({
    status: jobs.STATUS.FAILED,
    last_error: String(message || "failed"),
    updated_at: timestamp(),
  });
}

async function completeJob(jobRef, trackingId) {
  await jobRef.update({
    status: jobs.STATUS.REQUESTED,
    tracking_id: trackingId || null,
    last_error: null,
    updated_at: timestamp(),
  });
}

async function processWarehouse(db, job, orderSnap, sv) {
  const order = orderSnap.data() || {};
  const lines = logic.warehouseLinesFromOrder(order);
  const inventory = await inventoryByProductIds(
    db,
    lines.map((line) => line.productId),
  );
  const payload = jobs.warehouseDeliveryPayload({
    orderId: job.order_id,
    order,
    inventoryByProduct: inventory,
  });
  const jobRef = db.collection(jobs.COLLECTION).doc(job.id);
  if (!payload.ok) {
    await failJob(jobRef, payload.code);
    await orderSnap.ref.update({
      ready_shipping_request_status: "FAILED",
      updated_at: timestamp(),
    });
    return { ok: false, code: payload.code, shouldReleaseShipped: false };
  }
  const clientOrderId = payload.body.client_order_id;
  const existing = await getExisting(sv, "/orders/" + clientOrderId);
  let body = existing.body;
  let created = false;
  let pickupOtp = "";
  if (!existing.found) {
    const posted = await sv.request({
      method: "POST",
      path: "/orders",
      body: payload.body,
      generateOtp: true,
      notifyCustomer: jobs.notifyCustomerFromOrder(order),
    });
    if (posted.status === 409) {
      await failJob(jobRef, posted.body && posted.body.message ? posted.body.message : "conflict");
      await orderSnap.ref.update({
        ready_shipping_request_status: "FAILED",
        updated_at: timestamp(),
      });
      return { ok: false, code: "conflict", shouldReleaseShipped: false };
    }
    if (posted.status < 200 || posted.status >= 300) {
      await failJob(jobRef, posted.body && posted.body.message ? posted.body.message : "store_valley_error");
      await orderSnap.ref.update({
        ready_shipping_request_status: "FAILED",
        updated_at: timestamp(),
      });
      return { ok: false, code: "store_valley_error", shouldReleaseShipped: false };
    }
    body = posted.body || {};
    created = true;
    pickupOtp = posted.pickup_otp || "";
  }
  const trackingId = trackingFromWarehouse(body);
  const productIds = lines.map((line) => line.productId);
  const deliveryRef = await persistDeliveryDoc(db, orderSnap, {
    delivery_type: "ready",
    delivery_tracking_id: trackingId,
    delivery_id: trackingId,
  });
  await persistLogisticsSnapshot(db, "/orders", body, {
    pickupOtp,
    notifyCustomer: jobs.notifyCustomerFromOrder(order),
  });
  await orderSnap.ref.update({
    ready_shipping_request_status: "REQUESTED",
    delivery_info_list: arrayUnion([
      {
        delivery_tracking_id: trackingId,
        status: "REQUESTED",
        delivery_type: "ready",
        product_ids: productIds,
        delivery_ref: deliveryRef,
        has_code: !!pickupOtp,
      },
    ]),
    updated_at: timestamp(),
  });
  await completeJob(jobRef, trackingId);
  return {
    ok: true,
    created,
    trackingId,
    productIds,
    shouldReleaseShipped: true,
  };
}

async function processCustom(db, job, orderSnap, sv) {
  const order = orderSnap.data() || {};
  const jobRef = db.collection(jobs.COLLECTION).doc(job.id);
  let designer = {};
  if (job.designer_uid) {
    const userSnap = await db.collection("users").doc(job.designer_uid).get();
    if (userSnap.exists) {
      designer = userSnap.data() || {};
    }
  }
  const items = jobs.pickupItemsForDesigner(order, job.designer_uid);
  const inventory = await inventoryByProductIds(
    db,
    items.map((item) => String(item.product_id)),
  );
  const payload = jobs.customPickupPayload({
    job: {
      id: job.id,
      clientOrderId: job.client_order_id || job.id,
      designerUid: job.designer_uid,
    },
    order,
    designer,
    inventoryByProduct: inventory,
  });
  if (!payload.ok) {
    await failJob(jobRef, payload.code);
    await orderSnap.ref.update({
      custom_shipping_request_status: "FAILED",
      updated_at: timestamp(),
    });
    return { ok: false, code: payload.code, shouldReleaseShipped: false };
  }
  const externalId = payload.body.external_request_id;
  const existing = await getExisting(sv, "/pickup-requests/" + externalId);
  let body = existing.body;
  let pickupOtp = "";
  if (!existing.found) {
    const posted = await sv.request({
      method: "POST",
      path: "/pickup-requests",
      body: payload.body,
      generateOtp: true,
      notifyCustomer: jobs.notifyCustomerFromOrder(order),
    });
    if (posted.status < 200 || posted.status >= 300) {
      await failJob(jobRef, posted.body && posted.body.message ? posted.body.message : "store_valley_error");
      await orderSnap.ref.update({
        custom_shipping_request_status: "FAILED",
        updated_at: timestamp(),
      });
      return { ok: false, code: "store_valley_error", shouldReleaseShipped: false };
    }
    body = posted.body || {};
    pickupOtp = posted.pickup_otp || "";
  }
  const trackingId = trackingFromPickup(body);
  const deliveryRef = await persistDeliveryDoc(db, orderSnap, {
    delivery_type: "custom",
    delivery_tracking_id: trackingId,
    delivery_id: trackingId,
  });
  await persistLogisticsSnapshot(db, "/pickup-requests", body, {
    pickupOtp,
    notifyCustomer: jobs.notifyCustomerFromOrder(order),
  });
  const nextItems = jobs.cartItems(order).map((item) => {
    if (!payload.productIds.includes(String(item.product_id))) {
      return item;
    }
    if (jobs.designerUidFromItem(item) !== String(job.designer_uid || "")) {
      return item;
    }
    return Object.assign({}, item, {
      product_pickup_info: Object.assign({}, item.product_pickup_info || {}, {
        status: "processing",
        delivery_id: trackingId,
        delivery_tracking_id: trackingId,
      }),
    });
  });
  const nextOrderItems = Object.assign({}, order.order_items || {}, {
    cart_items: nextItems,
  });
  await orderSnap.ref.update({
    custom_shipping_request_status: "REQUESTED",
    order_items: nextOrderItems,
    delivery_info_list: arrayUnion([
      {
        delivery_tracking_id: trackingId,
        status: "REQUESTED",
        delivery_type: "custom",
        product_ids: payload.productIds,
        delivery_ref: deliveryRef,
        has_code: !!pickupOtp,
      },
    ]),
    updated_at: timestamp(),
  });
  await completeJob(jobRef, trackingId);
  return {
    ok: true,
    trackingId,
    productIds: payload.productIds,
    shouldReleaseShipped: false,
  };
}

async function processDeliveryJob(db, jobId, options) {
  const opts = options || {};
  const sv = opts.sv;
  if (!sv || typeof sv.request !== "function") {
    throw new Error("sv.request is required");
  }
  const jobRef = db.collection(jobs.COLLECTION).doc(jobId);
  const claimed = await db.runTransaction(async (tx) => {
    const snap = await tx.get(jobRef);
    if (!snap.exists) {
      return { ok: false, code: "not_found" };
    }
    const current = Object.assign({ id: snap.id }, snap.data() || {});
    const now = Date.now();
    if (!jobs.canClaim(current, now, jobs.LEASE_MS)) {
      return { ok: false, skipped: true, code: "not_claimable" };
    }
    tx.update(jobRef, {
      status: jobs.STATUS.PROCESSING,
      attempts: (current.attempts || 0) + 1,
      lease_until: now + jobs.LEASE_MS,
      updated_at: timestamp(),
    });
    return { ok: true, job: current };
  });
  if (!claimed.ok) {
    return claimed;
  }
  const orderSnap = await findOrderSnap(db, claimed.job.order_id);
  if (!orderSnap) {
    await failJob(jobRef, "order_not_found");
    return { ok: false, code: "order_not_found", shouldReleaseShipped: false };
  }
  try {
    if (claimed.job.kind === jobs.KIND.WAREHOUSE) {
      return await processWarehouse(db, claimed.job, orderSnap, sv);
    }
    return await processCustom(db, claimed.job, orderSnap, sv);
  } catch (error) {
    await failJob(jobRef, error.message || "error");
    return {
      ok: false,
      code: "error",
      error: error.message,
      shouldReleaseShipped: false,
    };
  }
}

async function sweepDeliveryJobs(db, options) {
  const opts = options || {};
  const sv = opts.sv;
  const now = opts.now || Date.now();
  let processed = 0;
  const statuses = [
    jobs.STATUS.QUEUED,
    jobs.STATUS.PROCESSING,
    jobs.STATUS.FAILED,
  ];
  for (const status of statuses) {
    const snap = await db
      .collection(jobs.COLLECTION)
      .where("status", "==", status)
      .get();
    for (const doc of snap.docs) {
      const job = Object.assign({ id: doc.id }, doc.data() || {});
      if (!jobs.shouldSweep(job, now, jobs.MAX_ATTEMPTS)) {
        continue;
      }
      if (job.status === jobs.STATUS.FAILED) {
        await doc.ref.update({
          status: jobs.STATUS.QUEUED,
          updated_at: timestamp(),
        });
      }
      await processDeliveryJob(db, doc.id, { sv });
      processed += 1;
    }
  }
  return { processed };
}

module.exports = {
  jobsForOrder,
  enqueueWarehouseDelivery,
  enqueueCustomDeliveries,
  cancelQueuedJobs,
  processDeliveryJob,
  findOrderSnap,
  sweepDeliveryJobs,
};
