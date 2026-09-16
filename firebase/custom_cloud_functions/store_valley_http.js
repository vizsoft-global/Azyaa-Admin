const functions = require("firebase-functions");
const admin = require("firebase-admin");
const crypto = require("crypto");

const DEFAULT_BASE_URL =
  "https://us-central1-store-valley-websitek-staging.cloudfunctions.net/api/v1";

const ALLOWED_ROUTES = [
  { method: "POST", pattern: /^\/orders$/ },
  { method: "GET", pattern: /^\/orders$/ },
  { method: "GET", pattern: /^\/orders\/[^/]+$/ },
  { method: "DELETE", pattern: /^\/orders\/[^/]+$/ },
  { method: "POST", pattern: /^\/warehouse-intake-requests$/ },
  { method: "GET", pattern: /^\/warehouse-intake-requests\/[^/]+$/ },
  { method: "POST", pattern: /^\/pickup-requests$/ },
  { method: "GET", pattern: /^\/pickup-requests\/[^/]+$/ },
  { method: "POST", pattern: /^\/return-requests$/ },
  { method: "GET", pattern: /^\/return-requests\/[^/]+$/ },
  { method: "GET", pattern: /^\/inventory$/ },
];

function configValue(key, envName, fallback) {
  const fromEnv = process.env[envName];
  if (fromEnv) {
    return fromEnv;
  }
  try {
    const cfg = functions.config().storevalley || {};
    if (cfg[key]) {
      return cfg[key];
    }
  } catch (_) {
    // functions.config() is unset locally
  }
  return fallback;
}

function isAllowed(method, path) {
  return ALLOWED_ROUTES.some(
    (route) => route.method === method && route.pattern.test(path),
  );
}

function generateOtp() {
  return String(crypto.randomInt(0, 1000000)).padStart(6, "0");
}

function otpMessage(otpType, otp) {
  if (otpType === "designer_pickup") {
    return {
      subject: "Azyaa pickup OTP",
      body:
        "Your Azyaa pickup OTP is " +
        otp +
        ". Share this code with the driver when they collect your products.",
      fcmType: "pickup_otp",
    };
  }
  if (otpType === "return_pickup") {
    return {
      subject: "Azyaa return pickup OTP",
      body:
        "Your Azyaa return pickup OTP is " +
        otp +
        ". Share this code with the driver when they collect your returned products.",
      fcmType: "return_pickup_otp",
    };
  }
  return {
    subject: "Azyaa delivery OTP",
    body:
      "Your Azyaa delivery OTP is " +
      otp +
      ". Share this code with the delivery person to complete your order.",
    fcmType: "delivery_otp",
  };
}

async function notifyOtp(notifyCustomer, otp) {
  if (!notifyCustomer || typeof notifyCustomer !== "object") {
    return;
  }
  const copy = otpMessage(notifyCustomer.otpType || "delivery", otp);
  const db = admin.firestore();
  const mailTo = notifyCustomer.email || notifyCustomer.phone;
  if (mailTo) {
    await db.collection("mail").add({
      created_at: admin.firestore.FieldValue.serverTimestamp(),
      to: mailTo,
      message: {
        subject: copy.subject,
        html: "<p>" + copy.body + "</p>",
      },
    });
  }
  const userId = notifyCustomer.userId;
  if (!userId) {
    return;
  }
  try {
    const userDoc = await db.collection("users").doc(userId).get();
    const fcmToken = userDoc.exists ? userDoc.data().fcm_token : null;
    if (!fcmToken) {
      return;
    }
    await admin.messaging().send({
      notification: { title: copy.subject, body: copy.body },
      token: fcmToken,
      data: { type: copy.fcmType },
    });
  } catch (error) {
    console.error("storeValleyProxy OTP notify failed", error.message);
  }
}

async function persistCreateSnapshot(path, method, upstreamBody, extras) {
  if (method !== "POST" || !upstreamBody || typeof upstreamBody !== "object") {
    return;
  }
  const trackingId =
    upstreamBody.order_id ||
    upstreamBody.request_id ||
    upstreamBody.delivery_order_id;
  if (!trackingId) {
    return;
  }
  const extra = extras && typeof extras === "object" ? extras : {};
  const payload = {
    swftTrackID: trackingId,
    id: trackingId,
    status: upstreamBody.status || "",
    state: upstreamBody.status || "",
    name: "store_valley",
    updated_at: admin.firestore.FieldValue.serverTimestamp(),
    request_id: upstreamBody.request_id || null,
    external_request_id: upstreamBody.external_request_id || null,
    delivery_order_id:
      upstreamBody.delivery_order_id || upstreamBody.order_id || null,
    original_source_location_id:
      upstreamBody.original_source_location_id || null,
    inventory_source: upstreamBody.inventory_source || null,
    return_destination_type: upstreamBody.return_destination_type || null,
    client_order_id: upstreamBody.client_order_id || null,
    resource_path: path,
  };
  if (extra.pickupOtp) {
    payload.pickup_otp = extra.pickupOtp;
    payload.otp_sent_at = admin.firestore.FieldValue.serverTimestamp();
  }
  if (extra.notifyCustomer && typeof extra.notifyCustomer === "object") {
    payload.otp_user_id = extra.notifyCustomer.userId || null;
    payload.otp_phone = extra.notifyCustomer.phone || null;
    payload.otp_email = extra.notifyCustomer.email || null;
    payload.otp_type = extra.notifyCustomer.otpType || null;
  }
  await admin.firestore().collection("logistics_response").add(payload);
}

function attachGeneratedDeliveryOtp(body, opts) {
  const next = body && typeof body === "object" ? { ...body } : body;
  const method = String((opts && opts.method) || "GET").toUpperCase();
  const path = String((opts && opts.path) || "");
  const isOtpPath =
    path === "/orders" ||
    path === "/pickup-requests" ||
    path === "/warehouse-intake-requests" ||
    path === "/return-requests";
  if (
    (opts && opts.generateOtp) === false ||
    method !== "POST" ||
    !next ||
    typeof next !== "object" ||
    !isOtpPath ||
    next.requires_otp_proof === false ||
    next.delivery_otp
  ) {
    return { body: next, otp: "" };
  }
  const otp = generateOtp();
  next.requires_otp_proof = true;
  next.delivery_otp = otp;
  return { body: next, otp };
}

function defaultOtpType(path) {
  if (path === "/return-requests") {
    return "return_pickup";
  }
  if (path === "/warehouse-intake-requests") {
    return "designer_pickup";
  }
  return "delivery";
}

async function requestStoreValley(opts) {
  const method = String((opts && opts.method) || "GET").toUpperCase();
  const path = String((opts && opts.path) || "");
  const attached = attachGeneratedDeliveryOtp(
    opts && opts.body && typeof opts.body === "object" ? opts.body : undefined,
    opts,
  );
  const body = attached.body;
  const apiKey = configValue("api_key", "STOREVALLEY_API_KEY");
  if (!apiKey) {
    return {
      status: 500,
      body: { message: "Store Valley API key is not configured." },
    };
  }
  const baseUrl = configValue(
    "base_url",
    "STOREVALLEY_BASE_URL",
    DEFAULT_BASE_URL,
  ).replace(/\/$/, "");

  let notify = opts && opts.notifyCustomer;
  const generatedOtp = attached.otp;
  if (generatedOtp) {
    if (!notify || !notify.otpType) {
      notify = Object.assign({}, notify, {
        otpType: defaultOtpType(path),
      });
    }
    await notifyOtp(notify, generatedOtp);
  }

  const query = opts && opts.query && typeof opts.query === "object" ? opts.query : {};
  const search = new URLSearchParams();
  Object.keys(query).forEach((key) => {
    const value = query[key];
    if (value !== undefined && value !== null && value !== "") {
      search.append(key, String(value));
    }
  });
  const url = baseUrl + path + (search.toString() ? "?" + search.toString() : "");
  const headers = {
    "Content-Type": "application/json",
    "x-api-key": apiKey,
  };

  async function send(payload) {
    return fetch(url, {
      method,
      headers,
      body:
        method === "GET" || method === "DELETE" || !payload
          ? undefined
          : JSON.stringify(payload),
    });
  }

  let response;
  try {
    response = await send(body);
  } catch (error) {
    return { status: 503, body: { message: "Store Valley request failed." } };
  }

  const text = await response.text();
  let parsed;
  try {
    parsed = text ? JSON.parse(text) : {};
  } catch (_) {
    parsed = { message: text };
  }

  if (response.ok && opts && opts.persistSnapshot !== false) {
    await persistCreateSnapshot(path, method, parsed, {
      pickupOtp: generatedOtp,
      notifyCustomer: notify,
    });
  }

  return {
    status: response.status,
    body: parsed,
    pickup_otp: generatedOtp || undefined,
  };
}

module.exports = {
  DEFAULT_BASE_URL,
  ALLOWED_ROUTES,
  configValue,
  isAllowed,
  generateOtp,
  notifyOtp,
  persistCreateSnapshot,
  attachGeneratedDeliveryOtp,
  defaultOtpType,
  requestStoreValley,
};
