function isStoredIntakeEvent(event) {
  const type = event && event.resource_type;
  const status = String(
    (event && (event.status || event.new_status)) || "",
  ).toLowerCase();
  return type === "warehouse_intake_request" && status === "stored";
}

function refKey(ref) {
  if (!ref) {
    return "";
  }
  if (typeof ref === "string") {
    return ref;
  }
  return ref.path || String(ref);
}

function inventoryMovementRefsFromDelivery(data) {
  if (!data || data.type !== "inventory") {
    return [];
  }
  const seen = new Set();
  const refs = [];
  const add = (ref) => {
    const key = refKey(ref);
    if (!key || seen.has(key)) {
      return;
    }
    seen.add(key);
    refs.push(ref);
  };
  if (Array.isArray(data.inventory_movement_refs)) {
    data.inventory_movement_refs.forEach(add);
  }
  add(data.inventory_movement_ref);
  return refs;
}

function inventoryMovementRefFromDelivery(data) {
  const refs = inventoryMovementRefsFromDelivery(data);
  return refs.length ? refs[0] : null;
}

function restockCompletedPatch() {
  return {
    "request_info.fulfill_status": "Completed",
  };
}

function restockInventoryClearPatch(FieldValue) {
  return {
    restock_request_raised_ref: FieldValue.delete(),
  };
}

function isOtpVerifiedStatus(otp) {
  return String((otp && otp.status) || "").toLowerCase() === "verified";
}

function isDeliveredInventoryEvent(event) {
  const type = event && event.resource_type;
  const status = String(
    (event && (event.status || event.new_status)) || "",
  ).toLowerCase();
  return type === "delivery_order" && (status === "delivered" || status === "completed");
}

function isReturnToDesignerRequest(data) {
  const info = (data && data.request_info) || {};
  return info.request_type === "Return to Designer";
}

function nextUnavailable(current, qty) {
  const value =
    Math.trunc(Number(current) || 0) - Math.trunc(Number(qty) || 0);
  return value < 0 ? 0 : value;
}

function movementOtpVerifiedPatch() {
  return {
    "request_delivery_info.status": "verified",
  };
}

module.exports = {
  isStoredIntakeEvent,
  inventoryMovementRefFromDelivery,
  inventoryMovementRefsFromDelivery,
  restockCompletedPatch,
  restockInventoryClearPatch,
  isOtpVerifiedStatus,
  isDeliveredInventoryEvent,
  isReturnToDesignerRequest,
  nextUnavailable,
  movementOtpVerifiedPatch,
};
