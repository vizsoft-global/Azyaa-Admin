const codes = require("./store_valley_codes.js");
const { persistCreateSnapshot } = require("./store_valley_http.js");
const { resendTarget } = require("./store_valley_resend_pickup_otp.js");

function assertEqual(actual, expected, label) {
  const a = JSON.stringify(actual);
  const e = JSON.stringify(expected);
  if (a !== e) {
    throw new Error(label + ": expected " + e + " got " + a);
  }
}

/** A tiny in-memory stand-in for the two collections the code store touches. */
class MemoryDb {
  constructor(seed) {
    this.docs = new Map(Object.entries(seed || {}));
    this.auto = 0;
  }
  doc(path) {
    const db = this;
    return {
      path,
      id: path.split("/").pop(),
      async get() {
        const data = db.docs.get(path);
        return { exists: data != null, id: path.split("/").pop(), data: () => (data ? { ...data } : undefined) };
      },
      async set(data, opts) {
        const prev = db.docs.get(path) || {};
        db.docs.set(path, opts && opts.merge ? Object.assign({}, prev, data) : { ...data });
      },
    };
  }
  collection(name) {
    const db = this;
    return {
      doc: (id) => db.doc(name + "/" + id),
      async add(data) {
        db.auto += 1;
        const ref = db.doc(name + "/auto" + db.auto);
        await ref.set(data);
        return ref;
      },
      where(field, _op, value) {
        return {
          limit() {
            return this;
          },
          async get() {
            const docs = [];
            for (const [path, data] of db.docs.entries()) {
              if (path.startsWith(name + "/") && data[field] === value) {
                docs.push({ id: path.split("/").pop(), data: () => ({ ...data }) });
              }
            }
            return { empty: docs.length === 0, docs };
          },
        };
      },
    };
  }
}

// --- ids ---
assertEqual(codes.trackingIdOf({ order_id: "O1", request_id: "R1" }), "O1", "order id first");
assertEqual(codes.trackingIdOf({ request_id: "R1", delivery_order_id: "D1" }), "R1", "then request id");
assertEqual(codes.trackingIdOf({ delivery_order_id: "D1" }), "D1", "then delivery order id");
assertEqual(codes.trackingIdOf(null), "", "no body");
assertEqual(codes.codeDocId(" a/b "), "a_b", "record id has no slash");

// --- the private record ---
const record = codes.codeRecord({
  code: "461832",
  notify: { otpType: "designer_pickup", userId: "uid1", phone: "+96550000001", email: "d@example.com" },
  body: { request_id: "REQ-1", external_request_id: "INT-1", delivery_order_id: "DEL-1" },
  path: "/warehouse-intake-requests",
  sentAt: "T",
  now: "T",
});
assertEqual(
  record,
  {
    tracking_id: "REQ-1",
    code: "461832",
    otp_type: "designer_pickup",
    user_id: "uid1",
    phone: "+96550000001",
    email: "d@example.com",
    request_id: "REQ-1",
    external_request_id: "INT-1",
    delivery_order_id: "DEL-1",
    resource_path: "/warehouse-intake-requests",
    sent_at: "T",
    updated_at: "T",
  },
  "private record",
);
assertEqual(
  codes.codeRecord({ trackingId: "X", code: "1" }),
  { tracking_id: "X", code: "1" },
  "empty details are left out",
);
assertEqual(
  codes.codeRecord({ code: "1", body: { order_id: "O1", client_order_id: "C-RM" } }).delivery_order_id,
  "O1",
  "a warehouse delivery's order id is its delivery id",
);

// --- what a readable record may say ---
assertEqual(codes.publicCodeMarker({ now: "T", otpType: "delivery" }), { has_code: true, otp_sent_at: "T", otp_type: "delivery" }, "marker");
assertEqual(codes.publicCodeMarker({}), { has_code: true }, "bare marker");

// --- who may be given a code ---
const found = { code: "461832", user_id: "designer1" };
assertEqual(codes.mayReceive({ uid: "a", roleKey: "super_admin" }, found), true, "super admin sees every code");
assertEqual(codes.mayReceive({ uid: "a", roleKey: "admin" }, found), true, "admin sees every code");
assertEqual(codes.mayReceive({ uid: "a", roleKey: "shop_manager" }, found), true, "shop manager sees every code");
assertEqual(codes.mayReceive({ uid: "designer1", roleKey: "designer" }, found), true, "designer sees a code sent to them");
assertEqual(codes.mayReceive({ uid: "designer2", roleKey: "designer" }, found), false, "designer does not see another's code");
assertEqual(codes.mayReceive({ uid: "designer1", roleKey: "designer" }, { code: "1", user_id: null }), false, "designer does not see a code with no owner");
assertEqual(codes.mayReceive({ uid: "a", roleKey: "admin" }, { code: "" }), false, "no code, nothing to give");
assertEqual(codes.mayReceive({ uid: "a", roleKey: "admin" }, null), false, "nothing found");
assertEqual(codes.mayReceive(null, found), false, "no caller");

// --- shaping ---
assertEqual(
  codes.shapeCode({ code: "461832", otp_type: "delivery", sent_at: new Date("2026-11-27T10:00:00Z"), user_id: "u", phone: "p" }),
  { code: "461832", otp_type: "delivery", sent_at: "2026-11-27T10:00:00.000Z" },
  "the answer carries no contact details",
);
assertEqual(codes.shapeCode({ code: "1" }), { code: "1", otp_type: null, sent_at: null }, "bare answer");
assertEqual(codes.fromLegacy({ pickup_otp: "9", otp_user_id: "u", otp_type: "delivery" }).user_id, "u", "legacy owner");
assertEqual(codes.fromLegacy({ pickup_otp: "9" }).source, "legacy", "legacy source");

// --- input ---
assertEqual(codes.cleanTrackingIds([" a ", "a", "", 5, null, "b"]), ["a", "b"], "trimmed and de-duplicated");
assertEqual(codes.cleanTrackingIds("a"), [], "not a list");
assertEqual(
  codes.cleanTrackingIds(Array.from({ length: 30 }, (_, i) => "id" + i)).length,
  codes.MAX_TRACKING_IDS,
  "capped",
);

// --- a stored code is never replaced or blanked ---
assertEqual(codes.mergeKeepingCode(null, { tracking_id: "T", code: "1" }), { tracking_id: "T", code: "1" }, "new record");
assertEqual(codes.mergeKeepingCode({ tracking_id: "T", code: "1" }, { tracking_id: "T", code: "2" }), null, "an existing code is kept");
assertEqual(
  codes.mergeKeepingCode({ tracking_id: "T", code: "1" }, { tracking_id: "T", code: "", user_id: "u", updated_at: "N" }),
  { user_id: "u", updated_at: "N" },
  "details are filled in, the code is untouched",
);
assertEqual(codes.mergeKeepingCode({ tracking_id: "T", code: "1", user_id: "u" }, { tracking_id: "T", user_id: "other" }), null, "existing details are kept");
assertEqual(codes.mergeKeepingCode(null, { tracking_id: "T", user_id: "u" }), null, "no code, no record");

// --- planning the move of old codes ---
const logisticsPlan = codes.planLogisticsMove({
  swftTrackID: "REQ-1",
  request_id: "REQ-1",
  external_request_id: "INT-1",
  pickup_otp: "461832",
  otp_user_id: "designer1",
  otp_phone: "+96550000001",
  otp_email: "d@example.com",
  otp_type: "designer_pickup",
  otp_sent_at: "S",
  resource_path: "/warehouse-intake-requests",
  status: "stored",
});
assertEqual(logisticsPlan.trackingId, "REQ-1", "logistics id");
assertEqual(logisticsPlan.hasCode, true, "logistics has a code");
assertEqual(logisticsPlan.remove, ["pickup_otp", "otp_user_id", "otp_phone", "otp_email"], "fields taken off");
assertEqual(logisticsPlan.record.code, "461832", "code moved");
assertEqual(logisticsPlan.record.user_id, "designer1", "owner moved");
assertEqual(logisticsPlan.record.sent_at, "S", "sent time moved");
assertEqual(logisticsPlan.record.external_request_id, "INT-1", "reference moved");
assertEqual(codes.planLogisticsMove({ swftTrackID: "X", status: "stored", pickup_otp: null }), null, "nothing to move");
const contactOnly = codes.planLogisticsMove({ swftTrackID: "X", otp_phone: "+96550000001" });
assertEqual([contactOnly.record, contactOnly.hasCode], [null, false], "contact details alone are only removed");
assertEqual(codes.planLogisticsMove({ pickup_otp: "1" }), null, "a code with no id stays where it is");

const orderPlan = codes.planOrderMove({
  delivery_info_list: [
    { delivery_tracking_id: "SV-1", status: "REQUESTED", pickup_otp: "111111", product_ids: ["p1"] },
    { delivery_tracking_id: "SV-2", status: "delivered", pickup_otp: null },
    { delivery_tracking_id: "SV-3", status: "delivered" },
    { status: "REQUESTED", pickup_otp: "333333" },
  ],
});
assertEqual(orderPlan.records, [{ tracking_id: "SV-1", code: "111111", otp_type: "delivery" }], "order codes");
assertEqual(
  orderPlan.nextList,
  [
    { delivery_tracking_id: "SV-1", status: "REQUESTED", product_ids: ["p1"], has_code: true },
    { delivery_tracking_id: "SV-2", status: "delivered" },
    { delivery_tracking_id: "SV-3", status: "delivered" },
    { status: "REQUESTED", pickup_otp: "333333" },
  ],
  "order list without codes; an entry with no id keeps its code",
);
assertEqual(codes.planOrderMove({ delivery_info_list: [{ delivery_tracking_id: "SV-3" }] }), null, "order with no code");
assertEqual(codes.planOrderMove({}), null, "order with no list");

assertEqual(
  codes.planMovementMove({ request_delivery_info: { delivery_tracking_id: "REQ-1", pickup_otp: "461832" } }),
  { records: [{ tracking_id: "REQ-1", code: "461832" }], hasCode: true },
  "restock request",
);
assertEqual(codes.planMovementMove({ request_delivery_info: { delivery_tracking_id: "REQ-1" } }), null, "restock request with no code");
assertEqual(codes.planMovementMove({ request_delivery_info: { pickup_otp: "1" } }), null, "restock code with no id stays");

assertEqual(
  codes.planReturnMove({ pickup_otp: "777777", store_valley_request_ids: ["RET-1", "RET-2"] }).records,
  [
    { tracking_id: "RET-1", code: "777777", otp_type: "return_pickup" },
    { tracking_id: "RET-2", code: "777777", otp_type: "return_pickup" },
  ],
  "a return's code is filed under every pickup",
);
assertEqual(codes.planReturnMove({ status: "Pending" }), null, "return with no code");
assertEqual(codes.planReturnMove({ pickup_otp: "1" }), null, "return code with no pickup id stays");

// --- resend: private store first, old record as fallback ---
assertEqual(
  resendTarget({ status: "intake_created", has_code: true }, { code: "461832", user_id: "u1", email: "d@example.com", otp_type: "designer_pickup" }),
  {
    record: { pickup_otp: "461832", status: "intake_created" },
    notify: { userId: "u1", phone: null, email: "d@example.com", otpType: "designer_pickup" },
  },
  "resend from the private store",
);
assertEqual(
  resendTarget({ status: "intake_created", pickup_otp: "9", otp_user_id: "u2", otp_phone: "+1" }, null).notify,
  { userId: "u2", phone: "+1", email: null, otpType: "designer_pickup" },
  "resend from an old record",
);

(async () => {
  // --- lookups ---
  const db = new MemoryDb({
    "store_valley_codes/REQ-1": { tracking_id: "REQ-1", code: "461832", user_id: "designer1", external_request_id: "INT-1", otp_type: "designer_pickup" },
    "store_valley_codes/EMPTY": { tracking_id: "EMPTY", user_id: "designer1" },
    "logistics_response/old1": { swftTrackID: "OLD-1", request_id: "OLD-1", pickup_otp: "222222", otp_user_id: "designer2" },
    "logistics_response/old2": { swftTrackID: "OLD-2", status: "stored" },
  });
  assertEqual((await codes.lookupCode(db, "REQ-1")).code, "461832", "by tracking id");
  assertEqual((await codes.lookupCode(db, "INT-1")).code, "461832", "by reference");
  const legacy = await codes.lookupCode(db, "OLD-1");
  assertEqual([legacy.code, legacy.source, legacy.user_id], ["222222", "legacy", "designer2"], "old record fallback");
  assertEqual(await codes.lookupCode(db, "OLD-2"), null, "old record with no code");
  assertEqual(await codes.lookupCode(db, "EMPTY"), null, "private record with no code");
  assertEqual(await codes.lookupCode(db, "NOPE"), null, "unknown id");
  assertEqual(await codes.lookupCode(db, " "), null, "blank id");

  // --- writes ---
  assertEqual(await codes.saveCode(db, { tracking_id: "NEW", code: "" }), false, "no code is not stored");
  assertEqual(await codes.saveCode(db, { code: "1" }), false, "no id is not stored");
  assertEqual(await codes.saveCode(db, { tracking_id: "NEW", code: "5" }), true, "stored");
  assertEqual(await codes.saveMovedCode(db, { tracking_id: "NEW", code: "6", phone: "+1" }), true, "details added to an existing record");
  assertEqual(db.docs.get("store_valley_codes/NEW"), { tracking_id: "NEW", code: "5", phone: "+1" }, "the stored code survives a move");
  assertEqual(await codes.saveMovedCode(db, { tracking_id: "NEW", code: "7" }), false, "nothing to add");

  // --- the request path: the readable snapshot carries no code or contact details ---
  const snapDb = new MemoryDb();
  await persistCreateSnapshot(
    "/warehouse-intake-requests",
    "POST",
    { request_id: "REQ-9", external_request_id: "INT-9", status: "intake_created" },
    { db: snapDb, pickupOtp: "909090", notifyCustomer: { userId: "designer9", phone: "+96550000009", email: "nine@example.com", otpType: "designer_pickup" } },
  );
  const snapshot = [...snapDb.docs.entries()].find(([path]) => path.startsWith("logistics_response/"))[1];
  assertEqual(
    [snapshot.swftTrackID, snapshot.has_code, snapshot.otp_type, snapshot.pickup_otp, snapshot.otp_user_id, snapshot.otp_phone, snapshot.otp_email],
    ["REQ-9", true, "designer_pickup", undefined, undefined, undefined, undefined],
    "readable snapshot",
  );
  assertEqual(JSON.stringify(snapshot).includes("909090"), false, "the code is nowhere on the readable snapshot");
  const kept = snapDb.docs.get("store_valley_codes/REQ-9");
  assertEqual([kept.code, kept.user_id, kept.phone, kept.email, kept.external_request_id], ["909090", "designer9", "+96550000009", "nine@example.com", "INT-9"], "private record from the request path");

  const plainDb = new MemoryDb();
  await persistCreateSnapshot("/orders", "POST", { order_id: "O-1", status: "pending" }, { db: plainDb });
  assertEqual([...plainDb.docs.keys()].filter((path) => path.startsWith("store_valley_codes/")).length, 0, "no code, no private record");
  assertEqual(plainDb.docs.get("logistics_response/auto1").has_code, undefined, "no code, no marker");

  console.log("store_valley_codes tests passed");
})().catch((error) => {
  console.error(error);
  process.exit(1);
});
