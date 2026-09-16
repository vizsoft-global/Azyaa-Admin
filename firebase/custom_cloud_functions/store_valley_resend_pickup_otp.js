const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { notifyOtp } = require("./store_valley_proxy.js");

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

function toHttpsError(error) {
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
      const trackingId = String(
        (data && (data.trackingId || data.request_id)) || "",
      ).trim();
      if (!trackingId) {
        const error = new Error("Missing tracking id.");
        error.code = "invalid-argument";
        throw error;
      }
      const doc = await findLogisticsDoc(trackingId);
      if (!doc) {
        const error = new Error("Intake tracking record was not found.");
        error.code = "not-found";
        throw error;
      }
      const payload = doc.data() || {};
      const otp = resolvePickupOtpForResend(payload);
      await notifyOtp(
        {
          userId: payload.otp_user_id || null,
          phone: payload.otp_phone || null,
          email: payload.otp_email || null,
          otpType: payload.otp_type || "designer_pickup",
        },
        otp,
      );
      return { ok: true };
    } catch (error) {
      toHttpsError(error);
    }
  },
);

module.exports.assertAuthenticated = assertAuthenticated;
module.exports.isResendBlocked = isResendBlocked;
module.exports.resolvePickupOtpForResend = resolvePickupOtpForResend;
