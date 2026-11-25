const {
  hostOf,
  environmentName,
  webhookUrl,
  isoOrNull,
  shapeEvent,
  selftestEvent,
  signedRequest,
  wrongSignature,
  cleanIds,
  sortOldestFirst,
} = require("./store_valley_diagnostics.js");
const { verifySignature } = require("./store_valley_webhook_order.js");

function assertEqual(actual, expected, label) {
  if (actual !== expected) {
    throw new Error(
      label + ": expected " + JSON.stringify(expected) + " got " + JSON.stringify(actual),
    );
  }
}

const STAGING =
  "https://us-central1-store-valley-websitek-staging.cloudfunctions.net/api/v1";

// --- which Store Valley system ---
assertEqual(hostOf(STAGING), "us-central1-store-valley-websitek-staging.cloudfunctions.net", "host only");
assertEqual(hostOf("not a url"), "", "bad url has no host");
assertEqual(hostOf("https://api.storevalley.example/api/v1?x-api-key=abc"), "api.storevalley.example", "host never carries a key");
assertEqual(environmentName(STAGING, true), "staging", "configured staging");
assertEqual(environmentName(STAGING, false), "staging", "built-in default is staging");
assertEqual(environmentName("https://api.storevalley.example/api/v1", true), "production", "configured non-staging address");
assertEqual(environmentName("https://api.storevalley.example/api/v1", false), "unknown", "non-staging address that was not configured");
assertEqual(environmentName("", true), "unknown", "empty address");
assertEqual(environmentName("garbage", true), "unknown", "unreadable address");
assertEqual(environmentName("https://API-STAGING.example.com", true), "staging", "case-insensitive");

// --- our own receiving address ---
assertEqual(
  webhookUrl({ GCLOUD_PROJECT: "azyaa-0uiv4k" }),
  "https://us-central1-azyaa-0uiv4k.cloudfunctions.net/storeValleyWebhook",
  "default region",
);
assertEqual(
  webhookUrl({ GCP_PROJECT: "p1", FUNCTION_REGION: "europe-west1" }),
  "https://europe-west1-p1.cloudfunctions.net/storeValleyWebhook",
  "explicit region",
);
assertEqual(
  webhookUrl({ FIREBASE_CONFIG: JSON.stringify({ projectId: "p2" }) }),
  "https://us-central1-p2.cloudfunctions.net/storeValleyWebhook",
  "project from FIREBASE_CONFIG",
);
assertEqual(webhookUrl({}), "", "no project, no address");
assertEqual(webhookUrl({ FIREBASE_CONFIG: "{bad" }), "", "bad FIREBASE_CONFIG");

// --- times ---
const at = new Date("2026-09-11T13:17:00.000Z");
assertEqual(isoOrNull({ toDate: () => at }), "2026-09-11T13:17:00.000Z", "timestamp object");
assertEqual(isoOrNull(at), "2026-09-11T13:17:00.000Z", "date");
assertEqual(isoOrNull("2026-09-11T13:17:00.000Z"), "2026-09-11T13:17:00.000Z", "iso string");
assertEqual(isoOrNull({ _seconds: at.getTime() / 1000 }), "2026-09-11T13:17:00.000Z", "plain seconds");
assertEqual(isoOrNull(null), null, "missing");
assertEqual(isoOrNull("nonsense"), null, "unreadable");

// --- one update, as shown ---
const old = shapeEvent("delivery_order_1", {
  event_id: "delivery_order_1",
  event_type: "storevalley.delivery_order.delivered",
  resource_type: "delivery_order",
  received_at: { toDate: () => at },
});
assertEqual(old.event_id, "delivery_order_1", "event id");
assertEqual(old.resource_id, null, "records from before this change have no resource id");
assertEqual(old.status, null, "nor a status");
assertEqual(old.selftest, false, "not a self-test");
assertEqual(old.received_at, "2026-09-11T13:17:00.000Z", "received time");
assertEqual(Object.keys(old).join(","), "event_id,event_type,resource_type,resource_id,status,received_at,selftest", "exact shape");

const detailed = shapeEvent(
  "e2",
  {
    event_type: "storevalley.delivery_order.delivered",
    resource_type: "delivery_order",
    resource_id: "dlv-1",
    status: "delivered",
    otp_status: "verified",
    otp_failed_attempts: 1,
    has_photo: true,
    has_signature: true,
  },
  true,
);
assertEqual(detailed.event_id, "e2", "falls back to the record id");
assertEqual(detailed.otp_status, "verified", "otp outcome");
assertEqual(detailed.otp_failed_attempts, 1, "failed attempts");
assertEqual(detailed.has_photo, true, "photo");
assertEqual(detailed.has_signature, true, "signature");
assertEqual(shapeEvent("s1", { resource_type: "selftest" }).selftest, true, "self-test by type");
assertEqual(shapeEvent("s2", { selftest: true }).selftest, true, "self-test by flag");
assertEqual(shapeEvent("s3", null).received_at, null, "null-safe");

// --- the signed sample is accepted by the real verifier ---
const secret = "whsec_test";
const event = selftestEvent(1764072000000);
assertEqual(event.event_id, "selftest_1764072000000", "self-test id");
assertEqual(event.resource_type, "selftest", "self-test type");
assertEqual(event.event_type, "storevalley.selftest", "self-test event type");
const request = signedRequest(event, secret, 1764072000000);
assertEqual(
  verifySignature(
    request.rawBody,
    request.headers["X-StoreValley-Signature-Timestamp"],
    request.headers["X-StoreValley-Signature"],
    secret,
  ),
  true,
  "signed sample verifies",
);
const bad = wrongSignature(request.headers["X-StoreValley-Signature"]);
assertEqual(bad.length, request.headers["X-StoreValley-Signature"].length, "wrong signature keeps its length");
assertEqual(bad === request.headers["X-StoreValley-Signature"], false, "wrong signature differs");
assertEqual(
  verifySignature(request.rawBody, request.headers["X-StoreValley-Signature-Timestamp"], bad, secret),
  false,
  "wrong signature is rejected",
);
assertEqual(wrongSignature("0abc"), "1abc", "flips a leading 0");
assertEqual(wrongSignature("fabc"), "0abc", "replaces any other first character");

// --- id lists ---
assertEqual(cleanIds([" a ", "a", "", null, 5, "b"]).join(","), "a,b", "trims, drops blanks, non-text and repeats");
assertEqual(cleanIds("a").length, 0, "not a list");
assertEqual(cleanIds(Array.from({ length: 25 }, (_, i) => "id" + i)).length, 10, "at most 10");

// --- order ---
assertEqual(
  sortOldestFirst([
    { event_id: "c", received_at: "2026-09-11T10:00:00.000Z" },
    { event_id: "a", received_at: null },
    { event_id: "b", received_at: "2026-09-10T10:00:00.000Z" },
  ])
    .map((item) => item.event_id)
    .join(","),
  "a,b,c",
  "oldest first, undated first",
);

console.log("store_valley_diagnostics tests passed");
