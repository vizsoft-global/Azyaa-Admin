const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { notifyOtp } = require("./store_valley_proxy.js");
const { requireStaff } = require("./store_valley_staff.js");
const { lookupCode } = require("./store_valley_codes.js");

function assertAuthenticated(auth) {
  if (!auth) {
    const error = new Error("Sign in required.");
    error.code = "unauthenticated";
    throw error;
  }
}

function isResendBlocked(status, otpVerificationStatus) {
  const otp = String(otpVerificationStatus || "").toLowerCase();
  const value = String(status || "").toLowerCase();
  return (
    otp === "verified" ||
    value === "pickup_completed" ||
    value === "stored" ||
    value === "verification_passed"
  );
}

function resolvePickupOtpForResend(docData) {
  const otp = docData && docData.pickup_otp;
  if (!otp) {
    const error = new Error("Pickup OTP is not stored.");
    error.code = "not-found";
    throw error;
  }
  if (isResendBlocked(docData.status, docData.otp_verification_status)) {
    const error = new Error("Pickup OTP cannot be resent.");
    error.code = "failed-precondition";
    throw error;
  }
  return String(otp);
}

/**
 * What to resend and to whom: the code and contact details from the private
 * store (`found`), with the status of the readable record deciding whether a
 * resend is still allowed. Old records that carry everything themselves work too.
 */
function resendTarget(logistics, found) {
  const record = logistics || {};
  const code = (found && found.code) || record.pickup_otp || "";
  return {
    record: {
      pickup_otp: code,
      status: record.status,
      otp_verification_status: record.otp_verification_status,
    },
    notify: {
      userId: (found && found.user_id) || record.otp_user_id || null,
      phone: (found && found.phone) || record.otp_phone || null,
      email: (found && found.email) || record.otp_email || null,
      otpType:
        (found && found.otp_type) || record.otp_type || "designer_pickup",
    },
  };
}

function toHttpsError(error) {
  if (error instanceof functions.https.HttpsError) {
    throw error;
  }
  const code = error && error.code;
  if (code === "unauthenticated") {
    throw new functions.https.HttpsError("unauthenticated", error.message);
  }
  if (code === "invalid-argument") {
    throw new functions.https.HttpsError("invalid-argument", error.message);
  }
  if (code === "not-found") {
    throw new functions.https.HttpsError("not-found", error.message);
  }
  if (code === "failed-precondition") {
    throw new functions.https.HttpsError("failed-precondition", error.message);
  }
  throw new functions.https.HttpsError(
    "internal",
    (error && error.message) || "Unable to resend pickup OTP.",
  );
}

async function findLogisticsDoc(trackingId) {
  const col = admin.firestore().collection("logistics_response");
  const fields = ["swftTrackID", "request_id", "id", "external_request_id"];
  for (const field of fields) {
    const snap = await col.where(field, "==", trackingId).limit(1).get();
    if (!snap.empty) {
      return snap.docs[0];
    }
  }
  return null;
}

exports.storeValleyResendPickupOtp = functions.https.onCall(
  async (data, context) => {
    try {
      assertAuthenticated(context && context.auth);
      await requireStaff(context);
      const trackingId = String(
        (data && (data.trackingId || data.request_id)) || "",
      ).trim();
      if (!trackingId) {
        const error = new Error("Missing tracking id.");
        error.code = "invalid-argument";
        throw error;
      }
      // The code is kept in the private store; records written before it
      // existed still carry it themselves, and `lookupCode` reads both.
      const doc = await findLogisticsDoc(trackingId);
      const found = await lookupCode(admin.firestore(), trackingId);
      if (!doc && !found) {
        const error = new Error("Intake tracking record was not found.");
        error.code = "not-found";
        throw error;
      }
      const payload = (doc && doc.data()) || {};
      const resend = resendTarget(payload, found);
      const otp = resolvePickupOtpForResend(resend.record);
      await notifyOtp(resend.notify, otp);
      return { ok: true };
    } catch (error) {
      toHttpsError(error);
    }
  },
);

module.exports.assertAuthenticated = assertAuthenticated;
module.exports.isResendBlocked = isResendBlocked;
module.exports.resolvePickupOtpForResend = resolvePickupOtpForResend;
module.exports.resendTarget = resendTarget;
