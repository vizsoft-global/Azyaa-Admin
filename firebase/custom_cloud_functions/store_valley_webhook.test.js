const crypto = require("crypto");
const {
  trackingIdsFrom,
  entryMatchesTracking,
  patchDeliveryInfoList,
  mapDeliveryWebhookStatus,
  eventStatus,
  verifySignature,
  signWebhookBody,
  webhookEventRecord,
} = require("./store_valley_webhook_order.js");

function assertEqual(actual, expected, label) {
  if (actual !== expected) {
    throw new Error(
      label + ": expected " + JSON.stringify(expected) + " got " + JSON.stringify(actual),
    );
  }
}

const trackingId = "83a27a21-bc7c-47db-a94e-ad5278be6573";

assertEqual(
  trackingIdsFrom(
    {
      resource_id: trackingId,
      client_order_id: "sv-test-delivery-3-RM",
      delivery_order_id: trackingId,
    },
    [],
  ).includes(trackingId),
  true,
  "tracking ids include delivery_order_id",
);

assertEqual(
  entryMatchesTracking(
    { delivery_tracking_id: trackingId, status: "REQUESTED" },
    [trackingId],
  ),
  true,
  "matches tracking id on list entry",
);

assertEqual(
  entryMatchesTracking(
    { delivery_tracking_id: "other", status: "REQUESTED" },
    [trackingId],
  ),
  false,
  "ignores unrelated list entry",
);

const patched = patchDeliveryInfoList(
  [
    {
      delivery_tracking_id: trackingId,
      status: "REQUESTED",
      delivery_type: "ready",
    },
    {
      delivery_tracking_id: "other",
      status: "REQUESTED",
      delivery_type: "custom",
    },
  ],
  [trackingId],
  "delivered",
);

assertEqual(patched[0].status, "delivered", "updates matching entry to delivered");
assertEqual(patched[1].status, "REQUESTED", "leaves unrelated entry unchanged");

const unchanged = [
  { delivery_tracking_id: trackingId, status: "delivered" },
];
assertEqual(
  patchDeliveryInfoList(unchanged, [trackingId], "delivered") === unchanged,
  true,
  "returns same array when already delivered",
);

assertEqual(mapDeliveryWebhookStatus("assigned"), "order_assigned", "maps assigned");
assertEqual(
  mapDeliveryWebhookStatus("outForDelivery"),
  "out_for_delivery",
  "maps outForDelivery",
);
assertEqual(mapDeliveryWebhookStatus("delivered"), "delivered", "passthrough delivered");
assertEqual(mapDeliveryWebhookStatus("failed"), "failed", "passthrough failed");
assertEqual(mapDeliveryWebhookStatus("returned"), "returned", "passthrough returned");
assertEqual(mapDeliveryWebhookStatus("cancelled"), "cancelled", "passthrough cancelled");

assertEqual(
  eventStatus({
    resource_type: "delivery_order",
    new_status: "outForDelivery",
  }),
  "out_for_delivery",
  "delivery event uses mapped new_status",
);
assertEqual(
  eventStatus({
    resource_type: "warehouse_intake_request",
    status: "verification_passed",
  }),
  "verification_passed",
  "logistics event uses status as-is",
);

const secret = "webhook-secret";
const timestamp = "1710000000";
const rawBody = JSON.stringify({
  event_id: "delivery_order_1",
  resource_type: "delivery_order",
  new_status: "out_for_delivery",
});
const hex = crypto
  .createHmac("sha256", secret)
  .update(timestamp + "." + rawBody)
  .digest("hex");

assertEqual(
  verifySignature(rawBody, timestamp, hex, secret),
  true,
  "accepts HMAC of timestamp.raw_json_body",
);
assertEqual(
  verifySignature(rawBody, timestamp, "sha256=" + hex, secret),
  true,
  "accepts sha256= prefix",
);
assertEqual(
  verifySignature(rawBody, timestamp, hex.toUpperCase(), secret),
  true,
  "accepts uppercase hex",
);
assertEqual(
  verifySignature(JSON.stringify({ event_id: "delivery_order_1" }), timestamp, hex, secret),
  false,
  "rejects re-stringified body",
);
assertEqual(
  verifySignature(rawBody, timestamp, hex, "other-secret"),
  false,
  "rejects wrong secret",
);
assertEqual(
  verifySignature(rawBody, timestamp, hex, ""),
  false,
  "unsigned destination fails closed",
);

// --- signing helper round-trips with the verifier ---
assertEqual(signWebhookBody(rawBody, timestamp, secret), hex, "signWebhookBody matches the reference HMAC");
assertEqual(
  verifySignature(rawBody, timestamp, signWebhookBody(rawBody, timestamp, secret), secret),
  true,
  "a body signed by the helper verifies",
);

// --- what is kept about a processed update ---
const kept = webhookEventRecord({
  event_id: "delivery_order_9",
  event_type: "storevalley.delivery_order.delivered",
  resource_type: "delivery_order",
  resource_id: trackingId,
  client_order_id: "sv-test-delivery-3-RM",
  new_status: "outForDelivery",
  data: {
    proof: { photo_url: "https://example.com/p.jpg", signature_url: null },
    otp_verification: { status: "verified", failed_attempts: 2 },
    delivery_address: { contact_phone: "+96550000000" },
  },
  delivery_otp: "123456",
});
assertEqual(kept.event_id, "delivery_order_9", "keeps event id");
assertEqual(kept.resource_id, trackingId, "keeps resource id");
assertEqual(kept.status, "out_for_delivery", "keeps the mapped status");
assertEqual(kept.client_order_id, "sv-test-delivery-3-RM", "keeps client order id");
assertEqual(kept.external_request_id, null, "missing ids are null");
assertEqual(kept.delivery_order_id, null, "missing delivery id is null");
assertEqual(kept.otp_status, "verified", "keeps otp outcome");
assertEqual(kept.otp_failed_attempts, 2, "keeps failed attempts");
assertEqual(kept.has_photo, true, "photo flag");
assertEqual(kept.has_signature, false, "signature flag");
assertEqual(kept.selftest, false, "a real update is not a self-test");
assertEqual(
  JSON.stringify(kept).includes("96550000000") ||
    JSON.stringify(kept).includes("123456") ||
    JSON.stringify(kept).includes("example.com"),
  false,
  "no phone, code or proof link is kept",
);

const keptLogistics = webhookEventRecord({
  event_id: "warehouse_intake_request_1",
  resource_type: "warehouse_intake_request",
  resource_id: "req-1",
  external_request_id: "INT-BCH1195",
  delivery_order_id: "dlv-1",
  status: "stored",
});
assertEqual(keptLogistics.status, "stored", "logistics status");
assertEqual(keptLogistics.external_request_id, "INT-BCH1195", "external id");
assertEqual(keptLogistics.delivery_order_id, "dlv-1", "delivery order id");
assertEqual(keptLogistics.otp_failed_attempts, 0, "attempts default to 0");
assertEqual(keptLogistics.otp_status, null, "no otp outcome");

const keptSelftest = webhookEventRecord({ event_id: "selftest_1", event_type: "storevalley.selftest", resource_type: "selftest" });
assertEqual(keptSelftest.selftest, true, "self-test is marked");
assertEqual(keptSelftest.status, null, "self-test has no status");
assertEqual(webhookEventRecord(null).event_id, null, "null-safe");
assertEqual(webhookEventRecord(undefined).has_photo, false, "null-safe flags");

console.log("store_valley_webhook.test.js ok");
