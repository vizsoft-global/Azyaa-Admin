# Database lockdown, stage 1 — rules and back-office fixes

Status: design for approval
Date: 2026-11-28 (updated the same day: services rule in 9.1, search copy in problem 9 and 6.4)
Repos touched: `Azyaa-Admin` (Firestore rules, rules tests, cloud functions). `azya-admin-2026` (admin panel) only if a test shows the panel breaks a new rule. The customer app is **not** changed.
Firebase project: `azyaa-0uiv4k`

## 1. Problem

The live Firestore rules (`firebase/firestore.rules` in this repo, confirmed identical to the live ruleset on 28 Nov 2026) let anyone on the internet create a record in almost every collection and read everything, with no login. Several collections also let anyone change records. Four collections were fixed on 25–28 Nov 2026 (`delivery`, `logistics_response`, `store_valley_codes`, `store_valley_webhook_events`). This design covers the rest.

What that exposes today, confirmed against the live project:

1. **Anyone can make themselves a super admin.** `users` can be created by anyone and updated by any signed-in account. The panel, the rules' `isStaff()` and the back office (`store_valley_staff.js`) all decide who is staff from `users.role_unique_key`, so a customer who writes `super_admin` onto their own record gets the whole panel, the Store Valley key and the delivery codes.
2. **Delivery partner passwords** are stored as plain text in `delivery_login_creds` (5 records) and readable without login.
3. **Designers' bank details** (`transactions`: IBAN, account number, holder name) are readable without login. Stage 1 closes `transactions` only. Bank details also sit on the `users` record itself (`creator_main_info.creator_payout_info` on 12 creator records on 28 Nov 2026; `designer_main_info.designer_bank_info` when a designer saves it in the panel, none yet), and `users` stays readable until stage 2 splits it.
4. **Every email the system sent** (`mail`, 339 records) is readable without login. Delivery codes are mailed, so this bypasses the private code store released on 28 Nov.
5. **Anyone can send email as Azyaa.** The Trigger Email extension sends whatever record anyone creates in `mail`. (Stage 1 reduces this to "anyone with an account"; see 6.1.)
6. **Anyone can push a notification to any user.** `sendPushNotificationToUser` and `sendPushNotificationToUsers` have no login check. `generateDynamicReport` has none either.
7. **Catalogue, roles, permissions, coupons, plans, settings** can be created by anyone and changed by any signed-in customer; `orders`, `inventory`, `settings`, `id_map`, `payment_response`, `sales_history`, `user_waitlist`, `store_valley_inventory`, `inventorymovementlog` can be changed with no login at all.
8. **Any signed-in customer can delete** any order, user, product or stock record.
9. **The search service holds an open copy of customers and orders** (found 28 Nov 2026, after the first draft). Six Firebase add-ons copy `users`, `orders`, `inventory`, `products`, `category` and `brands` to Algolia. The Algolia key built into the customer app and the old Flutter admin (the same key in both) reads all six copies with no login: 81 customer records with email, name and date of birth, and 239 orders with items, totals and shipping address. The same key may also add, delete and re-configure those copies; it is not a search-only key. Firestore rules do not touch this copy, so closing `orders` in Firestore changes nothing here. See 6.4.

A second group of problems cannot be fixed by rules, because the customer app relies on the open access. They are stage 2 (section 9) and are **not** solved here:

- The payment providers' secret keys are in the `settings` record, which the app reads before login.
- The app itself marks its orders as paid, lowers stock, credits the designer's sales and uses up coupons.
- Guests browse designers and creators from the same `users` records that hold customers' emails, phones and addresses, and creators' payout bank details.

## 2. Goals

- Close items 1–4 and 6–8 above, and reduce item 5, without an app release.
- Close item 9 as far as it can be closed without an app release (6.4).
- Add no new outside service. The owner's rule (28 Nov 2026): as few different services as possible, Firebase and Cloudflare for most things. Stage 1 uses Firebase only; section 9 lists what stage 2 moves or removes.
- Nothing a customer, a guest, a designer or office staff does today in the customer app or the React panel stops working, with the exceptions listed in section 6.
- Every rule is proven on the local emulator before release, the same way the delivery rules were.
- Each release can be undone in about a minute by putting back the previous ruleset.

## 3. Non-goals

- No customer app change and no forced update.
- No change to how payment is confirmed, how stock is lowered, or where payment keys live (stage 2).
- No splitting of `users` into public and private parts (stage 2). `users` stays readable without login.
- No rule for `tryon_requests`. That collection has no rule today, so the app's try-on is refused on live; bringing it back belongs to the approved try-on design (`2026-09-29-tryon-provider-registry-design.md`), which already lists it.
- No data is deleted. In particular the stored partner passwords stay where they are, now unreadable by outsiders, until the owner says to remove them.

## 4. Anti-goals

- Checkout, registration, login or guest browsing breaking for customers on the app build that is in the stores today.
- A rule so narrow that the panel's own screens start failing for designers or office staff.
- Releasing the customer app repository's rules file (`Azyaa/firebase/firestore.rules`). It is not the live one.
- "Fixing" a hole by trusting a field the account can write itself.

## 5. Who is who in the rules

| Name used below | Meaning | How a rule recognises it |
|---|---|---|
| Guest | Not signed in | `request.auth == null` |
| Customer | Signed in, no panel role | signed in, and not staff |
| Designer | Panel role `designer` | own `users/<login id>` record has `role_unique_key == 'designer'` |
| Office | Panel role `super_admin`, `admin` or `shop_manager` | same record, role in that list |
| Super admin | Panel role `super_admin` | same record |
| Staff | Designer or Office | already in the rules as `isStaff()` |

Role facts on live, 28 Nov 2026: the only role keys in use are `super_admin` (2 accounts) and `designer` (13); `roles` also holds `admin`, `shop_manager` and `customer` with no account using them. The live `designer` role opens only the dashboard, products, orders, media, inventory and profile screens. It has no category, tag, attribute, coupon, notification or settings permission, so "create: office" on those collections refuses nothing a designer can reach. A role key outside the four named ones would be treated as a customer by the rules; none exists.

The staff check reads the caller's own record by login id. On 28 Nov 2026, 80 of 81 `users` records are filed under the login id (the other has no login id at all), and all 15 staff records are. Server code (cloud functions, the email and translation extensions) is not bound by rules and is unaffected.

## 6. The design

### 6.1 Rules, in two releases

**Release A — close what no client needs.** Low risk: every change either closes something no app uses, or asks for a login on a path where the app is already signed in. The one change on a path customers really use is registration (the `users` create and change rules), which is why it gets its own tests for every sign-in method.

**Release B — limit what a signed-in customer may change.** Medium risk: it narrows writes the customer app really makes after payment, so each one is modelled as a test from the app's own code first.

A and B are separate releases so that if something breaks, the cause is obvious and only one step is undone.

#### Release A

| Collection | Read | Create | Change | Delete |
|---|---|---|---|---|
| `users` | anyone (unchanged) | signed in, only the record under your own login id, with no panel role in it | see below | super admin |
| `roles` | signed in | super admin | super admin | super admin |
| `permissions` | staff | super admin | super admin | super admin |
| `delivery_login_creds` | office | office | office | office |
| `transactions` | office; a designer reads their own (`user_ref` is their record) | office | office | nobody (unchanged) |
| `mail` | nobody | signed in | nobody | nobody |
| `settings` | anyone (unchanged) | super admin | office | super admin |
| `id_map` | anyone (unchanged) | nobody | signed in; the record's `type` may not change (both apps find it by type) | nobody |
| `store_valley_inventory` | staff | nobody | nobody | nobody |
| `inventorymovementlog` | staff | staff | staff | super admin |
| `notification` | the person it is addressed to (`to_userRef`), or office | signed in | the person it is addressed to, or office | office |
| `user_waitlist` | office | office | office | office |
| `user_referral_activities` | office | signed in | signed in | office |
| `category`, `tags`, `attributes`, `brands` | anyone (unchanged) | office | staff | office |
| `coupon` | signed in | office | signed in (narrowed in B) | office |
| `user_membership_plans`, `user_vto_plans`, `theme` | anyone (unchanged) | office | office | office |
| `images` | staff | staff | staff | staff |
| `videos`, `services`, `subscriptions`, `review`, `banners` | office | office | office | office |
| `products` | anyone (unchanged) | staff | signed in (narrowed in B) | office |
| `inventory` | anyone (unchanged) | staff | signed in (narrowed in B) | office |
| `orders` | signed in | signed in, with `customer_id` equal to your own login id | signed in (narrowed in B) | super admin |
| `return_requests` | signed in | signed in, with status `Pending` and `userRef` your own record | office | super admin |
| `sales_history` | signed in | office | signed in (narrowed in B) | super admin |
| `payment_response` | unchanged (anyone) — see open question 1 | unchanged (anyone) | unchanged (anyone) | super admin |
| `delivery`, `logistics_response`, `store_valley_codes`, `store_valley_webhook_events`, `store_valley_delivery_jobs` | unchanged | unchanged | unchanged | unchanged |

**`users`, change.** This is the fix for the super-admin takeover.

- Your own record: allowed, but `role_unique_key` must stay exactly as it was, and `user_role` may only stay as it was or be set to `Customer` or `Admin`. (`Customer` is what the app writes at registration; `Admin` with an empty role is what the panel's Register form writes for an account waiting for approval. Neither gives any access by itself.)
- Your own record, approval status: `designer_main_info.designer_status` and `creator_main_info.creator_status` must stay as they were **if** the builder confirms from the app and panel code that no account writes its own status. If one does, leave those two fields alone and say so in the plan.
- Someone else's record: office may change anything, except that only a super admin may give or take away `super_admin`. A customer may change only `points_balance` and `user_vto` on another person's record (the referral bonus the app pays to the referrer today). A designer may not change other people's records.
- Create: the panel's Register form writes `role_unique_key: ""`; the rule must accept an empty or missing role and refuse anything else.
- `uid`: a record may only carry its own login id. The panel finds a person with `uid == login id`, so without this any customer could write a staff member's uid onto their own record and lock that person out of the panel (found by the review). Office may still correct a `uid`.

**`mail`, create.** Reading is closed completely, which protects the delivery codes. Sending is reduced, not closed: it needs a login, but any registered account can still create a mail record to any address. Pinning the address was considered and dropped for stage 1. The app sends to the email on the person's `users` record, which they can edit themselves, so a pin on it proves little; and the app waits for this write on the way to the "order placed" and "verify your email" screens, so a wrong refusal strands a paying or registering customer. Stage 2 moves mail sending to the back office and then closes client creates. (On 28 Nov 2026: 84 login accounts, all with an email; 79 match their record's email, 1 differs, 4 have no record.)

**Staff are also app users.** A designer is an ordinary customer-app account that was later given the `designer` role on the same record, and may shop in the app. So everywhere in these tables, a staff member keeps every right a customer has; the staff rows add to the customer rights and never replace them.

Collections not present on live today (`videos`, `services`, `subscriptions`, `review`, `banners`, `return_requests`) still get rules, so they are not left open if they come into use.

Why some reads stay wider than one would like: Firestore refuses a whole query unless the rule can be proven from the query's own filters. The app looks up orders by order number without naming the customer, its creator screens read all completed orders, it looks up returns by order, and designers in the panel load orders and returns unfiltered and narrow them in the browser. So `orders`, `return_requests` and `sales_history` are "signed in" here, not "owner only". Owner-only needs the queries changed first (stage 2).

#### Release B

Office keeps full change rights on all of these. A designer has the customer rights in each row plus the designer row, because designers also buy in the app (see "Staff are also app users").

| Collection | What a customer may change |
|---|---|
| `orders` | Only their own order (`customer_id` is their login id), and only the fields the app writes after creating it: `shipping_address`, `shipping_info`, `payment_id`, `payment_method`, `payment_type`, `payment_status`, `order_status`, `ready_shipping_request_status`, `custom_shipping_request_status` (both written by the MyFatoorah path; found during the build), `return_request_id`, `updated_at`. |
| `orders`, designer | Additionally, on any order: only `order_items` and `updated_at` (the panel's "line ready" action rewrites the item list). |
| `inventory` | Only `stock`, `stock_reserved`, `updated_at`; `stock` may not go up and `stock_reserved` may not go down. |
| `inventory`, designer | Additionally, any field on their own record (`designer_uid`); create only as their own. |
| `products` | Only `product_review`, `product_notify_list`, `updated_at`, `creator_id_list` inside `product_authorizer`, and `promotion` and `product_sales_history` inside `product_marketing`. |
| `products`, designer | Additionally, any field on their own product (`product_authorizer.product_designer_id`), except that a designer may only leave `status` as it is or set it to `request` or `archived` (approval stays with the office; added during the build, the panel never sends anything else); create only as their own, with status `request`. |
| `coupon` | Only `coupon_used_user_list` and `coupon_limit`; `coupon_limit` may not go up. |
| `sales_history` | Only `sale_history` and `updated_at`. |

The field lists above come from reading the app's code on `main` (28 Nov 2026). The builder must re-derive each list from every write site before writing the rule (FlutterFlow record helpers, `.update(` calls and custom actions; search for the snake_case field name and the camelCase Dart name), and must check the three payment paths (UPayments, Tap, MyFatoorah), the free-order path and the in-app-purchase path separately, because each has its own copy of the after-payment writes. Where the code shows a field not listed here, the code wins and the plan records the difference.

Three things added after the review, all in Release B:

- **Untidy old records.** A number stored as text or left blank, or a blank where a list or map should be, is read as 0, an empty list or an empty map, so the app's after-payment writes are not refused on such a record. What the customer writes must still be a number or a list. (On 28 Nov 2026 every live stock and coupon number was a proper number; this is a guard.)
- **Lists the app only adds to** (`coupon_used_user_list`, `sale_history`, `product_review`, `product_notify_list`, and the three lists inside the product maps): a customer may add to them but not remove or change what is there.
- **A stock record out of step with its product.** A designer may also save a stock record that names another designer or nobody, when it belongs to a product of theirs (one such record of each kind on live). The `designer_uid` on a stock record can be changed by the office only.

What Release B does **not** stop: a signed-in customer can still set `payment_status` to `CAPTURED` on their own order, drain stock by lowering it, and append to sales records. Stopping those is stage 2.

### 6.2 Back office

Small changes in `firebase/custom_cloud_functions/`:

1. `sendPushNotificationToUser`, `sendPushNotificationToUsers`, `sendPushNotificationToMultipleUsers` and `generateDynamicReport` refuse callers who are not office staff, using the existing `requireStaff(context, { noDesigner: true })`. Only the two admin panels call them; the customer app does not.
2. `loadStaffProfile` in `store_valley_staff.js` looks for the caller's record by login id first and by the `uid` field second (today it is the other way round), so it agrees with the rules.

Released before Release A. Neither depends on the rules.

### 6.3 Admin panel

No change is planned. The audit of `azya-admin-2026` found every panel write is made signed in, and by a role the tables above allow. If a rules test modelled on a panel action fails, the builder fixes the rule when the action is legitimate, or raises it when the panel is doing something a designer should not be able to do. Known cases to model: product save by a designer (touches `products`, `inventory`, `category`, `tags`, `id_map`), restock request and pickup by a designer, "line ready" on an order, the translation page under a designer login, role change from the Roles screen, designer and creator approval, the Register form, and the notifications page.

### 6.4 The search copy at Algolia

This is a settings change at Algolia and in the Firebase add-ons, not code. It is independent of the rules and can go first. It needs someone signed in to the Algolia dashboard (the builder cannot sign in), and the owner's go-ahead for each part.

Facts, 28 Nov 2026:

- The customer app on `main` no longer searches through Algolia; its search reads Firestore and matches in the app (`lib/backend/search/search_service.dart`). The Algolia key is still built in. An older store build may still search `products`, `category`, `brands` and `users` through Algolia (open question 2).
- The old Flutter admin searches all six copies, including `orders` and `inventory`.
- The React panel does not use Algolia (the package is listed but nothing calls it).
- The add-ons keep their Algolia key in Secret Manager. Checked on 28 Nov 2026 (compared without printing): all six add-ons use the same key that is built into the app.

The owner's click-by-click steps are in `docs/search-copy-steps.md`. In short:

1. **Make the built-in key search-only.** Because the add-ons share that key, first create a new write key at Algolia, put it into the add-ons, confirm a product edit still reaches Algolia, and only then edit the built-in key: rights `search` only; indexes `products`, `category`, `brands`, `users`. Breaks nothing in the customer app at any version. In the old Flutter admin, order search and stock search stop.
2. **Stop returning private fields from the `users` copy.** In the `users` index settings, mark `email`, `user_info.date_of_birth` and `user_info.age` as not retrievable. They stay searchable for the old admin's customer search but are no longer handed back.
3. **Remove the `orders` and `inventory` copies.** Uninstall the two add-ons that feed them and delete the two indexes at Algolia. The originals in Firestore are untouched. Only if the owner confirms the old Flutter admin is no longer used for order or stock search (open question 3); otherwise step 1 already hides them from the built-in key.

After step 1 the built-in key can still read product, category and brand copies (public anyway) and the `users` copy minus the private fields. Removing Algolia altogether is stage 2 (section 9).

## 7. What stops working, on purpose

- **Order search and stock search in the old Flutter admin** (6.4, step 1). The React panel is unaffected.

- **The waitlist form and the secret-code screen in the customer app.** Both run before login and write to `user_waitlist`, `id_map`, `notification` and `settings`. Both features are switched off on live (`settings_waitlist_feature` and `settings_secret_feature` are false; the last waitlist record is from December 2025). If either is switched back on, it will fail until stage 2 gives it a back-office program. This is my call; say so if the waitlist is coming back soon.
- **The old Flutter admin's pre-login loading.** That site starts reading before login on most routes; the reads that need staff will now be refused until the person signs in. Signed-in staff use it as before.
- **Role editing by a non-super-admin.** Only a super admin can change the `roles` and `permissions` records. No `admin` or `shop_manager` account exists today.
- **Deleting by customers.** Nothing in the customer app deletes a record, so nothing visible changes.

## 8. Testing and release

**Tests.** Extend `firebase/rules-tests/rules.test.js` (emulator, `npm test` in that folder):

- A table test per collection: guest, customer, a second customer, designer, a second designer, office, super admin × read one, list, create, change, delete, checked against the tables in 6.1.
- "The app still works" tests: one per write the customer app makes, built from the code at that write site with realistic field sets. Registration (email, Google, Apple, phone), profile and cart updates, the referral bonus, order creation, every after-payment write on each payment path, coupon use, return request, order-summary and OTP mail.
- "The panel still works" tests for the cases listed in 6.3.
- Attack tests: self-promotion to each staff role, creating a second user record carrying another login id, creating a user record with a role, reading `mail`, `delivery_login_creds` and `transactions` as guest and as customer, sending mail to someone else, raising stock, changing someone else's order.
- The existing before/after comparison stays for the collections not touched.
- Functions: unit tests that the four callables refuse a guest, a customer and a designer, and that `loadStaffProfile` prefers the record under the login id.

**Release order.** Each step needs the owner's go-ahead.

0. The search copy (6.4), by whoever holds the Algolia login. Independent of the rest; can be done the same day it is approved.
1. Back office (6.2).
2. Release A. Before it: download the live ruleset, confirm it is still the file on `main`, keep it as the rollback copy.
3. Owner's check after A (about 15 minutes, signed in): in the app, open as guest, register a new account, browse, add to cart, place a test order through to the paid screen, open the order list. In the panel, sign in as super admin and as a designer, save a product, open orders, open notifications.
4. Release B, then the same check again with a test payment and a coupon.

**Rollback.** `firebase deploy --only firestore:rules` with the saved copy. About a minute.

**What cannot be verified before release.** There is no test database and the builder cannot sign in to live. The emulator proves the rules do what the tables say; it does not prove the tables match every build of the app in customers' hands (open question 2). Step 3 is the real check.

## 9. Stage 2 (outline only; its own design later)

- Payment result confirmed by the back office with the provider, keys held in server settings and removed from `settings`.
- After-payment steps (mark paid, lower stock, credit sales, use coupon, notify designer, order mail) done by the back office.
- Public profile records for designers and creators; `users` private.
- Owner-only reads for orders and returns, with the app's queries changed to match.
- Order numbers and other counters issued by the back office.
- Waitlist and secret-code through a back-office program if they are wanted.
- App release, then a forced update, then the strict rules.

Payments are in test mode on live today (MyFatoorah primary, production off). Stage 2 should be done before production payments are switched on.

### 9.1 Services: Firebase and Cloudflare for most things

The owner's rule, 28 Nov 2026: avoid as many different services as possible; Firebase and Cloudflare for most. Stage 2 is where it is applied, because almost every outside address is built into the customer app and only an app release can change it. Stage 2's design must not add a service outside Firebase and Cloudflare, and must settle each row below.

| Service today | What it does | Plan |
|---|---|---|
| Make.com | Receives the payment provider's result and (it appears) saves it to `payment_response`. Its address is built into the app. | Replace with a Firebase function that checks the result with the provider. Removes Make.com. |
| `proxy.vizsoft.in` (own relay server) | Passes the web version's calls on to Tap, the three Render servers and dub.co. | Not needed once those calls are made by the back office. Remove. |
| Render, three small servers | `nocodeplayground`: login codes by WhatsApp, SMS and email through OTPless. `standalone-5vgm`: file and image upload. `newplot`: try-on and image watermark. | Move to Firebase functions and Firebase Storage. Try-on follows the try-on design. |
| OTPless | Sends the WhatsApp and SMS codes. Phone codes are switched off on live. | Remove, or use Firebase phone sign-in if phone login is wanted. Owner's choice. |
| Algolia | Search copy of six collections (problem 9). The customer app on `main` no longer uses it. | Remove completely once no app build in use searches through it and the old Flutter admin is retired. |
| Branch and dub.co | Share links. A dub.co key is built into the app. | The project's own `azyaa-link` site on Cloudflare Pages already exists. Keep that one, remove the other two, cancel the dub.co key. |
| `backend.vizsoft.in` (own server) | Shipping labels in the old Flutter admin only. | Goes away with the old Flutter admin. |
| Mail account behind the Trigger Email add-on | Actually delivers the emails (an outside mail account under the `bonuskw.com` name). | Firebase cannot deliver email by itself, so one mail provider stays. Stage 2 checks whether Cloudflare's email sending can take it over; if not, keep this one. |
| RevenueCat | In-app purchases through Apple and Google. | Stays while memberships are sold in the app. Owner's choice. |
| MyFatoorah, UPayments, Tap | Take payment. Three are wired in; one is in use. | A payment provider cannot be Firebase or Cloudflare. Going down to one is the owner's choice. |
| Store Valley | Warehouse and drivers. | Stays. |
| Try-on provider | Makes the try-on pictures. | Stays (try-on design). |
| `restcountries.com`, `flagcdn.com`, `ui-avatars.com` | Country list, flags, placeholder avatars. | Bundle into the app. Remove. |
| Google Translate add-ons, Cloudflare Images, Cloudflare Pages (panel, link site) | Translation, pictures, hosting. | Already Firebase or Cloudflare. Stay. |
| GitHub | Stores the code. | Stays. |

## 10. Open questions for the owner

1. **How does the Make.com scenario talk to the database?** It saves the payment result into `payment_response`, and it may also look up the order. If it uses a Google account connection, rules do not bind it: `payment_response` can then be closed to everyone else in Release A and nothing else matters. If it uses plain web requests with no login, `payment_response` must stay open until stage 2, **and** any lookup it does on `orders` would be refused once `orders` needs a login. Until answered: `payment_response` is left exactly as it is today (read and write), `orders` still moves to "signed in", and the owner's check after Release A includes a test payment that must reach the paid screen. If it does not, Release A is rolled back and `orders` reads stay open until the answer is known. (Under the services rule in 9.1, Make.com is replaced by a Firebase function in stage 2 either way; this question now only protects stage 1.)
2. **Which app build is in the App Store and Play Store today?** The field lists in Release B were read from `main` (version 1.8.3+83). If the store build is older, the builder needs its commit or tag to check its write sites too. Until answered: Release B is built from `main` and the owner's check in step 4 is the safety net.
3. **Does anyone still work in the old Flutter admin, and can it be taken offline?** The tables were checked against the React panel and the customer app. If designers or staff still use the old admin for real work, the builder must check its writes against Release B as well. If nobody does, taking the site offline removes one more way in.
4. **Is there any other program that reads or writes the database directly?** For example a delivery partner app that signs partners in from `delivery_login_creds`, or a website form. None was found in the three repositories. If one exists, Release A would cut it off.
5. **May the plain-text partner passwords be removed from the 5 old `delivery_login_creds` records?** The React panel never reads or writes them. Not done unless approved.
6. **Who holds the Algolia login, and are the three steps in 6.4 approved?** Step 1 (search-only key) and step 2 (hide email and date of birth) are safe for the customer app. Step 3 (remove the order and stock copies) depends on question 3. Until answered: nothing is changed at Algolia, and the copy stays readable.
7. **Release B and repeated order numbers.** The app finds "its" order after payment by order number alone, and order numbers can repeat (the counter is read and bumped in two steps; 2 repeats among 240 live orders). Today, a customer who hits a repeat marks the *other* customer's order as paid and their own stays unpaid, silently. Under Release B that write is refused instead, so that customer is stuck on the payment screen after paying: no confirmation, no mail, cart not cleared. Both are wrong; the second is visible. Stage 2 removes the cause. The owner decides before Release B: release it and accept a visible failure in that rare case, or hold Release B until stage 2. Release A is not affected.

## 11. Left to the builder

- The exact rule expressions and helper functions, including safe handling of missing fields.
- Whether Release A and B are two rule files on two branches or one file released at two commits.
- Test layout and fixtures.
- The order of work inside each release.
