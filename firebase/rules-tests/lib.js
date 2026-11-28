/*
 * Shared pieces for the rules tests: the emulator connection, the people the
 * tests act as, and the two assertions (`ok` = must be allowed, `no` = must be
 * refused).
 */
const fs = require("fs");
const path = require("path");
const { execSync } = require("child_process");
const {
  initializeTestEnvironment,
  assertSucceeds,
  assertFails,
} = require("@firebase/rules-unit-testing");
const { doc, setDoc, setLogLevel } = require("firebase/firestore");

// Refusals are expected here; without this the SDK prints every one.
setLogLevel("silent");

const HOST = "127.0.0.1";
const PORT = 8085;
const RULES_PATH = path.join(__dirname, "..", "firestore.rules");

function newRules() {
  return fs.readFileSync(RULES_PATH, "utf8");
}

/** The rules this branch started from: `OLD_RULES` (a file) or `OLD_RULES_REF` (a git ref, default origin/main). */
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

function startEnv(rulesText, projectId) {
  return initializeTestEnvironment({
    projectId: projectId || "demo-azyaa-rules",
    firestore: { rules: rulesText, host: HOST, port: PORT },
  });
}

/*
 * The people. `anon` is signed out. `ghost` is signed in but has no users
 * record. Everyone else has `users/<id>` with the fields below.
 *  - cust1: registered through the app (no role field at all)
 *  - cust2: a customer whose record has an empty role
 *  - pending1: registered through the panel's Register form, waiting for approval
 */
const PEOPLE = {
  cust1: { user_role: "Customer", status: "Published", points_balance: 0, user_vto: 0 },
  cust2: { user_role: "Customer", status: "Published", role_unique_key: "", points_balance: 5, user_vto: 1 },
  pending1: { user_role: "Admin", status: "Pending", role_unique_key: "" },
  designer1: { user_role: "Admin", status: "Published", role_unique_key: "designer" },
  designer2: { user_role: "Admin", status: "Published", role_unique_key: "designer" },
  admin1: { user_role: "Admin", status: "Published", role_unique_key: "admin" },
  shop1: { user_role: "Admin", status: "Published", role_unique_key: "shop_manager" },
  super1: { user_role: "Admin", status: "Published", role_unique_key: "super_admin" },
  super2: { user_role: "Admin", status: "Published", role_unique_key: "super_admin" },
};
const PERSONAS = ["anon", "ghost", ...Object.keys(PEOPLE)];

/** Groups used by the expectation table; a persona's own key overrides its group. */
const GROUPS = {
  customer: ["ghost", "cust1", "cust2", "pending1"],
  designer: ["designer1", "designer2"],
  office: ["admin1", "shop1"],
  super: ["super1", "super2"],
};
function groupOf(persona) {
  for (const [group, members] of Object.entries(GROUPS)) {
    if (members.includes(persona)) return group;
  }
  return persona;
}

function personRecord(id) {
  return { uid: id, email: id + "@example.test", display_name: id, ...PEOPLE[id] };
}

function dbOf(env, persona) {
  return persona === "anon"
    ? env.unauthenticatedContext().firestore()
    : env.authenticatedContext(persona, { email: persona + "@example.test" }).firestore();
}

function userRef(db, persona) {
  return doc(db, "users", persona);
}

async function seedPeople(env) {
  await env.withSecurityRulesDisabled(async (ctx) => {
    const db = ctx.firestore();
    for (const id of Object.keys(PEOPLE)) {
      await setDoc(doc(db, "users", id), personRecord(id));
    }
  });
}

/** Writes documents with rules off. `docs` is `{ id: data }` or a function of the admin db returning that. */
async function seedDocs(env, collectionName, docs) {
  await env.withSecurityRulesDisabled(async (ctx) => {
    const db = ctx.firestore();
    const entries = typeof docs === "function" ? docs(db) : docs;
    for (const [id, data] of Object.entries(entries)) {
      await setDoc(doc(db, collectionName, id), data);
    }
  });
}

const counter = { checks: 0 };
async function ok(promise, label) {
  try {
    await assertSucceeds(promise);
  } catch (error) {
    throw new Error("should be ALLOWED: " + label + " (" + String(error.message).split("\n")[0] + ")");
  }
  counter.checks += 1;
}
async function no(promise, label) {
  try {
    await assertFails(promise);
  } catch (error) {
    throw new Error("should be REFUSED: " + label);
  }
  counter.checks += 1;
}

/** True when allowed, false when refused by the rules; any other error is thrown. */
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

/** Collection names that have a `match /name/{document}` block in a rules text. */
function collectionsIn(rules) {
  const names = [];
  const pattern = /match \/(\w+)\/\{document\}/g;
  let match;
  while ((match = pattern.exec(rules))) {
    names.push(match[1]);
  }
  return names;
}

let unique = 0;
function newId(prefix) {
  unique += 1;
  return (prefix || "n") + "-" + unique + "-" + Math.random().toString(36).slice(2, 8);
}

module.exports = {
  newRules,
  oldRules,
  startEnv,
  PEOPLE,
  PERSONAS,
  GROUPS,
  groupOf,
  personRecord,
  dbOf,
  userRef,
  seedPeople,
  seedDocs,
  ok,
  no,
  allowed,
  counter,
  collectionsIn,
  newId,
};
