# Wire product stock in the Azyaa app

Plan for the customer / product app. Admin reservation is already live on Firebase project `azyaa-0uiv4k`. Store Valley v1 has **no reserve API**. `stored_quantity` and `available` are the same warehouse number until admin ships (`POST /orders`). Oversell is prevented in Azyaa, not in Store Valley.

Applies only to **ready-made warehouse** lines:

- `product_main_type == "ready"`
- `product_stock_info.is_preferred_vendor == true`

Custom / designer pickup stock is unchanged.

---

## 1. Numbers to show and sell against

| Label | Source | Meaning |
|---|---|---|
| Warehouse stored | `store_valley_inventory.stored_quantity` | Physical units in `WH-KWT-MAIN` |
| Reserved | `inventory.stock_reserved` | Paid orders not shipped yet |
| Unavailable | `inventory.stock_unavailable` | Enquiry / QC hold |
| **Available for order** | `inventory.available_for_order` | Sellable now |

Formula (also computed live in admin):

```
available_for_order = max(0, stored_quantity - stock_reserved - stock_unavailable)
```

**Do not sell against** `inventory.stock`, `product.product_quantity`, or Store Valley `available`. Those do not hold unshipped orders.

---

## 2. Firestore

### `inventory/{autoId}`

| Field | Use in app |
|---|---|
| `product_id` | Join to product / cache |
| `inventory_id` | `INV…` from cart `product_stock_info.inventory_id` |
| `stock_reserved` | Display reserved |
| `stock_unavailable` | Display holds |
| `available_for_order` | PDP, PLP, cart, checkout gate |
| `stock` / `stock_on_hand` | Azyaa ledger only — not sellable |

Lookup: `inventory_ref` or `inventory_id` on the cart line, else `where product_id ==`.

### `store_valley_inventory/{productId}_WH-KWT-MAIN`

Mirror of Store Valley. Admin “Warehouse stored”. Not the sellable number.

### `orders/{orderId}`

| Field | Values |
|---|---|
| `payment_status` | Reserve when this becomes `CAPTURED` |
| `inventory_reservation_status` | `none` / `reserved` / `released_shipped` / `released_cancelled` / `stock_failed` |
| `inventory_reservation_lines` | Per `product_id`: `{ qty, status }` |

Cart shape the Cloud Function reads:

```
order_items.cart_items[]
  product_id
  quantity
  product_main_type
  product_stock_info.is_preferred_vendor
  product_stock_info.inventory_id
  product_stock_info.inventory_ref
```

---

## 3. Cloud Functions (already deployed)

| Name | When |
|---|---|
| `reserveWarehouseStockOnOrder` | Trigger: `orders` write, `payment_status` → `CAPTURED`. Also releases if payment leaves `CAPTURED` while still `reserved`. After a successful reserve, enqueues a warehouse Store Valley delivery job. |
| `onStoreValleyDeliveryJobWrite` | Trigger: `store_valley_delivery_jobs` queued. POST `/orders` (warehouse RM) or POST `/pickup-requests` (custom Ready to Pickup). |
| `enqueueStoreValleyDeliveriesOnOrder` | Trigger: `orders` write. Enqueues custom pickup when an item becomes `Ready to Pickup` (and payment is already CAPTURED). |
| `sweepStoreValleyDeliveryJobs` | Every 5 minutes. Retries queued / stuck / failed jobs (max 3 attempts). |
| `retryStoreValleyDelivery` | Callable. `{ job_id }` or `{ order_id }` to re-queue failed jobs. |
| `backfillStoreValleyDeliveries` | Callable. Enqueue missing jobs for CAPTURED orders. |
| `reserveWarehouseStock` | Callable. Pass `{ order_id }`. Optional `{ retry: true }` after `stock_failed`. Prefer this **before** payment capture. |
| `releaseWarehouseStock` | Callable. `{ order_id, reason: "shipped" \| "cancelled", product_ids?: [] }`. Admin shipping label already calls `shipped`. |
| `backfillWarehouseReservations` | Admin Inventory → Sync reserved orders. |

Idempotent via `inventory_reservation_status`. Last unit: first reserve wins; second gets `stock_failed` / `failed-precondition`.

---

## 4. App wiring (this is the work)

### Product list / PDP

1. Load `inventory` for the product (same `inventory_ref` / `inventory_id` as catalog).
2. Show **in stock** only if `available_for_order > 0`.
3. Max qty stepper = `available_for_order`.
4. Optional: show “X available” from that field. Do not show Store Valley `available`.
5. If Algolia indexes `inventory`, add/reindex `available_for_order` so search filters stay correct.

### Cart

1. Re-read `available_for_order` when the cart opens and before checkout.
2. Clamp line qty if sellable dropped (another customer reserved).
3. Block checkout if any warehouse line has `qty > available_for_order`.

### Checkout (required to stop oversell)

Two customers can both pay the last unit if you only write `orders` with `CAPTURED` and wait for the trigger. The second order is marked `stock_failed` after money is taken.

**Preferred**

1. Create the `orders` doc (`payment_status` still `Initialization` or equivalent).
2. Call `reserveWarehouseStock({ order_id })`.
3. On success, capture payment and set `payment_status: "CAPTURED"` (trigger no-ops; already reserved).
4. On `failed-precondition`, do not capture. Show out of stock. Leave order unpaid / failed.

**Fallback if payment already captured**

Trigger reserves. If it fails, `inventory_reservation_status == "stock_failed"` → refund in admin. Surface that status in the customer order screen.

### Payment fail / user cancel before ship

Set `payment_status` away from `CAPTURED` (e.g. `FAILED`). The trigger releases reserved qty. Do not call Store Valley.

### After ship

Automatic: after warehouse reservation succeeds, Cloud Functions POST Store Valley `/orders` and then `releaseWarehouseStock` with `reason: "shipped"`. Custom / designer pickup POSTs `/pickup-requests` when the designer sets cart-item `product_pickup_info.status` to `Ready to Pickup` (payment must already be `CAPTURED`). Admin Create shipping label is retry only if that automatic request failed.

Warehouse stored drops via Store Valley webhook.

---

## 5. Display map

| Screen | Warehouse product | Custom / designer |
|---|---|---|
| PLP / PDP | `available_for_order` | Existing designer stock rules |
| Cart | Same + clamp qty | Unchanged |
| Checkout | Reserve callable then pay | Unchanged |
| Order confirmation | If `stock_failed`, “out of stock — refund” | Unchanged |

Do not mix `stock_on_hand` into the warehouse sellable number.

---

## 6. Implementation checklist (product app)

1. Replace in-stock checks for preferred-vendor ready products with `inventory.available_for_order`.
2. Cap add-to-cart and cart qty on that field.
3. Index `available_for_order` in Algolia / search if PLP is search-driven.
4. Checkout: `reserveWarehouseStock` before capture; handle `failed-precondition`.
5. Listen to `inventory_reservation_status` on the order (`reserved` vs `stock_failed`).
6. On payment fail, set `payment_status` off `CAPTURED` so reserved qty returns.
7. QA: last unit, two checkouts; cancel unpaid; ship in admin then confirm sellable does not jump until warehouse stored drops.

---

## 7. What not to do

- Do not call Store Valley `POST /orders` at unpaid checkout (wait until CAPTURED + reserved; the job worker does it).
- Do not call `POST /pickup-requests` before the designer marks `Ready to Pickup`.
- Do not decrement `store_valley_inventory` from the app.
- Do not recompute reserved by querying open orders; use `stock_reserved`.
- Do not treat Store Valley `available` as sellable.

---

## 8. Admin already done (this repo)

- Reserve on `CAPTURED`, auto warehouse `POST /orders` after reserved, auto `POST /pickup-requests` after Ready to Pickup, release on ship, release on cancel-before-ship.
- Inventory: Warehouse stored, Reserved, Available for order.
- Order details: reserved / stock-failed / delivery queued-requested-failed badges.
- Sync reserved orders backfill; `backfillStoreValleyDeliveries` for missed logistics jobs.

Related code: `firebase/custom_cloud_functions/warehouse_stock_reservation*.js`, `firebase/custom_cloud_functions/store_valley_delivery_jobs*.js`, `lib/backend/store_valley/warehouse_stock.dart`.
