# Websitek v1 Staging Acceptance Matrix

Release: 1.1.0-rc.5
Status: staging foundation and API preflight passed; contractual flows 0/5
Release archive: `store_valley_websitek_integration_v1.1.0-rc.5.zip`
Checksum authority: adjacent `store_valley_websitek_integration_v1.1.0-rc.5.zip.sha256` sidecar

Acceptance is complete only when every row has a staging API request, response,
final Store Valley status, and webhook delivery or valid failed-attempt log.
Execution procedure and evidence fields are defined in
`websitek_staging_acceptance_runbook.md`.

## Emulator prerequisite

The demo-only Firebase emulator gate passed 17 of 17 scenarios on 2026-08-13.
The verified scenarios were:

1. Cross-client get, list, and cancellation isolation.
2. Per-client idempotency for a reused external ID, including non-mutating
   exact retries and HTTP 409 for a conflicting payload.
3. Test-key writes limited to test order, request, and idempotency collections.
4. Intake and warehouse Return QC synchronization limited to the selected
   environment, with warehouse Return completion deferred until placement.
5. Webhook selection limited to the matching client and environment.
6. No Websitek webhook for a non-external delivery.
7. Rejection of a mismatched Return source location.
8. Exact Warehouse and Designer Return routing.
9. Scoped, secret-free webhook attempt records.
10. Rejection of unknown and cross-integration designer ownership bindings.
11. Rejection of product/SKU mismatch and insufficient warehouse stock.
12. Creation of the existing Store Valley client-order and checkout/retrieval
    records for Warehouse Delivery.
13. A designer/warehouse-scoped inventory snapshot over the existing product
    stock projection.
14. A deterministic, designer/warehouse-scoped inventory update event.
15. Server-enforced canonical pickup ID/location, assignment, durable HTTPS
    photo/signature evidence, Return condition photo, OTP verification, and
    plaintext-free persistence/webhook output.
16. Rejection of staging credentials by production and production credentials
    by staging, with accepted staging writes using normal operational
   collections and selecting the staging status/inventory webhook destination
   in the isolated staging runtime; staging intake synchronization stays out
   of `_test` request records.
17. Delivery cancellation cancels an unstarted checkout, preserves a checkout
    with an active physical retrieval session, rejects terminal orders, and is
    idempotent after cancellation.

The focused Phase 5 webhook test also verifies required signing configuration,
raw-body HMAC generation, the five-attempt retry policy, and deterministic
status/inventory event IDs. The API emulator verifies that duplicate events
retain their IDs, unsigned destinations receive no task, enqueue failure does
not use a direct-delivery fallback, and non-2xx receiver status is retained in
the secret-free attempt record. Every focused Websitek backend-only rule check
passed. A fresh run of the complete Firestore rules harness on 2026-08-09 also
passed all 81 of 81 checks, including direct client creation of an authorized
`client_orders` record.

This emulator result is a prerequisite only. It does not replace the staging
tests or the five end-to-end flow results below.

The separate Phase 4 inventory-projection emulator suite also passed on
2026-08-09. It proves that the same placement CloudEvent cannot change stock
twice; activation, release, and warehouse moves produce exact deltas; invalid
owner, contract, or warehouse scope fails closed; repair dry-run/write uses the
same active-placement calculation; owner and warehouse filters are isolated;
and `inventory_placements_test` does not affect operational stock. It also
rejects a placement whose warehouse space belongs to another organization.
The final staging repair dry-run and flow-specific snapshot/webhook comparison
remain pending.

| Flow | Create endpoint | Required final status | Request evidence | Response evidence | Webhook evidence | Result |
|---|---|---|---|---|---|---|
| Intake | `POST /v1/warehouse-intake-requests` | `stored` after successful QC/placement, with inventory available | Pending | Pending | Pending | Not run |
| Warehouse Delivery | `POST /v1/orders` | `delivered`; OTP passed; delivery photo captured; inventory availability updated | Pending | Pending | Pending | Not run |
| Designer Delivery | `POST /v1/pickup-requests` | `delivered`; OTP passed; delivery photo captured | Pending | Pending | Pending | Not run |
| Custom Delivery | `POST /v1/pickup-requests` | `delivered`; OTP passed; delivery photo captured | Pending | Pending | Pending | Not run |
| Returns | `POST /v1/return-requests` | Counted Warehouse-source Exchange case: `verification_passed`, then `return_completed` after placement; inventory restored; no automatic replacement | Pending | Pending | Pending | Not run |

The smallest evidence sequence starts the approved SKU at zero, uses Intake to
place 12, Warehouse Delivery to retrieve one, and the counted Warehouse-source
Return to restore one. The Intake evidence must include the stored and
available quantities visible to Websitek. The Warehouse Delivery evidence must
use a provisioned designer, globally unique SKU, and Azya packaging code. The
counted Return uses `return_type=exchange` to prove that it follows the same
original-item Return flow and does not create an automatic replacement
Delivery. A Designer-source Return remains a recommended supplemental branch
test, not a sixth Exhibit A acceptance flow.

The five operational flows cannot be executed against `_test` collections
because Store Valley's worker and driver apps use normal collections. Staging
acceptance therefore requires a dedicated Firebase project and staging app
configuration. The `store-valley-websitek-staging` project and registered
Android/iOS apps are active, and Firestore, Storage, required backend services,
the API, queue, environment-scoped key, and synthetic Store Valley fixtures are
provisioned. Azya's receiver URL and final acceptance data are still pending.

## Live staging technical preflight

The non-mutating preflight ran on 2026-08-15 against:

```text
https://us-central1-store-valley-websitek-staging.cloudfunctions.net/api/v1
```

It is prerequisite evidence, not one of the five contractual flows:

| Check | Verified result |
|---|---|
| `GET /health` | HTTP 200 |
| Inventory without a key | HTTP 401 |
| Inventory with an invalid key | HTTP 401 |
| Scoped inventory with the active Azya staging key | HTTP 200 |
| Unknown designer with the active key | HTTP 400 |
| Scoped fixture | `DSN-KWT-0001` / `PRD-RM-1001` / `AZY-DSN0001-DRESS-RED-M` / `WH-KWT-MAIN`, available `0` |

The preflight used no operational create/update/delete request and generated no
acceptance-flow evidence. The API key remained secret and was not written into
the shared report.

## Isolation tests required before flow testing

| Test | Expected result | Result |
|---|---|---|
| Test key creates Delivery | Record exists only in `delivery_orders_test` | Not run |
| Test key creates Intake | Records exist only in test request/order collections | Not run |
| Test check-in status sync | Updates only the test Intake request | Not run |
| Staging key calls the production runtime | `401 Unauthorized` | Not run |
| Production key calls the staging runtime | `401 Unauthorized` | Not run |
| Staging key creates Delivery in the staging project | Record, function log, resource name, and app runtime diagnostics all identify the staging project; no production collection query is used | Not run |
| Websitek key lists orders | Only Websitek client orders are returned | Not run |
| Websitek key retrieves another client's ID | `403 Forbidden` | Not run |
| Websitek key reuses another client's external ID | A separate scoped idempotency record is created | Not run |
| Staging delivery status changes | Only the Websitek staging webhook is selected | Not run |
| Staging destination scope | Resolver selects exactly one Azya staging webhook for the persisted `staging` environment | Not run |

## Evidence rules

- Never record raw API keys or webhook secrets.
- Redact customer phone numbers and exact addresses in shared evidence.
- Preserve request IDs, resource IDs, event IDs, timestamps, HTTP status codes,
  and final external status values.
- For a rejected webhook, preserve the destination hostname, attempt count,
  response status, and timestamps without recording the secret.
- Both Store Valley and Websitek must identify the accepted release version.
