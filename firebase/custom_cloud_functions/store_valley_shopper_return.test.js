const {
  returnRequestRefFromDelivery,
  shopperReturnLogisticsPatch,
} = require("./store_valley_shopper_return.js");

function assertEqual(actual, expected, label) {
  if (actual !== expected) {
    throw new Error(label + ": expected " + JSON.stringify(expected) + " got " + JSON.stringify(actual));
  }
}

assertEqual(
  returnRequestRefFromDelivery({
    type: "order",
    return_request_ref: "returns/RR1",
  }),
  "returns/RR1",
  "order delivery with return ref",
);

assertEqual(
  returnRequestRefFromDelivery({
    type: "order",
  }),
  null,
  "order delivery without return ref",
);

assertEqual(
  returnRequestRefFromDelivery({
    type: "inventory",
    inventory_movement_ref: "mov1",
  }),
  null,
  "inventory delivery skipped",
);

const patch = shopperReturnLogisticsPatch("pickup_completed", "NOW");
assertEqual(patch.logistics_status, "pickup_completed", "status copied");
assertEqual(patch.updated_at, "NOW", "timestamp copied");

console.log("store_valley_shopper_return.test.js ok");
