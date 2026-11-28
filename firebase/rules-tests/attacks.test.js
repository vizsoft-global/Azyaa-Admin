/*
 * Things an outsider or a curious customer might try. Each must be refused;
 * the legitimate neighbour of each attack must still be allowed.
 */
const { doc, getDoc, getDocs, setDoc, updateDoc, deleteDoc, arrayUnion, increment, Timestamp, collection, query, where, limit } = require("firebase/firestore");
const { dbOf, seedDocs, ok, no, personRecord, PEOPLE, newRules } = require("./lib");
const { seedWorld } = require("./fixtures");

const STAFF_ROLES = ["super_admin", "admin", "shop_manager", "designer"];

async function identity(env) {
  // ---- a customer cannot give themselves a role ----
  for (const who of ["cust1", "cust2", "pending1", "designer1"]) {
    const db = dbOf(env, who);
    for (const role of STAFF_ROLES) {
      if (PEOPLE[who].role_unique_key === role) continue;
      await no(updateDoc(doc(db, "users", who), { role_unique_key: role }), who + " makes themselves " + role);
    }
  }
  await no(updateDoc(doc(dbOf(env, "designer1"), "users", "designer1"), { role_unique_key: "" }), "designer clears own role");
  await no(updateDoc(doc(dbOf(env, "cust1"), "users", "cust1"), { user_role: "Super Admin" }), "customer sets user_role to Super Admin");
  await ok(updateDoc(doc(dbOf(env, "cust1"), "users", "cust1"), { user_role: "Customer", display_name: "New Name" }), "customer saves own profile");

  // ---- creating a users record ----
  const ghost = dbOf(env, "ghost");
  for (const role of STAFF_ROLES) {
    await no(setDoc(doc(ghost, "users", "ghost"), { uid: "ghost", role_unique_key: role }), "new account creates own record as " + role);
  }
  await no(setDoc(doc(ghost, "users", "someone-else"), { uid: "someone-else", user_role: "Customer" }), "account creates a record under another id");
  await no(setDoc(doc(ghost, "users", "someone-else"), { uid: "ghost", user_role: "Customer" }), "account creates a second record claiming its own uid");
  await no(setDoc(doc(dbOf(env, "anon"), "users", "anon-made"), { uid: "x", user_role: "Customer" }), "signed-out create of a users record");
  await no(setDoc(doc(ghost, "users", "ghost"), { uid: "ghost", user_role: "Super Admin" }), "new account creates own record with user_role Super Admin");
  await ok(setDoc(doc(ghost, "users", "ghost"), { uid: "ghost", email: "ghost@example.test", user_role: "Customer", status: "Published" }), "new account creates own record (app shape, no role field)");
  const fresh = env.authenticatedContext("fresh-panel").firestore();
  await ok(
    setDoc(doc(fresh, "users", "fresh-panel"), { uid: "fresh-panel", email: "p@example.test", role_unique_key: "", user_role: "Admin", status: "Pending" }),
    "panel Register form creates own record (empty role)",
  );

  // ---- someone else's record ----
  const cust1 = dbOf(env, "cust1");
  await ok(updateDoc(doc(cust1, "users", "cust2"), { points_balance: 15, user_vto: 2 }), "customer pays the referral bonus onto another record");
  await no(updateDoc(doc(cust1, "users", "cust2"), { email: "stolen@example.test" }), "customer changes another customer's email");
  await no(updateDoc(doc(cust1, "users", "cust2"), { points_balance: 20, role_unique_key: "designer" }), "customer slips a role into a referral write");
  await no(updateDoc(doc(cust1, "users", "super1"), { role_unique_key: "customer" }), "customer demotes a super admin");
  await no(updateDoc(doc(dbOf(env, "designer1"), "users", "cust2"), { display_name: "x" }), "designer changes a customer's record");
  await no(updateDoc(doc(dbOf(env, "designer1"), "users", "designer2"), { status: "Rejected" }), "designer changes another designer's record");

  // ---- office and super admin ----
  const admin = dbOf(env, "admin1");
  await ok(updateDoc(doc(admin, "users", "pending1"), { role_unique_key: "designer", status: "Published" }), "admin approves a designer");
  await ok(updateDoc(doc(admin, "users", "cust2"), { status: "Blocked" }), "admin edits a customer");
  await no(updateDoc(doc(admin, "users", "cust2"), { role_unique_key: "super_admin" }), "admin makes someone a super admin");
  await no(updateDoc(doc(admin, "users", "super2"), { role_unique_key: "admin" }), "admin demotes a super admin");
  await no(updateDoc(doc(admin, "users", "admin1"), { role_unique_key: "super_admin" }), "admin makes themselves super admin");
  await ok(updateDoc(doc(admin, "users", "super2"), { display_name: "Edited" }), "admin edits a super admin's name, role untouched");
  const superDb = dbOf(env, "super1");
  await ok(updateDoc(doc(superDb, "users", "cust2"), { role_unique_key: "super_admin" }), "super admin makes someone a super admin");
  await ok(updateDoc(doc(superDb, "users", "cust2"), { role_unique_key: "" }), "super admin takes it away again");
  await no(setDoc(doc(superDb, "users", "made-by-super"), { uid: "made-by-super", role_unique_key: "admin" }), "nobody creates a record for someone else, not even a super admin");
  await no(setDoc(doc(admin, "users", "made-by-admin"), { uid: "made-by-admin", role_unique_key: "super_admin" }), "admin creates a super admin record");

  // ---- staff keep saving their own profile (role sent back unchanged) ----
  for (const who of ["designer1", "admin1", "shop1", "super1"]) {
    const db = dbOf(env, who);
    const whole = { ...personRecord(who), display_name: "Renamed " + who };
    await ok(setDoc(doc(db, "users", who), whole), who + " saves own whole record, role unchanged");
    await ok(setDoc(doc(db, "users", who), { display_name: "Merged" }, { merge: true }), who + " merges into own record");
  }
  await no(
    setDoc(doc(dbOf(env, "designer1"), "users", "designer1"), { ...personRecord("designer1"), role_unique_key: "admin" }),
    "designer saves own whole record with a higher role",
  );
  // A returning sign-in that writes the create payload again must not wipe or change the role.
  await no(
    setDoc(doc(dbOf(env, "designer1"), "users", "designer1"), { uid: "designer1", email: "designer1@example.test", user_role: "Customer" }),
    "returning designer overwrites own record without the role",
  );
  await ok(
    setDoc(doc(dbOf(env, "designer1"), "users", "designer1"), { email: "designer1@example.test", last_login: 1 }, { merge: true }),
    "returning designer merges sign-in fields",
  );

  // ---- approval status is given by the office, never taken ----
  await seedDocs(env, "users", {
    cust1: { ...personRecord("cust1"), creator_main_info: { creator_status: "pending", creator_promotions: [] }, designer_requests: { status: "Pending" } },
    designer1: { ...personRecord("designer1"), designer_main_info: { designer_status: "inactive", designer_bank_info: { bank_name: "A" } } },
  });
  await no(updateDoc(doc(cust1, "users", "cust1"), { "creator_main_info.creator_status": "active" }), "customer approves themselves as a creator");
  await no(updateDoc(doc(cust1, "users", "cust1"), { designer_main_info: { designer_status: "active" } }), "customer writes themselves a designer approval");
  await no(updateDoc(doc(dbOf(env, "designer1"), "users", "designer1"), { "designer_main_info.designer_status": "active" }), "designer re-activates themselves");
  await ok(
    updateDoc(doc(dbOf(env, "designer1"), "users", "designer1"), { "designer_main_info.designer_bank_info.bank_name": "B", "designer_main_info.designer_bank_info.iban_or_ifsc_code": "KW00" }),
    "designer saves own bank details (panel)",
  );
  await ok(
    updateDoc(doc(cust1, "users", "cust1"), { "creator_main_info.creator_promotions": arrayUnion({ promotion_id: "PROMP1", promotion_status: "pending" }) }),
    "creator adds a promotion to own record (app)",
  );
  await ok(updateDoc(doc(admin, "users", "cust1"), { "creator_main_info.creator_status": "active", user_role: "Creator" }), "admin approves a creator");
  await ok(updateDoc(doc(admin, "users", "designer1"), { "designer_main_info.designer_status": "active" }), "admin re-activates a designer");

  // ---- a record cannot claim someone else's login id ----
  // The panel finds a person by `uid`; a second record claiming a staff uid would lock them out.
  await no(updateDoc(doc(cust1, "users", "cust1"), { uid: "super1" }), "customer writes a super admin's uid onto own record");
  await no(setDoc(doc(env.authenticatedContext("claimer").firestore(), "users", "claimer"), { uid: "super1", email: "c@example.test" }), "new account creates own record claiming a super admin's uid");
  await ok(updateDoc(doc(cust1, "users", "cust1"), { uid: "cust1", display_name: "Same uid" }), "customer saves own record with own uid");
  await seedDocs(env, "users", { "old-no-uid": { email: "old@example.test", user_role: "Customer" } });
  const old = env.authenticatedContext("old-no-uid").firestore();
  await ok(updateDoc(doc(old, "users", "old-no-uid"), { display_name: "Old" }), "account whose record has no uid still saves its profile");
  await ok(updateDoc(doc(old, "users", "old-no-uid"), { uid: "old-no-uid" }), "account whose record has no uid may add its own");
  await ok(updateDoc(doc(admin, "users", "cust1"), { uid: "cust1" }), "office may correct a uid");

  // ---- deleting people ----
  await seedDocs(env, "users", { "gone-1": { uid: "gone-1" }, "gone-2": { uid: "gone-2" }, "gone-3": { uid: "gone-3" } });
  await no(deleteDoc(doc(cust1, "users", "cust1")), "customer deletes own record");
  await no(deleteDoc(doc(cust1, "users", "gone-1")), "customer deletes another record");
  await no(deleteDoc(doc(admin, "users", "gone-2")), "admin deletes a user");
  await ok(deleteDoc(doc(superDb, "users", "gone-3")), "super admin deletes a user");

  // ---- roles and permissions ----
  await seedDocs(env, "roles", { designer: { role_unique_key: "designer", permissions_list: ["dashboard"] } });
  await no(getDoc(doc(dbOf(env, "anon"), "roles", "designer")), "signed-out read of a role");
  await ok(getDoc(doc(ghost, "roles", "designer")), "any signed-in account reads its role");
  await no(updateDoc(doc(dbOf(env, "designer1"), "roles", "designer"), { permissions_list: ["dashboard", "users"] }), "designer widens the designer role");
  await no(updateDoc(doc(admin, "roles", "designer"), { permissions_list: [] }), "admin edits a role");
  await ok(updateDoc(doc(superDb, "roles", "designer"), { permissions_list: ["dashboard", "product"] }), "super admin edits a role");
}

async function privateRecords(env) {
  await seedWorld(env);
  const anon = dbOf(env, "anon");
  const cust1 = dbOf(env, "cust1");
  const designer1 = dbOf(env, "designer1");
  const person = (db, id) => doc(db, "users", id);

  // ---- things nobody outside the office should read ----
  for (const [who, db] of [["signed-out", anon], ["customer", cust1]]) {
    await no(getDoc(doc(db, "mail", "ml1")), who + " reads a sent email (it carries a delivery code)");
    await no(getDocs(query(collection(db, "mail"), limit(5))), who + " lists sent emails");
    await no(getDoc(doc(db, "delivery_login_creds", "dp1")), who + " reads a delivery partner login");
    await no(getDoc(doc(db, "transactions", "tr-designer1")), who + " reads a designer's bank details");
    await no(getDocs(query(collection(db, "transactions"), limit(5))), who + " lists payouts");
    await no(getDocs(query(collection(db, "user_waitlist"), limit(5))), who + " lists the waitlist");
    await no(getDocs(query(collection(db, "images"), limit(5))), who + " lists the media library");
  }
  await no(getDoc(doc(designer1, "mail", "ml1")), "designer reads a sent email");
  await no(getDoc(doc(dbOf(env, "super1"), "mail", "ml1")), "even a super admin does not read mail through the apps");
  await no(getDoc(doc(designer1, "delivery_login_creds", "dp1")), "designer reads a delivery partner login");
  await no(getDocs(query(collection(designer1, "transactions"), where("user_ref", "==", person(designer1, "designer2")))), "designer lists another designer's payouts");
  await no(getDocs(query(collection(designer1, "transactions"), limit(5))), "designer lists all payouts");
  // A customer whose record is named on a payout still does not get it: only designers and office.
  await seedDocs(env, "transactions", (db) => ({ "tr-cust1": { user_ref: doc(db, "users", "cust1"), IBAN: "KW00" } }));
  await no(getDoc(doc(cust1, "transactions", "tr-cust1")), "customer reads a payout naming them");

  // ---- mail: queue only ----
  await no(setDoc(doc(anon, "mail", "x1"), { to: "victim@example.test", message: { subject: "s", html: "h" } }), "signed-out sends mail as Azyaa");
  await ok(setDoc(doc(cust1, "mail", "x2"), { to: "cust1@example.test", message: { subject: "OTP from Azyaa", html: "h" } }), "signed-in customer queues their OTP mail");
  await no(updateDoc(doc(cust1, "mail", "ml1"), { to: "other@example.test" }), "customer redirects a queued mail");
  await no(deleteDoc(doc(cust1, "mail", "ml1")), "customer deletes a mail");
  await no(setDoc(doc(cust1, "mail", "ml1"), { to: "other@example.test" }), "customer overwrites an existing mail");

  // ---- notifications ----
  await no(getDoc(doc(cust1, "notification", "n-cust2")), "customer reads someone else's notification");
  await no(getDocs(query(collection(cust1, "notification"), limit(5))), "customer lists all notifications");
  await no(updateDoc(doc(cust1, "notification", "n-cust2"), { message: "changed" }), "customer edits someone else's notification");
  await no(deleteDoc(doc(cust1, "notification", "n-cust1")), "customer deletes a notification");
  await no(setDoc(doc(anon, "notification", "x1"), { to_userRef: person(anon, "admin1"), message: "spam" }), "signed-out creates a notification");
  await ok(getDoc(doc(dbOf(env, "admin1"), "notification", "n-cust2")), "office reads any notification");

  // ---- warehouse and requests ----
  await no(setDoc(doc(dbOf(env, "super1"), "store_valley_inventory", "x"), { available: 99 }), "nobody writes warehouse stock from the apps");
  await no(updateDoc(doc(cust1, "inventorymovementlog", "m-designer1"), { product_quantity: 99 }), "customer edits a restock request");
  await no(deleteDoc(doc(designer1, "inventorymovementlog", "m-designer1")), "designer deletes a restock request");
}

async function shop(env) {
  await seedWorld(env);
  const anon = dbOf(env, "anon");
  const cust1 = dbOf(env, "cust1");
  const designer1 = dbOf(env, "designer1");
  const admin = dbOf(env, "admin1");
  const superDb = dbOf(env, "super1");
  const person = (db, id) => doc(db, "users", id);

  // ---- nothing accepts a signed-out write, except the payment result ----
  const names = [...newRules().matchAll(/match \/(\w+)\/\{\w+\}/g)].map((m) => m[1]);
  if (names.length < 35) throw new Error("expected every collection in the rules file, found " + names.length);
  for (const name of names) {
    await seedDocs(env, name, { "open-check": { id: "open-check" }, "open-check-del": { id: "open-check" } });
    const open = name === "payment_response";
    await (open ? ok : no)(setDoc(doc(anon, name, "made-by-nobody"), { id: "x" }), "signed-out create in " + name);
    await (open ? ok : no)(updateDoc(doc(anon, name, "open-check"), { id: "y" }), "signed-out change in " + name);
    await no(deleteDoc(doc(anon, name, "open-check-del")), "signed-out delete in " + name);
    // Nor may a plain customer delete anything, anywhere.
    await no(deleteDoc(doc(cust1, name, "open-check-del")), "customer delete in " + name);
  }

  // ---- signed-out reads that are now closed ----
  await no(getDoc(doc(anon, "orders", "o-cust1")), "signed-out reads an order");
  await no(getDocs(query(collection(anon, "orders"), limit(5))), "signed-out lists orders");
  await no(getDocs(query(collection(anon, "sales_history"), limit(5))), "signed-out lists sales records");
  await no(getDocs(query(collection(anon, "coupon"), limit(5))), "signed-out lists coupons");
  await no(getDocs(query(collection(anon, "return_requests"), limit(5))), "signed-out lists returns");

  // ---- a customer does not edit the shop ----
  await no(setDoc(doc(cust1, "products", "fake"), { status: "active", product_id: "FAKE" }), "customer creates a product");
  await no(setDoc(doc(cust1, "inventory", "fake"), { stock: 999 }), "customer creates a stock record");
  await no(setDoc(doc(cust1, "coupon", "fake"), { coupon_value: "FREE", coupon_price: 100 }), "customer creates a coupon");
  await no(setDoc(doc(cust1, "category", "fake"), { status: "active" }), "customer creates a category");
  await no(updateDoc(doc(cust1, "category", "c1"), { status: "archived" }), "customer changes a category");
  await no(updateDoc(doc(cust1, "settings", "company"), { "settings_company_info.name": "Hacked" }), "customer changes settings");
  await no(updateDoc(doc(cust1, "settings", "company"), { settings_payment_info: [] }), "customer replaces the payment gateways");
  await no(setDoc(doc(cust1, "settings", "second"), { type: "Company" }), "customer creates a second settings record");
  await no(updateDoc(doc(cust1, "user_membership_plans", "mp1"), { price: 0 }), "customer makes a plan free");
  await no(updateDoc(doc(cust1, "user_vto_plans", "vp1"), { price: 0 }), "customer makes a try-on plan free");
  await no(updateDoc(doc(cust1, "return_requests", "r1"), { status: "Accepted" }), "customer approves their own return");
  await no(setDoc(doc(cust1, "sales_history", "fake"), { user_ref: person(cust1, "cust1"), total_earning: 999 }), "customer creates a sales record");

  // ---- a designer is not the office ----
  await no(updateDoc(doc(designer1, "settings", "company"), { "settings_company_info.name": "x" }), "designer changes settings");
  await no(setDoc(doc(designer1, "coupon", "fake"), { coupon_value: "MINE" }), "designer creates a coupon");
  await no(setDoc(doc(designer1, "category", "fake"), { status: "active" }), "designer creates a category");
  await no(updateDoc(doc(designer1, "user_membership_plans", "mp1"), { price: 0 }), "designer edits a plan");
  await no(updateDoc(doc(designer1, "return_requests", "r1"), { status: "Accepted" }), "designer approves a return");
  await no(deleteDoc(doc(designer1, "products", "p-designer1")), "designer deletes a product (the panel archives instead)");

  // ---- orders ----
  await no(setDoc(doc(cust1, "orders", "forged-1"), { order_id: "X", customer_id: "cust2", order_status: "CAPTURED" }), "customer creates an order in someone else's name");
  await no(setDoc(doc(cust1, "orders", "forged-2"), { order_id: "X", order_status: "CAPTURED" }), "customer creates an order with no customer");
  await no(setDoc(doc(cust1, "orders", "forged-3"), { order_id: "X", customer_id: "", order_status: "CAPTURED" }), "customer creates an order with an empty customer");
  await no(deleteDoc(doc(cust1, "orders", "o-cust1")), "customer deletes own order");
  await no(deleteDoc(doc(admin, "orders", "o-cust2")), "admin deletes an order");
  await ok(deleteDoc(doc(superDb, "orders", "o-cust2")), "super admin deletes an order");

  // ---- a return starts as "Pending", in the customer's own name ----
  const orderRef = doc(cust1, "orders", "o-cust1");
  await ok(setDoc(doc(cust1, "return_requests", "ret-ok"), { return_request_id: "RTORD5", status: "Pending", userRef: person(cust1, "cust1"), orderRef, order_id: "AZY100", created_at: 1 }), "customer raises a return (app shape)");
  await no(setDoc(doc(cust1, "return_requests", "ret-approved"), { return_request_id: "RTORD6", status: "Accepted", outcome: "Refunded", userRef: person(cust1, "cust1"), orderRef }), "customer creates a return that is already approved");
  await no(setDoc(doc(cust1, "return_requests", "ret-other"), { return_request_id: "RTORD7", status: "Pending", userRef: person(cust1, "cust2"), orderRef }), "customer raises a return in someone else's name");
  await no(setDoc(doc(cust1, "return_requests", "ret-nobody"), { return_request_id: "RTORD8", status: "Pending", orderRef }), "customer raises a return naming nobody");

  // ---- the counter record keeps its type (both apps find it by type) ----
  await no(updateDoc(doc(cust1, "id_map", "main"), { type: "X" }), "customer renames the counter record so nobody finds it");
  await no(updateDoc(doc(cust1, "id_map", "main"), { order_id: increment(1), type: "Other" }), "customer slips a type change into a counter bump");
  await ok(updateDoc(doc(cust1, "id_map", "main"), { order_id: increment(1) }), "customer bumps a counter");

  // ---- counters and settings records cannot be made or removed ----
  await no(setDoc(doc(superDb, "id_map", "second"), { type: "Main" }), "nobody creates a second counter record");
  await no(deleteDoc(doc(superDb, "id_map", "main")), "nobody deletes the counters");
  await no(deleteDoc(doc(admin, "settings", "company")), "admin deletes the settings record");
  await no(deleteDoc(doc(admin, "payment_response", "pr1")), "admin deletes a payment result");
  await ok(deleteDoc(doc(superDb, "payment_response", "pr1")), "super admin deletes a payment result");
}

/*
 * Release B: a signed-in customer may change only the fields the app itself
 * writes after payment. (It can still mark its own order paid and lower stock:
 * stopping that needs the back office to do those steps, which is stage 2.)
 */
async function customerLimits(env) {
  await seedWorld(env);
  await seedDocs(env, "orders", { "o-nobody": { order_id: "AZY200", order_status: "Initialization", total_price: 9 } });
  const cust1 = dbOf(env, "cust1");
  const designer1 = dbOf(env, "designer1");
  const admin = dbOf(env, "admin1");
  const person = (db, id) => doc(db, "users", id);
  const now = Timestamp.now();

  // ---- orders ----
  const mine = doc(cust1, "orders", "o-cust1");
  for (const [field, value] of [
    ["shipping_address", { city: "Salmiya" }], ["shipping_info", { is_default: true }], ["payment_id", "P"], ["payment_method", "KNET"],
    ["payment_type", "card"], ["payment_status", "CAPTURED"], ["order_status", "CAPTURED"], ["return_request_id", "RTORD9"],
    ["updated_at", now], ["ready_shipping_request_status", "Notyet"], ["custom_shipping_request_status", ""],
  ]) {
    await ok(updateDoc(mine, { [field]: value }), "customer writes " + field + " on own order");
  }
  await no(updateDoc(mine, { total_price: 0 }), "customer changes the price of own order");
  await no(updateDoc(mine, { shipping_price: 0 }), "customer changes the shipping price of own order");
  await no(updateDoc(mine, { "order_items.cart_items": [] }), "customer rewrites the items of own order");
  await no(updateDoc(mine, { customer_id: "cust2" }), "customer hands own order to someone else");
  await no(updateDoc(mine, { delivery_info_list: [{ delivery_id: "1" }] }), "customer writes delivery details on own order");
  await no(updateDoc(mine, { payment_status: "CAPTURED", total_price: 1 }), "customer slips a price change into the paid update");
  await no(updateDoc(doc(cust1, "orders", "o-cust2"), { order_status: "CANCELLED" }), "customer cancels someone else's order");
  await no(updateDoc(doc(cust1, "orders", "o-cust2"), { payment_status: "CAPTURED" }), "customer marks someone else's order paid");
  await no(updateDoc(doc(cust1, "orders", "o-nobody"), { payment_status: "CAPTURED" }), "customer claims an order that names no customer");
  // designers: the panel's "line ready" on any order, and full customer rights on their own purchases
  await ok(updateDoc(doc(designer1, "orders", "o-cust2"), { "order_items.cart_items": [{ product_id: "AZYPRD1", product_designer_id: "designer1", product_pickup_info: { status: "Ready to Pickup" } }], updated_at: now }), "designer marks a line ready on a customer's order");
  await no(updateDoc(doc(designer1, "orders", "o-cust2"), { total_price: 0 }), "designer changes the price of a customer's order");
  await no(updateDoc(doc(designer1, "orders", "o-cust2"), { payment_status: "CAPTURED" }), "designer marks a customer's order paid");
  await no(updateDoc(doc(designer1, "orders", "o-cust2"), { "order_items.cart_items": [], order_status: "completed" }), "designer slips a status into a line-ready update");
  await ok(updateDoc(doc(designer1, "orders", "o-designer1"), { payment_status: "CAPTURED", order_status: "CAPTURED", updated_at: now }), "designer's own purchase is marked paid");
  await ok(updateDoc(doc(admin, "orders", "o-cust2"), { total_price: 35, payment_comment: "adjusted", delivery_info_list: [] }), "office changes any field of an order");

  // ---- stock ----
  const stock = doc(cust1, "inventory", "i-designer1");
  await ok(updateDoc(stock, { updated_at: now, stock_reserved: increment(2), stock: increment(-2) }), "purchase lowers stock and raises reserved");
  await no(updateDoc(stock, { stock: increment(5) }), "customer raises stock");
  await no(updateDoc(stock, { stock: 999 }), "customer sets stock to a large number");
  await no(updateDoc(stock, { stock_reserved: increment(-1) }), "customer lowers reserved stock");
  await no(updateDoc(stock, { stock_on_hand: 0 }), "customer changes stock on hand");
  await no(updateDoc(stock, { status: "archived" }), "customer archives a stock record");
  await no(updateDoc(stock, { stock: increment(-1), designer_uid: "cust1" }), "customer takes over a stock record");
  await ok(updateDoc(doc(designer1, "inventory", "i-designer1"), { threshold_stock: 9, status: "inactive", stock_unavailable: increment(1) }), "designer changes any field of own stock record");
  await no(updateDoc(doc(designer1, "inventory", "i-designer2"), { threshold_stock: 0 }), "designer changes another designer's stock record");
  await no(updateDoc(doc(designer1, "inventory", "i-designer1"), { designer_uid: "designer2" }), "designer gives own stock record away");
  await ok(updateDoc(doc(designer1, "inventory", "i-designer2"), { updated_at: now, stock_reserved: increment(1), stock: increment(-1) }), "designer buying from another designer lowers that stock");
  await no(setDoc(doc(designer1, "inventory", "made-for-other"), { designer_uid: "designer2", stock: 50 }), "designer creates a stock record for another designer");
  await ok(updateDoc(doc(admin, "inventory", "i-designer2"), { stock: 40, stock_on_hand: 40 }), "office adjusts stock");

  // ---- products ----
  const product = doc(cust1, "products", "p-designer1");
  await ok(updateDoc(product, { product_notify_list: arrayUnion("cust1@example.test") }), "customer asks to be notified");
  await ok(updateDoc(product, { product_review: arrayUnion({ review_id: "1", customer_id: "cust1", review_rate: 5 }), updated_at: now }), "customer leaves a rating");
  await ok(updateDoc(product, { "product_marketing.product_sales_history": arrayUnion({ order_id: "AZY100", quantity: 1 }), updated_at: now }), "purchase records a sale on the product");
  await ok(updateDoc(product, { "product_authorizer.creator_id_list": arrayUnion("cust1"), "product_marketing.promotion": arrayUnion({ promotion_id: "PROMP1" }) }), "creator promotes a product");
  await no(updateDoc(product, { "product.product_price": 1 }), "customer changes a price");
  await no(updateDoc(product, { "product.product_sale_price": 0, updated_at: now }), "customer changes a sale price");
  await no(updateDoc(product, { status: "archived" }), "customer archives a product");
  await no(updateDoc(product, { "product_info.name": "Defaced" }), "customer renames a product");
  await no(updateDoc(product, { "product_authorizer.product_designer_id": "cust1" }), "customer takes over a product");
  await no(updateDoc(product, { "product_authorizer.is_affiliate_product": true }), "customer makes a product an affiliate product");
  await no(updateDoc(product, { "product_marketing.is_popular_product": true }), "customer features a product");
  // The same writes sent as a whole map instead of a dotted path (Review Focus 1).
  const snap = await getDoc(doc(admin, "products", "p-designer2"));
  const marketing = snap.data().product_marketing;
  const authorizer = snap.data().product_authorizer;
  const other = doc(cust1, "products", "p-designer2");
  await ok(updateDoc(other, { product_marketing: { ...marketing, promotion: [{ promotion_id: "PROMP2" }] } }), "whole marketing map sent back with only the promotion list changed");
  await no(updateDoc(other, { product_marketing: { ...marketing, is_featue_product: true } }), "whole marketing map sent back with a feature flag changed");
  await no(updateDoc(other, { product_marketing: { promotion: [] } }), "whole marketing map replaced, dropping other fields");
  await ok(updateDoc(other, { product_authorizer: { ...authorizer, creator_id_list: ["cust1"] } }), "whole authorizer map sent back with only the creator list changed");
  await no(updateDoc(other, { product_authorizer: { ...authorizer, product_designer_id: "cust1" } }), "whole authorizer map sent back with the designer changed");
  // designers
  await ok(updateDoc(doc(designer1, "products", "p-designer1"), { "product.product_price": 22, "product_info.name": "Mine", status: "request", updated_at: now }), "designer edits own product");
  await ok(updateDoc(doc(designer1, "products", "p-designer1"), { status: "archived" }), "designer archives own product");
  await no(updateDoc(doc(designer1, "products", "p-designer1"), { status: "active" }), "designer approves own product");
  await no(updateDoc(doc(designer1, "products", "p-designer2"), { "product.product_price": 1 }), "designer edits another designer's product");
  await no(updateDoc(doc(designer1, "products", "p-designer1"), { "product_authorizer.product_designer_id": "designer2" }), "designer gives own product away");
  await ok(updateDoc(doc(designer1, "products", "p-designer2"), { product_notify_list: arrayUnion("designer1@example.test") }), "designer keeps the customer rights on other products");
  await no(setDoc(doc(designer1, "products", "made-for-other"), { status: "request", product_authorizer: { product_designer_id: "designer2" } }), "designer creates a product in another designer's name");
  await no(setDoc(doc(designer1, "products", "self-approved"), { status: "active", product_authorizer: { product_designer_id: "designer1" } }), "designer creates an already approved product");
  await ok(updateDoc(doc(admin, "products", "p-designer2"), { status: "active", "product.product_price": 30 }), "office changes any field of a product");

  // ---- coupons ----
  const coupon = doc(cust1, "coupon", "cp1");
  await ok(updateDoc(coupon, { coupon_used_user_list: arrayUnion({ user_id: "cust1" }), coupon_limit: increment(-1) }), "purchase uses a coupon");
  await no(updateDoc(coupon, { coupon_limit: increment(10) }), "customer raises a coupon's limit");
  await no(updateDoc(coupon, { coupon_price: 100 }), "customer raises a coupon's discount");
  await no(updateDoc(coupon, { coupon_status: "inactive" }), "customer switches a coupon off");
  await no(updateDoc(coupon, { coupon_limit: increment(-1), coupon_minimum_order_amount: 0 }), "customer slips another field into a coupon use");
  await ok(updateDoc(doc(admin, "coupon", "cp1"), { coupon_limit: 50, coupon_price: 15 }), "office edits a coupon");

  // ---- sales records ----
  const sales = doc(cust1, "sales_history", "s-designer1");
  await ok(updateDoc(sales, { updated_at: now, sale_history: arrayUnion({ sale_order_id: "AZY100", sale_amount: 20 }) }), "purchase adds a sale line");
  await no(updateDoc(sales, { total_earning: 9999 }), "customer changes a designer's earnings");
  await no(updateDoc(sales, { available_for_payout: 9999, updated_at: now }), "customer changes the payout amount");
  await no(updateDoc(sales, { user_ref: person(cust1, "cust1") }), "customer takes over a sales record");
  await no(updateDoc(doc(designer1, "sales_history", "s-designer1"), { available_for_payout: 9999 }), "designer raises own payout amount");
  await ok(updateDoc(doc(admin, "sales_history", "s-designer1"), { last_payout_amount: 5, updated_at: now }), "office records a payout on a sales record");
}

/*
 * Old records are not always tidy: a number stored as text or left empty, a
 * map that is empty. The after-payment writes must still go through on those
 * (a refusal there strands a customer who has already paid), and a customer
 * still may not use them to break the limits.
 */
async function untidyRecords(env) {
  await seedWorld(env);
  await seedDocs(env, "inventory", (db) => ({
    "i-null": { designer_uid: "designer2", stock: null, stock_reserved: null },
    "i-text": { designer_uid: "designer2", stock: "10", stock_reserved: "0" },
    "i-bare": { designer_uid: "designer2" },
    "i-mismatch": { designer_uid: "designer2", product_ref: doc(db, "products", "p-designer1"), stock: 3, stock_reserved: 0, threshold_stock: 1 },
    "i-nodesigner": { product_ref: doc(db, "products", "p-designer1"), stock: 3, stock_reserved: 0 },
    "i-orphan": { stock: 3, stock_reserved: 0 },
  }));
  await seedDocs(env, "coupon", {
    "cp-null": { coupon_status: "active", coupon_limit: null, coupon_used_user_list: null },
    "cp-text": { coupon_status: "active", coupon_limit: "5" },
    "cp-used": { coupon_status: "active", coupon_limit: 3, coupon_used_user_list: [{ user_id: "cust2" }] },
  });
  await seedDocs(env, "products", {
    "p-nullmaps": { status: "active", product_marketing: null, product_authorizer: null, product_notify_list: null },
    "p-bare": { status: "active" },
    "p-reviewed": { status: "active", product_review: [{ review_id: "1", customer_id: "cust2", review_rate: 5 }], product_notify_list: ["cust2@example.test"], product_marketing: { product_sales_history: [{ order_id: "A1", quantity: 1 }] } },
  });
  await seedDocs(env, "sales_history", { "s-lines": { sale_history: [{ sale_order_id: "A1", sale_amount: 20 }], total_earning: 20 }, "s-null": { sale_history: null } });
  const cust1 = dbOf(env, "cust1");
  const designer1 = dbOf(env, "designer1");
  const now = Timestamp.now();
  const buy = { updated_at: now, stock_reserved: increment(1), stock: increment(-1) };

  // ---- the app's after-payment writes on untidy records ----
  for (const id of ["i-null", "i-text", "i-bare"]) {
    await ok(updateDoc(doc(cust1, "inventory", id), buy), "purchase lowers stock on record " + id);
  }
  for (const id of ["cp-null", "cp-text"]) {
    await ok(updateDoc(doc(cust1, "coupon", id), { coupon_used_user_list: arrayUnion({ user_id: "cust1" }), coupon_limit: increment(-1) }), "purchase uses coupon " + id);
  }
  for (const id of ["p-nullmaps", "p-bare"]) {
    await ok(updateDoc(doc(cust1, "products", id), { updated_at: now, "product_marketing.product_sales_history": arrayUnion({ order_id: "A2", quantity: 1 }) }), "purchase records a sale on product " + id);
    await ok(updateDoc(doc(cust1, "products", id), { product_notify_list: arrayUnion("cust1@example.test") }), "notify me on product " + id);
    await ok(updateDoc(doc(cust1, "products", id), { "product_authorizer.creator_id_list": arrayUnion("cust1"), "product_marketing.promotion": arrayUnion({ promotion_id: "P" }) }), "creator promotes product " + id);
  }
  await ok(updateDoc(doc(cust1, "sales_history", "s-null"), { updated_at: now, sale_history: arrayUnion({ sale_order_id: "A2" }) }), "purchase adds a sale line to a record with no list yet");

  // ---- ...and a customer still cannot use them to get round the limits ----
  await no(updateDoc(doc(cust1, "inventory", "i-designer2"), { stock: "lots" }), "customer sets stock to text");
  await no(updateDoc(doc(cust1, "inventory", "i-designer2"), { stock: null }), "customer blanks stock");
  await no(updateDoc(doc(cust1, "inventory", "i-designer2"), { stock_reserved: "0" }), "customer sets reserved stock to text");
  await no(updateDoc(doc(cust1, "inventory", "i-text"), { stock: 500 }), "customer sets a large stock on a record whose stock was text");
  await no(updateDoc(doc(cust1, "coupon", "cp-text"), { coupon_limit: 500 }), "customer sets a large limit on a coupon whose limit was text");
  await no(updateDoc(doc(cust1, "coupon", "cp1"), { coupon_limit: "unlimited" }), "customer sets a coupon limit to text");

  // ---- lists the app only ever adds to ----
  await no(updateDoc(doc(cust1, "coupon", "cp-used"), { coupon_used_user_list: [] }), "customer clears a coupon's used list to use it again");
  await no(updateDoc(doc(cust1, "coupon", "cp-used"), { coupon_used_user_list: [{ user_id: "cust1" }] }), "customer replaces a coupon's used list");
  await ok(updateDoc(doc(cust1, "coupon", "cp-used"), { coupon_used_user_list: arrayUnion({ user_id: "cust1" }), coupon_limit: increment(-1) }), "customer's own use is added to the list");
  await no(updateDoc(doc(cust1, "sales_history", "s-lines"), { sale_history: [{ sale_order_id: "A1", sale_amount: 0 }] }), "customer zeroes a designer's sale line");
  await no(updateDoc(doc(cust1, "sales_history", "s-lines"), { sale_history: [] }), "customer empties a designer's sale lines");
  await ok(updateDoc(doc(cust1, "sales_history", "s-lines"), { sale_history: arrayUnion({ sale_order_id: "A3", sale_amount: 5 }), updated_at: now }), "a new sale line is added");
  await no(updateDoc(doc(cust1, "products", "p-reviewed"), { product_review: [] }), "customer removes other people's ratings");
  await no(updateDoc(doc(cust1, "products", "p-reviewed"), { product_notify_list: [] }), "customer removes other people's notify-me emails");
  await no(updateDoc(doc(cust1, "products", "p-reviewed"), { "product_marketing.product_sales_history": [] }), "customer wipes a product's sales list");
  await ok(updateDoc(doc(cust1, "products", "p-reviewed"), { product_review: arrayUnion({ review_id: "2", customer_id: "cust1", review_rate: 4 }), updated_at: now }), "a new rating is added");

  // ---- a stock record whose designer field is missing or out of step with its product ----
  await ok(updateDoc(doc(designer1, "inventory", "i-mismatch"), { threshold_stock: 4, updated_at: now }), "designer saves the stock record of their own product, though it names another designer");
  await ok(updateDoc(doc(designer1, "inventory", "i-nodesigner"), { threshold_stock: 4, updated_at: now }), "designer saves the stock record of their own product, though it names no designer");
  await ok(updateDoc(doc(dbOf(env, "designer2"), "inventory", "i-mismatch"), { threshold_stock: 5 }), "the designer named on the stock record can save it too");
  await no(updateDoc(doc(designer1, "inventory", "i-orphan"), { threshold_stock: 4 }), "designer changes a stock record tied to nobody");
  await no(updateDoc(doc(designer1, "inventory", "i-mismatch"), { designer_uid: "designer1" }), "designer re-labels a stock record as their own");
  await ok(updateDoc(doc(dbOf(env, "admin1"), "inventory", "i-orphan"), { designer_uid: "designer1" }), "office repairs a stock record's designer");
}

async function runAttacks(env) {
  await identity(env);
  await privateRecords(env);
  await shop(env);
  await customerLimits(env);
  await untidyRecords(env);
}

module.exports = { runAttacks };
