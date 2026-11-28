/*
 * A small world of records for the flow tests: one of everything the apps
 * touch, owned by the people in lib.js. Written with rules off.
 */
const { doc, setDoc, Timestamp } = require("firebase/firestore");

function world(db) {
  const user = (id) => doc(db, "users", id);
  const now = Timestamp.now();
  const product = (designer, code) => ({
    created_at: now,
    updated_at: now,
    status: "active",
    product_id: code,
    product_type: "simple",
    product_info: { name: "Dress " + code, short_description: "s", description: "d", feature_image: "u", gallery_image: [] },
    product: { product_price: 20, product_sale_price: 18, product_type: "ready", SKU: 1001, inventory_ref: doc(db, "inventory", "i-" + designer), inventory_id: "INV1" },
    product_authorizer: { product_designer_id: designer, product_designer_ref: user(designer), is_affiliate_product: false, is_virtualtryon_status: false, creator_id_list: [] },
    product_marketing: { is_featue_product: false, is_recommended_product: false, is_popular_product: false, promotion: [], product_sales_history: { total_sales: 0 } },
    product_attribute: [],
    product_review: [],
    product_notify_list: [],
  });
  const stock = (designer, code) => ({
    created_at: now,
    updated_at: now,
    status: "active",
    product_type: "ready",
    product_id: code,
    product_ref: doc(db, "products", "p-" + designer),
    designer_uid: designer,
    threshold_stock: 2,
    stock: 10,
    stock_on_hand: 10,
    stock_reserved: 0,
    stock_unavailable: 0,
    stock_status: "instock",
    inventory_id: "INV1",
  });
  const line = (designer, code) => ({ product_id: code, product_designer_id: designer, quantity: 1, price: 20, product_ref: doc(db, "products", "p-" + designer) });
  const order = (customer, code) => ({
    created_at: now,
    updated_at: now,
    order_id: code,
    customer_id: customer,
    customer_ref: user(customer),
    order_status: "Initialization",
    payment_status: "",
    total_price: 40,
    shipping_price: 2,
    order_items: { cart_items: [line("designer1", "AZYPRD1"), line("designer2", "AZYPRD2")], sub_total: 40 },
    shipping_address: { shipping_name: customer, city: "Kuwait City" },
    delivery_info_list: [],
  });
  return {
    id_map: {
      main: {
        type: "Main", product_id: 10, inventory_id: 10, order_id: 100, inventory_request_id: 5, movement_log_id: 5, delivery_id: 5,
        enquiry_id: 1, notification_id: 50, sizechart_id: 1, category_id: 3, tag_id: 3, attribute_id: 3, brand_id: 3,
        delivery_partner_id: 1, creator_id: 1, designer_id: 1, sale_history_id: 1, vto_id: 1, coupon_id: 1, transaction_id: 1,
        return_request_id: 1, user_id: 80, mail_id: 300, review_id: 1, waitlist_id: 1,
      },
    },
    settings: {
      company: {
        type: "Company", updated_at: now, settings_company_info: { name: "Azyaa", wearhouse_address: { city: "Kuwait City" } },
        settings_product: { compare_price: true }, settings_home: { settings_categoryid_list: [] }, settings_payment_info: [],
        settings_secret_feature: { settings_waitlist_feature: false, settings_secret_feature: false, settings_app_access_list: [] },
        settings_social_login: { google_login: true },
      },
    },
    products: { "p-designer1": product("designer1", "AZYPRD1"), "p-designer2": product("designer2", "AZYPRD2") },
    inventory: { "i-designer1": stock("designer1", "AZYPRD1"), "i-designer2": stock("designer2", "AZYPRD2") },
    category: { c1: { category_id: "1", status: "active", category_info: { name: "Dresses" }, category_product_list: [] } },
    tags: { t1: { tag_id: "1", status: "active", tag_info: { name: "Summer" }, tag_product_id: [] } },
    attributes: { a1: { attribute_id: "1", status: "active", attribute_info: { name: "Size" }, attribute_brand_id: [] } },
    brands: { b1: { brand_id: "1", status: "active", brand_info: { name: "M" } } },
    orders: { "o-cust1": order("cust1", "AZY100"), "o-cust2": order("cust2", "AZY101"), "o-designer1": order("designer1", "AZY102") },
    coupon: { cp1: { coupon_status: "active", coupon_value: "WELCOME", coupon_limit: 5, coupon_price: 10, coupon_discount_type: "percent", coupon_used_user_list: [] } },
    sales_history: {
      "s-designer1": { user_ref: user("designer1"), uid: "designer1", status: "active", total_earning: 0, remaining_balance: 0, available_for_payout: 0, sale_history: [], updated_at: now },
      "s-designer2": { user_ref: user("designer2"), uid: "designer2", status: "active", total_earning: 0, remaining_balance: 0, available_for_payout: 0, sale_history: [], updated_at: now },
    },
    inventorymovementlog: {
      "m-designer1": { created_at: now, update_at: now, designer_uid: "designer1", product_id: "AZYPRD1", product_quantity: 3, status: "inbound", request_info: { request_status: "Pending", request_type: "Restock", raised_by: "admin" }, inventory_ref: doc(db, "inventory", "i-designer1") },
    },
    store_valley_inventory: { "AZYPRD1_WH-KWT-MAIN": { product_id: "AZYPRD1", available: 4 } },
    logistics_response: { l1: { swftTrackID: "SV-1", request_id: "R-1", status: "created", state: "created" } },
    delivery: { del1: { status: "REQUESTED", type: "order", order_ref: doc(db, "orders", "o-cust1"), delivery_id: "4", delivery_tracking_id: "SV-1" } },
    return_requests: { r1: { created_at: now, updated_at: now, status: "Pending", orderRef: doc(db, "orders", "o-cust1"), customer_ref: user("cust1"), return_request_id: "RET1" } },
    notification: {
      "n-designer1": { to_userRef: user("designer1"), message: "Low stock", mark_as_read: false, created_at: now },
      "n-cust1": { to_userRef: user("cust1"), message: "Order placed", mark_as_read: false, created_at: now },
      "n-cust2": { to_userRef: user("cust2"), message: "Order placed", mark_as_read: false, created_at: now },
      "n-admin1": { to_userRef: user("admin1"), message: "New order", mark_as_read: false, created_at: now },
    },
    transactions: {
      "tr-designer1": { user_ref: user("designer1"), status: "pending", payout_amount: 10, IBAN: "KW00TEST", account_holder_name: "D One", created_at: now },
      "tr-designer2": { user_ref: user("designer2"), status: "pending", payout_amount: 12, IBAN: "KW00TEST2", account_holder_name: "D Two", created_at: now },
    },
    images: {
      "im-designer1": { image_id: "IMG-1", image_uid: "designer1", feature_image: "u", created_at: now },
      "im-designer2": { image_id: "IMG-2", image_uid: "designer2", feature_image: "u", created_at: now },
    },
    mail: { ml1: { to: "cust1@example.test", template: { name: "Order_summary", data: { pickup_otp: "123456" } }, created_at: now } },
    delivery_login_creds: { dp1: { email: "driver@example.test", display_name: "Driver", status: "active", password: "plain-text-old" } },
    user_waitlist: { w1: { email: "w@example.test", status: "Pending" } },
    user_referral_activities: { ra1: { referrer_ref: user("cust2"), referred_ref: user("cust1"), created_at: now } },
    user_membership_plans: { mp1: { membership_plan_id: "1", plan_info: { name: "Gold" }, price: 5, status: "active" } },
    user_vto_plans: { vp1: { vto_plan_id: "1", vto_info: { name: "10 tries" }, vto_point: 10, price: 2, status: "active" } },
    theme: { th1: { name: "default" } },
    roles: {
      designer: { role_unique_key: "designer", role_info: { name: "Designer" }, permissions_list: ["dashboard", "product"] },
      shop: { role_unique_key: "shop_manager", role_info: { name: "Shop manager" }, permissions_list: [] },
    },
    permissions: { perm1: { key: "product" } },
    payment_response: { pr1: { order_id: "AZY100", status: "CAPTURED" } },
  };
}

async function seedWorld(env) {
  await env.withSecurityRulesDisabled(async (ctx) => {
    const db = ctx.firestore();
    for (const [name, docs] of Object.entries(world(db))) {
      for (const [id, data] of Object.entries(docs)) {
        await setDoc(doc(db, name, id), data);
      }
    }
  });
}

module.exports = { world, seedWorld };
