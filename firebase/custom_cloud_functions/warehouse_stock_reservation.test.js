const logic = require("./warehouse_stock_reservation.js");

function assertEqual(actual, expected, label) {
  if (actual !== expected) {
    throw new Error(label + ": expected " + expected + " got " + actual);
  }
}

function assertDeepEqual(actual, expected, label) {
  const left = JSON.stringify(actual);
  const right = JSON.stringify(expected);
  if (left !== right) {
    throw new Error(label + ": expected " + right + " got " + left);
  }
}

assertEqual(logic.availableForOrder(10, 2, 1), 7, "available formula");
assertEqual(logic.availableForOrder(1, 2, 0), 0, "available floors at 0");

const warehouseItem = {
  product_id: "AZYPRD1122",
  quantity: 2,
  product_main_type: "ready",
  product_stock_info: { is_preferred_vendor: true, inventory_id: "INV1" },
};
assertEqual(
  logic.isWarehouseReservableItem(warehouseItem),
  true,
  "warehouse ready preferred",
);
assertEqual(
  logic.isWarehouseReservableItem({
    ...warehouseItem,
    product_main_type: "custom",
  }),
  false,
  "custom is not warehouse",
);

const order = {
  payment_status: "CAPTURED",
  order_items: {
    cart_items: [
      warehouseItem,
      {
        product_id: "CUSTOM1",
        quantity: 1,
        product_main_type: "custom",
        product_stock_info: { is_preferred_vendor: true },
      },
    ],
  },
};
assertDeepEqual(
  logic.warehouseLinesFromOrder(order),
  [{ productId: "AZYPRD1122", qty: 2, inventoryId: "INV1", inventoryRef: null }],
  "warehouse lines only",
);

const first = logic.applyReserve({
  stored: 1,
  reserved: 0,
  unavailable: 0,
  qty: 1,
});
assertEqual(first.ok, true, "last unit first order");
assertEqual(first.reserved, 1, "reserved after first");
assertEqual(first.availableForOrder, 0, "sellable after first");

const second = logic.applyReserve({
  stored: 1,
  reserved: first.reserved,
  unavailable: 0,
  qty: 1,
});
assertEqual(second.ok, false, "last unit second order refused");
assertEqual(second.code, "out_of_stock", "out of stock code");

const shipped = logic.applyRelease({
  stored: 1,
  reserved: 1,
  unavailable: 0,
  qty: 1,
  mode: "shipped",
  previousAvailable: 0,
});
assertEqual(shipped.reserved, 0, "ship releases reserved");
assertEqual(shipped.availableForOrder, 0, "ship does not bump sellable");

const shippedAfterWebhook = logic.applyRelease({
  stored: 0,
  reserved: 1,
  unavailable: 0,
  qty: 1,
  mode: "shipped",
  previousAvailable: 0,
});
assertEqual(shippedAfterWebhook.reserved, 0, "ship after webhook reserved");
assertEqual(
  shippedAfterWebhook.availableForOrder,
  0,
  "ship after webhook keeps min",
);

const cancelled = logic.applyRelease({
  stored: 5,
  reserved: 2,
  unavailable: 0,
  qty: 2,
  mode: "cancelled",
});
assertEqual(cancelled.reserved, 0, "cancel releases reserved");
assertEqual(cancelled.availableForOrder, 5, "cancel returns sellable");

const ignoreAfterShip = logic.shouldSkipReserve("released_shipped");
assertEqual(ignoreAfterShip, true, "shipped orders skip reserve");

const webhook = logic.applyWebhookStored({
  stored: 4,
  reserved: 2,
  unavailable: 0,
});
assertEqual(webhook.reserved, 2, "webhook outbound does not drop reserved");
assertEqual(webhook.availableForOrder, 2, "webhook recomputes sellable");

assertEqual(
  logic.paymentBecameCaptured(
    { payment_status: "Initialization" },
    { payment_status: "CAPTURED" },
  ),
  true,
  "captured transition",
);
assertEqual(
  logic.paymentLeftCaptured(
    { payment_status: "CAPTURED" },
    { payment_status: "FAILED" },
  ),
  true,
  "left captured",
);

const mixedLines = {
  A: { qty: 1, status: "released_shipped" },
  B: { qty: 1, status: "reserved" },
};
assertEqual(logic.wholeOrderStatus(mixedLines), "reserved", "partial ship");

const shippedOrder = {
  ...order,
  delivery_info_list: [
    { status: "REQUESTED", product_ids: ["AZYPRD1122"] },
  ],
};
assertEqual(
  logic.openWarehouseLinesFromOrder(shippedOrder).length,
  0,
  "shipped lines excluded from backfill",
);

const cancelThenIgnore = logic.applyRelease({
  stored: 4,
  reserved: 0,
  unavailable: 0,
  qty: 1,
  mode: "cancelled",
});
assertEqual(cancelThenIgnore.reserved, 0, "cancel after ship no-ops reserved");

console.log("warehouse_stock_reservation ok");
