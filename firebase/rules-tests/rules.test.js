/*
 * Checks firebase/firestore.rules against the Firestore emulator.
 *
 *   npm install && npm test
 *
 * `npm test` starts the emulator through firebase-tools 13, whose emulator
 * runs on Java 17; newer firebase-tools need Java 21.
 *
 * Two things are checked:
 *  1. the delivery collections: who may read and who may change them;
 *  2. every other collection behaves exactly as it does under the rules this
 *     change started from (`OLD_RULES`, by default `main`'s copy), for a
 *     signed-out person, a customer and a staff member.
 */
const fs = require("fs");
const path = require("path");
const { execSync } = require("child_process");
const {
  initializeTestEnvironment,
  assertSucceeds,
  assertFails,
} = require("@firebase/rules-unit-testing");
const {
  doc,
  getDoc,
  getDocs,
  setDoc,
  updateDoc,
  deleteDoc,
  collection,
  query,
  where,
  setLogLevel,
} = require("firebase/firestore");

// Refusals are expected here; without this the SDK prints every one.
setLogLevel("silent");

const HOST = "127.0.0.1";
const PORT = 8085;
const NEW_RULES = fs.readFileSync(path.join(__dirname, "..", "firestore.rules"), "utf8");

function oldRules() {
  if (process.env.OLD_RULES) {
    return fs.readFileSync(process.env.OLD_RULES, "utf8");
  }
  const base = process.env.OLD_RULES_REF || "origin/main";
  return execSync("git show " + base + ":firebase/firestore.rules", {
    cwd: path.join(__dirname, "..", ".."),
    encoding: "utf8",
  });
}

const STAFF = {
  super1: "super_admin",
  admin1: "admin",
  shop1: "shop_manager",
  designer1: "designer",
};
const CHANGED = ["delivery", "logistics_response"];
const SERVER_ONLY = ["store_valley_codes", "store_valley_webhook_events"];

let checks = 0;
async function ok(promise, label) {
  try {
    await assertSucceeds(promise);
  } catch (error) {
    throw new Error("should be ALLOWED: " + label + " (" + error.message.split("\n")[0] + ")");
  }
  checks += 1;
}
async function no(promise, label) {
  try {
    await assertFails(promise);
  } catch (error) {
    throw new Error("should be REFUSED: " + label);
  }
  checks += 1;
}

async function seed(env, collections) {
  await env.withSecurityRulesDisabled(async (ctx) => {
    const db = ctx.firestore();
    for (const [uid, role] of Object.entries(STAFF)) {
      await setDoc(doc(db, "users", uid), { uid, role_unique_key: role });
    }
    await setDoc(doc(db, "users", "cust1"), { uid: "cust1", role_unique_key: "customer" });
    await setDoc(doc(db, "users", "norole1"), { uid: "norole1" });
    for (const name of collections) {
      await setDoc(doc(db, name, "seed"), { id: "seed", status: "pending" });
      for (const actor of ["anon", "cust1", "norole1", "ghost", ...Object.keys(STAFF)]) {
        await setDoc(doc(db, name, "del-" + actor), { id: "del" });
      }
    }
  });
}

function dbOf(env, actor) {
  return actor === "anon"
    ? env.unauthenticatedContext().firestore()
    : env.authenticatedContext(actor).firestore();
}

/** The four basic operations on one collection, as promises not yet awaited. */
function ops(db, name, actor) {
  return {
    get: () => getDoc(doc(db, name, "seed")),
    list: () => getDocs(query(collection(db, name), where("id", "==", "seed"))),
    create: () => setDoc(doc(db, name, "new-" + actor + "-" + Math.random().toString(36).slice(2)), { id: "new" }),
    update: () => updateDoc(doc(db, name, "seed"), { status: "changed-by-" + actor }),
    delete: () => deleteDoc(doc(db, name, "del-" + actor)),
  };
}

async function allowed(run) {
  try {
    await run();
    return true;
  } catch (error) {
    if (error && (error.code === "permission-denied" || /PERMISSION_DENIED|permission/i.test(String(error.message)))) {
      return false;
    }
    throw error;
  }
}

function collectionsIn(rules) {
  const names = [];
  const pattern = /match \/(\w+)\/\{document\}/g;
  let match;
  while ((match = pattern.exec(rules))) {
    names.push(match[1]);
  }
  return names;
}

(async () => {
  const previous = oldRules();
  const untouched = collectionsIn(previous).filter((name) => !CHANGED.includes(name));
  const everything = [...new Set([...collectionsIn(NEW_RULES), ...untouched, ...SERVER_ONLY])];

  const env = await initializeTestEnvironment({
    projectId: "demo-azyaa-rules",
    firestore: { rules: NEW_RULES, host: HOST, port: PORT },
  });
  const before = await initializeTestEnvironment({
    projectId: "demo-azyaa-rules-before",
    firestore: { rules: previous, host: HOST, port: PORT },
  });

  try {
    await env.clearFirestore();
    await before.clearFirestore();
    await seed(env, everything);
    await seed(before, everything);

    // ---- 1. the delivery collections ----
    for (const name of CHANGED) {
      // Signed out: nothing.
      const anon = ops(dbOf(env, "anon"), name, "anon");
      for (const op of ["get", "list", "create", "update", "delete"]) {
        await no(anon[op](), "signed-out " + op + " " + name);
      }
      // A customer, an account with no role, an account with no users record: read only.
      for (const actor of ["cust1", "norole1", "ghost"]) {
        const o = ops(dbOf(env, actor), name, actor);
        await ok(o.get(), actor + " get " + name);
        await ok(o.list(), actor + " list " + name);
        await no(o.create(), actor + " create " + name);
        await no(o.update(), actor + " update " + name);
        await no(o.delete(), actor + " delete " + name);
      }
      // Every panel role: read and change.
      for (const actor of Object.keys(STAFF)) {
        const o = ops(dbOf(env, actor), name, actor);
        for (const op of ["get", "list", "create", "update", "delete"]) {
          await ok(o[op](), STAFF[actor] + " " + op + " " + name);
        }
      }
    }
    // The customer app's own two queries still work for a signed-in customer.
    const customerDb = dbOf(env, "cust1");
    await ok(
      getDocs(query(collection(customerDb, "delivery"), where("order_ref", "==", doc(customerDb, "orders", "seed")))),
      "customer app: deliveries of an order",
    );
    await ok(
      getDocs(query(collection(customerDb, "logistics_response"), where("id", "==", "SV-1"))),
      "customer app: tracking record by id",
    );

    // ---- 2. server-only collections: nobody, not even a super admin ----
    for (const name of SERVER_ONLY) {
      for (const actor of ["anon", "cust1", "designer1", "super1"]) {
        const o = ops(dbOf(env, actor), name, actor);
        for (const op of ["get", "list", "create", "update", "delete"]) {
          await no(o[op](), actor + " " + op + " " + name);
        }
      }
    }

    // ---- 3. a few fixed points on collections this change does not touch ----
    const anonDb = dbOf(env, "anon");
    await ok(getDoc(doc(anonDb, "orders", "seed")), "signed-out read of an order (unchanged)");
    await ok(updateDoc(doc(anonDb, "orders", "seed"), { status: "x" }), "signed-out update of an order (unchanged)");
    // `allow write: if true` on orders also covers delete, so even this is allowed today.
    // It is recorded here as it is; tightening `orders` is a separate change.
    await ok(deleteDoc(doc(anonDb, "orders", "del-anon")), "signed-out delete of an order (unchanged, and a known weakness)");
    await no(getDoc(doc(anonDb, "store_valley_delivery_jobs", "seed")), "signed-out read of a delivery job (unchanged)");
    await ok(getDoc(doc(customerDb, "store_valley_delivery_jobs", "seed")), "signed-in read of a delivery job (unchanged)");
    await no(setDoc(doc(dbOf(env, "super1"), "store_valley_delivery_jobs", "x"), { a: 1 }), "nobody writes a delivery job (unchanged)");

    // ---- 4. every untouched collection answers exactly as before ----
    let compared = 0;
    const differences = [];
    for (const name of untouched) {
      for (const actor of ["anon", "cust1", "super1"]) {
        const now = ops(dbOf(env, actor), name, actor);
        const then = ops(dbOf(before, actor), name, actor);
        for (const op of ["get", "list", "create", "update", "delete"]) {
          const a = await allowed(now[op]);
          const b = await allowed(then[op]);
          compared += 1;
          if (a !== b) {
            differences.push(name + " " + actor + " " + op + ": before " + b + ", now " + a);
          }
        }
      }
    }
    if (differences.length) {
      throw new Error("untouched collections changed behaviour:\n  " + differences.join("\n  "));
    }

    console.log(
      "rules tests passed: " + checks + " checks on the delivery and server-only collections, " +
        compared + " before/after comparisons across " + untouched.length + " untouched collections",
    );
  } finally {
    await env.cleanup();
    await before.cleanup();
  }
})().catch((error) => {
  console.error("RULES TEST FAILED:", error.message);
  process.exit(1);
});
