const {
  attachGeneratedDeliveryOtp,
  defaultOtpType,
  mailRecipient,
  requestStoreValley,
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

// --- the code email goes to an email address only ---
assertEqual(mailRecipient({ email: "a@b.co", phone: "+96550000000" }), "a@b.co", "uses the email");
assertEqual(mailRecipient({ phone: "+96550000000" }), "", "never mails a phone number");
assertEqual(mailRecipient({ email: "+96550000000" }), "", "a phone in the email field is not an address");
assertEqual(mailRecipient({ email: "  " }), "", "blank email");
assertEqual(mailRecipient(null), "", "no recipient");

// --- the code is sent only after Store Valley accepts the request ---
function fakeFetch(status, body, seen) {
  return async (url, init) => {
    seen.push({ url, init });
    return {
      ok: status >= 200 && status < 300,
      status,
      text: async () => JSON.stringify(body),
    };
  };
}

(async () => {
  const realFetch = global.fetch;
  const realKey = process.env.STOREVALLEY_API_KEY;
  process.env.STOREVALLEY_API_KEY = "test-key";
  try {
    // Refused: nothing is sent to the customer.
    let sent = [];
    let calls = [];
    global.fetch = fakeFetch(409, { message: "Insufficient stock" }, calls);
    const refused = await requestStoreValley({
      method: "POST",
      path: "/orders",
      body: { client_order_id: "T-1-RM" },
      generateOtp: true,
      notifyCustomer: { email: "customer@example.com" },
      persistSnapshot: false,
      notify: async (who, otp) => sent.push({ who, otp }),
    });
    assertEqual(refused.status, 409, "refusal is passed back");
    assertEqual(sent.length, 0, "no code is sent for a refused request");
    assertEqual(calls.length, 1, "one request made");
    assertTrue(
      JSON.parse(calls[0].init.body).delivery_otp.length === 6,
      "the code still goes to Store Valley",
    );

    // Unreachable: nothing is sent either.
    sent = [];
    global.fetch = async () => {
      throw new Error("network down");
    };
    const down = await requestStoreValley({
      method: "POST",
      path: "/orders",
      body: { client_order_id: "T-1-RM" },
      notifyCustomer: { email: "customer@example.com" },
      persistSnapshot: false,
      notify: async (who, otp) => sent.push({ who, otp }),
    });
    assertEqual(down.status, 503, "unreachable is 503");
    assertEqual(sent.length, 0, "no code is sent when Store Valley is unreachable");

    // Accepted: sent once, with the same code Store Valley was given.
    sent = [];
    calls = [];
    global.fetch = fakeFetch(200, { order_id: "sv-1", status: "pending" }, calls);
    const accepted = await requestStoreValley({
      method: "POST",
      path: "/warehouse-intake-requests",
      body: { external_request_id: "INT-1" },
      persistSnapshot: false,
      notify: async (who, otp) => sent.push({ who, otp }),
    });
    assertEqual(accepted.status, 200, "accepted");
    assertEqual(sent.length, 1, "code sent once after acceptance");
    assertEqual(sent[0].otp, JSON.parse(calls[0].init.body).delivery_otp, "same code as sent to Store Valley");
    assertEqual(sent[0].otp, accepted.pickup_otp, "same code as returned to the caller");
    assertEqual(sent[0].who.otpType, "designer_pickup", "default type for an intake");

    // A failing notification does not undo an accepted request.
    global.fetch = fakeFetch(200, { order_id: "sv-2", status: "pending" }, []);
    const realError = console.error;
    console.error = () => {};
    const stillOk = await requestStoreValley({
      method: "POST",
      path: "/orders",
      body: { client_order_id: "T-2-RM" },
      persistSnapshot: false,
      notify: async () => {
        throw new Error("mail down");
      },
    });
    console.error = realError;
    assertEqual(stillOk.status, 200, "accepted request survives a failed notification");
    assertTrue(stillOk.pickup_otp, "the code is still returned");

    // A read never generates or sends a code.
    sent = [];
    global.fetch = fakeFetch(200, { inventory: [] }, []);
    const read = await requestStoreValley({
      method: "GET",
      path: "/inventory",
      persistSnapshot: false,
      notify: async (who, otp) => sent.push({ who, otp }),
    });
    assertEqual(read.pickup_otp, undefined, "no code on a read");
    assertEqual(sent.length, 0, "nothing sent on a read");
  } finally {
    global.fetch = realFetch;
    if (realKey === undefined) {
      delete process.env.STOREVALLEY_API_KEY;
    } else {
      process.env.STOREVALLEY_API_KEY = realKey;
    }
  }
  console.log("store_valley_http notify-after-accept ok");
})().catch((error) => {
  console.error(error);
  process.exit(1);
});
