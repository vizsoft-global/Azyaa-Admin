const {
  inventoryCacheDocId,
  inventoryCachePayload,
} = require("./store_valley_inventory_cache.js");

function assertEqual(actual, expected, label) {
  if (actual !== expected) {
    throw new Error(label + ": expected " + expected + " got " + actual);
  }
}

assertEqual(
  inventoryCacheDocId("AZYPRD1122", "WH-KWT-MAIN"),
  "AZYPRD1122_WH-KWT-MAIN",
  "doc id",
);

const payload = inventoryCachePayload(
  {
    designer_id: "DSN-KWT-0001",
    product_id: "AZYPRD1122",
    sku: "SKU-1",
    warehouse_id: "WH-KWT-MAIN",
    stored_quantity: 4,
    available: 4,
  },
  { updatedAt: "ts", asOf: "asof" },
);

assertEqual(payload.product_id, "AZYPRD1122", "product_id");
assertEqual(payload.stored_quantity, 4, "stored_quantity");
assertEqual(payload.available, 4, "available");
assertEqual(payload.as_of, "asof", "as_of");
if (Object.prototype.hasOwnProperty.call(payload, "event_id")) {
  throw new Error("event_id should be omitted when not provided");
}

console.log("store_valley_inventory_cache ok");
