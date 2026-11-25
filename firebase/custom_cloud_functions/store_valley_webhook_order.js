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
  const expected = signWebhookBody(rawBody, timestamp, secret);
  const provided = normalizeSignature(signatureHeader);
  const a = Buffer.from(provided, "utf8");
  const b = Buffer.from(expected, "utf8");
  if (a.length !== b.length) {
    return false;
  }
  return crypto.timingSafeEqual(a, b);
}

function signWebhookBody(rawBody, timestamp, secret) {
  return crypto
    .createHmac("sha256", String(secret))
    .update(String(timestamp) + "." + String(rawBody))
    .digest("hex");
}

function textOrNull(value) {
  if (value === undefined || value === null || value === "") {
    return null;
  }
  return String(value);
}

/**
 * What is kept about a processed update so it can be looked up later: ids and
 * outcome only. No address, phone number, code or proof link is stored.
 */
function webhookEventRecord(event) {
  const src = event && typeof event === "object" ? event : {};
  const data = src.data && typeof src.data === "object" ? src.data : {};
  const otp =
    data.otp_verification && typeof data.otp_verification === "object"
      ? data.otp_verification
      : {};
  const proof = data.proof && typeof data.proof === "object" ? data.proof : {};
  const attempts = Number(otp.failed_attempts);
  return {
    event_id: textOrNull(src.event_id),
    event_type: String(src.event_type || ""),
    resource_type: String(src.resource_type || ""),
    resource_id: textOrNull(src.resource_id),
    status: textOrNull(eventStatus(src)),
    client_order_id: textOrNull(src.client_order_id),
    external_request_id: textOrNull(src.external_request_id),
    delivery_order_id: textOrNull(src.delivery_order_id),
    otp_status: textOrNull(otp.status),
    otp_failed_attempts: Number.isFinite(attempts) ? Math.trunc(attempts) : 0,
    has_photo: !!proof.photo_url,
    has_signature: !!proof.signature_url,
    selftest: src.resource_type === "selftest",
  };
}

module.exports = {
  signWebhookBody,
  webhookEventRecord,
  trackingIdsFrom,
  entryMatchesTracking,
  patchDeliveryInfoList,
  mapDeliveryWebhookStatus,
  eventStatus,
  verifySignature,
};
