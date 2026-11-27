const functions = require("firebase-functions");
const admin = require("firebase-admin");
const {
  DEFAULT_BASE_URL,
  configValue,
  requestStoreValley,
} = require("./store_valley_http.js");
const { signWebhookBody } = require("./store_valley_webhook_order.js");
const { requireStaff } = require("./store_valley_staff.js");
const codes = require("./store_valley_codes.js");

const EVENTS = "store_valley_webhook_events";
const JOBS = "store_valley_delivery_jobs";
const JOB_STATUSES = ["queued", "processing", "requested", "failed", "cancelled"];
const CHECK_DESIGNER_ID = "DSN-KWT-0001";
const CHECK_WAREHOUSE_ID = "WH-KWT-MAIN";
const RECENT_LIMIT = 10;
const SCAN_LIMIT = 50;
const MAX_IDS = 10;
const LOOKUP_FIELDS = [
  "resource_id",
  "external_request_id",
  "client_order_id",
  "delivery_order_id",
];

/* ---------- pure helpers (unit-tested) ---------- */

function hostOf(url) {
  try {
    return new URL(String(url || "")).host;
  } catch (_) {
    return "";
  }
}

/**
 * Which Store Valley system the base address belongs to. `configured` says
 * whether an address was set for this project (as opposed to the built-in
 * default, which is Store Valley's staging).
 */
function environmentName(baseUrl, configured) {
  const host = hostOf(baseUrl).toLowerCase();
  if (!host) {
    return "unknown";
  }
  if (host.includes("staging")) {
    return "staging";
  }
  return configured ? "production" : "unknown";
}

function webhookUrl(env) {
  const source = env || {};
  let project = source.GCLOUD_PROJECT || source.GCP_PROJECT || "";
  if (!project && source.FIREBASE_CONFIG) {
    try {
      project = JSON.parse(source.FIREBASE_CONFIG).projectId || "";
    } catch (_) {
      project = "";
    }
  }
  const region = source.FUNCTION_REGION || "us-central1";
  if (!project) {
    return "";
  }
  return (
    "https://" + region + "-" + project + ".cloudfunctions.net/storeValleyWebhook"
  );
}

function isoOrNull(value) {
  if (!value) {
    return null;
  }
  let date = null;
  if (typeof value.toDate === "function") {
    date = value.toDate();
  } else if (value instanceof Date) {
    date = value;
  } else if (typeof value === "string" || typeof value === "number") {
    date = new Date(value);
  } else if (value._seconds != null) {
    date = new Date(value._seconds * 1000);
  }
  return date && !Number.isNaN(date.getTime()) ? date.toISOString() : null;
}

function textOrNull(value) {
  return value === undefined || value === null || value === ""
    ? null
    : String(value);
}

/** One processed update, as the panel shows it. */
function shapeEvent(id, data, detailed) {
  const src = data || {};
  const resourceType = String(src.resource_type || "");
  const event = {
    event_id: String(src.event_id || id || ""),
    event_type: String(src.event_type || ""),
    resource_type: resourceType,
    resource_id: textOrNull(src.resource_id),
    status: textOrNull(src.status),
    received_at: isoOrNull(src.received_at),
    selftest: src.selftest === true || resourceType === "selftest",
  };
  if (detailed) {
    const attempts = Number(src.otp_failed_attempts);
    event.otp_status = textOrNull(src.otp_status);
    event.otp_failed_attempts = Number.isFinite(attempts)
      ? Math.trunc(attempts)
      : 0;
    event.has_photo = src.has_photo === true;
    event.has_signature = src.has_signature === true;
  }
  return event;
}

function selftestEvent(nowMs) {
  const at = new Date(nowMs);
  return {
    event_id: "selftest_" + nowMs,
    event_type: "storevalley.selftest",
    resource_type: "selftest",
    timestamp: at.toISOString(),
  };
}

/** The body and headers of a signed update, exactly as the receiver checks them. */
function signedRequest(event, secret, timestamp) {
  const rawBody = JSON.stringify(event);
  const stamp = String(timestamp);
  return {
    rawBody,
    headers: {
      "Content-Type": "application/json",
      "X-StoreValley-Signature": signWebhookBody(rawBody, stamp, secret),
      "X-StoreValley-Signature-Timestamp": stamp,
    },
  };
}

function wrongSignature(signature) {
  const text = String(signature || "");
  const first = text.charAt(0) === "0" ? "1" : "0";
  return first + text.slice(1);
}

function cleanIds(ids) {
  const list = Array.isArray(ids) ? ids : [];
  const seen = new Set();
  const out = [];
  for (const value of list) {
    const id = typeof value === "string" ? value.trim() : "";
    if (!id || seen.has(id)) {
      continue;
    }
    seen.add(id);
    out.push(id);
    if (out.length >= MAX_IDS) {
      break;
    }
  }
  return out;
}

function sortOldestFirst(events) {
  return events.slice().sort((a, b) => {
    const left = a.received_at || "";
    const right = b.received_at || "";
    if (left === right) {
      return 0;
    }
    return left < right ? -1 : 1;
  });
}

/* ---------- reads ---------- */

async function countJobs(db) {
  const counts = {};
  for (const status of JOB_STATUSES) {
    const query = db.collection(JOBS).where("status", "==", status);
    if (typeof query.count === "function") {
      const snap = await query.count().get();
      counts[status] = Number(snap.data().count) || 0;
    } else {
      const snap = await query.select().get();
      counts[status] = snap.size;
    }
  }
  return counts;
}

async function recentEvents(db) {
  const snap = await db
    .collection(EVENTS)
    .orderBy("received_at", "desc")
    .limit(SCAN_LIMIT)
    .get();
  return snap.docs.map((doc) => shapeEvent(doc.id, doc.data()));
}

async function eventsForIds(db, ids) {
  const found = new Map();
  for (const field of LOOKUP_FIELDS) {
    const snap = await db.collection(EVENTS).where(field, "in", ids).get();
    snap.forEach((doc) => {
      if (!found.has(doc.id)) {
        found.set(doc.id, shapeEvent(doc.id, doc.data(), true));
      }
    });
  }
  return sortOldestFirst(Array.from(found.values()));
}

async function checkReachable() {
  const started = Date.now();
  const result = await requestStoreValley({
    method: "GET",
    path: "/inventory",
    query: {
      designer_id: CHECK_DESIGNER_ID,
      warehouse_id: CHECK_WAREHOUSE_ID,
      limit: 1,
    },
    persistSnapshot: false,
    generateOtp: false,
  });
  const status = Number(result && result.status) || 0;
  return {
    ok: status >= 200 && status < 300,
    status,
    ms: Date.now() - started,
  };
}

async function statusReport(db) {
  const configuredBase = configValue("base_url", "STOREVALLEY_BASE_URL", "");
  const baseUrl = configuredBase || DEFAULT_BASE_URL;
  const events = await recentEvents(db);
  return {
    environment: environmentName(baseUrl, !!configuredBase),
    base_host: hostOf(baseUrl),
    api_key_set: !!configValue("api_key", "STOREVALLEY_API_KEY", ""),
    webhook_secret_set: !!configValue(
      "webhook_secret",
      "STOREVALLEY_WEBHOOK_SECRET",
      "",
    ),
    webhook_url: webhookUrl(process.env),
    reachable: await checkReachable(),
    jobs: await countJobs(db),
    last_webhook: events.find((event) => !event.selftest) || null,
    last_selftest: events.find((event) => event.selftest) || null,
    recent_webhooks: events.slice(0, RECENT_LIMIT),
  };
}

async function postWebhook(url, rawBody, headers) {
  try {
    const response = await fetch(url, { method: "POST", headers, body: rawBody });
    return response.status;
  } catch (_) {
    return 0;
  }
}

async function webhookSelftest() {
  const secret = configValue("webhook_secret", "STOREVALLEY_WEBHOOK_SECRET", "");
  if (!secret) {
    throw new functions.https.HttpsError(
      "failed-precondition",
      "Webhook secret is not configured.",
    );
  }
  const url = webhookUrl(process.env);
  if (!url) {
    throw new functions.https.HttpsError(
      "failed-precondition",
      "The webhook address could not be worked out.",
    );
  }
  const now = Date.now();
  const event = selftestEvent(now);
  const request = signedRequest(event, secret, now);
  const signedStatus = await postWebhook(url, request.rawBody, request.headers);
  const badHeaders = Object.assign({}, request.headers, {
    "X-StoreValley-Signature": wrongSignature(
      request.headers["X-StoreValley-Signature"],
    ),
  });
  const unsignedStatus = await postWebhook(url, request.rawBody, badHeaders);
  return {
    event_id: event.event_id,
    signed: { status: signedStatus, ok: signedStatus === 200 },
    unsigned: { status: unsignedStatus, ok: unsignedStatus === 401 },
  };
}

/* ---------- moving codes out of readable records ---------- */

const ORDER_PAGE = 200;

/**
 * Moves every delivery or pickup code still sitting on a readable record into
 * the private store, and takes it (and the contact details beside it) off that
 * record. The private copy is written first, so a failure never loses a code.
 * With `dryRun` it only counts.
 */
async function moveCodes(db, dryRun) {
  const FieldValue = admin.firestore.FieldValue;
  const moved = { logistics: 0, orders: 0, movements: 0, returns: 0 };
  let skipped = 0;
  const stamp = (record) =>
    Object.assign({}, record, { updated_at: FieldValue.serverTimestamp() });

  // 1. The warehouse's answers (`logistics_response`): code and contact details.
  const logistics = new Map();
  for (const field of ["pickup_otp", "otp_user_id", "otp_phone", "otp_email"]) {
    const snap = await db.collection("logistics_response").where(field, ">", "").get();
    snap.forEach((doc) => logistics.set(doc.id, doc));
  }
  for (const doc of logistics.values()) {
    const plan = codes.planLogisticsMove(doc.data() || {});
    if (!plan) {
      skipped += 1;
      continue;
    }
    moved.logistics += 1;
    if (dryRun) {
      continue;
    }
    if (plan.record) {
      await codes.saveMovedCode(db, stamp(plan.record));
    }
    const patch = {};
    plan.remove.forEach((key) => {
      patch[key] = FieldValue.delete();
    });
    if (plan.hasCode) {
      patch.has_code = true;
    }
    await doc.ref.update(patch);
  }

  // 2. Orders: the code on each shipment of `delivery_info_list`. An array
  // cannot be searched by a field of its entries, so every order is read.
  let last = null;
  while (true) {
    let query = db
      .collection("orders")
      .orderBy(admin.firestore.FieldPath.documentId())
      .select("delivery_info_list")
      .limit(ORDER_PAGE);
    if (last) {
      query = query.startAfter(last);
    }
    const page = await query.get();
    if (page.empty) {
      break;
    }
    for (const doc of page.docs) {
      if (!codes.planOrderMove(doc.data() || {})) {
        continue;
      }
      moved.orders += 1;
      if (dryRun) {
        continue;
      }
      // Re-read inside a transaction: a status update may be rewriting the same list.
      const plan = await db.runTransaction(async (tx) => {
        const fresh = await tx.get(doc.ref);
        const current = fresh.exists ? codes.planOrderMove(fresh.data() || {}) : null;
        if (current) {
          for (const record of current.records) {
            const ref = db.collection(codes.COLLECTION).doc(codes.codeDocId(record.tracking_id));
            const existing = await tx.get(ref);
            const patch = codes.mergeKeepingCode(
              existing.exists ? existing.data() || {} : null,
              stamp(record),
            );
            if (patch) {
              current.writes = (current.writes || []).concat([{ ref, patch }]);
            }
          }
          (current.writes || []).forEach((write) => tx.set(write.ref, write.patch, { merge: true }));
          tx.update(doc.ref, { delivery_info_list: current.nextList });
        }
        return current;
      });
      if (!plan) {
        moved.orders -= 1;
      }
    }
    last = page.docs[page.docs.length - 1];
    if (page.docs.length < ORDER_PAGE) {
      break;
    }
  }

  // 3. Restock and return-to-designer requests.
  const movements = await db
    .collection("inventorymovementlog")
    .where("request_delivery_info.pickup_otp", ">", "")
    .get();
  for (const doc of movements.docs) {
    const plan = codes.planMovementMove(doc.data() || {});
    if (!plan) {
      skipped += 1;
      continue;
    }
    moved.movements += 1;
    if (dryRun) {
      continue;
    }
    for (const record of plan.records) {
      await codes.saveMovedCode(db, stamp(record));
    }
    await doc.ref.update({
      "request_delivery_info.pickup_otp": FieldValue.delete(),
      "request_delivery_info.has_code": plan.hasCode,
    });
  }

  // 4. Customer returns.
  const returns = await db.collection("return_requests").where("pickup_otp", ">", "").get();
  for (const doc of returns.docs) {
    const plan = codes.planReturnMove(doc.data() || {});
    if (!plan) {
      skipped += 1;
      continue;
    }
    moved.returns += 1;
    if (dryRun) {
      continue;
    }
    for (const record of plan.records) {
      await codes.saveMovedCode(db, stamp(record));
    }
    await doc.ref.update({ pickup_otp: FieldValue.delete(), has_code: plan.hasCode });
  }

  return { dry_run: dryRun, moved, skipped };
}

exports.storeValleyDiagnostics = functions
  .runWith({ timeoutSeconds: 300, memory: "256MB" })
  .https.onCall(async (data, context) => {
    await requireStaff(context, { noDesigner: true });
    const action = String((data && data.action) || "status");
    const db = admin.firestore();
    if (action === "status") {
      return statusReport(db);
    }
    if (action === "webhook_selftest") {
      return webhookSelftest();
    }
    if (action === "events") {
      const ids = cleanIds(data && data.ids);
      if (!ids.length) {
        return { events: [] };
      }
      return { events: await eventsForIds(db, ids) };
    }
    if (action === "move_codes") {
      // Counts only unless the caller says `dry_run: false`.
      return moveCodes(db, !(data && data.dry_run === false));
    }
    throw new functions.https.HttpsError("invalid-argument", "Unknown action.");
  });

module.exports.hostOf = hostOf;
module.exports.environmentName = environmentName;
module.exports.webhookUrl = webhookUrl;
module.exports.isoOrNull = isoOrNull;
module.exports.shapeEvent = shapeEvent;
module.exports.selftestEvent = selftestEvent;
module.exports.signedRequest = signedRequest;
module.exports.wrongSignature = wrongSignature;
module.exports.cleanIds = cleanIds;
module.exports.sortOldestFirst = sortOldestFirst;
