# Store Valley — Websitek API Integration Guide

Document version: 1.3
SDK version: 1.1.0-rc.5
Contract authority: Exhibit A and the confirmed Websitek Logistics Integration Requirements & Acceptance Criteria BRD

## 1. Base URL and environment

The isolated staging API base URL is:

```text
https://us-central1-store-valley-websitek-staging.cloudfunctions.net/api/v1
```

Release candidate `1.1.0-rc.5` is prepared for this dedicated Firebase project.
Firestore, Storage, the required backend services, the API function, and its
task queue are active. The project also has dedicated Android/iOS apps and
flavor-specific client configuration. Do not use the production project for
staging operations.

Every curl block below uses the real staging base URL but keeps the API key,
OTP, customer, and address data redacted. Store Valley supplies the single
environment-specific Azya staging key through the agreed secure channel.

API isolation tests may use a test key and `_test` collections. The five
end-to-end acceptance flows require the dedicated staging project because the
worker and driver apps operate on normal collections.

The staging runtime accepts only staging (and local test) credentials; the
production runtime rejects a staging key. Production and staging use the same
operational collection names but reside in separate Firebase projects.

An unrecognised or missing key environment is rejected. Store Valley supplies
the Websitek-specific staging key through a secure credential channel.

## 2. Authentication

Every request requires:

```text
x-api-key: <environment-specific key>
Content-Type: application/json
```

Azya receives one key for staging and one key for production. Each key is bound
to one organization, the Azya integration client, and one environment. A
Websitek/Azya key cannot list, retrieve, cancel, or receive webhooks for another
integration client. The shared key does not identify the designer inventory
owner; every applicable request must provide a provisioned `designer_id`.

## 3. Configured warehouses

The provisioned Azya staging warehouse is:

| `warehouse_id` | Name |
|---|---|
| `WH-KWT-MAIN` | Azya staging main warehouse |

The staging foundation also contains delivery location `WH-KWT-MAIN`, designer
`DSN-KWT-0001`, product `PRD-RM-1001`, and globally unique SKU
`AZY-DSN0001-DRESS-RED-M`. A scoped live inventory read returned HTTP 200 with
quantity zero on 2026-08-15. These are Store Valley dress-rehearsal fixtures;
Azya may provide final acceptance data in the same agreed format before the
five operational flows are executed.

## 4. Shared schemas

### Address

Required:

- `street`
- `city`
- `contact_name`
- `contact_phone`

Optional:

- `location_id`
- `name`
- `governorate`
- `district`
- `block`
- `building`
- `postal_code`
- `country`
- `latitude`
- `longitude`

### Item

Required:

- `quantity`: positive integer
- at least one of `product_id` or `sku`

Optional:

- `product_name`
- `condition_notes`
- `packaging_notes`

### Designer ownership

`designer_id` is required on Delivery and Return requests and inside the
`designer` object for Intake and Pickup requests. Store Valley provisions each
identifier against an existing Store Valley client and active warehouse
contract. An unknown, inactive, or wrong-environment designer is rejected. The
Azya API key authenticates the platform and never substitutes for the designer
inventory owner.

## 5. Delivery endpoints

### 5.1 Warehouse Delivery

`POST /orders`

Use this endpoint when Store Valley holds the stock and must deliver it to the
customer. `pickup_location_id` is the Store Valley warehouse delivery-location
identifier supplied during staging configuration.

Store Valley resolves each `product_id` and globally unique `sku` to the same
existing catalog record owned by the supplied designer. A mismatch is rejected
with HTTP 400. If the existing Store Valley warehouse stock projection is lower
than the requested quantity, the request is rejected with HTTP 409. Accepted
requests create the linked Store Valley fulfillment order and enter the normal
warehouse checkout/retrieval chain.

Single-customer example:

```bash
curl --request POST \
  'https://us-central1-store-valley-websitek-staging.cloudfunctions.net/api/v1/orders' \
  --header 'x-api-key: <WEBSITEK_STAGING_KEY>' \
  --header 'Content-Type: application/json' \
  --data '{
    "client_order_id": "WS-WH-DELIVERY-001",
    "designer_id": "DSN-KWT-0001",
    "pickup_location_id": "WH-KWT-MAIN",
    "inventory_source": "warehouse",
    "order_kind": "ready_made",
    "packaging_profile": "AZY-PKG-STD-01",
    "requires_otp_proof": true,
    "delivery_otp": "<CUSTOMER_OTP>",
    "requires_photo_proof": true,
    "delivery_address": {
      "street": "Gulf Road",
      "city": "Salmiya",
      "contact_name": "Websitek Customer",
      "contact_phone": "+96550000000",
      "latitude": 29.3375,
      "longitude": 48.0758
    },
    "items": [
      { "product_id": "PRD-RM-1001", "sku": "AZY-DSN0001-DRESS-RED-M", "quantity": 1 }
    ]
  }'
```

Success response:

```json
{
  "message": "Order created successfully",
  "order_id": "<store-valley-order-id>",
  "client_order_id": "WS-WH-DELIVERY-001",
  "status": "pending",
  "original_source_location_id": "WH-KWT-MAIN",
  "is_test": false
}
```

For multiple destinations, send `stops` instead of `delivery_address`. Each
stop may contain its own `products` list.

When `requires_otp_proof` is true, `delivery_otp` is required. Azya generates
and sends the value to the customer. Store Valley stores only an order-scoped
HMAC, collects the value entered by the assigned driver, and blocks delivery
completion if it does not match. The plaintext value is not returned, logged,
stored in the delivery document, or included in webhooks.

### 5.2 Get Delivery

`GET /orders/{order_id_or_client_order_id}`

Returns the current delivery status, driver/timing data, proof URLs when
available, and `original_source_location_id`.

### 5.3 List Deliveries

`GET /orders?limit=50&status=delivered&starting_after=<order_id>`

The list is restricted to the authenticated Websitek client and environment.
The `limit` is clamped to `1..100`. Use `next_cursor` while `has_more` is
`true`.

### 5.4 Cancel Delivery

`DELETE /orders/{order_id_or_client_order_id}`

Cancellation is allowed only while the order status is `pending`, `confirmed`,
`ready`, or `assigned`.

This is the only public v1 cancellation endpoint. Warehouse Intake, Pickup,
and Return requests have no v1 cancellation route; any operational exception
for those resources must be coordinated through Store Valley rather than
calling an undocumented endpoint.

## 6. Warehouse Intake

`POST /warehouse-intake-requests`

```bash
curl --request POST \
  'https://us-central1-store-valley-websitek-staging.cloudfunctions.net/api/v1/warehouse-intake-requests' \
  --header 'x-api-key: <WEBSITEK_STAGING_KEY>' \
  --header 'Content-Type: application/json' \
  --data '{
    "external_request_id": "WS-INTAKE-001",
    "warehouse_id": "WH-KWT-MAIN",
    "designer": {
      "designer_id": "DSN-KWT-0001",
      "name": "Designer One",
      "pickup_address": {
        "street": "Street 10",
        "city": "Kuwait City",
        "contact_name": "Designer One",
        "contact_phone": "+96550000001",
        "latitude": 29.3759,
        "longitude": 47.9774
      }
    },
    "items": [
      { "product_id": "PRD-RM-1001", "sku": "AZY-DSN0001-DRESS-RED-M", "quantity": 5 }
    ]
  }'
```

Initial external status: `intake_created`.

Get request:

`GET /warehouse-intake-requests/{request_id_or_external_request_id}`

## 7. Designer and Custom Delivery

`POST /pickup-requests`

Use `pickup_purpose`:

- `designer_order_fulfillment` for Designer Delivery;
- `custom_made_fulfillment` for Custom Delivery.

```bash
curl --request POST \
  'https://us-central1-store-valley-websitek-staging.cloudfunctions.net/api/v1/pickup-requests' \
  --header 'x-api-key: <WEBSITEK_STAGING_KEY>' \
  --header 'Content-Type: application/json' \
  --data '{
    "external_request_id": "WS-DESIGNER-DELIVERY-001",
    "source_order_id": "WEBSITEK-ORDER-001",
    "pickup_purpose": "designer_order_fulfillment",
    "order_kind": "ready_made",
    "packaging_profile": "AZY-PKG-STD-01",
    "requires_otp_proof": true,
    "delivery_otp": "<CUSTOMER_OTP>",
    "requires_photo_proof": true,
    "designer": {
      "designer_id": "DSN-KWT-0001",
      "name": "Designer One",
      "pickup_address": {
        "street": "Street 10",
        "city": "Kuwait City",
        "contact_name": "Designer One",
        "contact_phone": "+96550000001",
        "latitude": 29.3759,
        "longitude": 47.9774
      }
    },
    "delivery_address": {
      "street": "Gulf Road",
      "city": "Salmiya",
      "contact_name": "Websitek Customer",
      "contact_phone": "+96550000000",
      "latitude": 29.3375,
      "longitude": 48.0758
    },
    "items": [
      { "product_id": "PRD-RM-1001", "sku": "AZY-DSN0001-DRESS-RED-M", "quantity": 1 }
    ]
  }'
```

For a later Designer-source or Custom-source Return, Websitek must retain two
values from this response:

- use `delivery_order_id` as the Return request's `source_order_id`;
- resend `original_source_location_id` unchanged.

The pickup request's `request_id`, `external_request_id`, and optional business
`source_order_id` are not substitutes for the returned `delivery_order_id`.

Get request:

`GET /pickup-requests/{request_id_or_external_request_id}`

## 8. Returns

`POST /return-requests`

Websitek must provide the `original_source_location_id` returned for the
original delivery. Store Valley verifies that it matches the original order's
pickup location and uses that exact location as the return destination.

Use Store Valley's returned delivery identifier as `source_order_id`:

- Warehouse Delivery: the `order_id` returned by `POST /orders`;
- Designer or Custom Delivery: the `delivery_order_id` returned by
  `POST /pickup-requests`.

The legacy `original_inventory_source`, `warehouse_id`, and
`designer_return_address` fields are not authoritative. If
`original_inventory_source` is supplied, it must agree with the resolved source
location.

```bash
curl --request POST \
  'https://us-central1-store-valley-websitek-staging.cloudfunctions.net/api/v1/return-requests' \
  --header 'x-api-key: <WEBSITEK_STAGING_KEY>' \
  --header 'Content-Type: application/json' \
  --data '{
    "external_request_id": "WS-RETURN-001",
    "source_order_id": "<STORE_VALLEY_ORDER_OR_DELIVERY_ORDER_ID>",
    "designer_id": "DSN-KWT-0001",
    "original_source_location_id": "<VALUE_FROM_ORIGINAL_DELIVERY>",
    "return_type": "return",
    "customer_pickup_address": {
      "street": "Gulf Road",
      "city": "Salmiya",
      "contact_name": "Websitek Customer",
      "contact_phone": "+96550000000",
      "latitude": 29.3375,
      "longitude": 48.0758
    },
    "items": [
      { "product_id": "PRD-RM-1001", "sku": "AZY-DSN0001-DRESS-RED-M", "quantity": 1 }
    ],
    "reason": "Customer return"
  }'
```

Initial external status: `return_initiated`.

For every Return, the customer pickup uses the existing Store Valley driver
proof flow. A Websitek/Azya Return requires both a pickup signature and a
condition/packaging photo. Successful pickup proof produces
`pickup_completed` followed by `verification_passed`. A reported damaged,
missing, or wrong item produces `verification_failed` with the recorded
reason.

For a Designer-source Return, `return_completed` is produced when delivery to
the verified designer source succeeds. For a Warehouse-source Return, arrival
at the warehouse does not complete the Return. The order enters Store Valley's
existing warehouse QC and placement flow; `verification_passed` or
`verification_failed` comes from QC, and `return_completed` is produced only
after the check-in becomes `fully_placed` and warehouse inventory is updated.

Get request:

`GET /return-requests/{request_id_or_external_request_id}`

### 8.1 Intake, Pickup, and Return response shape

The POST and individual GET routes use the same resource fields. POST responses
also include a human-readable `message`:

```json
{
  "request_id": "<store-valley-request-id>",
  "external_request_id": "<websitek-request-id>",
  "source_order_id": "<websitek-order-id-or-null>",
  "status": "<current-logistics-status>",
  "delivery_order_id": "<store-valley-delivery-id-or-null>",
  "original_source_location_id": "<source-location-id-or-null>",
  "warehouse_id": "<warehouse-id-or-null>",
  "inventory_source": "<warehouse-designer-or-null>",
  "return_destination_type": "<warehouse-designer-or-null>",
  "created_at": "<ISO-8601-or-null>",
  "updated_at": "<ISO-8601-or-null>",
  "is_test": false
}
```

`LogisticsRequestResponse` in SDK `1.1.0-rc.5` exposes every field above.
Fields that do not apply to a particular request type are `null`.

## 9. Inventory synchronization

`GET /inventory?designer_id=<id>&warehouse_id=<id>&limit=50&starting_after=<cursor>`

This endpoint is a scoped read view over Store Valley's existing product
warehouse-stock projection. It does not create a second Azya balance or ledger.
The designer must be provisioned to the authenticated Azya integration and the
requested warehouse.

Example response:

```json
{
  "inventory": [
    {
      "designer_id": "DSN-KWT-0001",
      "product_id": "PRD-RM-1001",
      "store_valley_product_id": "PRD-RM-1001",
      "sku": "AZY-DSN0001-DRESS-RED-M",
      "warehouse_id": "WH-KWT-MAIN",
      "stored_quantity": 0,
      "available": 0,
      "updated_at": "<ISO-8601-or-null>"
    }
  ],
  "count": 1,
  "next_cursor": null,
  "has_more": false,
  "as_of": "<ISO-8601>",
  "is_test": false
}
```

The current Store Valley projection has one warehouse quantity rather than
separate reservation buckets, so `stored_quantity` and `available` report that
same existing quantity. Reserved, dispatched, returned, and damaged bucket
APIs are not part of the confirmed v1 scope.

When the existing `products.stock_by_warehouse` value changes, Store Valley
emits `storevalley.inventory.updated` with a deterministic `event_id`,
`designer_id`, product identifiers, `warehouse_id`, `stored_quantity`,
`available`, `available_delta`, and `reason_code`.

## 10. Status contract

Intake, Pickup, and Return resource statuses and webhook status values use
`snake_case`:

| Logistics/webhook status | Source transition |
|---|---|
| `intake_created` | Warehouse Intake request accepted |
| `request_created` | Designer or Custom Pickup request accepted |
| `pickup_scheduled` | Linked delivery becomes `assigned` |
| `pickup_completed` | Linked delivery becomes `outForDelivery` after pickup proof |
| `verification_passed` | Intake/warehouse Return passes QC, or a designer Return pickup completes with required proof |
| `verification_failed` | Intake/warehouse Return fails QC, or a Return pickup reports a damaged, missing, or wrong item |
| `stored` | Intake check-in becomes `fully_placed` |
| `order_assigned` | Delivery becomes `assigned` |
| `out_for_delivery` | Delivery becomes `outForDelivery` |
| `delivered` | Delivery becomes `delivered` |
| `return_initiated` | Return request accepted |
| `return_completed` | Designer Return reaches the verified designer, or warehouse Return placement becomes `fully_placed` |

The existing `GET /orders`, list, and cancellation routes expose Store
Valley's operational Delivery status string: `pending`, `confirmed`, `ready`,
`assigned`, `outForDelivery`, `delivered`, `failed`, `returned`, or
`cancelled`. Delivery webhooks map `assigned` to `order_assigned` and
`outForDelivery` to `out_for_delivery`; the other values pass through.
Receiving `failed` or `returned` reports the operational result only. It does
not add the separate returned-to-sender orchestration listed as outside v1.

## 11. Webhooks

Websitek supplies one staging webhook URL and one production webhook URL. Store
Valley registers each URL against the matching client and environment
configuration.

A webhook destination is active only when both a valid HTTP(S) URL and a
non-empty signing secret are configured for the same organization, integration
client, and environment. An unsigned destination fails closed and receives no
events.

Status webhooks are signed with:

```text
X-StoreValley-Signature
X-StoreValley-Signature-Timestamp
```

Signature input:

```text
HMAC-SHA256(webhook_secret, "<timestamp>.<raw_json_body>")
```

Webhook delivery is attempted at most five times, with exponential backoff from
60 seconds up to 3,600 seconds. Websitek should process `event_id`
idempotently. Each queued attempt records the scoped client/environment,
`event_id`, target hostname, attempt number, outcome, HTTP status when
available, and timestamp. Raw secrets are not written to the attempt record.

Delivery event:

```json
{
  "event_id": "delivery_order_<cloud-event-id>",
  "event_type": "storevalley.delivery_order.<status>",
  "resource_type": "delivery_order",
  "resource_id": "<delivery-order-id>",
  "client_order_id": "<websitek-order-id>",
  "original_source_location_id": "<source-location-id>",
  "new_status": "out_for_delivery",
  "previous_status": "order_assigned",
  "timestamp": "<ISO-8601>",
  "data": {
    "proof": {
      "photo_url": "<proof-url>",
      "signature_url": "<signature-url-or-null>",
      "proof_id": "<proof-id>"
    },
    "otp_verification": {
      "required": true,
      "status": "verified",
      "failed_attempts": 0,
      "verified_at": "<ISO-8601>"
    }
  }
}
```

Logistics event:

```json
{
  "event_id": "<resource-type>_<cloud-event-id>",
  "event_type": "storevalley.<resource-type>.<status>",
  "resource_type": "warehouse_intake_request",
  "resource_id": "<request-id>",
  "external_request_id": "<websitek-request-id>",
  "delivery_order_id": "<delivery-order-id>",
  "original_source_location_id": "<source-location-id>",
  "status": "verification_passed",
  "previous_status": "pickup_completed",
  "timestamp": "<ISO-8601>"
}
```

Inventory event:

```json
{
  "event_id": "inventory_<cloud-event-id>_<product-id>_<warehouse-id>",
  "event_type": "storevalley.inventory.updated",
  "resource_type": "inventory",
  "designer_id": "DSN-KWT-0001",
  "product_id": "PRD-RM-1001",
  "sku": "AZY-DSN0001-DRESS-RED-M",
  "warehouse_id": "WH-KWT-MAIN",
  "stored_quantity": 11,
  "available": 11,
  "available_delta": -1,
  "reason_code": "outbound",
  "timestamp": "<ISO-8601>"
}
```

## 12. Reconciliation and missed events

- Delivery orders can be reconciled using `GET /orders` and `GET /orders/{id}`.
- Intake, Pickup, and Return requests can be reconciled individually using
  their GET endpoints.
- Inventory can be reconciled from `GET /inventory` using cursor pagination.
- Webhook replay, `updated_since`, and list endpoints for logistics requests are
  not part of v1.
- Websitek should retain the Store Valley resource IDs returned by every POST.
- After a webhook is missed or exhausts retries, Websitek recovers current
  state by polling these snapshot/GET routes and comparing the returned status
  or quantity with its local record. This reconstructs current state; it does
  not reconstruct every intermediate webhook event.

## 13. Idempotency

- Delivery uses `client_order_id`.
- Intake, Pickup, and Return use `external_request_id`.
- Idempotency is isolated by organization, client, environment, and resource.
- Repeating the same validated payload returns HTTP 200 and the existing
  Store Valley resource ID without creating another resource.
- Reusing the same ID with a different validated payload returns HTTP 409 and
  does not mutate the original resource.

## 14. Items not established by the confirmed v1 scope

The confirmed BRD requires stored quantity, available stock, intake
confirmations, inventory updates, OTP confirmation, delivery photos, and Azya
packaging codes. The following additional capabilities require a separate
written agreement before they become part of the v1 commitment:

- a public multi-bucket inventory movement ledger or replay API;
- reserve/release inventory commands;
- detailed available/reserved/dispatched/returned/damaged stock buckets;
- shipping-label generation;
- public tracking URLs;
- returned-to-sender orchestration beyond reporting the existing Delivery
  `failed` or `returned` status and the agreed Return statuses.
