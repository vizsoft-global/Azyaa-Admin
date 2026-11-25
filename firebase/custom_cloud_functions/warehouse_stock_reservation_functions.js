const functions = require("firebase-functions");
const admin = require("firebase-admin");
const {
  reserveOrder,
  releaseOrder,
  backfillReservations,
} = require("./warehouse_stock_reservation_ops.js");
const logic = require("./warehouse_stock_reservation.js");
const { requireStaff } = require("./store_valley_staff.js");

// Reserving and releasing stock is for panel staff, not designers or customers.
function requireAuth(context) {
  return requireStaff(context, { noDesigner: true });
}

function orderRefFromData(db, data) {
  const orderId = data && (data.order_id || data.orderId);
  if (!orderId || typeof orderId !== "string") {
    throw new functions.https.HttpsError(
      "invalid-argument",
      "order_id is required.",
    );
  }
  return db.collection("orders").doc(orderId);
}

exports.reserveWarehouseStock = functions.https.onCall(async (data, context) => {
  await requireAuth(context);
  const db = admin.firestore();
  const result = await reserveOrder(db, orderRefFromData(db, data), {
    force: false,
    retry: data && data.retry === true,
  });
  if (result.code === "not_found") {
    throw new functions.https.HttpsError("not-found", "Order not found.");
  }
  if (!result.ok && result.code === "out_of_stock") {
    throw new functions.https.HttpsError(
      "failed-precondition",
      "Not enough warehouse stock available for order.",
    );
  }
  return result;
});

exports.releaseWarehouseStock = functions.https.onCall(async (data, context) => {
  await requireAuth(context);
  const db = admin.firestore();
  const reason = data && data.reason === "shipped" ? "shipped" : "cancelled";
  const productIds = Array.isArray(data && data.product_ids)
    ? data.product_ids.map(String)
    : undefined;
  return releaseOrder(db, orderRefFromData(db, data), {
    reason,
    productIds,
  });
});

exports.backfillWarehouseReservations = functions
  .runWith({
    timeoutSeconds: 300,
    memory: "512MB",
  })
  .https.onCall(async (data, context) => {
    await requireAuth(context);
    const db = admin.firestore();
    return backfillReservations(db, {
      warehouseId: data && data.warehouse_id,
    });
  });

exports.reserveWarehouseStockOnOrder = functions.firestore
  .document("orders/{orderId}")
  .onWrite(async (change) => {
    const db = admin.firestore();
    const before = change.before.exists ? change.before.data() : null;
    const after = change.after.exists ? change.after.data() : null;
    if (!after) {
      if (before && before.inventory_reservation_status === logic.STATUS.RESERVED) {
        await releaseOrder(db, change.after.ref, {
          reason: "cancelled",
          orderData: before,
        });
      }
      return null;
    }
    if (logic.paymentBecameCaptured(before, after)) {
      await reserveOrder(db, change.after.ref, { force: false });
      return null;
    }
    if (
      logic.paymentLeftCaptured(before, after) &&
      after.inventory_reservation_status === logic.STATUS.RESERVED
    ) {
      await releaseOrder(db, change.after.ref, { reason: "cancelled" });
    }
    return null;
  });
