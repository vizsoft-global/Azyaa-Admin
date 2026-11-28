/*
 * "The customer app still works": each write and query the Flutter app makes,
 * with the field shapes read from Azyaa/lib on 28 Nov 2026 (version 1.8.3+83).
 * Labels name the app file and line the action comes from. The app uses no
 * transactions, no batches and client clocks, and so do these tests.
 */
const {
  doc,
  collection,
  query,
  where,
  orderBy,
  limit,
  getDoc,
  getDocs,
  getCountFromServer,
  setDoc,
  updateDoc,
  increment,
  arrayUnion,
  arrayRemove,
  deleteField,
  Timestamp,
} = require("firebase/firestore");
const { dbOf, ok } = require("./lib");
const { seedWorld } = require("./fixtures");

const now = () => Timestamp.now();
const person = (db, id) => doc(db, "users", id);
const idMap = (db) => doc(db, "id_map", "main");

/** Every counter use: find the record by type, then add one (flow 9 of the inventory). */
async function bump(db, counters, label) {
  await ok(getDocs(query(collection(db, "id_map"), where("type", "==", "Main"), limit(1))), label + " find counters");
  const change = {};
  for (const name of counters) change[name] = increment(1);
  await ok(updateDoc(idMap(db), change), label + " bump " + counters.join("+"));
}

async function guest(env) {
  const db = dbOf(env, "anon");
  const list = (name, ...parts) => getDocs(query(collection(db, name), ...parts));
  await ok(list("settings", where("type", "==", "Company"), limit(1)), "entry_widget.dart:42 guest reads company settings");
  await ok(list("settings", where("type", "==", "Company"), where("settings_secret_feature.settings_catllog_feature", "==", false), limit(1)), "product_grid_widget.dart:567 catalogue mode");
  await ok(list("products", where("status", "==", "active"), orderBy("created_at", "desc"), limit(10)), "home_widget.dart:1045 new products");
  await ok(list("products", where("status", "==", "active"), where("product_marketing.is_popular_product", "==", true), orderBy("created_at", "desc"), limit(20)), "home_widget.dart:1564 popular products");
  await ok(list("products", where("product_id", "==", "AZYPRD1"), limit(1)), "cart_item_list_widget.dart:70 product by code");
  await ok(list("products", where("status", "==", "active"), where("product_authorizer.product_designer_ref", "==", person(db, "designer1")), orderBy("created_at", "desc")), "designer_widget.dart:898 a designer's products");
  await ok(getDoc(doc(db, "products", "p-designer1")), "product page: product");
  await ok(getDoc(doc(db, "inventory", "i-designer1")), "product_widget.dart:3478 stock by reference");
  await ok(list("inventory", where("inventory_id", "in", ["INV1"]), limit(30)), "stock_service.dart:176 stock of several products");
  await ok(list("category", where("status", "==", "active"), where("category_marketing.is_featue_product", "==", true)), "home_widget.dart:494 featured categories");
  await ok(getDoc(doc(db, "category", "c1")), "nav.dart:163 category by link");
  await ok(list("tags", where("status", "==", "active"), where("tag_product_id", "array-contains", "AZYPRD1")), "product_widget.dart:1386 tags of a product");
  await ok(list("attributes", where("attribute_id", "==", "1"), where("status", "==", "active"), limit(1)), "product_attribute_widget.dart:63 attribute");
  await ok(list("brands", limit(150)), "search_service.dart:294 terms");
  await ok(list("users", where("status", "==", "Published"), where("user_role", "==", "Designer")), "designers_list_widget.dart:569 designers");
  await ok(list("users", where("status", "==", "Published"), where("user_role", "==", "Creator"), where("creator_main_info.creator_status", "==", "active")), "creators_widget.dart:280 creators");
  await ok(list("users", where("uid", "==", "designer1"), limit(1)), "product_widget.dart:1786 designer of a product");
  await ok(getDoc(person(db, "designer1")), "product_widget.dart:1976 designer record");
  await ok(getCountFromServer(query(collection(db, "users"), where("email", "==", "cust1@example.test"))), "forgot_password_widget.dart:279 is this email registered");
  await ok(list("user_membership_plans", where("status", "==", "active"), orderBy("created_at", "desc")), "membership_plan_widget.dart:542 plans");
  await ok(list("user_vto_plans", where("status", "==", "active"), orderBy("vto_plan_id", "desc")), "virtual_try_on_points_widget.dart:164 try-on plans");
}

async function registration(env) {
  // Email sign-up. The Auth account exists first; then the app writes its record.
  const id = "new-email";
  const db = env.authenticatedContext(id, { email: "new@example.test" }).firestore();
  const me = person(db, id);
  await ok(getDoc(me), "backend.dart:1054 is there a record yet");
  await ok(setDoc(me, { email: "new@example.test", uid: id, created_time: now() }), "backend.dart:1072 maybeCreateUser");
  await ok(
    updateDoc(me, {
      "user_info.user_id": id, "user_info.first_name": "New", "user_info.email": "new@example.test",
      "user_info.is_email_verification_status": true, "user_info.is_pofile_complete_status": false,
      "user_info.is_step1_status": false, "user_info.is_step2_status": false, "user_info.is_step3_status": false,
      "user_info.is_phone_verification_status": false,
      status: "Published", user_role: "Customer", user_name: "new", referral_code: "ABCD1234",
    }),
    "register_widget.dart:1395 finish registration",
  );
  await ok(setDoc(me, { fcm_token: "tok" }, { merge: true }), "register_fcm_token_if_missing.dart:46 save push token");
  await ok(updateDoc(me, { "user_info.email": "new@example.test", "user_info.is_email_verification_status": true }), "register_verification_widget.dart:249 email verified");
  await ok(setDoc(doc(collection(db, "mail")), { created_at: now(), to: "new@example.test", message: { subject: "OTP from Azyaa", html: "<b>123456</b>" } }), "register_verification_widget.dart:535 OTP mail");

  // Google / Apple: the first record carries the profile fields, then the same finishing update.
  const social = "new-google";
  const sdb = env.authenticatedContext(social, { email: "g@example.test" }).firestore();
  await ok(setDoc(person(sdb, social), { email: "g@example.test", display_name: "G User", photo_url: "u", uid: social, created_time: now() }), "backend.dart:1072 maybeCreateUser (Google or Apple)");
  await ok(updateDoc(person(sdb, social), { status: "Secret" }), "social_widget.dart:239 waitlist hold");
  await ok(updateDoc(person(sdb, social), { "user_info.user_id": social, status: "Published", user_role: "Customer", user_name: "g", referral_code: "WXYZ5678" }), "social_widget.dart:296 finish registration");
  await ok(updateDoc(person(sdb, social), { phone_number: "+96550000000", "user_info.phone_number": "+96550000000", "user_info.is_phone_verification_status": true }), "phone_verification_widget.dart:341 phone verified");

  // A push token can arrive before any record exists: set-merge then creates a one-field record.
  const early = env.authenticatedContext("new-token-first").firestore();
  await ok(setDoc(person(early, "new-token-first"), { fcm_token: "tok" }, { merge: true }), "register_fcm_token_if_missing.dart:46 token before record");

  // Referral at step 4: log it, pay the referrer, close the log.
  const activity = doc(collection(db, "user_referral_activities"));
  await ok(getDocs(query(collection(db, "users"), where("referral_code", "==", "REF-CUST2"), where("uid", "!=", id), limit(1))), "step4_referral_code_widget.dart:282 find the referrer");
  await ok(setDoc(activity, { user_referral_id: "1", referee_new_user_id: me, referrer_existing_user_id: person(db, "cust2"), reward_points: 30, status: "Pending", created_at: now() }), "step4_referral_code_widget.dart:446 log referral");
  await ok(updateDoc(person(db, "cust2"), { points_balance: 35, "user_vto.updatedAt": now(), "user_vto.user_vto_credit_points": 4 }), "step4_referral_code_widget.dart:471 pay the referrer");
  await ok(updateDoc(activity, { status: "Completed" }), "step4_referral_code_widget.dart:486 close referral");
  await bump(db, ["user_referral_id"], "step4_referral_code_widget.dart:491");
  await ok(updateDoc(me, { "user_info.is_pofile_complete_status": true, "user_vto.createdAt": now(), "user_vto.updatedAt": now(), "user_vto.user_vto_credit_points": 3 }), "step4_referral_code_widget.dart:500 finish steps");
}

async function profile(env) {
  const db = dbOf(env, "cust1");
  const me = person(db, "cust1");
  await ok(getDoc(me), "auth_util.dart:51 own record");
  await ok(updateDoc(me, { "user_info.first_name": "C", "user_info.gender": "f", "user_info.date_of_birth": now(), display_name: "C One", photo_url: "u" }), "profile_edit_widget.dart:2051 edit profile");
  await ok(updateDoc(me, { user_shippingaddress: arrayUnion({ relation_id: "1", user_name: "C", relation_name: "Home", shipping_address_info: { city: "Kuwait City" }, is_default: true }) }), "profile_address_add_widget.dart:2028 add address");
  await bump(db, ["relation_id", "address_id"], "profile_address_add_widget.dart:2069");
  await ok(updateDoc(me, { user_wishlist_item: arrayUnion({ wishlist_item_id: "AZYPRD1", entity_type: "product", added_at: now() }) }), "user_wishlist_widget.dart:134 wishlist");
  await ok(updateDoc(me, { user_designer_following: arrayUnion(person(db, "designer1")) }), "designer_widget.dart:355 follow a designer");
  await ok(updateDoc(me, { user_designer_following: arrayRemove(person(db, "designer1")) }), "unfollow_confirm_popup_widget.dart:201 unfollow");
  await ok(
    updateDoc(me, { "user_cart.cart_id": "5", "user_cart.created_at": now(), "user_cart.updated_at": now(), "user_cart.subtotal": 20, "user_cart.total": 22, "user_cart.cart_items": [{ product_id: "AZYPRD1", quantity: 1, product_type: "product" }] }),
    "default_cart_button_widget.dart:584 add to cart",
  );
  await bump(db, ["cart_id", "cart_item_id"], "default_cart_button_widget.dart:616");
  await ok(updateDoc(me, { "user_cart.coupon_info.coupon_ref": doc(db, "coupon", "cp1"), "user_cart.coupon_info.coupon_value": "WELCOME", "user_cart.coupon_info.coupon_user_info": { user_email: "cust1@example.test", user_id: "cust1", user_role: "Customer" } }), "apply_coupon_widget.dart:535 apply coupon");
  await ok(updateDoc(me, { "user_vto.updatedAt": now(), "user_vto.user_vto_credit_points": increment(-1), "user_vto.user_vto_history": arrayUnion("try-1") }), "v_t_o_final_widget.dart:953 spend a try-on");
  // applying to be a designer or a creator
  await ok(updateDoc(me, { "designer_requests.designer_request_id": "3", "designer_requests.request_type": "Pending", "designer_requests.submission_date": now(), "designer_requests.form_data.name": "C", "designer_requests.form_data.status": "Pending" }), "designer_form_widget.dart:3459 designer application");
  await ok(updateDoc(me, { "designer_requests.form_data.document_url": "u", "designer_requests.is_designer_request_status": true, "designer_requests.status": "Pending" }), "designer_form_upload_widget.dart:1420 submit application");
  await bump(db, ["form_id", "designer_request_id"], "designer_form_widget.dart:3526");
  await ok(setDoc(doc(collection(db, "notification")), { created_at: now(), updated_at: now(), notification_id: "52", notification_type: "designerrequest", message_type: "DESIGNER REQUEST", message: "m", to_userRef: person(db, "super1"), sent_from: "system", mark_as_read: false }), "designer_form_upload_widget.dart:1454 tell the office");
  await ok(updateDoc(me, { "creator_requests.creator_request_id": "2", "creator_requests.request_type": "Pending", "creator_requests.form_data.name": "C" }), "creator_form_widget.dart:5588 creator application");
  await ok(updateDoc(me, { "creator_main_info.creator_promotions": arrayUnion({ promotion_id: "PROMP3", promotion_status: "active", promotion_type: "preapproved", promotion_user_ref: me }) }), "product_widget.dart:3787 creator promotion on own record");
}

async function productActions(env) {
  const db = dbOf(env, "cust1");
  const product = doc(db, "products", "p-designer1");
  await ok(updateDoc(product, { product_notify_list: arrayUnion("cust1@example.test") }), "product_widget.dart:4020 notify me");
  await ok(updateDoc(product, { "product_authorizer.creator_id_list": arrayUnion("cust1"), "product_marketing.promotion": arrayUnion({ created_at: now(), updated_at: now(), promotion_id: "PROMP3", creator_ref: person(db, "cust1") }) }), "product_widget.dart:3812 creator promotes a product");
  await bump(db, ["promotion_id"], "product_widget.dart:3804");
}

/** Everything from "Pay" to the "order placed" screen, for one payment provider. */
async function paidOrder(env, provider) {
  const db = dbOf(env, "cust1");
  const me = person(db, "cust1");
  const code = "ORDAZYA-" + provider;
  const order = doc(collection(db, "orders"));
  const label = (text) => provider + ": " + text;

  await ok(setDoc(order, { order_status: "Initialization", created_at: now(), order_id: code, customer_ref: me, total_price: 22, order_items: { cart_id: "5", subtotal: 20, total: 22, cart_items: [{ product_id: "AZYPRD1", quantity: 1, product_type: "product", product_main_type: "ready" }], coupon_info: { coupon_ref: doc(db, "coupon", "cp1") } }, customer_id: "cust1", shipping_price: 2 }), label("checkout_widget.dart:3532 create order"));
  const shipping = { "shipping_address.shipping_name": "C One", "shipping_address.city": "Kuwait City", "shipping_info.relation_id": "1", "shipping_info.user_name": "C", "shipping_info.is_default": true, "shipping_info.shipping_address_info": { city: "Kuwait City" } };
  if (provider === "MyFatoorah") {
    Object.assign(shipping, { ready_shipping_request_status: "Notyet", custom_shipping_request_status: "" });
  }
  await ok(updateDoc(order, shipping), label("checkout_widget.dart:3623 shipping details"));
  await bump(db, ["order_id"], label("checkout_widget.dart:3654"));

  // payment_checker_widget.dart — the app polls for the result, then does the rest itself
  await ok(getDocs(query(collection(db, "payment_response"), where("order_id", "==", code), limit(1))), label("payment_checker_widget.dart:45 poll the result"));
  await ok(getDocs(query(collection(db, "orders"), where("order_id", "==", code), limit(1))), label("payment_checker_widget.dart:54 find the order by number"));
  await ok(updateDoc(order, { payment_id: "PAY-1", payment_method: "KNET", payment_type: "card" }), label("payment_checker_widget.dart:68 payment ids"));
  await ok(updateDoc(order, { order_status: "CAPTURED", payment_status: "CAPTURED", payment_id: "PAY-1", payment_method: "KNET", payment_type: "card", updated_at: now() }), label("payment_checker_widget.dart:87 mark paid"));
  await ok(updateDoc(me, { "user_memberships.plan_id": "1", "user_memberships.start_date": now(), "user_memberships.membership_id": "9", "user_memberships.status": "active", "user_memberships.order_history": arrayUnion({ order_id: code, plan_id: "1", amount_paid: 5, currency: "KWD" }) }), label("payment_checker_widget.dart:269 membership"));
  await bump(db, ["membership_id"], label("payment_checker_widget.dart:359"));
  await ok(updateDoc(me, { "user_vto.updatedAt": now(), "user_vto.user_vto_credit_points": increment(10), "user_vto.user_vto_history": arrayUnion(code) }), label("payment_checker_widget.dart:378 try-on plan"));
  await ok(getDoc(doc(db, "inventory", "i-designer1")), label("stock record"));
  await ok(updateDoc(doc(db, "inventory", "i-designer1"), { updated_at: now(), stock_reserved: increment(1), stock: increment(-1) }), label("payment_checker_widget.dart:440 lower stock"));
  await ok(getDocs(query(collection(db, "sales_history"), where("user_ref", "==", person(db, "designer1")), limit(1))), label("payment_checker_widget.dart:470 find the designer's sales record"));
  await ok(updateDoc(doc(db, "sales_history", "s-designer1"), { updated_at: now(), sale_history: arrayUnion({ sale_date: now(), sale_amount: 20, sale_quantity: 1, sale_product_id: "AZYPRD1", sale_payout_status: false, sale_order_status: "pending", sale_order_id: code }) }), label("payment_checker_widget.dart:488 credit the designer"));
  await ok(updateDoc(doc(db, "products", "p-designer1"), { updated_at: now(), "product_marketing.product_sales_history": arrayUnion({ created_at: now(), order_id: code, quantity: 1, sales_user_info: { customer_id: "cust1", customer_ref: me } }) }), label("payment_checker_widget.dart:667 product sales"));
  await ok(setDoc(doc(collection(db, "notification")), { created_at: now(), notification_id: "53", updated_at: now(), notification_type: "customorder", message_type: "CUSTOM ORDER PLACED", message: "m", to_userRef: person(db, "designer1"), sent_from: "system", mark_as_read: false }), label("payment_checker_widget.dart:728 tell the designer"));
  await bump(db, ["notification_id"], label("payment_checker_widget.dart:745"));
  await ok(updateDoc(doc(db, "coupon", "cp1"), { coupon_used_user_list: arrayUnion({ user_email: "cust1@example.test", user_id: "cust1", user_order_ref: order, user_order_id: code }), coupon_limit: increment(-1) }), label("payment_checker_widget.dart:768 use the coupon"));
  await ok(getDocs(query(collection(db, "brands"), where("brand_id", "==", "1"), limit(1))), label("payment_checker_widget.dart:834 term for the mail"));
  await ok(updateDoc(me, { "user_cart.updated_at": now(), "user_cart.cart_items": deleteField(), "user_cart.coupon_info": deleteField() }), label("payment_checker_widget.dart:798 clear the cart"));
  await ok(setDoc(doc(collection(db, "mail")), { created_at: now(), to: "cust1@example.test", template: { name: "Order_summary", data: { name: "C One", order_id: code, total: 22, purchased_items: [{ product_name: "Dress", product_qty: 1 }] } } }), label("payment_checker_widget.dart:904 order summary mail"));
  await ok(getDocs(query(collection(db, "orders"), where("order_id", "==", code), limit(1))), label("success_widget.dart:178 order placed screen"));
  return order;
}

async function otherOrders(env) {
  const db = dbOf(env, "cust1");
  const me = person(db, "cust1");
  // free order (100% coupon): created already paid
  await ok(setDoc(doc(collection(db, "orders")), { order_id: "ORDAZYA-FREE", customer_id: "cust1", customer_ref: me, order_items: { cart_items: [] }, total_price: 0, order_status: "CAPTURED", payment_status: "CAPTURED", created_at: now(), updated_at: now(), payment_id: "COUPONFREE", payment_method: "COUPONFREE", shipping_price: 0, payment_type: "COUPON", shipping_address: { city: "Kuwait City" }, shipping_info: { is_default: true } }), "free_payment_widget.dart:48 free order");
  await ok(updateDoc(doc(db, "inventory", "i-designer2"), { updated_at: now(), stock_reserved: increment(1), stock: increment(-1) }), "free_payment_widget.dart:158 lower stock");
  await ok(updateDoc(doc(db, "coupon", "cp1"), { coupon_used_user_list: arrayUnion({ user_id: "cust1" }), coupon_limit: increment(-1) }), "free_payment_widget.dart:227 use the coupon");
  // in-app purchase, signed in (the feature is off on live)
  const inApp = doc(collection(db, "orders"));
  await ok(setDoc(inApp, { order_status: "CAPTURED", created_at: now(), order_id: "ORDAZYA_INAPP1234", customer_ref: me, total_price: 5, order_items: { cart_id: "6", cart_items: [{ product_id: "AZYPRD1" }] }, customer_id: "cust1" }), "default_cart_button_widget.dart:904 in-app order");
  await ok(updateDoc(inApp, { payment_status: "CAPTURED", payment_id: "rc-1", payment_method: "InApp", payment_type: "InApp", updated_at: now() }), "default_cart_button_widget.dart:996 in-app paid");
  await bump(db, ["order_id", "cart_item_id", "cart_id"], "default_cart_button_widget.dart:985");

  // order screens
  await ok(getDocs(query(collection(db, "orders"), where("customer_ref", "==", me), orderBy("created_at", "desc"))), "orders_widget.dart:130 my orders");
  await ok(getDocs(query(collection(db, "orders"), where("order_status", "==", "completed"))), "s2_creator_wallet_widget.dart:597 creator wallet reads completed orders");
  await ok(getDoc(doc(db, "orders", "o-cust1")), "orders_details_widget.dart:123 order details");
  await ok(getDocs(query(collection(db, "delivery"), where("order_ref", "==", doc(db, "orders", "o-cust1")))), "orders_comp_widget.dart:55 deliveries of an order");
  await ok(getDocs(query(collection(db, "logistics_response"), where("id", "==", "SV-1"), limit(1))), "orders_single_comp_widget.dart:762 tracking");
  await ok(getDocs(query(collection(db, "coupon"), where("coupon_value", "==", "WELCOME"), limit(1))), "apply_coupon_widget.dart:207 find a coupon");
  await ok(getDocs(query(collection(db, "coupon"), where("coupon_status", "==", "active"))), "apply_coupon_widget.dart:846 active coupons");

  // returns
  await ok(setDoc(doc(collection(db, "return_requests")), { return_request_id: "RTORD2", created_at: now(), updated_at: now(), status: "Pending", userRef: me, orderRef: doc(db, "orders", "o-cust1"), order_id: "AZY100", total_return_quantity: 1, total_return_amount: 20, return_reason: "size", return_product_list: [{ product_id: "AZYPRD1" }] }), "order_return_widget.dart:1139 return request");
  await ok(updateDoc(doc(db, "orders", "o-cust1"), { return_request_id: "RTORD2" }), "order_return_widget.dart:1202 link the return");
  await bump(db, ["return_request_id"], "order_return_widget.dart:1207");
  await ok(getDocs(query(collection(db, "return_requests"), where("return_request_id", "==", "RTORD2"), limit(1))), "orders_comp_widget.dart:350 return by number");
  await ok(getDocs(query(collection(db, "return_requests"), where("orderRef", "==", doc(db, "orders", "o-cust1")), limit(1))), "orders_details_widget.dart:1484 return of an order");

  // a designer shopping in the app has every customer right
  const shopper = dbOf(env, "designer1");
  const own = doc(collection(shopper, "orders"));
  await ok(setDoc(own, { order_status: "Initialization", created_at: now(), order_id: "ORDAZYA-D", customer_ref: person(shopper, "designer1"), total_price: 5, order_items: { cart_items: [] }, customer_id: "designer1" }), "a designer places an order in the app");
  await ok(updateDoc(own, { order_status: "CAPTURED", payment_status: "CAPTURED", payment_id: "P", payment_method: "KNET", payment_type: "card", updated_at: now() }), "a designer's order is marked paid");
  await ok(updateDoc(doc(shopper, "inventory", "i-designer2"), { updated_at: now(), stock_reserved: increment(1), stock: increment(-1) }), "a designer's purchase lowers another designer's stock");
}

async function runAppFlows(env) {
  await seedWorld(env);
  await guest(env);
  await registration(env);
  await profile(env);
  await productActions(env);
  for (const provider of ["UPayments", "Tap", "MyFatoorah"]) {
    await paidOrder(env, provider);
  }
  await otherOrders(env);
}

module.exports = { runAppFlows, paidOrder };
