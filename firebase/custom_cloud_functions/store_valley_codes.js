const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { requireStaff } = require("./store_valley_staff.js");

/*
 * Delivery and pickup codes are kept in `store_valley_codes`, a collection no
 * app or panel can read (database rules refuse every client). Staff get a code
 * through the `storeValleyCode` function below. The records other screens read
 * (`logistics_response`, the order, a restock request, a return) only say that
 * a code exists.
 */

const COLLECTION = "store_valley_codes";
const LEGACY_COLLECTION = "logistics_response";
// Other ids a request is known by, on a private record.
const LOOKUP_FIELDS = [
  "request_id",
  "external_request_id",
  "client_order_id",
  "delivery_order_id",
];
// Where a code written before the private store existed may still be found.
const LEGACY_FIELDS = [
  "swftTrackID",
  "request_id",
  "external_request_id",
  "delivery_order_id",
];
const MAX_TRACKING_IDS = 20;
const DESIGNER_ROLE = "designer";

/* ---------- pure helpers (unit-tested) ---------- */

function text(value) {
  return value === undefined || value === null ? "" : String(value).trim();
}

function textOrNull(value) {
  const out = text(value);
  return out || null;
}

/** The id a request is filed under: the same one `logistics_response.swftTrackID` holds. */
function trackingIdOf(body) {
  const src = body && typeof body === "object" ? body : {};
  return text(src.order_id || src.request_id || src.delivery_order_id);
}

/** A tracking id as a record id ("/" cannot be part of one). */
function codeDocId(trackingId) {
  return text(trackingId).replace(/\//g, "_");
}

/**
 * The private record of one code. `notify` is who the code was sent to
 * (`userId`, `phone`, `email`, `otpType`); `body` is Store Valley's answer.
 * Fields with nothing to say are left out, so a merge never blanks a value.
 */
function codeRecord(input) {
  const src = input || {};
  const body = src.body && typeof src.body === "object" ? src.body : {};
  const notify = src.notify && typeof src.notify === "object" ? src.notify : {};
  const trackingId = text(src.trackingId) || trackingIdOf(body);
  const fields = {
    tracking_id: trackingId,
    code: text(src.code),
    otp_type: text(notify.otpType || src.otpType),
    user_id: text(notify.userId),
    phone: text(notify.phone),
    email: text(notify.email),
    request_id: text(body.request_id),
    external_request_id: text(body.external_request_id),
    client_order_id: text(body.client_order_id),
    delivery_order_id: text(body.delivery_order_id || body.order_id),
    resource_path: text(src.path),
  };
  const record = {};
  Object.keys(fields).forEach((key) => {
    if (fields[key]) {
      record[key] = fields[key];
    }
  });
  if (src.sentAt) {
    record.sent_at = src.sentAt;
  }
  if (src.now) {
    record.updated_at = src.now;
  }
  return record;
}

/** What a readable record may say about a code: that there is one, never the code. */
function publicCodeMarker(input) {
  const src = input || {};
  const marker = { has_code: true };
  if (src.now) {
    marker.otp_sent_at = src.now;
  }
  const type = text(src.otpType);
  if (type) {
    marker.otp_type = type;
  }
  return marker;
}

/** A code found in the private store, in one shape. */
function fromPrivate(data) {
  const src = data || {};
  return {
    source: "private",
    code: text(src.code),
    otp_type: textOrNull(src.otp_type),
    user_id: textOrNull(src.user_id),
    phone: textOrNull(src.phone),
    email: textOrNull(src.email),
    sent_at: src.sent_at || null,
  };
}

/** A code still sitting on an old `logistics_response` record, in the same shape. */
function fromLegacy(data) {
  const src = data || {};
  return {
    source: "legacy",
    code: text(src.pickup_otp),
    otp_type: textOrNull(src.otp_type),
    user_id: textOrNull(src.otp_user_id),
    phone: textOrNull(src.otp_phone),
    email: textOrNull(src.otp_email),
    sent_at: src.otp_sent_at || null,
  };
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

/** What the panel receives for one tracking id. */
function shapeCode(found) {
  return {
    code: text(found && found.code),
    otp_type: textOrNull(found && found.otp_type),
    sent_at: isoOrNull(found && found.sent_at),
  };
}

/**
 * Whether the caller may be given this code. Staff see every code; a designer
 * only the codes that were sent to them (their own restock pickups).
 * `who` is what `requireStaff` returns.
 */
function mayReceive(who, found) {
  if (!who || !found || !text(found.code)) {
    return false;
  }
  if (who.roleKey !== DESIGNER_ROLE) {
    return true;
  }
  const owner = text(found.user_id);
  return !!owner && owner === text(who.uid);
}

function cleanTrackingIds(ids) {
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
    if (out.length >= MAX_TRACKING_IDS) {
      break;
    }
  }
  return out;
}

/**
 * What to write when a record for this tracking id may already exist. A code
 * already stored is never replaced or blanked; missing details are filled in.
 * Returns null when there is nothing to write.
 */
function mergeKeepingCode(existing, record) {
  const prev = existing || {};
  const next = {};
  Object.keys(record || {}).forEach((key) => {
    if (key === "code") {
      return;
    }
    if (key === "updated_at" || !text(prev[key])) {
      next[key] = record[key];
    }
  });
  const hadCode = !!text(prev.code);
  if (!hadCode && text(record && record.code)) {
    next.code = text(record.code);
  }
  const meaningful = Object.keys(next).filter((key) => key !== "updated_at");
  if (!meaningful.length) {
    return null;
  }
  if (hadCode || next.code) {
    return next;
  }
  // No code before and none now: nothing worth a private record.
  return null;
}

/* ---------- moving codes written before the private store ---------- */

function logisticsTrackingId(data) {
  const src = data || {};
  return text(src.swftTrackID || src.id || src.request_id || src.delivery_order_id);
}

/**
 * An old `logistics_response` record: the private record to keep and the
 * fields to take off it. Null when it holds neither a code nor contact details.
 */
function planLogisticsMove(data) {
  const src = data || {};
  const code = text(src.pickup_otp);
  const hasContact =
    !!text(src.otp_user_id) || !!text(src.otp_phone) || !!text(src.otp_email);
  if (!code && !hasContact) {
    return null;
  }
  const trackingId = logisticsTrackingId(src);
  const record =
    code && trackingId
      ? codeRecord({
          trackingId,
          code,
          notify: {
            otpType: src.otp_type,
            userId: src.otp_user_id,
            phone: src.otp_phone,
            email: src.otp_email,
          },
          body: {
            request_id: src.request_id,
            external_request_id: src.external_request_id,
            client_order_id: src.client_order_id,
            delivery_order_id: src.delivery_order_id,
          },
          path: src.resource_path,
          sentAt: src.otp_sent_at || null,
        })
      : null;
  if (code && !record) {
    // A code with no id to file it under is left where it is rather than lost.
    return null;
  }
  return {
    trackingId,
    record,
    remove: ["pickup_otp", "otp_user_id", "otp_phone", "otp_email"],
    hasCode: !!code,
  };
}

/**
 * An order: the codes on its `delivery_info_list` entries and the list without
 * them. Null when no entry carries a code field.
 */
function planOrderMove(data) {
  const list = data && Array.isArray(data.delivery_info_list) ? data.delivery_info_list : null;
  if (!list) {
    return null;
  }
  const records = [];
  let changed = false;
  const nextList = list.map((entry) => {
    if (!entry || typeof entry !== "object" || !Object.prototype.hasOwnProperty.call(entry, "pickup_otp")) {
      return entry;
    }
    const code = text(entry.pickup_otp);
    const trackingId = text(entry.delivery_tracking_id || entry.delivery_id);
    if (code && !trackingId) {
      return entry;
    }
    changed = true;
    const next = Object.assign({}, entry);
    delete next.pickup_otp;
    if (code) {
      next.has_code = true;
      records.push(codeRecord({ trackingId, code, otpType: "delivery" }));
    }
    return next;
  });
  return changed ? { records, nextList } : null;
}

/** A restock or return-to-designer request (`inventorymovementlog`). */
function planMovementMove(data) {
  const info = data && data.request_delivery_info;
  if (!info || typeof info !== "object" || !Object.prototype.hasOwnProperty.call(info, "pickup_otp")) {
    return null;
  }
  const code = text(info.pickup_otp);
  const trackingId = text(info.delivery_tracking_id);
  if (code && !trackingId) {
    return null;
  }
  return {
    records: code ? [codeRecord({ trackingId, code })] : [],
    hasCode: !!code,
  };
}

/** A customer return (`return_requests`): one code for every pickup booked for it. */
function planReturnMove(data) {
  const src = data || {};
  if (!Object.prototype.hasOwnProperty.call(src, "pickup_otp")) {
    return null;
  }
  const code = text(src.pickup_otp);
  const ids = Array.isArray(src.store_valley_request_ids)
    ? src.store_valley_request_ids.map(text).filter(Boolean)
    : [];
  if (code && !ids.length) {
    return null;
  }
  return {
    records: code
      ? ids.map((trackingId) => codeRecord({ trackingId, code, otpType: "return_pickup" }))
      : [],
    hasCode: !!code,
  };
}

/* ---------- reads and writes ---------- */

/** Stores a freshly made code. Does nothing when there is no code or no id. */
async function saveCode(db, record) {
  const id = codeDocId(record && record.tracking_id);
  if (!id || !text(record.code)) {
    return false;
  }
  await db.collection(COLLECTION).doc(id).set(record, { merge: true });
  return true;
}

/** Stores a moved code without replacing one that is already there. */
async function saveMovedCode(db, record) {
  const id = codeDocId(record && record.tracking_id);
  if (!id) {
    return false;
  }
  const ref = db.collection(COLLECTION).doc(id);
  const snap = await ref.get();
  const patch = mergeKeepingCode(snap.exists ? snap.data() || {} : null, record);
  if (!patch) {
    return false;
  }
  await ref.set(patch, { merge: true });
  return true;
}

async function findPrivate(db, id) {
  const col = db.collection(COLLECTION);
  const direct = await col.doc(codeDocId(id)).get();
  if (direct.exists && text((direct.data() || {}).code)) {
    return fromPrivate(direct.data());
  }
  for (const field of LOOKUP_FIELDS) {
    const snap = await col.where(field, "==", id).limit(1).get();
    if (!snap.empty) {
      const data = snap.docs[0].data() || {};
      if (text(data.code)) {
        return fromPrivate(data);
      }
    }
  }
  return null;
}

async function findLegacy(db, id) {
  const col = db.collection(LEGACY_COLLECTION);
  for (const field of LEGACY_FIELDS) {
    const snap = await col.where(field, "==", id).limit(5).get();
    for (const doc of snap.docs) {
      const data = doc.data() || {};
      if (text(data.pickup_otp)) {
        return fromLegacy(data);
      }
    }
  }
  return null;
}

/** The code of a request, from the private store or, failing that, an old record. */
async function lookupCode(db, trackingId) {
  const id = text(trackingId);
  if (!id) {
    return null;
  }
  return (await findPrivate(db, id)) || (await findLegacy(db, id));
}

exports.storeValleyCode = functions.https.onCall(async (data, context) => {
  const who = await requireStaff(context);
  const ids = cleanTrackingIds(data && data.trackingIds);
  const db = admin.firestore();
  const codes = {};
  for (const id of ids) {
    const found = await lookupCode(db, id);
    if (mayReceive(who, found)) {
      codes[id] = shapeCode(found);
    }
  }
  return { codes };
});

module.exports.COLLECTION = COLLECTION;
module.exports.LOOKUP_FIELDS = LOOKUP_FIELDS;
module.exports.MAX_TRACKING_IDS = MAX_TRACKING_IDS;
module.exports.trackingIdOf = trackingIdOf;
module.exports.codeDocId = codeDocId;
module.exports.codeRecord = codeRecord;
module.exports.publicCodeMarker = publicCodeMarker;
module.exports.fromPrivate = fromPrivate;
module.exports.fromLegacy = fromLegacy;
module.exports.shapeCode = shapeCode;
module.exports.mayReceive = mayReceive;
module.exports.cleanTrackingIds = cleanTrackingIds;
module.exports.mergeKeepingCode = mergeKeepingCode;
module.exports.planLogisticsMove = planLogisticsMove;
module.exports.planOrderMove = planOrderMove;
module.exports.planMovementMove = planMovementMove;
module.exports.planReturnMove = planReturnMove;
module.exports.saveCode = saveCode;
module.exports.saveMovedCode = saveMovedCode;
module.exports.lookupCode = lookupCode;
