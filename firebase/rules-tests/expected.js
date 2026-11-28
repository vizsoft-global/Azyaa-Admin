/*
 * Who may do what, as data. This is section 6.1 of
 * docs/superpowers/specs/2026-11-28-rules-lockdown-stage-1-design.md.
 *
 * Each row lists the allowed operations out of: get list create update delete
 * ("all" = every one, "" = none). A row is either one string, or
 * `{ own, other }` for collections where a record belongs to someone.
 * Rows are keyed by a person (cust1, designer1 ...) or by a group:
 *   customer = ghost, cust1, cust2, pending1     designer = designer1, designer2
 *   office   = admin1, shop1                      super    = super1, super2
 */
const { doc, where } = require("firebase/firestore");

const plain = () => ({ id: "seed", status: "pending" });

const TABLE = {
  // Reads only here; who may create and change a users record is in attacks.test.js.
  users: {
    owned: true,
    seeded: false,
    ops: ["get", "list"],
    docId: (owner) => owner,
    otherOwner: (persona) => (persona === "cust2" ? "cust1" : "cust2"),
    rows: { anon: "get list", customer: "get list", designer: "get list", office: "get list", super: "get list" },
  },
  roles: {
    doc: () => ({ role_unique_key: "designer", permissions_list: ["dashboard"] }),
    update: () => ({ permissions_list: ["dashboard", "product"] }),
    rows: { anon: "", customer: "get list", designer: "get list", office: "get list", super: "all" },
  },
  permissions: {
    doc: plain,
    rows: { anon: "", customer: "", designer: "get list", office: "get list", super: "all" },
  },
};

module.exports = { TABLE, plain, doc, where };
