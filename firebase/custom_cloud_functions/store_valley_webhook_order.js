const crypto = require("crypto");
const { logisticsClientOrderId } = require("./store_valley_client_ids.js");

function trackingIdsFrom(event, deliveryDocs) {
  const ids = [
    event && event.resource_id,
    event && event.client_order_id,
    event && event.delivery_order_id,
    event && event.external_request_id,
    logisticsClientOrderId(event),
  ];
  (deliveryDocs || []).forEach((doc) => {
    const data = doc && typeof doc.data === "function" ? doc.data() || {} : {};
    ids.push(data.delivery_tracking_id, data.delivery_id, doc && doc.id);
  });
  return [...new Set(ids.filter(Boolean).map(String))];
}

function entryMatchesTracking(entry, trackingIds) {
  const ids = new Set((trackingIds || []).map(String));
  const candidates = [
    entry && entry.delivery_tracking_id,
    entry && entry.delivery_id,
  ];
  return candidates.some((id) => id && ids.has(String(id)));
}

function patchDeliveryInfoList(list, trackingIds, status) {
  if (!Array.isArray(list) || !list.length || !trackingIds || !trackingIds.length) {
    return list;
  }
  let changed = false;
  const next = list.map((entry) => {
    if (!entryMatchesTracking(entry, trackingIds)) {
      return entry;
    }
    if ((entry && entry.status) === status) {
      return entry;
    }
    changed = true;
    return Object.assign({}, entry, { status });
  });
  return changed ? next : list;
}

function mapDeliveryWebhookStatus(status) {
  const value = String(status || "");
  if (value === "assigned") {
    return "order_assigned";
  }
  if (value === "outForDelivery") {
    return "out_for_delivery";
  }
  return value;
}

function eventStatus(event) {
  const raw = (event && (event.new_status || event.status)) || "";
  if (event && event.resource_type === "delivery_order") {
    return mapDeliveryWebhookStatus(raw);
  }
  return raw;
}

function normalizeSignature(value) {
  return String(value || "")
    .trim()
    .replace(/^sha256=/i, "")
    .toLowerCase();
}

function verifySignature(rawBody, timestamp, signatureHeader, secret) {
  if (!timestamp || !signatureHeader || !secret || rawBody == null) {
    return false;
  }
  const expected = crypto
    .createHmac("sha256", secret)
    .update(String(timestamp) + "." + String(rawBody))
    .digest("hex");
  const provided = normalizeSignature(signatureHeader);
  const a = Buffer.from(provided, "utf8");
  const b = Buffer.from(expected, "utf8");
  if (a.length !== b.length) {
    return false;
  }
  return crypto.timingSafeEqual(a, b);
}

module.exports = {
  trackingIdsFrom,
  entryMatchesTracking,
  patchDeliveryInfoList,
  mapDeliveryWebhookStatus,
  eventStatus,
  verifySignature,
};
