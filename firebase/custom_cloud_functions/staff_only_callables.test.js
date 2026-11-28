/*
 * The push and report functions are for office staff only
 * (super admin, admin, shop manager). Run: node staff_only_callables.test.js
 */
const admin = require("firebase-admin");

const ROLES = {
  cust1: "customer",
  norole1: "",
  des1: "designer",
  super1: "super_admin",
  admin1: "admin",
  shop1: "shop_manager",
};

// A stand-in database: the caller's users record carries the role; anything
// the function body touches after the staff check throws REACHED_BODY.
const fakeDb = {
  collection(name) {
    return {
      doc(id) {
        return {
          async get() {
            if (name === "users" && id in ROLES) {
              return { exists: true, data: () => ({ role_unique_key: ROLES[id] }) };
            }
            return { exists: false, data: () => undefined };
          },
        };
      },
      where() {
        if (name !== "users") {
          throw new Error("REACHED_BODY");
        }
        return { limit: () => ({ get: async () => ({ empty: true, docs: [] }) }) };
      },
    };
  },
};
Object.defineProperty(admin, "firestore", { value: () => fakeDb, configurable: true });

const CALLS = [
  {
    name: "sendPushNotificationToUser",
    fn: require("./send_push_notification_to_user.js").sendPushNotificationToUser,
    data: { userId: "target", notificationTitle: "t", notificationBody: "b" },
  },
  {
    name: "sendPushNotificationToUsers",
    fn: require("./send_push_notification_to_users.js").sendPushNotificationToUsers,
    data: { userIds: ["target"], notificationTitle: "t", notificationBody: "b" },
  },
  {
    name: "sendPushNotificationToMultipleUsers",
    fn: require("./send_push_notification_to_multiple_users.js").sendPushNotificationToMultipleUsers,
    data: { userIds: ["target"], notificationTitle: "t", notificationBody: "b" },
  },
  {
    name: "generateDynamicReport",
    fn: require("./generate_dynamic_report.js").generateDynamicReport,
    data: { projectId: "p", collectionName: "orders", reportType: "count" },
  },
];

async function codeOf(call, uid) {
  try {
    await call.fn.run(call.data, uid ? { auth: { uid } } : {});
    return "ok";
  } catch (error) {
    return error.code || error.message;
  }
}

function assertEqual(actual, expected, label) {
  if (actual !== expected) {
    throw new Error(label + ": expected " + JSON.stringify(expected) + " got " + JSON.stringify(actual));
  }
}

(async () => {
  let checks = 0;
  for (const call of CALLS) {
    assertEqual(await codeOf(call, null), "unauthenticated", call.name + " signed out");
    assertEqual(await codeOf(call, "ghost"), "permission-denied", call.name + " no users record");
    for (const uid of ["cust1", "norole1", "des1"]) {
      assertEqual(await codeOf(call, uid), "permission-denied", call.name + " as " + (ROLES[uid] || "no role"));
    }
    for (const uid of ["super1", "admin1", "shop1"]) {
      const code = await codeOf(call, uid);
      if (code === "unauthenticated" || code === "permission-denied") {
        throw new Error(call.name + " refused " + ROLES[uid] + " (" + code + ")");
      }
    }
    // A refused caller learns nothing about the input: the staff check comes first.
    assertEqual(
      await call.fn.run({}, { auth: { uid: "cust1" } }).then(() => "ok", (e) => e.code),
      "permission-denied",
      call.name + " checks staff before input",
    );
    checks += 9;
  }
  console.log("staff-only callables tests passed: " + checks + " checks");
})().catch((error) => {
  console.error("TEST FAILED:", error.message);
  process.exit(1);
});
