const crypto = require("crypto");
const {
  trackingIdsFrom,
  entryMatchesTracking,
  patchDeliveryInfoList,
  mapDeliveryWebhookStatus,
  eventStatus,
  verifySignature,
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

console.log("store_valley_webhook.test.js ok");
