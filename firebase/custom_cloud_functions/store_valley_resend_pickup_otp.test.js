const {
  assertAuthenticated,
  resolvePickupOtpForResend,
  isResendBlocked,
} = require("./store_valley_resend_pickup_otp.js");

function assertThrows(fn, code, label) {
  try {
    fn();
  } catch (error) {
    if (error.code !== code) {
      throw new Error(label + ": expected " + code + " got " + error.code);
    }
    return;
  }
  throw new Error(label + ": expected throw");
}

assertThrows(
  () => assertAuthenticated(null),
  "unauthenticated",
  "unauthenticated resend",
);

assertThrows(
  () => resolvePickupOtpForResend({}),
  "not-found",
  "missing OTP",
);

assertThrows(
  () =>
    resolvePickupOtpForResend({
      pickup_otp: "482193",
      status: "pickup_completed",
    }),
  "failed-precondition",
  "blocked after handover",
);

if (isResendBlocked("intake_created", "") !== false) {
  throw new Error("pending intake should allow resend");
}

const otp = resolvePickupOtpForResend({
  pickup_otp: "482193",
  status: "intake_created",
});
if (otp !== "482193") {
  throw new Error("pending OTP should be returned");
}

console.log("store_valley_resend_pickup_otp ok");
