# Closing the open search copy at Algolia

For: whoever holds the Algolia login and the Firebase console login for project `azyaa-0uiv4k`.
Time: about 40 minutes, most of it waiting for Firebase to save.
Why: see section 6.4 of `docs/superpowers/specs/2026-11-28-rules-lockdown-stage-1-design.md`.

## What is wrong today

Six Firebase add-ons ("Search Firestore with Algolia") copy these collections to Algolia: products, category, brands, users, orders, inventory.

One Algolia key does everything. The add-ons use it to write the copies, and the same key is built into the customer app and the old Flutter admin so they can search. (Checked on 28 Nov 2026: all six add-ons hold the same key as the app.) Anyone who takes that key out of the app can:

- read all customers (email, name, date of birth) and all orders (items, totals, shipping address), with no login;
- add, change or delete those copies.

The fix is to give the add-ons their own private key, and then cut the built-in key down to "search only".

Nothing here changes the database itself. The copies at Algolia are copies; the originals stay in Firebase.

## Before you start

- Do the parts in order. Part 2 must be finished and tested before part 3, or the copies stop updating.
- Never paste a key into chat, email or a document. Copy it straight from Algolia into Firebase.
- How to recognise the built-in key in Algolia: under **API Keys → All API Keys** it is the key that is limited to exactly these six indices: `products`, `orders`, `brands`, `category`, `inventory`, `users`, with the rights Search, Add records, Delete records, Delete index, List indices, Get index settings, Set index settings. A developer can confirm by comparing it with the value in the app's file `lib/backend/algolia/algolia_manager.dart`.

## Part 1 — Make a new key for the add-ons (Algolia, 3 minutes)

1. Sign in to the Algolia dashboard and pick the Azyaa application.
2. Open **API Keys**, then **All API Keys**, then **New API Key**.
3. Description: `Firebase sync - do not put in any app`.
4. Indices: `products`, `category`, `brands`, `users`. Add `orders` and `inventory` too only if you are **not** doing part 5.
5. Rights (ACL): Add records, Delete records, List indices, Delete index, Get index settings, Set index settings. Do **not** tick Search.
6. Create it and keep the page open so you can copy the key.

## Part 2 — Give the new key to the add-ons (Firebase, about 25 minutes)

1. Open the Firebase console, project `azyaa-0uiv4k`, **Extensions**.
2. For each "Search Firestore with Algolia" add-on that you are keeping (the ones for products, category, brands, users):
   1. **Manage**, then **Extension configuration**, then **Reconfigure extension**.
   2. Replace only **Algolia API Key** with the new key. Leave everything else as it is.
   3. Save. Firebase takes 3 to 5 minutes per add-on. Wait for "Installed" before the next one.
3. Test before going on: in the admin panel, change a product's name slightly and save. In Algolia, open the `products` index and search for the product. The new name should be there within a minute. Change the name back.

If the name does not arrive: open the add-on in Firebase, look at **Logs** for an error, and do not start part 3 until this works. To undo, reconfigure the add-on with the old key again.

## Part 3 — Cut the built-in key down to search only (Algolia, 3 minutes)

1. **API Keys → All API Keys**, open the built-in key (see "Before you start").
2. Rights (ACL): leave only **Search** ticked. Untick everything else.
3. Indices: leave only `products`, `category`, `brands`, `users`. Remove `orders` and `inventory`.
4. Max API calls/IP/hour: `1000`. (Stops someone hammering the key.)
5. Save.

What this changes for people:

- Customer app, any version: nothing. It only ever searched those four.
- Old Flutter admin: order search and stock search stop working. Product and customer search keep working.
- React admin panel: nothing. It does not use Algolia.

To undo: edit the key again and put the rights and indices back.

## Part 4 — Stop the customers copy handing back private details (Algolia, 3 minutes)

1. **Search → Index**, pick the `users` index, open **Configuration**.
2. Find **Unretrievable attributes** (use the search box in the settings list).
3. Add: `email`, `user_info.date_of_birth`, `user_info.age`. Names are case-sensitive.
4. Review and save.

Searching by email still works in the old admin; the search results simply no longer carry the email or date of birth. To undo, remove the three names.

## Part 5 — Remove the orders and stock copies (only if the old Flutter admin is retired)

Do this only once nobody uses the old Flutter admin's order search or stock search. Part 3 already hides these two copies from the built-in key, so this part is tidying up, not urgent.

1. Firebase console, **Extensions**: for the add-on whose collection is `orders` and the one whose collection is `inventory`: **Manage**, then **Uninstall extension**.
2. Algolia: open the `orders` index, **Manage index**, **Delete**. Same for `inventory`.

This cannot be undone with one click: to bring a copy back, install the add-on again and run its full re-index.

## How to tell it worked

Tell the builder when parts 3 and 4 are done. The builder runs a count-only check with the built-in key and expects:

- `orders` and `inventory`: refused.
- `users`: readable, but no `email`, date of birth or age in the results.
- Trying to add or delete a record: refused.

## Later

Under the "Firebase and Cloudflare for most things" rule, Algolia is removed completely in stage 2, once no app version in use searches through it. The current app code already searches without it.
