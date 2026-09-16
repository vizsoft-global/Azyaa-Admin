const functions = require("firebase-functions");
const admin = require("firebase-admin");
const jobs = require("./store_valley_delivery_jobs.js");
const logic = require("./warehouse_stock_reservation.js");
const ops = require("./store_valley_delivery_jobs_ops.js");
const { requestStoreValley } = require("./store_valley_http.js");
const { releaseOrder } = require("./warehouse_stock_reservation_ops.js");

function svClient() {
  return {
    request: (opts) =>
      requestStoreValley(Object.assign({}, opts, { persistSnapshot: false })),
  };
}

function requireAuth(context) {
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Sign in required.",
    );
  }
}

async function releaseIfNeeded(db, jobData, result) {
  if (!result || !result.shouldReleaseShipped || !result.productIds) {
    return;
  }
  const orderId = jobData && jobData.order_id;
  const orderSnap = await ops.findOrderSnap(db, orderId);
  if (!orderSnap) {
    return;
  }
  await releaseOrder(db, orderSnap.ref, {
    reason: "shipped",
    productIds: result.productIds,
  });
}

async function cancelRequestedWarehouse(db, orderId) {
  const listed = await ops.jobsForOrder(db, orderId);
  for (const job of listed) {
    if (job.kind !== jobs.KIND.WAREHOUSE || job.status !== jobs.STATUS.REQUESTED) {
      continue;
    }
    const clientOrderId = job.id;
    await requestStoreValley({
      method: "DELETE",
      path: "/orders/" + clientOrderId,
      persistSnapshot: false,
    });
    await db.collection(jobs.COLLECTION).doc(job.id).update({
      status: jobs.STATUS.CANCELLED,
      updated_at: admin.firestore.FieldValue.serverTimestamp(),
    });
  }
}

exports.onStoreValleyDeliveryJobWrite = functions
  .runWith({ timeoutSeconds: 120, memory: "256MB" })
  .firestore.document("store_valley_delivery_jobs/{jobId}")
  .onWrite(async (change) => {
    const after = change.after.exists ? change.after.data() : null;
    if (!after || after.status !== jobs.STATUS.QUEUED) {
      return null;
    }
    const db = admin.firestore();
    const result = await ops.processDeliveryJob(db, change.after.id, {
      sv: svClient(),
    });
    await releaseIfNeeded(db, after, result);
    return result;
  });

exports.enqueueStoreValleyDeliveriesOnOrder = functions.firestore
  .document("orders/{orderId}")
  .onWrite(async (change) => {
    const before = change.before.exists ? change.before.data() : null;
    const after = change.after.exists ? change.after.data() : null;
    if (!after) {
      return null;
    }
    const db = admin.firestore();
    const orderId = after.order_id || change.after.id;
    if (jobs.shouldEnqueueCustomOnWrite(before, after)) {
      await ops.enqueueCustomDeliveries(db, change.after.ref);
    }
    if (logic.paymentLeftCaptured(before, after)) {
      await ops.cancelQueuedJobs(db, orderId);
      const shipping = String(after.ready_shipping_request_status || "").toLowerCase();
      if (
        shipping === "requested" ||
        shipping === "pending" ||
        shipping === "confirmed" ||
        shipping === "ready" ||
        shipping === "assigned"
      ) {
        await cancelRequestedWarehouse(db, orderId);
      }
    }
    return null;
  });

exports.sweepStoreValleyDeliveryJobs = functions
  .runWith({ timeoutSeconds: 300, memory: "512MB" })
  .pubsub.schedule("every 5 minutes")
  .onRun(async () => {
    const db = admin.firestore();
    return ops.sweepDeliveryJobs(db, { sv: svClient() });
  });

exports.retryStoreValleyDelivery = functions.https.onCall(async (data, context) => {
  requireAuth(context);
  const db = admin.firestore();
  const jobId = data && (data.job_id || data.jobId);
  const orderId = data && (data.order_id || data.orderId);
  if (jobId) {
    await db.collection(jobs.COLLECTION).doc(String(jobId)).update({
      status: jobs.STATUS.QUEUED,
      updated_at: admin.firestore.FieldValue.serverTimestamp(),
    });
    return { ok: true, job_id: jobId };
  }
  if (!orderId) {
    throw new functions.https.HttpsError("invalid-argument", "job_id or order_id is required.");
  }
  const orderRef = db.collection("orders").doc(String(orderId));
  const snap = await orderRef.get();
  const listed = await ops.jobsForOrder(
    db,
    (snap.exists && snap.data().order_id) || orderId,
  );
  for (const job of listed) {
    if (job.status === jobs.STATUS.FAILED) {
      await db.collection(jobs.COLLECTION).doc(job.id).update({
        status: jobs.STATUS.QUEUED,
        updated_at: admin.firestore.FieldValue.serverTimestamp(),
      });
    }
  }
  await ops.enqueueWarehouseDelivery(db, orderRef);
  await ops.enqueueCustomDeliveries(db, orderRef);
  return { ok: true, order_id: orderId };
});

exports.backfillStoreValleyDeliveries = functions
  .runWith({ timeoutSeconds: 300, memory: "512MB" })
  .https.onCall(async (data, context) => {
    requireAuth(context);
    const db = admin.firestore();
    const pageSize = 50;
    let lastDoc = null;
    let scanned = 0;
    let enqueued = 0;
    while (true) {
      let query = db
        .collection("orders")
        .where("payment_status", "==", "CAPTURED")
        .orderBy(admin.firestore.FieldPath.documentId())
        .limit(pageSize);
      if (lastDoc) {
        query = query.startAfter(lastDoc);
      }
      const page = await query.get();
      if (page.empty) {
        break;
      }
      for (const doc of page.docs) {
        scanned += 1;
        const rm = await ops.enqueueWarehouseDelivery(db, doc.ref);
        const cm = await ops.enqueueCustomDeliveries(db, doc.ref);
        enqueued += rm.length + cm.length;
      }
      lastDoc = page.docs[page.docs.length - 1];
      if (page.docs.length < pageSize) {
        break;
      }
    }
    return { scanned, enqueued };
  });
