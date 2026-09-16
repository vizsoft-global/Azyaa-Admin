const COLLECTION = "store_valley_inventory";

function inventoryCacheDocId(productId, warehouseId) {
  return String(productId) + "_" + String(warehouseId);
}

function inventoryCachePayload(item, extras) {
  const payload = {
    designer_id: item.designer_id || null,
    product_id: item.product_id || null,
    sku: item.sku || null,
    warehouse_id: item.warehouse_id || null,
    stored_quantity: item.stored_quantity,
    available: item.available,
    updated_at: extras.updatedAt,
  };
  if (Object.prototype.hasOwnProperty.call(extras, "availableDelta")) {
    payload.available_delta = extras.availableDelta;
  }
  if (Object.prototype.hasOwnProperty.call(extras, "reasonCode")) {
    payload.reason_code = extras.reasonCode;
  }
  if (Object.prototype.hasOwnProperty.call(extras, "eventId")) {
    payload.event_id = extras.eventId;
  }
  if (Object.prototype.hasOwnProperty.call(extras, "asOf")) {
    payload.as_of = extras.asOf;
  }
  return payload;
}

async function mergeInventoryCacheDoc(db, item, extras) {
  if (!item || !item.product_id || !item.warehouse_id) {
    return false;
  }
  const ref = db
    .collection(COLLECTION)
    .doc(inventoryCacheDocId(item.product_id, item.warehouse_id));
  await ref.set(inventoryCachePayload(item, extras), { merge: true });
  return true;
}

module.exports = {
  COLLECTION,
  inventoryCacheDocId,
  inventoryCachePayload,
  mergeInventoryCacheDoc,
};
