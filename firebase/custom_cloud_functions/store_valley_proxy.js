const functions = require("firebase-functions");
const {
  isAllowed,
  configValue,
  requestStoreValley,
  notifyOtp,
} = require("./store_valley_http.js");
const { requireStaff } = require("./store_valley_staff.js");

exports.storeValleyProxy = functions.https.onCall(async (data, context) => {
  // Staff only: this call spends the company's Store Valley key.
  await requireStaff(context);

  const method = String((data && data.method) || "GET").toUpperCase();
  const path = String((data && data.path) || "");
  if (!path.startsWith("/") || path.includes("..") || !isAllowed(method, path)) {
    throw new functions.https.HttpsError(
      "invalid-argument",
      "Route is not allowed.",
    );
  }

  const apiKey = configValue("api_key", "STOREVALLEY_API_KEY");
  if (!apiKey) {
    throw new functions.https.HttpsError(
      "failed-precondition",
      "Store Valley API key is not configured.",
    );
  }

  const result = await requestStoreValley({
    method,
    path,
    body: data && data.body,
    query: data && data.query,
    notifyCustomer: data && data.notifyCustomer,
    generateOtp: true,
  });

  if (result.status === 503) {
    throw new functions.https.HttpsError(
      "unavailable",
      "Store Valley request failed.",
    );
  }

  return {
    status: result.status,
    body: result.body,
    pickup_otp: result.pickup_otp,
  };
});

exports.notifyOtp = notifyOtp;
