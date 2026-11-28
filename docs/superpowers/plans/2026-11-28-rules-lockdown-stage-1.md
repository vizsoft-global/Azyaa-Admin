# Database Lockdown Stage 1 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Close the Firestore collections that are open without login, stop self-promotion to staff, and make four cloud functions staff-only, without changing the customer app.

**Architecture:** One rules file (`firebase/firestore.rules`) rewritten in two releases, each proven on the Firestore emulator by a persona-by-operation table plus tests modelled on the real clients' writes. Two small cloud-function changes go out first. Release A lands on branch `rules-lockdown-stage-1`; Release B is a stacked branch `rules-lockdown-release-b`, so the live rules always equal `main`.

**Tech Stack:** Firestore security rules v2, `@firebase/rules-unit-testing` 6 on the emulator (firebase-tools 13.35.1, Java 17), Node 22 cloud functions (firebase-functions v4), plain `node file.test.js` tests.

**Spec:** `docs/superpowers/specs/2026-11-28-rules-lockdown-stage-1-design.md` (approved 2026-11-28). Read it first; the tables in its section 6.1 are the requirement.

## Global Constraints

- The customer app (`~/Desktop/Azyaa/Azyaa`) is read, never changed. The React panel (`~/Desktop/Azyaa/azya-admin-2026`) is changed only if a panel-flow test proves a legitimate panel write is refused and the rule cannot reasonably allow it.
- Nothing is released to live (functions, rules, panel, Algolia) without the owner's go-ahead for that release. This plan ends at reviewed pull requests.
- Never deploy `Azyaa/firebase/firestore.rules`. The live file is `Azyaa-Admin/firebase/firestore.rules`.
- No data is deleted or rewritten on live. No new outside service.
- Never print or commit keys: Store Valley, payment providers, Algolia, dub.co, Make.com hook ids.
- Rules tests run with `cd firebase/rules-tests && npm test`. Function tests run with `node <file>.test.js` from `firebase/custom_cloud_functions`.
- Where the client code disagrees with a field list in the spec, the code wins; record the difference in the commit message and in the spec's section 6.1.
- A rule must never trust a field the account can write itself, and must behave as "customer" for an account with no `users` record or with a missing field (no rule error turning into a wrong allow).
- Commits end with `Co-Authored-By: Claude Fable 5.2 <noreply@anthropic.com>`.

## Review Focus

1. **Whole-map writes.** FlutterFlow helpers send a whole nested map (`product_marketing`, `product_authorizer`, `order_items`) when one inner field changes. A customer write that replaces the map but changes only allowed inner fields must pass; one that also changes another inner field must fail. Tests in Task 5.
2. **Real field transforms.** The clients write with `increment`, `arrayUnion`, `arrayRemove` and `serverTimestamp`. Rules see the resulting value. `id_map` counter increments, `sales_history` appends, coupon and product list changes are tested with the real transforms, not plain values. Tests in Tasks 4 and 5.
3. **Accounts without a tidy record.** A signed-in account with no `users` record (`ghost`), a record with no `role_unique_key`, a record with `role_unique_key: ""` (`pending1`, made by the panel's Register form), an order with no `customer_id`. Each must be treated as a plain customer or refused cleanly. `ghost` and `pending1` are columns of the table in every task.
4. **Second sign-in.** A returning Google or Apple user runs the app's create-or-update path again. It must not be refused and must not be able to clear or set a role. Test in Task 2.
5. **Staff editing their own profile.** The panel's profile screen and the app's profile screen save the whole record with `role_unique_key` unchanged. Unchanged must pass; changed must fail, for every staff role. Test in Task 2.

---

## File structure

| File | Responsibility |
|---|---|
| `firebase/custom_cloud_functions/store_valley_staff.js` | Staff lookup; login id first |
| `firebase/custom_cloud_functions/send_push_notification_to_user.js`, `..._to_users.js`, `..._to_multiple_users.js`, `generate_dynamic_report.js` | Each starts with the staff check |
| `firebase/custom_cloud_functions/staff_only_callables.test.js` (new) | The four callables refuse non-office callers |
| `firebase/firestore.rules` | All rules |
| `firebase/rules-tests/lib.js` (new) | Emulator setup, personas, `ok`/`no`, seeding |
| `firebase/rules-tests/expected.js` (new) | The spec's tables as data: collection → persona → operation → allowed |
| `firebase/rules-tests/matrix.test.js` (new) | Runs `expected.js` against the rules |
| `firebase/rules-tests/app-flows.test.js` (new) | One test per customer-app write, each naming its source file and line |
| `firebase/rules-tests/panel-flows.test.js` (new) | One test per panel write case in spec 6.3 |
| `firebase/rules-tests/attacks.test.js` (new) | The attacks in spec section 8 |
| `firebase/rules-tests/unchanged.test.js` (new) | Before/after comparison for collections the spec leaves unchanged (moved out of `rules.test.js`) |
| `firebase/rules-tests/run.js` (new) | Runs the five test files in one emulator session; `npm test` calls it. `rules.test.js` is deleted |
| `docs/search-copy-steps.md` (new) | Owner's click-by-click steps for spec 6.4 |

Personas (ids used in every test file): `anon` (signed out), `ghost` (signed in, no record), `cust1`, `cust2`, `pending1` (`role_unique_key: ""`, `user_role: "Admin"`, `status: "Pending"`), `designer1`, `designer2`, `admin1`, `shop1`, `super1`, `super2`.

Rule helper names (used by every later task): `signedIn()`, `myUserPath()`, `myRole()` (returns `''` when signed out, no record or no field), `isStaff()`, `isOffice()`, `isSuperAdmin()`, `isDesigner()`, `isMe(id)` (`request.auth.uid == id`), `changedKeys()` (`request.resource.data.diff(resource.data).affectedKeys()`), `unchanged(field)`.

---

### Task 1: Back office — staff lookup and four staff-only functions

**Files:**
- Modify: `firebase/custom_cloud_functions/store_valley_staff.js` (`loadStaffProfile`)
- Modify: `firebase/custom_cloud_functions/store_valley_staff.test.js`
- Modify: the four callable files named above
- Create: `firebase/custom_cloud_functions/staff_only_callables.test.js`

**Interfaces:**
- Consumes: `requireStaff(context, { noDesigner: true, db? })` from `store_valley_staff.js`.
- Produces: nothing later tasks use.

- [ ] **Step 1: Failing tests for the lookup order.** In `store_valley_staff.test.js`, with the file's existing fake database: (a) record under the login id says `customer`, another record whose `uid` field equals the login id says `super_admin` → `loadStaffProfile` returns the `customer` one; (b) no record under the login id, one found by `uid` field → that one is returned; (c) neither → `null`.
- [ ] **Step 2: Run** `node store_valley_staff.test.js` — fails on (a).
- [ ] **Step 3: Change `loadStaffProfile(db, uid)`** to read `users/<uid>` first and query by the `uid` field only when that record does not exist. Update its comment.
- [ ] **Step 4: Failing tests for the callables.** `staff_only_callables.test.js` loads each exported callable, calls its handler (`.run(data, context)` on a v1 callable) with valid input and a stubbed `admin.firestore()` that serves the caller's `users` record, and asserts: no `context.auth` → `unauthenticated`; `customer` → `permission-denied`; `designer` → `permission-denied`; `super_admin`, `admin`, `shop_manager` → the handler proceeds past the check (for the push functions, reaches the user lookup; for the report, reaches the query). Follow the stubbing approach already used in `store_valley_codes.test.js`.
- [ ] **Step 5: Run** — fails (no check yet).
- [ ] **Step 6: Add** `await requireStaff(context, { noDesigner: true });` as the first statement of each of the four handlers (make `sendPushNotificationToMultipleUsers`'s handler `async`). Nothing else in them changes.
- [ ] **Step 7: Run every** `*.test.js` in the folder — all pass.
- [ ] **Step 8: Commit** `Back office: staff lookup by login id first; push and report functions are office-only`.

### Task 2: Release A — test harness, and who is staff (`users`, `roles`, `permissions`)

**Files:**
- Create: `firebase/rules-tests/lib.js`, `expected.js`, `matrix.test.js`, `attacks.test.js`, `unchanged.test.js`, `run.js`; delete `rules.test.js`; modify `package.json` (`"node run.js"` inside the existing `emulators:exec` command)
- Modify: `firebase/firestore.rules`

**Interfaces:**
- Produces: `lib.js` exports `startEnv(rulesText) → env`, `dbOf(env, persona)`, `ok(promise, label)`, `no(promise, label)`, `seedPeople(env)`, `seedDoc(env, collection, id, data)`, `PERSONAS`, `userRef(db, persona)`. `expected.js` exports `TABLE`: `{ [collection]: { seed: (persona) => data, listFilter?: (db, persona) => QueryConstraint[], rows: { [persona]: { get, list, create, update, delete } } } }` with booleans; a row may be given once for a group of personas. `matrix.test.js` exports `runMatrix(env, collections?)`. The rule helpers listed under "File structure".

- [ ] **Step 1: Build the harness** from the existing `rules.test.js` (same host, port, `ok`/`no`, silent logging). `unchanged.test.js` keeps the before/after comparison, limited to: `delivery`, `logistics_response`, `store_valley_codes`, `store_valley_webhook_events`, `store_valley_delivery_jobs` (all operations) and `payment_response` (get, list, create, update only).
- [ ] **Step 2: Read the write sites for `users`** before writing expectations: app `lib/backend/backend.dart` (`maybeCreateUser`), `register_widget.dart`, `social_widget.dart`, the phone sign-in widgets, every `currentUserReference!.update(` and every update of another user's record (`step4_referral_code_widget.dart:471`); panel `src/components/auth-provider.tsx:250-269`, `src/features/people/*`, `src/lib/designer-enrollment.ts`, `src/lib/firestore-ui.ts` callers that pass `users`. Decide the two status fields (spec 6.1, "approval status") from what you find.
- [ ] **Step 3: Failing tests.** `expected.js` rows for `users`, `roles`, `permissions` per spec 6.1. `attacks.test.js`:
  - customer sets own `role_unique_key` to each of the four staff roles → refused; clears it → refused when it was set; sets `user_role` to `Super Admin` → refused; to `Customer` → allowed.
  - customer creates `users/<own id>` with `role_unique_key: "super_admin"` → refused; with `""` or without the field → allowed; creates `users/<other id>` or a random id → refused; signed-out create → refused.
  - `pending1` (panel Register shape: `role_unique_key: ""`, `user_role: "Admin"`, `status: "Pending"`) create → allowed.
  - returning user: `set` of the app's create payload over an existing own record that has `role_unique_key: "designer"` → refused if it would change the role, allowed with merge and no role field (Review Focus 4).
  - staff saves own whole record with the role unchanged → allowed, for each staff role (Review Focus 5).
  - customer changes another customer's `points_balance` and `user_vto` → allowed; any other field on another's record → refused; designer changes another's record → refused.
  - `admin1` approves a designer (the fields `designer-enrollment.ts` writes) → allowed; `admin1` gives or removes `super_admin` → refused; `super1` does → allowed.
  - `roles`: `ghost` reads → allowed; `anon` reads → refused; `admin1` writes → refused; `super1` writes → allowed. `permissions`: `cust1` reads → refused; `designer1` reads → allowed.
  - user delete: `cust1` deletes own → refused; `super1` → allowed.
- [ ] **Step 4: Run** `npm test` — the new cases fail against the current rules.
- [ ] **Step 5: Write the helpers and the three `match` blocks.** `isStaff()` is rebuilt on `myRole()`. Use `request.resource.data.get(field, default)` and `resource.data.get(field, default)` everywhere a field may be missing.
- [ ] **Step 6: Run** — pass, and `unchanged.test.js` reports no difference.
- [ ] **Step 7: Commit** `Rules A: only a super admin grants roles; users, roles, permissions`.

### Task 3: Release A — private collections

**Files:** Modify `firebase/firestore.rules`, `firebase/rules-tests/expected.js`, `attacks.test.js`; create `panel-flows.test.js`.

**Interfaces:**
- Consumes: Task 2's helpers and harness.
- Produces: `panel-flows.test.js` exports `runPanelFlows(env)`, added to `run.js`.

Collections: `delivery_login_creds`, `transactions`, `mail`, `notification`, `user_waitlist`, `user_referral_activities`, `store_valley_inventory`, `inventorymovementlog`, `images`, `videos`, `services`, `subscriptions`, `review`, `banners`.

- [ ] **Step 1: Read the queries** the clients run on `notification` (app: every `queryNotificationRecord`; panel: `src/features/marketing/my-notifications-page.tsx:45`), `transactions` (`src/features/finance/data.ts:232`), `images` and `inventorymovementlog` (panel media and restock screens under a designer login), and set each collection's `listFilter` to the real filter. If a real client query cannot satisfy the spec's read rule, stop and record it under "Deviations" at the end of this plan before choosing: widen the rule to what the query can prove, never narrower than "signed in".
- [ ] **Step 2: Failing tests.** Rows in `expected.js` per spec 6.1. In `attacks.test.js`: `anon` and `cust1` reading `mail`, `delivery_login_creds`, `transactions` → refused; `designer1` reading `designer2`'s transaction → refused, own → allowed; `cust1` reading a notification addressed to `cust2` → refused; `anon` creating `mail` → refused; `cust1` updating or deleting `mail` → refused. In `panel-flows.test.js`: designer restock request and pickup (`inventorymovementlog` create and update with the fields `src/features/inventory` writes), designer media upload (`images`), notifications page (`notification` list by `to_userRef`, mark read), office send-notification (`notification` create), panel mail (`src/lib/mail.ts` shape, as each staff role).
- [ ] **Step 3: Run** — fail. **Step 4: Write the `match` blocks.** **Step 5: Run** — pass.
- [ ] **Step 6: Commit** `Rules A: partner logins, bank details, mail and notifications are private`.

### Task 4: Release A — catalogue, settings, counters, orders

**Files:** Modify `firebase/firestore.rules`, `expected.js`, `panel-flows.test.js`, `attacks.test.js`; create `app-flows.test.js`.

**Interfaces:**
- Produces: `app-flows.test.js` exports `runAppFlows(env)`, added to `run.js`. Each test's label starts with the app file and line it models, for example `checkout_widget.dart:3530 create order`.

Collections: `settings`, `id_map`, `category`, `tags`, `attributes`, `brands`, `coupon`, `user_membership_plans`, `user_vto_plans`, `theme`, `products`, `inventory`, `orders`, `return_requests`, `sales_history`, and `payment_response` (delete only).

- [ ] **Step 1: List every write and query the customer app makes** on these collections and on Task 2–3's collections, from `~/Desktop/Azyaa/Azyaa/lib` (search `.update(`, `.set(`, `.doc().set`, `Record.collection.doc`, `create*RecordData`, `FieldValue.`, and each `query*Record(`). Cover registration (email, Google, Apple, phone), profile, cart, wishlist, referral, order creation (`checkout_widget.dart:3530, 3859`, `checkout_payment_method_widget.dart:678`), the after-payment writes on each of the three provider paths (`payment_checker_widget.dart`), the free-order path (`free_payment_widget.dart`), the in-app-purchase path, coupon use, return request, OTP and order-summary mail, notification to the designer, `id_map` increments, and every pre-login read.
- [ ] **Step 2: Failing tests.** One `app-flows` test per item in Step 1, signed in as `cust1` unless the app does it signed out, using the real transforms (Review Focus 2). Pre-login reads the app needs (`settings`, `products`, `inventory`, `category`, `brands`, `tags`, `attributes`, plans, `theme`, `users`, `id_map`) are tested as `anon`. `expected.js` rows per spec 6.1. Order create: `customer_id` equal to own login id → allowed; someone else's or missing → refused. `panel-flows.test.js`: designer product save (`products`, `inventory`, `category`, `tags`, `id_map` through `src/lib/id-map.ts` `takeIds`), "line ready" (`src/features/orders/data.ts:211-221`), translation page as designer, role change from the Roles screen, settings save as each office role and as designer, coupon create as office. `attacks.test.js`: `anon` writes to each collection → refused; `cust1` creates a product, a coupon, a category, a settings record → refused; `cust1` deletes an order, a product, a stock record → refused; `admin1` deletes an order → refused, `super1` → allowed; `id_map` create and delete by anyone → refused.
- [ ] **Step 3: Run** — fail. **Step 4: Write the `match` blocks.** In Release A, "signed in (narrowed in B)" is exactly `signedIn()` for change. **Step 5: Run** — pass, and every `app-flows` test passes.
- [ ] **Step 6: Check nothing is left open.** Add to `attacks.test.js` a loop over every `match` block in the rules file asserting `anon` cannot create, update or delete in any collection except `payment_response` create and update.
- [ ] **Step 7: Commit** `Rules A: catalogue, settings, counters and orders need the right login`.

### Task 5: Release B — what a customer may change (branch `rules-lockdown-release-b`)

**Files:** Modify `firebase/firestore.rules`, `expected.js`, `app-flows.test.js`, `panel-flows.test.js`, `attacks.test.js`; update the field lists in the spec's section 6.1 if the code differs.

**Interfaces:**
- Consumes: everything from Tasks 2–4.

- [ ] **Step 1: Re-derive the allowed fields** for `orders`, `inventory`, `products`, `coupon`, `sales_history` from Task 4 Step 1's list, separately for UPayments, Tap, MyFatoorah, free order and in-app purchase. Note for each write whether it sends the whole nested map or a dotted path.
- [ ] **Step 2: Failing tests.** `attacks.test.js`, as `cust1`:
  - own order: change `total_price`, `order_items`, `customer_id` → refused; change each allowed field → allowed; someone else's order, any field → refused; an order with no `customer_id` → refused.
  - `inventory`: `stock` down → allowed; up → refused; `stock_reserved` up → allowed; down → refused; any other field → refused.
  - `products`: each allowed field → allowed; `product_info`, price fields, `status` → refused; whole `product_marketing` map replaced with only `promotion` or `product_sales_history` different → allowed; with any other inner field different → refused; same for `product_authorizer` and `creator_id_list` (Review Focus 1).
  - `coupon`: `coupon_used_user_list` → allowed; `coupon_limit` down → allowed; up → refused; discount fields → refused.
  - `sales_history`: `sale_history` append → allowed; any other field → refused.
  As `designer1`: `order_items` and `updated_at` on any order → allowed; `total_price` on someone else's order → refused; any field on own `inventory` (`designer_uid`) and own product (`product_authorizer.product_designer_id`) → allowed; on `designer2`'s → only the customer fields; product create as own → allowed; as `designer2` → refused; and every customer right on their own order (designers shop too). Office: any field → allowed.
- [ ] **Step 3: Run** — fail; all Task 4 `app-flows` and `panel-flows` tests still pass on the Release A rules.
- [ ] **Step 4: Write the narrowed change rules.** For a nested map, compare with `request.resource.data.<map>.diff(resource.data.<map>).affectedKeys().hasOnly([...])`, guarding a missing map with `.get('<map>', {})`.
- [ ] **Step 5: Run** — pass, with every `app-flows` and `panel-flows` test still passing unchanged. A failing flow test means the rule is wrong, not the test.
- [ ] **Step 6: Commit** `Rules B: customers change only the fields the app writes`.

### Task 6: Owner's steps for the search copy

**Files:** Create `docs/search-copy-steps.md`.

- [ ] **Step 1: Check the current Algolia dashboard wording** in Algolia's own documentation (API keys: restricting rights and indices; index setting "unretrievable attributes"; deleting an index) and the Firebase console wording for uninstalling an extension.
- [ ] **Step 2: Write the steps** in plain language for spec 6.4's three parts: what to click, what to expect, how to tell it worked (the count-only check the builder runs afterwards), and how to undo each part. Name the key by where it lives (`lib/backend/algolia/algolia_manager.dart`), never by value. State the order: check which key the add-ons use, then step 1, then step 2, then step 3 only if the old Flutter admin is retired.
- [ ] **Step 3: Commit** `Docs: owner's steps for closing the search copy`.

### Task 7: Review and pull requests

- [ ] **Step 1: Whole-branch review** by a fresh reviewer for each branch, given the spec, this plan and the diff, asked specifically: which real client write would these rules refuse, and which outsider write would they still allow beyond what the spec accepts.
- [ ] **Step 2: Fix what the review finds; rerun all tests.**
- [ ] **Step 3: Download the live ruleset and confirm it still equals `main`'s file** (scratch script using firebase-tools' `lib/gcp/rules`); keep the copy as the rollback file.
- [ ] **Step 4: Open two pull requests** on `vizsoft-global/Azyaa-Admin`: `rules-lockdown-stage-1` → `main` (back office, Release A), and `rules-lockdown-release-b` → `rules-lockdown-stage-1` (Release B). Each body lists what changes for whom, the owner's check from spec section 8, and the rollback command.
- [ ] **Step 5: Stop and ask the owner** before any release.

## Deviations

(Recorded during the build: any place the code forced a rule different from the spec's tables.)

- **In-app purchase while signed out.** The app's in-app purchase handler (`default_cart_button_widget.dart:904`) has no login check and would then create an order with an empty `customer_id`. Release A refuses that (an order must carry the buyer's own login id). In-app purchase is switched off on live (`settings_inapp_purchase_status` false, no in-app order among 240), so nothing changes today. Signed in, the path is tested and works.
- **Two more order fields (Release B).** The MyFatoorah path also writes `ready_shipping_request_status` and `custom_shipping_request_status` on the customer's own order (`checkout_payment_method_widget.dart:748`). They are added to the allowed list.
- **`users` create** is own-record-only for everyone, including office, exactly as the spec says: the panel never creates a record for someone else.
- **`transactions` read** for a non-office account needs the `designer` role as well as being named in `user_ref`.
- **A designer cannot approve their own product (Release B).** The spec gave a designer "any field" on their own product. The rules add one limit: a designer may leave `status` unchanged or set it to `request` or `archived`, and a new product must start as `request`. The panel never sends anything else under a designer login; approval is a super-admin action.
- **A designer creates stock records and products only in their own name (Release B).**
