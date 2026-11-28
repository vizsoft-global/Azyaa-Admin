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
const { newId } = require("./lib");

const plain = () => ({ id: "seed", status: "pending" });
const person = (db, id) => doc(db, "users", id);

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

  // ---- private collections ----
  delivery_login_creds: {
    doc: () => ({ email: "driver@example.test", display_name: "Driver", status: "active" }),
    rows: { anon: "", customer: "", designer: "", office: "all", super: "all" },
  },
  // Payouts with bank details. Office handles them; a designer sees their own.
  transactions: {
    owned: true,
    doc: (db, owner) => ({ user_ref: person(db, owner), status: "pending", payout_amount: 1, IBAN: "KW00TEST" }),
    otherOwner: (persona) => (persona === "designer2" ? "designer1" : "designer2"),
    listFilter: (db, persona, owner) => [where("user_ref", "==", person(db, owner))],
    rows: {
      anon: "",
      customer: "",
      designer: { own: "get list", other: "" },
      office: "get list create update",
      super: "get list create update",
    },
  },
  // Outgoing email: anyone signed in may queue one, nobody reads them back.
  mail: {
    doc: () => ({ to: "someone@example.test", message: { subject: "s", html: "h" } }),
    rows: { anon: "", customer: "create", designer: "create", office: "create", super: "create" },
  },
  notification: {
    owned: true,
    doc: (db, owner) => ({ to_userRef: person(db, owner), message: "m", mark_as_read: false }),
    listFilter: (db, persona, owner) => [where("to_userRef", "==", person(db, owner))],
    update: () => ({ mark_as_read: true }),
    rows: {
      anon: "",
      customer: { own: "get list create update", other: "create" },
      designer: { own: "get list create update", other: "create" },
      office: "all",
      super: "all",
    },
  },
  user_waitlist: { doc: plain, rows: { anon: "", customer: "", designer: "", office: "all", super: "all" } },
  user_referral_activities: {
    doc: plain,
    rows: { anon: "", customer: "create update", designer: "create update", office: "all", super: "all" },
  },
  store_valley_inventory: {
    doc: plain,
    rows: { anon: "", customer: "", designer: "get list", office: "get list", super: "get list" },
  },
  inventorymovementlog: {
    doc: plain,
    rows: { anon: "", customer: "", designer: "get list create update", office: "get list create update", super: "all" },
  },
  images: { doc: plain, rows: { anon: "", customer: "", designer: "all", office: "all", super: "all" } },
  videos: { doc: plain, rows: { anon: "", customer: "", designer: "", office: "all", super: "all" } },
  services: { doc: plain, rows: { anon: "", customer: "", designer: "", office: "all", super: "all" } },
  subscriptions: { doc: plain, rows: { anon: "", customer: "", designer: "", office: "all", super: "all" } },
  review: { doc: plain, rows: { anon: "", customer: "", designer: "", office: "all", super: "all" } },
  banners: { doc: plain, rows: { anon: "", customer: "", designer: "", office: "all", super: "all" } },

  // ---- shop set-up ----
  // Read by the customer app before login. (It still holds the payment keys: stage 2.)
  settings: {
    doc: () => ({ type: "Company", settings_company_info: { name: "Azyaa" } }),
    update: () => ({ "settings_company_info.name": "Changed" }),
    rows: { anon: "get list", customer: "get list", designer: "get list", office: "get list update", super: "all" },
  },
  // The shared counters: both apps bump them while signed in.
  id_map: {
    doc: () => ({ type: "Main", order_id: 1 }),
    update: () => ({ order_id: 2 }),
    rows: { anon: "get list", customer: "get list update", designer: "get list update", office: "get list update", super: "get list update" },
  },
  category: { doc: plain, rows: { anon: "get list", customer: "get list", designer: "get list update", office: "all", super: "all" } },
  tags: { doc: plain, rows: { anon: "get list", customer: "get list", designer: "get list update", office: "all", super: "all" } },
  attributes: { doc: plain, rows: { anon: "get list", customer: "get list", designer: "get list update", office: "all", super: "all" } },
  brands: { doc: plain, rows: { anon: "get list", customer: "get list", designer: "get list update", office: "all", super: "all" } },
  user_membership_plans: { doc: plain, rows: { anon: "get list", customer: "get list", designer: "get list", office: "all", super: "all" } },
  user_vto_plans: { doc: plain, rows: { anon: "get list", customer: "get list", designer: "get list", office: "all", super: "all" } },
  theme: { doc: plain, rows: { anon: "get list", customer: "get list", designer: "get list", office: "all", super: "all" } },

  // ---- selling ----
  // The "update" in each row is one the customer app really makes; what a
  // customer may NOT change is in attacks.test.js (customerLimits).
  coupon: {
    doc: () => ({ coupon_status: "active", coupon_value: "X", coupon_limit: 5, coupon_used_user_list: [] }),
    update: () => ({ coupon_limit: 4 }),
    rows: { anon: "", customer: "get list update", designer: "get list update", office: "all", super: "all" },
  },
  products: {
    doc: (db, owner) => ({ status: "active", product_id: "P", product_authorizer: { product_designer_id: owner }, product_notify_list: [] }),
    update: () => ({ product_notify_list: ["someone@example.test"] }),
    // A designer's new product goes in for review ("request"), in their own name.
    create: (db, persona) => ({ id: newId("product"), data: { status: "request", product_id: "P", product_authorizer: { product_designer_id: persona } } }),
    rows: { anon: "get list", customer: "get list update", designer: "get list create update", office: "all", super: "all" },
  },
  inventory: {
    doc: (db, owner) => ({ status: "active", designer_uid: owner, stock: 5, stock_reserved: 0 }),
    update: () => ({ stock: 4, stock_reserved: 1 }),
    rows: { anon: "get list", customer: "get list update", designer: "get list create update", office: "all", super: "all" },
  },
  orders: {
    owned: true,
    doc: (db, owner) => ({ order_id: "O", customer_id: owner, customer_ref: person(db, owner), order_status: "Initialization", total_price: 1 }),
    // Unique per person: writing a value that is already there changes nothing and proves nothing.
    update: (db, persona) => ({ payment_id: "PAY-" + persona }),
    rows: {
      anon: "",
      customer: { own: "get list create update", other: "get list" },
      designer: { own: "get list create update", other: "get list" },
      office: "get list create update",
      super: "all",
    },
  },
  return_requests: {
    doc: (db, owner) => ({ status: "Pending", userRef: person(db, owner), return_request_id: "R" }),
    rows: { anon: "", customer: "get list create", designer: "get list create", office: "get list create update", super: "all" },
  },
  sales_history: {
    doc: (db, owner) => ({ user_ref: person(db, owner), sale_history: [] }),
    update: () => ({ sale_history: [{ sale_order_id: "O" }] }),
    rows: { anon: "", customer: "get list update", designer: "get list update", office: "get list create update", super: "all" },
  },
  // Written by the payment hook (Make.com) with no login: left open until stage 2.
  payment_response: {
    doc: plain,
    rows: { anon: "get list create update", customer: "get list create update", designer: "get list create update", office: "get list create update", super: "all" },
  },
};

module.exports = { TABLE, plain };
