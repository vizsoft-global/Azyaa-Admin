const {
  attachGeneratedDeliveryOtp,
  defaultOtpType,
} = require("./store_valley_http.js");

function assertEqual(actual, expected, label) {
  if (actual !== expected) {
    throw new Error(label + ": expected " + JSON.stringify(expected) + " got " + JSON.stringify(actual));
  }
}

function assertTrue(value, label) {
  if (!value) {
    throw new Error(label + ": expected truthy");
  }
}

const intake = attachGeneratedDeliveryOtp(
  { requires_otp_proof: true, warehouse_id: "WH-KWT-MAIN" },
  { method: "POST", path: "/warehouse-intake-requests" },
);
assertEqual(intake.body.requires_otp_proof, true, "intake keeps requires_otp_proof");
assertTrue(
  typeof intake.body.delivery_otp === "string" &&
    intake.body.delivery_otp.length === 6,
  "intake adds delivery_otp",
);
assertEqual(intake.otp, intake.body.delivery_otp, "intake otp matches body");
assertEqual(
  defaultOtpType("/warehouse-intake-requests"),
  "designer_pickup",
  "intake otp type",
);

const existing = attachGeneratedDeliveryOtp(
  { requires_otp_proof: true, delivery_otp: "461832" },
  { method: "POST", path: "/warehouse-intake-requests" },
);
assertEqual(existing.body.delivery_otp, "461832", "keeps existing delivery_otp");
assertEqual(existing.otp, "", "does not regenerate existing otp");

const skipped = attachGeneratedDeliveryOtp(
  { warehouse_id: "WH-KWT-MAIN" },
  { method: "POST", path: "/warehouse-intake-requests", generateOtp: false },
);
assertEqual(skipped.body.delivery_otp, undefined, "can skip otp generation");

console.log("store_valley_http otp attach ok");
