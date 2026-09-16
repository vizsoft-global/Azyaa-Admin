const STATUS = {
  NONE: "none",
  RESERVED: "reserved",
  RELEASED_SHIPPED: "released_shipped",
  RELEASED_CANCELLED: "released_cancelled",
  STOCK_FAILED: "stock_failed",
};

function toInt(value) {
  const n = Number(value);
  return Number.isFinite(n) ? Math.trunc(n) : 0;
}

function availableForOrder(stored, reserved, unavailable) {
  return Math.max(0, toInt(stored) - toInt(reserved) - toInt(unavailable));
}

function isPreferredVendor(value) {
  return value === true || value === "true";
}

function isWarehouseReservableItem(item) {
  if (!item || typeof item !== "object") {
    return false;
  }
  const type = String(item.product_main_type || "").toLowerCase();
  const stock = item.product_stock_info || {};
  return type === "ready" && isPreferredVendor(stock.is_preferred_vendor);
}

function warehouseLinesFromOrder(order) {
  const cartItems =
    (order && order.order_items && order.order_items.cart_items) || [];
  const byProduct = new Map();
  for (const item of cartItems) {
    if (!isWarehouseReservableItem(item)) {
      continue;
    }
    const productId = String(item.product_id || "").trim();
    const qty = toInt(item.quantity);
    if (!productId || qty <= 0) {
      continue;
    }
    const stock = item.product_stock_info || {};
    const existing = byProduct.get(productId);
    if (existing) {
      existing.qty += qty;
      continue;
    }
    byProduct.set(productId, {
      productId,
      qty,
      inventoryId: stock.inventory_id ? String(stock.inventory_id) : "",
      inventoryRef: stock.inventory_ref || null,
    });
  }
  return Array.from(byProduct.values());
}

function paymentBecameCaptured(before, after) {
  const prev = before && before.payment_status;
  const next = after && after.payment_status;
  return next === "CAPTURED" && prev !== "CAPTURED";
}

function paymentLeftCaptured(before, after) {
  const prev = before && before.payment_status;
  const next = after && after.payment_status;
  return prev === "CAPTURED" && next !== "CAPTURED";
}

function applyReserve(state) {
  const stored = toInt(state.stored);
  const reserved = toInt(state.reserved);
  const unavailable = toInt(state.unavailable);
  const qty = toInt(state.qty);
  const sellable = availableForOrder(stored, reserved, unavailable);
  if (!state.force && qty > sellable) {
    return {
      ok: false,
      code: "out_of_stock",
      sellable,
      reserved,
      availableForOrder: sellable,
    };
  }
  const nextReserved = reserved + qty;
  return {
    ok: true,
    reserved: nextReserved,
    availableForOrder: availableForOrder(stored, nextReserved, unavailable),
  };
}

function applyRelease(state) {
  const stored = toInt(state.stored);
  const reserved = toInt(state.reserved);
  const unavailable = toInt(state.unavailable);
  const qty = Math.min(toInt(state.qty), reserved);
  const nextReserved = Math.max(0, reserved - qty);
  const computed = availableForOrder(stored, nextReserved, unavailable);
  if (state.mode === "shipped") {
    const previous =
      state.previousAvailable == null
        ? computed
        : toInt(state.previousAvailable);
    return {
      ok: true,
      reserved: nextReserved,
      availableForOrder: Math.min(previous, computed),
    };
  }
  return {
    ok: true,
    reserved: nextReserved,
    availableForOrder: computed,
  };
}

function applyWebhookStored(state) {
  const reserved = toInt(state.reserved);
  return {
    reserved,
    availableForOrder: availableForOrder(
      state.stored,
      reserved,
      state.unavailable,
    ),
  };
}

function shouldSkipReserve(status) {
  return (
    status === STATUS.RESERVED ||
    status === STATUS.RELEASED_SHIPPED ||
    status === STATUS.RELEASED_CANCELLED ||
    status === STATUS.STOCK_FAILED
  );
}

function lineStatusMap(lines, status) {
  const map = {};
  for (const line of lines) {
    map[line.productId] = { qty: line.qty, status };
  }
  return map;
}

function wholeOrderStatus(linesMap) {
  const values = Object.keys(linesMap || {}).map((key) => linesMap[key]);
  if (!values.length) {
    return STATUS.NONE;
  }
  if (values.every((line) => line.status === STATUS.RELEASED_SHIPPED)) {
    return STATUS.RELEASED_SHIPPED;
  }
  if (values.every((line) => line.status === STATUS.RELEASED_CANCELLED)) {
    return STATUS.RELEASED_CANCELLED;
  }
  if (
    values.every(
      (line) =>
        line.status === STATUS.RELEASED_SHIPPED ||
        line.status === STATUS.RELEASED_CANCELLED,
    )
  ) {
    return STATUS.RELEASED_SHIPPED;
  }
  if (values.some((line) => line.status === STATUS.RESERVED)) {
    return STATUS.RESERVED;
  }
  if (values.every((line) => line.status === STATUS.STOCK_FAILED)) {
    return STATUS.STOCK_FAILED;
  }
  return STATUS.NONE;
}

function isProductInOpenDelivery(order, productId) {
  const list = (order && order.delivery_info_list) || [];
  return list.some((entry) => {
    const status = String((entry && entry.status) || "").toUpperCase();
    if (status === "CANCELLED") {
      return false;
    }
    const ids = (entry && entry.product_ids) || [];
    return ids.map(String).includes(String(productId));
  });
}

function openWarehouseLinesFromOrder(order) {
  return warehouseLinesFromOrder(order).filter(
    (line) => !isProductInOpenDelivery(order, line.productId),
  );
}

function filterLinesByProductIds(lines, productIds) {
  if (!productIds || !productIds.length) {
    return lines;
  }
  const allow = new Set(productIds.map(String));
  return lines.filter((line) => allow.has(line.productId));
}

module.exports = {
  STATUS,
  toInt,
  availableForOrder,
  isWarehouseReservableItem,
  warehouseLinesFromOrder,
  openWarehouseLinesFromOrder,
  isProductInOpenDelivery,
  paymentBecameCaptured,
  paymentLeftCaptured,
  applyReserve,
  applyRelease,
  applyWebhookStored,
  shouldSkipReserve,
  lineStatusMap,
  wholeOrderStatus,
  filterLinesByProductIds,
};
