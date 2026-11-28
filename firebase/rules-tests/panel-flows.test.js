/*
 * "The panel still works": each write and list query the React admin panel
 * makes, with the field shapes read from azya-admin-2026/src on 28 Nov 2026.
 * Labels name the panel file the action comes from.
 */
const {
  doc,
  collection,
  query,
  where,
  orderBy,
  limit,
  documentId,
  getDoc,
  getDocs,
  getCountFromServer,
  setDoc,
  addDoc,
  updateDoc,
  deleteDoc,
  writeBatch,
  runTransaction,
  increment,
  arrayUnion,
  arrayRemove,
  deleteField,
  serverTimestamp,
  Timestamp,
  GeoPoint,
} = require("firebase/firestore");
const { dbOf, ok, no } = require("./lib");
const { seedWorld } = require("./fixtures");

const person = (db, id) => doc(db, "users", id);
const idMap = (db) => doc(db, "id_map", "main");
const company = (db) => doc(db, "settings", "company");

/** `takeIds` from src/lib/id-map.ts: read the counters, then bump them, in a transaction. */
async function takeIds(tx, db, counters) {
  await tx.get(idMap(db));
  const bump = {};
  for (const name of counters) bump[name] = increment(1);
  tx.update(idMap(db), bump);
}

async function signInAndShell(env) {
  // auth-provider.tsx:89,100 — every account, before its role is known
  for (const who of ["ghost", "cust1", "pending1", "designer1", "admin1", "super1"]) {
    const db = dbOf(env, who);
    await ok(getDocs(query(collection(db, "users"), where("uid", "==", who), limit(1))), who + " auth-provider: own users record");
  }
  for (const who of ["designer1", "admin1", "shop1", "super1"]) {
    const db = dbOf(env, who);
    await ok(getDocs(query(collection(db, "roles"), where("role_unique_key", "==", "designer"), limit(1))), who + " auth-provider: own role");
  }
}

async function designerProfile(env) {
  const db = dbOf(env, "designer1");
  const me = person(db, "designer1");
  await ok(updateDoc(me, { display_name: "D One", phone_number: "+96500000000", photo_url: "u", "designer_main_info.designer_info.brand_photo": "u" }), "my-profile-page.tsx:82 details");
  await ok(
    updateDoc(me, {
      "designer_main_info.designer_pickup_address.shipping_name": "D One",
      "designer_main_info.designer_pickup_address.city": "Kuwait City",
      "designer_main_info.designer_pickup_address.lat_long": new GeoPoint(29.3, 47.9),
    }),
    "designer-profile-cards.tsx:89 pickup address",
  );
  await ok(updateDoc(me, { "designer_main_info.designer_pickup_address.lat_long": deleteField() }), "designer-profile-cards.tsx:89 clear map point");
  await ok(
    updateDoc(me, { "designer_main_info.designer_bank_info.bank_name": "NBK", "designer_main_info.designer_bank_info.iban_or_ifsc_code": "KW00" }),
    "designer-profile-cards.tsx:174 bank details",
  );
  // size-chart-page.tsx:183 — counter plus own record
  await ok(
    runTransaction(db, async (tx) => {
      await takeIds(tx, db, ["sizechart_id"]);
      tx.update(me, { "designer_main_info.designer_size_chart_list": arrayUnion({ chart_id: "SZ1", chart_name: "Abaya", chart_type: "uk", chart_metrics: [], chart_image: "u" }) });
    }),
    "size-chart-page.tsx:183 add size chart",
  );
}

async function people(env) {
  const admin = dbOf(env, "admin1");
  await ok(updateDoc(person(admin, "pending1"), { role_unique_key: "shop_manager", status: "Published" }), "roles-page.tsx:395 assign role");
  await ok(updateDoc(person(admin, "pending1"), { role_unique_key: deleteField() }), "roles-page.tsx:116 remove role");
  // designer-enrollment.ts:357-416 — approval, one transaction
  await ok(
    runTransaction(admin, async (tx) => {
      await tx.get(idMap(admin));
      await tx.get(person(admin, "cust2"));
      const history = doc(collection(admin, "sales_history"));
      tx.set(history, { created_at: serverTimestamp(), updated_at: serverTimestamp(), user_role: "Customer", user_ref: person(admin, "cust2"), status: "active", total_earning: 0, remaining_balance: 0, available_for_payout: 0, sale_history_id: "2", uid: "cust2" });
      tx.update(person(admin, "cust2"), {
        "designer_main_info.designer_id": "AZYD2",
        "designer_main_info.designer_status": "active",
        "designer_main_info.designer_info.name": "C Two",
        "designer_main_info.designer_payout_info.sale_history_ref": history,
        user_role: "Designer",
        role_unique_key: "designer",
        "designer_requests.status": "Approved",
        "designer_requests.updated_at": serverTimestamp(),
      });
      tx.update(idMap(admin), { designer_id: increment(1), sale_history_id: increment(1) });
      tx.set(doc(collection(admin, "mail")), { created_at: serverTimestamp(), to: "cust2@example.test", template: { name: "Designer_approval", data: { name: "C Two" } } });
    }),
    "designer-enrollment.ts:357 approve a designer",
  );
  await ok(updateDoc(person(admin, "cust1"), { "designer_requests.status": "Rejected", "designer_requests.reject_reason": "r", "designer_requests.updated_at": serverTimestamp() }), "designers-page.tsx:249 reject");
  await ok(updateDoc(person(admin, "cust1"), { user_role: "Creator", "creator_main_info.creator_status": "active", "creator_main_info.creator_main_id": "AZYCR2", "creator_requests.status": "Approved" }), "creators.ts:202 approve a creator");
  await ok(updateDoc(person(admin, "cust1"), { "creator_main_info.creator_promotions": [{ promotion_id: "PROMP1", promotion_status: "active", promotion_approved_by: person(admin, "admin1") }] }), "creator-promotions-page.tsx:249 approve a promotion");
  // people lists
  await ok(getDocs(query(collection(admin, "users"), where("role_unique_key", ">", ""), limit(500))), "roles-page.tsx:64 staff list");
  await ok(getDocs(query(collection(admin, "users"), orderBy("created_time", "desc"), limit(200))), "customers-page.tsx:64 all accounts");
  await ok(getCountFromServer(collection(admin, "users")), "finance/data.ts:204 count of accounts");

  // roles and permissions: super admin only (design section 7)
  const superDb = dbOf(env, "super1");
  await ok(addDoc(collection(superDb, "roles"), { created_at: serverTimestamp(), updated_at: serverTimestamp(), role_info: { name: "Support" }, role_id: 9, role_unique_key: "support", permissions_list: [] }), "roles-page.tsx:326 create role (super admin)");
  await ok(updateDoc(doc(superDb, "roles", "shop"), { permissions_list: arrayUnion("order"), updated_at: serverTimestamp() }), "role-permissions-page.tsx:90 toggle permission (super admin)");
  await ok(getDocs(query(collection(superDb, "permissions"), limit(500))), "role-permissions-page.tsx:48 permissions list");
  await ok(getDocs(query(collection(admin, "roles"), limit(200))), "roles-page.tsx:62 roles list (admin)");
  await no(updateDoc(doc(admin, "roles", "shop"), { permissions_list: arrayUnion("users") }), "an admin editing a role is refused on purpose");
}

async function products(env) {
  const db = dbOf(env, "designer1");
  // product-actions.ts:111-128 — create, one transaction
  await ok(
    runTransaction(db, async (tx) => {
      await takeIds(tx, db, ["product_id", "inventory_id"]);
      const product = doc(collection(db, "products"));
      const stock = doc(collection(db, "inventory"));
      tx.set(product, {
        created_at: serverTimestamp(), updated_at: serverTimestamp(), status: "request", product_id: "AZYPRD11", product_type: "simple",
        product_info: { name: "New", short_description: "s", description: "d", feature_image: "u", feature_image_id: "IMG-1", gallery_image: [] },
        product: { product_price: 30, product_sale_price: 30, product_stock_status: "in_stock", product_type: "ready", weight_gm: 300, SKU: 2001, inventory_ref: stock, inventory_id: "INV11", order_inventory_processed: false },
        product_authorizer: { product_designer_id: "designer1", product_designer_ref: person(db, "designer1"), is_affiliate_product: false, is_virtualtryon_status: false },
        product_marketing: { is_featue_product: false, is_recommended_product: false, is_popular_product: false },
        product_attribute: [],
      });
      tx.set(stock, { created_at: serverTimestamp(), updated_at: serverTimestamp(), status: "request", product_type: "ready", product_id: "AZYPRD11", product_sku: "2001", product_ref: product, threshold_stock: 2, designer_uid: "designer1", is_preferred_vendor: true, stock_source: "Designer", inventory_id: "INV11", stock_status: "instock", stock_reserved: 0, stock_on_hand: 0, stock_unavailable: 0, stock: 0, notify_designer: true });
      tx.update(doc(db, "category", "c1"), { category_product_list: arrayUnion("AZYPRD11") });
      tx.update(doc(db, "tags", "t1"), { tag_product_id: arrayUnion("AZYPRD11") });
    }),
    "product-actions.ts:111 designer creates a product",
  );
  // product-actions.ts:77-90 — edit, one batch
  const batch = writeBatch(db);
  batch.update(doc(db, "products", "p-designer1"), { "product_info.name": "Renamed", "product.product_price": 25, "product.product_regular_price": deleteField(), "product_authorizer.is_virtualtryon_status": true, "product_marketing.is_popular_product": true, product_attribute: [], status: "request", updated_at: serverTimestamp() });
  batch.update(doc(db, "inventory", "i-designer1"), { threshold_stock: 3, notify_designer: false, updated_at: serverTimestamp() });
  batch.update(doc(db, "category", "c1"), { category_product_list: arrayRemove("AZYPRD1") });
  batch.update(doc(db, "tags", "t1"), { tag_product_id: arrayUnion("AZYPRD1") });
  await ok(batch.commit(), "product-actions.ts:77 designer edits own product");
  const archive = writeBatch(db);
  archive.update(doc(db, "products", "p-designer1"), { status: "archived", updated_at: serverTimestamp() });
  archive.update(doc(db, "inventory", "i-designer1"), { status: "archived", updated_at: serverTimestamp() });
  await ok(archive.commit(), "product-actions.ts:55 designer archives own product");
  await ok(updateDoc(doc(db, "products", "p-designer1"), { "product.weight_gm": 250 }), "product-actions.ts:133 repair numbers");
  // translation-page.tsx:196 — a designer can save all five kinds
  for (const [name, id, field] of [["products", "p-designer1", "product_info_custom_translate"], ["category", "c1", "category_info_custom_translate"], ["tags", "t1", "tag_info_custom_translate"], ["attributes", "a1", "attribute_info_custom_translate"], ["brands", "b1", "brand_info_custom_translate"]]) {
    await ok(updateDoc(doc(db, name, id), { [field + ".name.ar"]: "اسم", updated_at: serverTimestamp() }), "translation-page.tsx:196 designer translates " + name);
  }
  // lists a designer loads
  await ok(getDocs(query(collection(db, "products"), where("product_authorizer.product_designer_id", "==", "designer1"), limit(300))), "products-page.tsx:95 own products");
  await ok(getCountFromServer(query(collection(db, "products"), where("product.SKU", "==", 2001))), "product-actions.ts:93 SKU count");
  for (const name of ["category", "tags", "attributes", "brands"]) {
    await ok(getDocs(query(collection(db, name), limit(500))), "product-editor.tsx:81 designer loads " + name);
  }
  await ok(getDocs(query(collection(db, "settings"), where("type", "==", "Company"), limit(1))), "company-settings.ts:11 designer reads company settings");
  await ok(getDocs(query(collection(db, "id_map"), where("type", "==", "Main"), limit(1))), "id-map.ts:29 designer finds the counters");
  await ok(getDocs(query(collection(db, "users"), where("uid", "==", "designer1"), limit(500))), "use-catalog.ts:13 designer loads own record");

  // office
  const admin = dbOf(env, "admin1");
  const approve = writeBatch(admin);
  approve.update(doc(admin, "products", "p-designer2"), { status: "active", updated_at: serverTimestamp(), product_reject_reason: deleteField() });
  approve.update(doc(admin, "inventory", "i-designer2"), { status: "active", updated_at: serverTimestamp() });
  await ok(approve.commit(), "product-actions.ts:64 office approves a product");
  await ok(
    runTransaction(admin, async (tx) => {
      await takeIds(tx, admin, ["category_id"]);
      tx.set(doc(collection(admin, "category")), { created_at: serverTimestamp(), updated_at: serverTimestamp(), status: "active", category_id: "4", category_info: { name: "Abayas", serial_no: 4 } });
    }),
    "taxonomy-page.tsx:403 office creates a category",
  );
  await ok(updateDoc(doc(admin, "brands", "b1"), { "brand_info.name": "L", status: "archived", updated_at: serverTimestamp() }), "taxonomy-page.tsx:397 office edits a term");
  await ok(updateDoc(company(admin), { "settings_product.compare_price": false }), "product-settings-page.tsx:31 office flips a product setting");
}

async function inventory(env) {
  const db = dbOf(env, "designer1");
  const move = doc(db, "inventorymovementlog", "m-designer1");
  // inventory/data.ts:115 — raise a request
  await ok(
    runTransaction(db, async (tx) => {
      await takeIds(tx, db, ["inventory_request_id", "movement_log_id"]);
      const created = doc(collection(db, "inventorymovementlog"));
      tx.set(created, { created_at: serverTimestamp(), update_at: serverTimestamp(), product_id: "AZYPRD1", product_ref: doc(db, "products", "p-designer1"), product_quantity: 4, request_info: { request_status: "Pending", inventory_request_id: "INVNSQ6", request_type: "Restock", raised_by: "designer", designer_notes: "n" }, movement_log_id: "MVMT6", status: "inbound", designer_uid: "designer1", inventory_ref: doc(db, "inventory", "i-designer1"), product_name: "Dress" });
      tx.update(doc(db, "inventory", "i-designer1"), { updated_at: serverTimestamp(), restock_request_raised_ref: created });
    }),
    "inventory/data.ts:115 designer raises a restock request",
  );
  await ok(updateDoc(move, { update_at: serverTimestamp(), "request_info.request_status": "Accepted", "request_info.fulfill_status": "Processing" }), "request-dialogs.tsx:179 designer accepts");
  // inventory/data.ts:278,287 — pickup: a counter-only transaction, then a batch
  await ok(runTransaction(db, (tx) => takeIds(tx, db, ["delivery_id"])), "inventory/data.ts:278 designer takes a delivery number");
  const pickup = writeBatch(db);
  const delivery = doc(collection(db, "delivery"));
  pickup.set(delivery, { created_at: serverTimestamp(), updated_at: serverTimestamp(), status: "REQUESTED", type: "inventory", inventory_movement_ref: move, assigned_by: person(db, "designer1"), delivery_id: "6", delivery_tracking_id: "SV-9", inventory_movement_refs: [move] });
  pickup.update(move, { update_at: serverTimestamp(), "request_info.fulfill_status": "DeliveryPartnerAssigned", "request_delivery_info.delivery_ref": delivery, "request_delivery_info.has_code": true });
  await ok(pickup.commit(), "inventory/data.ts:287 designer books a pickup");
  await ok(updateDoc(doc(db, "logistics_response", "l1"), { status: "picked", state: "picked", updated_at: serverTimestamp() }), "inventory/data.ts:427 designer refreshes from warehouse");
  await ok(updateDoc(doc(db, "inventory", "i-designer1"), { updated_at: serverTimestamp(), threshold_stock: 5 }), "inventory/data.ts:373 designer sets alert threshold");
  await ok(
    runTransaction(db, async (tx) => {
      tx.update(move, { update_at: serverTimestamp(), "enquiry_info.fulfill_status": "Received" });
      tx.update(doc(db, "inventory", "i-designer1"), { updated_at: serverTimestamp(), stock_unavailable: increment(-1), enquiry_raised_ref: deleteField() });
    }),
    "inventory/data.ts:369 designer confirms an enquiry return",
  );
  // lists
  await ok(getDocs(query(collection(db, "inventory"), where("designer_uid", "==", "designer1"), limit(500))), "use-inventory-data.ts:73 own stock");
  await ok(getDocs(query(collection(db, "inventorymovementlog"), where("designer_uid", "==", "designer1"), limit(300))), "use-inventory-data.ts:21 own requests");
  await ok(getDocs(query(collection(db, "inventorymovementlog"), where("product_id", "==", "AZYPRD1"), limit(200))), "product-detail-page.tsx:48 requests of a product");
  await ok(getDocs(query(collection(db, "store_valley_inventory"), limit(1000))), "use-inventory-data.ts:85 warehouse stock");
  await ok(getDocs(query(collection(db, "logistics_response"), where("swftTrackID", "==", "SV-1"), limit(1))), "request-detail.tsx:47 tracking record");

  // office and super admin
  const superDb = dbOf(env, "super1");
  await ok(
    runTransaction(superDb, async (tx) => {
      tx.update(doc(superDb, "inventorymovementlog", "m-designer1"), { update_at: serverTimestamp(), "request_info.fulfill_status": "Received", stock_received_quantity: 4, movement_info: arrayUnion({ movement_date: Timestamp.now(), movement_info: "in" }) });
      tx.update(doc(superDb, "inventory", "i-designer1"), { updated_at: serverTimestamp(), stock: increment(4), stock_on_hand: increment(4), restock_request_raised_ref: deleteField() });
    }),
    "inventory/data.ts:440 super admin adds to stock",
  );
  const admin = dbOf(env, "admin1");
  await ok(
    runTransaction(admin, async (tx) => {
      await takeIds(tx, admin, ["notification_id"]);
      tx.set(doc(collection(admin, "notification")), { notification_Id: "51", created_at: serverTimestamp(), updated_at: serverTimestamp(), notification_type: "inventory", message_type: "LOW_STOCK_ALERT", message: "m", to_userRef: person(admin, "designer1"), sent_from: "admin", mark_as_read: false });
    }),
    "inventory/data.ts:378 office notifies a designer of low stock",
  );
  await ok(getDocs(query(collection(admin, "inventorymovementlog"), orderBy("update_at", "desc"), limit(200))), "use-inventory-data.ts:22 office request list");
}

async function orders(env) {
  const db = dbOf(env, "designer1");
  await ok(getDocs(query(collection(db, "orders"), orderBy("created_at", "desc"), limit(500))), "orders-page.tsx:39 designer order list");
  await ok(getDocs(query(collection(db, "orders"), where("created_at", ">=", Timestamp.fromMillis(0)), orderBy("created_at", "desc"), limit(2001))), "finance/data.ts:135 designer dashboard orders");
  await ok(getDoc(doc(db, "orders", "o-cust1")), "order-details-page designer opens an order");
  await ok(getDocs(query(collection(db, "delivery"), where(documentId(), "in", ["del1"]))), "orders/data.ts:109 deliveries of an order");
  // orders/data.ts:211-221 — "line ready": the whole item list goes back
  await ok(
    runTransaction(db, async (tx) => {
      const snap = await tx.get(doc(db, "orders", "o-cust1"));
      const items = snap.data().order_items.cart_items.map((line) => (line.product_designer_id === "designer1" ? { ...line, product_pickup_info: { status: "Ready to Pickup", created_at: Timestamp.now(), pickup_address: { city: "Kuwait City" } } } : line));
      tx.update(doc(db, "orders", "o-cust1"), { "order_items.cart_items": items, updated_at: Timestamp.now() });
    }),
    "orders/data.ts:211 designer marks a line ready",
  );

  const superDb = dbOf(env, "super1");
  await ok(updateDoc(doc(superDb, "orders", "o-cust1"), { payment_comment: "bank transfer", updated_at: Timestamp.now() }), "orders/data.ts:223 payment note");
  await ok(
    runTransaction(superDb, async (tx) => {
      tx.set(doc(collection(superDb, "delivery")), { created_at: Timestamp.now(), updated_at: Timestamp.now(), type: "order", status: "REQUESTED", order_ref: doc(superDb, "orders", "o-cust1"), assigned_by: person(superDb, "super1"), delivery_id: "7", delivery_tracking_id: "SV-10", delivery_type: "ready" });
      tx.update(doc(superDb, "orders", "o-cust1"), { updated_at: Timestamp.now(), delivery_info_list: [{ delivery_id: "7" }], ready_shipping_request_status: "REQUESTED" });
    }),
    "orders/data.ts:290 manual shipping request",
  );
  const admin = dbOf(env, "admin1");
  await ok(setDoc(doc(admin, "delivery", "del1"), { return_request_ref: doc(admin, "return_requests", "r1") }, { merge: true }), "orders/data.ts:149 return approve: link delivery");
  await ok(updateDoc(doc(admin, "return_requests", "r1"), { updated_at: Timestamp.now(), status: "Accepted", approver_info: { uid: "admin1", user_ref: person(admin, "admin1") }, store_valley_request_ids: ["R-2"], logistics_status: "return_initiated" }), "orders/data.ts:149 return approve");
  await ok(updateDoc(doc(admin, "return_requests", "r1"), { outcome: "Refunded", outcome_amount: 10, outcome_at: Timestamp.now(), updated_at: Timestamp.now() }), "orders/data.ts:198 return outcome");
  await ok(getDocs(query(collection(admin, "return_requests"), orderBy("created_at", "desc"), limit(200))), "returns-page.tsx:55 return list");
  await ok(getDocs(query(collection(admin, "orders"), where("customer_id", "==", "cust1"), limit(200))), "customers-page.tsx:181 orders of a customer");
}

async function media(env) {
  const db = dbOf(env, "designer1");
  await ok(setDoc(doc(collection(db, "images")), { image_id: "IMG-9", image_name: "n", created_at: serverTimestamp(), feature_image: "u", image_alt_text: "", image_responsive_list: [], image_uid: "designer1" }), "media.ts:46 designer uploads a picture");
  await ok(getDocs(query(collection(db, "images"), where("image_uid", "==", "designer1"), limit(60))), "media-picker.tsx:24 designer's own pictures");
  await ok(deleteDoc(doc(db, "images", "im-designer1")), "media-page.tsx:76 designer deletes own picture");
  await ok(getDocs(query(collection(dbOf(env, "admin1"), "images"), orderBy("created_at", "desc"), limit(60))), "media-picker.tsx:24 office pictures");
}

async function marketing(env) {
  const admin = dbOf(env, "admin1");
  await ok(
    runTransaction(admin, async (tx) => {
      await takeIds(tx, admin, ["coupon_id"]);
      tx.set(doc(collection(admin, "coupon")), { coupon_status: "active", coupon_created_at: serverTimestamp(), coupon_id: "2", coupon_main_info: { main_description: "d" }, coupon_value: "EID", coupon_discount_type: "percent", coupon_price: 10, coupon_limit: 100 });
    }),
    "coupons-page.tsx:254 create a coupon",
  );
  await ok(updateDoc(doc(admin, "coupon", "cp1"), { coupon_status: "inactive" }), "coupons-page.tsx:96 coupon status");
  await ok(
    runTransaction(admin, async (tx) => {
      await tx.get(idMap(admin));
      tx.update(idMap(admin), { membership_plan_seq: 2 });
      tx.set(doc(collection(admin, "user_membership_plans")), { membership_plan_id: "2", plan_info: { name: "Silver" }, price: 3, duration: 30, created_at: serverTimestamp(), updated_at: serverTimestamp(), status: "active" });
    }),
    "membership-plans-page.tsx:199 create a membership plan",
  );
  await ok(updateDoc(doc(admin, "user_vto_plans", "vp1"), { vto_point: 12, updated_at: serverTimestamp() }), "tryon-page.tsx:201 edit a try-on plan");
  await ok(updateDoc(company(admin), { "settings_company_info.name": "Azyaa KW", "settings_home.settings_categoryid_list": arrayUnion("1") }), "settings-page.tsx:192 office saves settings");
  await ok(
    runTransaction(admin, async (tx) => {
      await tx.get(company(admin));
      tx.update(company(admin), { settings_payment_info: [] });
    }),
    "settings-page.tsx:348 office saves payment gateways",
  );
  await ok(updateDoc(company(admin), { "settings_secret_feature.settings_waitlist_feature": true, updated_at: serverTimestamp() }), "waitlist-page.tsx:70 waitlist switch");
  await ok(updateDoc(doc(admin, "user_waitlist", "w1"), { "user_app_access_data.created_by": person(admin, "admin1"), updated_at: serverTimestamp(), status: "Active" }), "waitlist-page.tsx:143 accept a waitlist request");
  await ok(getDocs(query(collection(admin, "user_waitlist"), limit(500))), "waitlist-page.tsx:110 waitlist");
  await ok(getDocs(query(collection(admin, "user_referral_activities"), limit(200))), "waitlist-page.tsx:260 referral log");
  await ok(getDocs(query(collection(admin, "coupon"), limit(200))), "coupons-page.tsx:72 coupons");

  // my-notifications-page.tsx — every role, own inbox
  for (const who of ["designer1", "admin1"]) {
    const db = dbOf(env, who);
    await ok(getDocs(query(collection(db, "notification"), where("to_userRef", "==", person(db, who)), limit(200))), "my-notifications-page.tsx:45 " + who + " inbox");
    const batch = writeBatch(db);
    batch.update(doc(db, "notification", "n-" + who), { updated_at: serverTimestamp(), mark_as_read: true });
    await ok(batch.commit(), "my-notifications-page.tsx:84 " + who + " marks all read");
  }

  // delivery-partners-page.tsx
  await ok(
    runTransaction(admin, async (tx) => {
      await takeIds(tx, admin, ["delivery_partner_id"]);
      tx.set(doc(collection(admin, "delivery_login_creds")), { status: "active", created_at: serverTimestamp(), email: "new@example.test", delivery_status: false, display_name: "New", id: "2" });
    }),
    "delivery-partners-page.tsx:188 add a delivery partner",
  );
  await ok(getDocs(query(collection(admin, "delivery_login_creds"), limit(500))), "delivery-partners-page.tsx:53 partner list");
}

async function finance(env) {
  const admin = dbOf(env, "admin1");
  // finance/data.ts:306-364 — record a payout
  await ok(
    runTransaction(admin, async (tx) => {
      await takeIds(tx, admin, ["transaction_id"]);
      tx.set(doc(collection(admin, "transactions")), { created_at: serverTimestamp(), updated_at: serverTimestamp(), status: "completed", transaction_id: 2, partner_type: "designer", user_ref: person(admin, "designer1"), IBAN: "KW00", payout_amount: 5, doneby_user_ref: person(admin, "admin1") });
      tx.update(person(admin, "designer1"), { "designer_main_info.designer_payout_info.last_payout_amount": 5, "designer_main_info.designer_payout_info.total_payout": 5 });
      tx.update(doc(admin, "sales_history", "s-designer1"), { last_payout_date: serverTimestamp(), last_payout_amount: 5, updated_at: serverTimestamp() });
    }),
    "finance/data.ts:306 office records a payout",
  );
  await ok(updateDoc(doc(admin, "transactions", "tr-designer1"), { status: "completed", updated_at: serverTimestamp() }), "finance/data.ts:378 payout status");
  await ok(getDocs(query(collection(admin, "transactions"), orderBy("created_at", "desc"), limit(301))), "finance/data.ts:233 office payouts");
  await ok(getDocs(query(collection(admin, "sales_history"), where("user_ref", "==", person(admin, "designer1")), limit(1))), "finance/data.ts:301 sales record of a partner");
  const db = dbOf(env, "designer1");
  await ok(getDocs(query(collection(db, "transactions"), where("user_ref", "==", person(db, "designer1")), limit(301))), "finance/data.ts:232 designer's own payouts");
  await ok(getDoc(doc(db, "transactions", "tr-designer1")), "payout-details designer opens own payout");
  await no(getDoc(doc(db, "transactions", "tr-designer2")), "designer opens another designer's payout");
}

async function runPanelFlows(env) {
  await seedWorld(env);
  await signInAndShell(env);
  await designerProfile(env);
  await people(env);
  await products(env);
  await inventory(env);
  await orders(env);
  await media(env);
  await marketing(env);
  await finance(env);
}

module.exports = { runPanelFlows };
