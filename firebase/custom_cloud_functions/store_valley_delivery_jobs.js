const logic = require("./warehouse_stock_reservation.js");
const ids = require("./store_valley_client_ids.js");

const KIND = {
  WAREHOUSE: "warehouse_delivery",
  CUSTOM: "custom_pickup",
};

const STATUS = {
  QUEUED: "queued",
  PROCESSING: "processing",
  REQUESTED: "requested",
  FAILED: "failed",
  CANCELLED: "cancelled",
};

const COLLECTION = "store_valley_delivery_jobs";
const READY_TO_PICKUP = "Ready to Pickup";
const DEFAULT_WAREHOUSE_ID = "WH-KWT-MAIN";
const DEFAULT_DESIGNER_ID = "DSN-KWT-0001";
const PACKAGING_PROFILE = "AZY-PKG-STD-01";
const MAX_ATTEMPTS = 3;
const LEASE_MS = 120000;

function warehouseJobId(orderId) {
  return String(orderId || "") + "-RM";
}

function customJobId(orderId, designerUid, seq) {
  const base = String(orderId || "") + "-CM-" + String(designerUid || "");
  if (!seq || seq === 1) {
    return base;
  }
  return base + "-" + seq;
}

function cartItems(order) {
  const items =
    order && order.order_items && order.order_items.cart_items;
  return Array.isArray(items) ? items : [];
}

function designerUidFromItem(item) {
  if (!item || typeof item !== "object") {
    return "";
  }
  const uid = String(item.product_designer_id || "").trim();
  if (uid) {
    return uid;
  }
  const ref = item.product_designer_ref;
  if (ref && typeof ref === "object" && ref.id) {
    return String(ref.id);
  }
  if (typeof ref === "string" && ref.includes("/")) {
    return ref.split("/").pop();
  }
  return "";
}

function isPickupEligibleItem(item) {
  if (!item || typeof item !== "object") {
    return false;
  }
  const pickup = item.product_pickup_info || {};
  if (String(pickup.status || "") !== READY_TO_PICKUP) {
    return false;
  }
  if (String(pickup.delivery_tracking_id || "").trim()) {
    return false;
  }
  const type = String(item.product_main_type || "").toLowerCase();
  const stock = item.product_stock_info || {};
  const preferred =
    stock.is_preferred_vendor === true || stock.is_preferred_vendor === "true";
  if (type === "custom") {
    return true;
  }
  if (type === "ready" && !preferred) {
    return true;
  }
  return false;
}

function pickupPurposeForItem(item) {
  const type = String((item && item.product_main_type) || "").toLowerCase();
  if (type === "custom") {
    return {
      pickupPurpose: "custom_made_fulfillment",
      orderKind: "custom_made",
    };
  }
  return {
    pickupPurpose: "designer_order_fulfillment",
    orderKind: "ready_made",
  };
}

function pickupItemsForDesigner(order, designerUid) {
  const uid = String(designerUid || "");
  return cartItems(order).filter(
    (item) =>
      isPickupEligibleItem(item) && designerUidFromItem(item) === uid,
  );
}

function itemBecameReadyToPickup(beforeItems, afterItem) {
  if (!isPickupEligibleItem(afterItem)) {
    return false;
  }
  const afterId = String(afterItem.product_id || "");
  const afterUid = designerUidFromItem(afterItem);
  const before = (beforeItems || []).find(
    (item) =>
      String(item.product_id || "") === afterId &&
      designerUidFromItem(item) === afterUid,
  );
  if (!before) {
    return true;
  }
  return String((before.product_pickup_info || {}).status || "") !== READY_TO_PICKUP;
}

function shouldEnqueueCustomOnWrite(before, after) {
  if (!after || after.payment_status !== "CAPTURED") {
    return false;
  }
  if (logic.paymentBecameCaptured(before, after)) {
    return cartItems(after).some(isPickupEligibleItem);
  }
  return cartItems(after).some((item) =>
    itemBecameReadyToPickup(cartItems(before), item),
  );
}

function relatedCustomJobs(existingJobs, orderId, designerUid) {
  const base = customJobId(orderId, designerUid);
  return (existingJobs || []).filter(
    (job) => job && (job.id === base || String(job.id).startsWith(base + "-")),
  );
}

function nextCustomJobId(orderId, designerUid, existingJobs) {
  const base = customJobId(orderId, designerUid);
  const related = relatedCustomJobs(existingJobs, orderId, designerUid);
  if (
    related.some(
      (job) =>
        job.status === STATUS.QUEUED || job.status === STATUS.PROCESSING,
    )
  ) {
    return null;
  }
  if (related.some((job) => job.status === STATUS.FAILED) &&
      !related.some((job) => job.status === STATUS.REQUESTED)) {
    return null;
  }
  if (!related.some((job) => job.status === STATUS.REQUESTED)) {
    return base;
  }
  let n = 2;
  while (related.some((job) => job.id === base + "-" + n)) {
    n += 1;
  }
  return base + "-" + n;
}

function warehouseJobsToEnqueue(input) {
  const orderId = input && input.orderId;
  const order = (input && input.order) || {};
  const reservationStatus = input && input.reservationStatus;
  const existingJobs = (input && input.existingJobs) || [];
  if (reservationStatus !== logic.STATUS.RESERVED) {
    return [];
  }
  const lines = logic.warehouseLinesFromOrder(order);
  if (!lines.length) {
    return [];
  }
  const jobId = warehouseJobId(orderId);
  if (
    existingJobs.some(
      (job) =>
        job.id === jobId &&
        (job.status === STATUS.QUEUED ||
          job.status === STATUS.PROCESSING ||
          job.status === STATUS.REQUESTED),
    )
  ) {
    return [];
  }
  return [
    {
      id: jobId,
      kind: KIND.WAREHOUSE,
      orderId,
      clientOrderId: jobId,
    },
  ];
}

function customJobsToEnqueue(input) {
  const orderId = input && input.orderId;
  const order = (input && input.order) || {};
  const existingJobs = (input && input.existingJobs) || [];
  if (order.payment_status !== "CAPTURED") {
    return [];
  }
  const grouped = new Map();
  for (const item of cartItems(order)) {
    if (!isPickupEligibleItem(item)) {
      continue;
    }
    const uid = designerUidFromItem(item);
    if (!uid) {
      continue;
    }
    if (!grouped.has(uid)) {
      grouped.set(uid, []);
    }
    grouped.get(uid).push(item);
  }
  const jobs = [];
  for (const [designerUid] of grouped) {
    const jobId = nextCustomJobId(orderId, designerUid, existingJobs);
    if (!jobId) {
      continue;
    }
    jobs.push({
      id: jobId,
      kind: KIND.CUSTOM,
      orderId,
      designerUid,
      clientOrderId: jobId,
    });
  }
  return jobs;
}

function latLngFromValue(value) {
  if (!value || typeof value !== "object") {
    return { latitude: undefined, longitude: undefined };
  }
  const latitude = value.latitude != null ? Number(value.latitude) : Number(value.lat);
  const longitude =
    value.longitude != null ? Number(value.longitude) : Number(value.lng);
  return {
    latitude: Number.isFinite(latitude) ? latitude : undefined,
    longitude: Number.isFinite(longitude) ? longitude : undefined,
  };
}

function optionalTrimmed(value) {
  const text = String(value || "").trim();
  return text || undefined;
}

function attachPaciFields(address, src) {
  const building = optionalTrimmed(src.building);
  const block = optionalTrimmed(src.block);
  const governorate = optionalTrimmed(src.governorate || src.state);
  if (building) {
    address.building = building;
  }
  if (block) {
    address.block = block;
  }
  if (governorate) {
    address.governorate = governorate;
  }
}

function streetFromAddress(src) {
  return String(
    src.address_line_1 || src.address_line1 || src.street || "",
  ).trim();
}

function customerAddressFromOrder(order) {
  const raw = (order && order.shipping_address) || {};
  const street = streetFromAddress(raw);
  const city = String(raw.city || "").trim();
  const contact_name = String(raw.shipping_name || raw.contact_name || "").trim();
  const contact_phone = String(
    raw.shipping_phone || raw.contact_phone || "",
  ).trim();
  if (!street || !city || !contact_name || !contact_phone) {
    return { ok: false, code: "incomplete_address" };
  }
  const coords = latLngFromValue(raw.lat_long || raw.latLong);
  const address = {
    street,
    city,
    contact_name,
    contact_phone,
  };
  if (raw.country) {
    address.country = String(raw.country);
  }
  attachPaciFields(address, raw);
  if (coords.latitude != null) {
    address.latitude = coords.latitude;
  }
  if (coords.longitude != null) {
    address.longitude = coords.longitude;
  }
  return { ok: true, address };
}

function resolveDesignerId(value) {
  const id = String(value || "").trim();
  if (/^DSN-/i.test(id)) {
    return id;
  }
  return DEFAULT_DESIGNER_ID;
}

function warehouseDeliveryPayload(input) {
  const orderId = input && input.orderId;
  const order = (input && input.order) || {};
  const inventoryByProduct = (input && input.inventoryByProduct) || {};
  const address = customerAddressFromOrder(order);
  if (!address.ok) {
    return address;
  }
  const lines = logic.warehouseLinesFromOrder(order);
  if (!lines.length) {
    return { ok: false, code: "no_warehouse_lines" };
  }
  const items = [];
  let designerId = "";
  for (const line of lines) {
    const inv = inventoryByProduct[line.productId] || {};
    if (!designerId) {
      designerId = resolveDesignerId(inv.designer_id);
    }
    const item = {
      product_id: line.productId,
      quantity: line.qty,
    };
    if (inv.sku) {
      item.sku = String(inv.sku);
    }
    items.push(item);
  }
  return {
    ok: true,
    body: {
      client_order_id: warehouseJobId(orderId),
      designer_id: designerId || DEFAULT_DESIGNER_ID,
      pickup_location_id: DEFAULT_WAREHOUSE_ID,
      inventory_source: "warehouse",
      order_kind: "ready_made",
      packaging_profile: PACKAGING_PROFILE,
      requires_otp_proof: true,
      requires_photo_proof: true,
      delivery_address: address.address,
      items,
    },
  };
}

function pickupAddressFromValue(raw) {
  const src = raw || {};
  const street = streetFromAddress(src);
  const city = String(src.city || "").trim();
  const contact_name = String(
    src.shipping_name || src.contact_name || src.name || "",
  ).trim();
  const contact_phone = String(
    src.shipping_phone || src.contact_phone || src.phone || "",
  ).trim();
  if (!street || !city || !contact_name || !contact_phone) {
    return { ok: false, code: "incomplete_pickup_address" };
  }
  const coords = latLngFromValue(src.lat_long || src.latLong);
  const address = {
    street,
    city,
    contact_name,
    contact_phone,
  };
  if (src.country) {
    address.country = String(src.country);
  }
  attachPaciFields(address, src);
  if (coords.latitude != null) {
    address.latitude = coords.latitude;
  }
  if (coords.longitude != null) {
    address.longitude = coords.longitude;
  }
  return { ok: true, address };
}

function customPickupPayload(input) {
  const job = (input && input.job) || {};
  const order = (input && input.order) || {};
  const designer = (input && input.designer) || {};
  const inventoryByProduct = (input && input.inventoryByProduct) || {};
  const items = pickupItemsForDesigner(order, job.designerUid);
  if (!items.length) {
    return { ok: false, code: "no_pickup_items" };
  }
  const delivery = customerAddressFromOrder(order);
  if (!delivery.ok) {
    return delivery;
  }
  const pickupSource =
    (items[0].product_pickup_info &&
      items[0].product_pickup_info.pickup_address) ||
    (designer.designer_main_info &&
      designer.designer_main_info.designer_pickup_address) ||
    designer.designer_pickup_address;
  const pickup = pickupAddressFromValue(pickupSource);
  if (!pickup.ok) {
    return pickup;
  }
  const purpose = pickupPurposeForItem(items[0]);
  const designerId = resolveDesignerId(
    (designer.designer_main_info && designer.designer_main_info.designer_id) ||
      designer.designer_id,
  );
  if (designerId === DEFAULT_DESIGNER_ID &&
      !/^DSN-/i.test(
        String(
          (designer.designer_main_info &&
            designer.designer_main_info.designer_id) ||
            designer.designer_id ||
            "",
        ),
      )) {
    return { ok: false, code: "missing_designer_id" };
  }
  const svItems = items.map((item) => {
    const inv = inventoryByProduct[String(item.product_id)] || {};
    const entry = {
      product_id: String(item.product_id),
      quantity: logic.toInt(item.quantity) || 1,
    };
    if (inv.sku) {
      entry.sku = String(inv.sku);
    }
    return entry;
  });
  const clientOrderId = job.clientOrderId || job.id;
  return {
    ok: true,
    body: {
      external_request_id: ids.externalRequestId(clientOrderId),
      source_order_id: clientOrderId,
      pickup_purpose: purpose.pickupPurpose,
      order_kind: purpose.orderKind,
      packaging_profile: PACKAGING_PROFILE,
      requires_otp_proof: true,
      requires_photo_proof: true,
      designer: {
        designer_id: designerId,
        name: pickup.address.contact_name,
        pickup_address: pickup.address,
      },
      delivery_address: delivery.address,
      items: svItems,
    },
    productIds: items.map((item) => String(item.product_id)),
  };
}

function leaseMillis(value) {
  if (value == null) {
    return NaN;
  }
  if (typeof value === "number") {
    return value;
  }
  if (typeof value.toMillis === "function") {
    return value.toMillis();
  }
  if (value._seconds != null) {
    return value._seconds * 1000;
  }
  const parsed = Date.parse(value);
  return parsed;
}

function canClaim(job, now, leaseMs) {
  if (!job) {
    return false;
  }
  if (job.status === STATUS.QUEUED) {
    return true;
  }
  if (job.status === STATUS.PROCESSING) {
    const lease = leaseMillis(job.lease_until);
    return Number.isFinite(lease) && lease < now;
  }
  return false;
}

function shouldSweep(job, now, maxAttempts) {
  if (!job) {
    return false;
  }
  const attempts = logic.toInt(job.attempts);
  const cap = maxAttempts == null ? MAX_ATTEMPTS : maxAttempts;
  if (attempts >= cap) {
    return false;
  }
  if (job.status === STATUS.QUEUED || job.status === STATUS.FAILED) {
    return true;
  }
  if (job.status === STATUS.PROCESSING) {
    const lease = leaseMillis(job.lease_until);
    return Number.isFinite(lease) && lease < now;
  }
  return false;
}

function notifyCustomerFromOrder(order) {
  const address = (order && order.shipping_address) || {};
  return {
    otpType: "delivery",
    userId: order && order.customer_id,
    email: address.shipping_email || "",
    phone: address.shipping_phone || "",
  };
}

function jobDocPayload(spec) {
  return {
    kind: spec.kind,
    status: STATUS.QUEUED,
    order_id: spec.orderId,
    designer_uid: spec.designerUid || null,
    client_order_id: spec.clientOrderId || spec.id,
    attempts: 0,
    last_error: null,
    created_at: spec.now || new Date(),
    updated_at: spec.now || new Date(),
  };
}

module.exports = {
  KIND,
  STATUS,
  COLLECTION,
  READY_TO_PICKUP,
  DEFAULT_WAREHOUSE_ID,
  DEFAULT_DESIGNER_ID,
  PACKAGING_PROFILE,
  MAX_ATTEMPTS,
  LEASE_MS,
  warehouseJobId,
  customJobId,
  cartItems,
  designerUidFromItem,
  isPickupEligibleItem,
  pickupPurposeForItem,
  pickupItemsForDesigner,
  itemBecameReadyToPickup,
  shouldEnqueueCustomOnWrite,
  warehouseJobsToEnqueue,
  customJobsToEnqueue,
  customerAddressFromOrder,
  warehouseDeliveryPayload,
  customPickupPayload,
  canClaim,
  shouldSweep,
  notifyCustomerFromOrder,
  jobDocPayload,
  resolveDesignerId,
};
