const {
  isStaffRole,
  staffDecision,
  loadStaffProfile,
  requireStaff,
} = require("./store_valley_staff.js");

function assertEqual(actual, expected, label) {
  if (actual !== expected) {
    throw new Error(
      label + ": expected " + JSON.stringify(expected) + " got " + JSON.stringify(actual),
    );
  }
}

// --- roles ---
assertEqual(isStaffRole("super_admin"), true, "super admin is staff");
assertEqual(isStaffRole("admin"), true, "admin is staff");
assertEqual(isStaffRole("shop_manager"), true, "shop manager is staff");
assertEqual(isStaffRole("designer"), true, "designer is staff by default");
assertEqual(
  isStaffRole("designer", { noDesigner: true }),
  false,
  "designer refused when noDesigner",
);
assertEqual(
  isStaffRole("super_admin", { noDesigner: true }),
  true,
  "super admin allowed when noDesigner",
);
assertEqual(isStaffRole("customer"), false, "customer is not staff");
assertEqual(isStaffRole(""), false, "no role is not staff");
assertEqual(isStaffRole(undefined), false, "missing role is not staff");
assertEqual(isStaffRole("Super_Admin"), false, "role key is exact");

// --- decision ---
assertEqual(
  staffDecision(null, { role_unique_key: "super_admin" }).code,
  "unauthenticated",
  "no auth",
);
assertEqual(
  staffDecision({ uid: "u1" }, null).code,
  "permission-denied",
  "no users record",
);
assertEqual(
  staffDecision({ uid: "u1" }, { role_unique_key: "customer" }).code,
  "permission-denied",
  "customer refused",
);
assertEqual(
  staffDecision({ uid: "u1" }, { role_unique_key: "admin" }).ok,
  true,
  "admin allowed",
);
assertEqual(
  staffDecision({ uid: "u1" }, { role_unique_key: "designer" }, { noDesigner: true })
    .code,
  "permission-denied",
  "designer refused on staff-only call",
);

// --- lookup against a fake database ---
function fakeDb(byField, byId) {
  return {
    collection(name) {
      assertEqual(name, "users", "reads users");
      return {
        where(field, op, value) {
          assertEqual(field, "uid", "queries the uid field");
          assertEqual(op, "==", "equality");
          return {
            limit() {
              return {
                async get() {
                  const data = byField[value];
                  return {
                    empty: !data,
                    docs: data ? [{ data: () => data }] : [],
                  };
                },
              };
            },
          };
        },
        doc(id) {
          return {
            async get() {
              const data = byId[id];
              return { exists: !!data, data: () => data };
            },
          };
        },
      };
    },
  };
}

async function expectCode(promise, code, label) {
  try {
    await promise;
  } catch (error) {
    assertEqual(error.code, code, label);
    return;
  }
  throw new Error(label + ": expected throw");
}

(async () => {
  const db = fakeDb(
    {
      staff1: { role_unique_key: "admin" },
      des1: { role_unique_key: "designer" },
      // A second record that merely claims cust1's login id in its `uid` field.
      cust1: { role_unique_key: "super_admin" },
    },
    { old1: { role_unique_key: "super_admin" }, cust1: { role_unique_key: "customer" } },
  );
  assertEqual(
    (await loadStaffProfile(db, "old1")).role_unique_key,
    "super_admin",
    "found under the login id",
  );
  assertEqual(
    (await loadStaffProfile(db, "cust1")).role_unique_key,
    "customer",
    "the record under the login id wins over one that claims the uid",
  );
  assertEqual(
    (await loadStaffProfile(db, "staff1")).role_unique_key,
    "admin",
    "falls back to the uid field when no record sits under the login id",
  );
  assertEqual(await loadStaffProfile(db, "nobody"), null, "no record");

  const ok = await requireStaff({ auth: { uid: "staff1" } }, { db });
  assertEqual(ok.roleKey, "admin", "requireStaff returns role");
  await requireStaff({ auth: { uid: "des1" } }, { db });
  await expectCode(
    requireStaff({ auth: { uid: "des1" } }, { db, noDesigner: true }),
    "permission-denied",
    "designer blocked",
  );
  await expectCode(
    requireStaff({ auth: { uid: "cust1" } }, { db }),
    "permission-denied",
    "customer blocked",
  );
  await expectCode(
    requireStaff({ auth: { uid: "nobody" } }, { db }),
    "permission-denied",
    "unknown account blocked",
  );
  await expectCode(requireStaff({}, { db }), "unauthenticated", "signed out");
  await expectCode(requireStaff(null, { db }), "unauthenticated", "no context");
  console.log("store_valley_staff tests passed");
})().catch((error) => {
  console.error(error);
  process.exit(1);
});
