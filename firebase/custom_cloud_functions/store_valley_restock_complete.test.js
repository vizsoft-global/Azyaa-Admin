const {
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
} = require("./store_valley_restock_complete.js");

function assertEqual(actual, expected, label) {
  if (actual !== expected) {
    throw new Error(label + ": expected " + expected + " got " + actual);
  }
}

assertEqual(
  isStoredIntakeEvent({
    resource_type: "warehouse_intake_request",
    status: "stored",
  }),
  true,
  "stored intake",
);

assertEqual(
  isStoredIntakeEvent({
    resource_type: "warehouse_intake_request",
    status: "verification_passed",
  }),
  false,
  "qc is not stored",
);

assertEqual(
  isStoredIntakeEvent({
    resource_type: "delivery_order",
    status: "stored",
  }),
  false,
  "delivery is not intake",
);

assertEqual(
  inventoryMovementRefFromDelivery({
    type: "inventory",
    inventory_movement_ref: "mov1",
  }),
  "mov1",
  "inventory delivery ref",
);

assertEqual(
  inventoryMovementRefFromDelivery({
    type: "order",
    inventory_movement_ref: "mov1",
  }),
  null,
  "order delivery skipped",
);

const batchRefs = inventoryMovementRefsFromDelivery({
  type: "inventory",
  inventory_movement_ref: "mov1",
  inventory_movement_refs: ["mov1", "mov2", "mov3"],
});
assertEqual(batchRefs.join(","), "mov1,mov2,mov3", "batch movement refs");
assertEqual(
  inventoryMovementRefsFromDelivery({
    type: "inventory",
    inventory_movement_ref: "mov1",
  }).join(","),
  "mov1",
  "legacy single movement ref",
);
assertEqual(
  inventoryMovementRefsFromDelivery({
    type: "order",
    inventory_movement_refs: ["mov1"],
  }).length,
  0,
  "order batch skipped",
);

const patch = restockCompletedPatch();
assertEqual(patch["request_info.fulfill_status"], "Completed", "fulfill status");
if (Object.prototype.hasOwnProperty.call(patch, "stock")) {
  throw new Error("must not patch Azyaa stock");
}
if (Object.prototype.hasOwnProperty.call(patch, "stock_on_hand")) {
  throw new Error("must not patch Azyaa stock_on_hand");
}

const clearPatch = restockInventoryClearPatch({
  delete: () => "DELETE",
});
assertEqual(
  clearPatch.restock_request_raised_ref,
  "DELETE",
  "clears restock ref",
);

assertEqual(
  isOtpVerifiedStatus({ status: "verified" }),
  true,
  "otp verified",
);
assertEqual(
  isOtpVerifiedStatus({ status: "pending" }),
  false,
  "otp pending",
);
assertEqual(
  movementOtpVerifiedPatch()["request_delivery_info.status"],
  "verified",
  "movement otp patch",
);

assertEqual(
  isDeliveredInventoryEvent({
    resource_type: "delivery_order",
    status: "delivered",
  }),
  true,
  "delivered inventory order",
);
assertEqual(
  isDeliveredInventoryEvent({
    resource_type: "warehouse_intake_request",
    status: "delivered",
  }),
  false,
  "intake is not designer return delivery",
);
assertEqual(
  isReturnToDesignerRequest({
    request_info: { request_type: "Return to Designer" },
  }),
  true,
  "return type",
);
assertEqual(
  isReturnToDesignerRequest({
    request_info: { request_type: "Restock" },
  }),
  false,
  "restock is not return",
);
assertEqual(nextUnavailable(5, 3), 2, "release hold");
assertEqual(nextUnavailable(1, 3), 0, "hold floors at 0");

console.log("store_valley_restock_complete ok");
