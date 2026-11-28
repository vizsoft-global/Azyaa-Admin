/*
 * Collections the lockdown leaves as they were must answer exactly as they do
 * under the rules this branch started from.
 */
const { doc, getDoc, getDocs, setDoc, updateDoc, deleteDoc, collection, query, where } = require("firebase/firestore");
const { dbOf, seedDocs, allowed, newId } = require("./lib");

const ALL = ["get", "list", "create", "update", "delete"];
const UNCHANGED = {
  delivery: ALL,
  logistics_response: ALL,
  store_valley_codes: ALL,
  store_valley_webhook_events: ALL,
  store_valley_delivery_jobs: ALL,
  // Left open on purpose until the payment result is handled by the back office.
  payment_response: ["get", "list", "create", "update"],
};
const ACTORS = ["anon", "ghost", "cust1", "designer1", "admin1", "super1"];

function ops(db, name, actor) {
  return {
    get: () => getDoc(doc(db, name, "seed")),
    list: () => getDocs(query(collection(db, name), where("id", "==", "seed"))),
    create: () => setDoc(doc(db, name, newId("new")), { id: "new" }),
    update: () => updateDoc(doc(db, name, "seed"), { status: "changed-by-" + actor }),
    delete: () => deleteDoc(doc(db, name, "del-" + actor)),
  };
}

async function runUnchanged(env, before) {
  let compared = 0;
  const differences = [];
  for (const [name, operations] of Object.entries(UNCHANGED)) {
    for (const target of [env, before]) {
      const docs = { seed: { id: "seed", status: "pending" } };
      for (const actor of ACTORS) docs["del-" + actor] = { id: "del" };
      await seedDocs(target, name, docs);
    }
    for (const actor of ACTORS) {
      const now = ops(dbOf(env, actor), name, actor);
      const then = ops(dbOf(before, actor), name, actor);
      for (const op of operations) {
        const a = await allowed(now[op]);
        const b = await allowed(then[op]);
        compared += 1;
        if (a !== b) differences.push(name + " " + actor + " " + op + ": before " + b + ", now " + a);
      }
    }
  }
  if (differences.length) {
    throw new Error("collections that must not change, changed:\n  " + differences.join("\n  "));
  }
  return compared;
}

module.exports = { runUnchanged, UNCHANGED };
