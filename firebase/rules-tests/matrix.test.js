/*
 * Runs the table in expected.js: for every collection, every person and every
 * basic operation, the rules must answer exactly as the table says.
 */
const {
  doc,
  getDoc,
  getDocs,
  setDoc,
  updateDoc,
  deleteDoc,
  collection,
  query,
  limit,
} = require("firebase/firestore");
const { PERSONAS, groupOf, dbOf, seedDocs, ok, no, newId } = require("./lib");
const { TABLE } = require("./expected");

const ALL_OPS = ["get", "list", "create", "update", "delete"];

function parseOps(text) {
  if (text === "all") return new Set(ALL_OPS);
  return new Set(String(text || "").split(/\s+/).filter(Boolean));
}

/** The row for a person: their own key first, then their group. `{ own, other }` or one string for both. */
function rowFor(spec, persona) {
  const row = persona in spec.rows ? spec.rows[persona] : spec.rows[groupOf(persona)];
  if (row === undefined) {
    throw new Error("expected.js has no row for " + persona);
  }
  return typeof row === "string" ? { own: row, other: row } : row;
}

function otherOwnerOf(spec, persona) {
  if (spec.otherOwner) return spec.otherOwner(persona);
  return persona === "cust2" ? "cust1" : "cust2";
}

async function runCollection(env, name, spec) {
  const ops = spec.ops || ALL_OPS;
  const owned = !!spec.owned;
  const people = PERSONAS.filter((p) => p !== "anon");

  await seedDocs(env, name, (db) => {
    const docs = {};
    if (spec.seeded === false) return docs; // the collection is seeded elsewhere (users)
    if (!owned) {
      docs.d = spec.doc(db, "cust1");
      for (const p of PERSONAS) docs["x-" + p] = spec.doc(db, "cust1");
      return docs;
    }
    for (const owner of people) docs["d-" + owner] = spec.doc(db, owner);
    for (const p of PERSONAS) {
      const self = p === "anon" ? "cust1" : p;
      docs["x-" + p + "-own"] = spec.doc(db, self);
      docs["x-" + p + "-other"] = spec.doc(db, otherOwnerOf(spec, self));
    }
    return docs;
  });

  for (const persona of PERSONAS) {
    const db = dbOf(env, persona);
    const row = rowFor(spec, persona);
    const kinds = owned && persona !== "anon" ? ["own", "other"] : ["other"];
    for (const kind of kinds) {
      const expected = parseOps(row[kind]);
      const owner = kind === "own" ? persona : otherOwnerOf(spec, persona === "anon" ? "cust1" : persona);
      const docId = spec.docId ? spec.docId(owner) : owned ? "d-" + owner : "d";
      const label = (op) => persona + " " + op + " " + name + (owned ? " (" + kind + ")" : "");
      const check = (op, promise) => (expected.has(op) ? ok(promise, label(op)) : no(promise, label(op)));

      if (ops.includes("get")) {
        await check("get", getDoc(doc(db, name, docId)));
      }
      if (ops.includes("list")) {
        const filters = spec.listFilter ? spec.listFilter(db, persona, owner) : [];
        await check("list", getDocs(query(collection(db, name), ...filters, limit(20))));
      }
      if (ops.includes("update")) {
        const change = spec.update ? spec.update(db, persona) : { status: "changed-by-" + persona };
        await check("update", updateDoc(doc(db, name, docId), change));
      }
      if (ops.includes("delete")) {
        const target = owned ? "x-" + persona + "-" + kind : "x-" + persona;
        await check("delete", deleteDoc(doc(db, name, target)));
      }
    }
    if (ops.includes("create")) {
      const made = spec.create
        ? spec.create(db, persona)
        : { id: newId("new"), data: spec.doc(db, persona === "anon" ? "cust1" : persona) };
      const expected = parseOps(rowFor(spec, persona).own);
      const promise = setDoc(doc(db, name, made.id), made.data);
      await (expected.has("create") ? ok(promise, persona + " create " + name) : no(promise, persona + " create " + name));
    }
  }
}

async function runMatrix(env, only) {
  for (const [name, spec] of Object.entries(TABLE)) {
    if (only && !only.includes(name)) continue;
    await runCollection(env, name, spec);
  }
}

module.exports = { runMatrix };
