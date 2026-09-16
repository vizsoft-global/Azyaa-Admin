# Websitek v1 Integration Contract Matrix

Status: release candidate `1.1.0-rc.5`; staging foundation and API preflight verified, five-flow acceptance pending
Authority: Exhibit A — IT Integration Scope of Work and the confirmed Websitek Logistics Integration Requirements & Acceptance Criteria BRD
BRD confirmation date: 2026-08-05

## Contract rules

1. The HTTP API contract is versioned as `v1`.
2. The API schemas, Dart SDK models, documentation, examples, and webhook payloads must describe the same fields and status values.
3. Every Websitek resource is isolated by `org_id`, `client_id`, and environment.
4. Test credentials use only `_test` order/request collections. Staging
   credentials are accepted only by a staging-configured runtime in a separate
   Firebase project and are rejected by production.
5. Undocumented internal APIs are not considered delivered integration capabilities.
6. The five SOW acceptance flows are Intake, Warehouse Delivery, Designer Delivery, Custom Delivery, and Returns.
7. Azya has one platform integration identity per environment; `designer_id` identifies the inventory owner on each applicable request.

## Requirements

| Requirement | SOW status | Current state | Remediation | Acceptance evidence |
|---|---|---|---|---|
| Secured Delivery endpoint | Required | `/v1/orders` is implemented and represented in the Websitek guide and SDK models | Verify the endpoint in isolated staging | One Warehouse Delivery staging flow reaches `delivered` |
| Secured Pickup endpoint | Required | `/v1/pickup-requests` exists | Align schema, SDK, response, and webhook statuses | Designer and Custom Delivery staging flows reach `delivered` |
| Secured Warehouse Intake endpoint | Required | `/v1/warehouse-intake-requests` uses the existing delivery, QC, placement, and inventory paths; Intake is eligible for QC only after warehouse arrival | Verify the complete operational flow in isolated staging | Intake flow reaches its final stored status |
| Secured Returns endpoint | Required | `/v1/return-requests` routes to the verified original source; designer Returns use driver proof and warehouse Returns use existing QC/placement before completion | Verify both source paths in isolated staging | Return reaches the correct destination, verification result, and final status |
| Agreed outbound statuses | Required | External mappings include Intake, Delivery, Return pickup verification, warehouse QC, placement, and completion | Verify webhook delivery and ordering in staging | Each flow records and delivers its required final webhook |
| Complete Dart SDK | Required | Version `1.1.0-rc.5` contains the complete package and generated models; the logistics response exposes every field returned by the serializer and the Return source-order contract is explicit. Models are unchanged from rc.4 | Build and verify the release archive from the reviewed source state | Analyze and test the extracted release archive |
| Formal API/webhook documentation | Required | The guide covers the exact staging base URL, Delivery, logistics response fields, current-state reconciliation, OTP, packaging, signed retry behavior, and exact HTTP/webhook status representations. Secrets and customer data remain redacted | Execute the operational examples with final acceptance data | Examples and five flows run successfully in staging |
| Environment-specific API keys | Required | Runtime mismatch fails closed. One active, environment-scoped Azya staging key exists and is available for delivery out of band; missing and invalid keys returned HTTP 401 in live staging on 2026-08-15 | Retain the key in the approved secret channel and issue production credentials only after acceptance | Staging activity cannot reach the production project |
| Isolated staging/development | Required | Staging uses normal operational collections only in the dedicated `store-valley-websitek-staging` project. Firestore, Storage, backend services, API, queue, mobile apps, and synthetic foundation fixtures are active. The live preflight read succeeded without using production data | Complete mobile/runtime isolation evidence during the five operational flows | Test records cannot update normal collections and staging credentials are rejected by production |
| Webhook retry and attempt logs | Required | Signed destinations are mandatory; five attempts, deterministic event IDs, one Cloud Tasks delivery path, scoped destination selection, retained non-2xx status, and secret-free attempt logs are implemented and locally tested; public replay is not in v1 | Verify signature, retry, and idempotency behavior with Azya's staging receiver | Failed staging webhook shows valid attempts and Azya verifies the signature |
| Websitek webhook URLs | Websitek responsibility | Not supplied in the reviewed artifacts | Websitek supplies separate staging and production destinations | Staging destination registered and verified |
| Return `source_order_id` | Websitek responsibility and Return dependency | Canonical input is Store Valley's returned `order_id` for Warehouse Delivery or `delivery_order_id` for Designer/Custom Pickup; the designer path is asserted in the API emulator suite | Websitek retains and resubmits the applicable Store Valley delivery identifier | Warehouse and designer return cases resolve the intended original delivery |
| `originalSourceLocationId` | Websitek responsibility and Return dependency | Implemented in the API and SDK as `original_source_location_id`; mismatches are rejected | Websitek retains and resubmits the original value | Warehouse and designer return cases route correctly |
| Per-designer ownership isolation | Required by confirmed platform model | The live staging key is bound to the Azya integration client, and `DSN-KWT-0001` resolves to the existing staging owner and active contract. An unknown designer returned HTTP 400 | Verify the same scope during mutating acceptance flows | Unknown or cross-scope designer IDs are rejected |
| Stored and available inventory sync | Required by BRD | Live `GET /inventory` returned the scoped designer/product/SKU/warehouse row at available quantity zero. Snapshot and deterministic update events reuse Store Valley's existing product warehouse-stock projection | Verify snapshot/event changes through Intake, Warehouse Delivery, and Return | Intake quantity becomes visible and warehouse fulfillment updates availability |
| Warehouse-stock fulfillment | Required by BRD | Local remediation atomically creates the Delivery/client-order link and passes the checkout-chain emulator test | Verify the same chain in the staging operational apps | Warehouse item is retrieved and delivered through the operational apps |
| OTP and delivery photo | Required by BRD | Azya supplies the OTP to the API, which stores only an order-scoped HMAC. The existing driver proof dialog shows a conditional obscured string field capped at 32 characters, keeps plaintext only in transient form/result/command/callable memory, requires photo, awaits the authoritative completion command, and closes only on success. Wrong OTP leaves the stop and dialog pending for correction under the same operation/proof identity. The open dialog is the sole retry owner, and webhooks emit only the verification result. The staging HMAC secret is provisioned; fresh local gates passed on 2026-08-13. | Execute the staging driver flow | Delivery completion has OTP pass and photo evidence; failed OTP remains pending; no plaintext appears in persisted or webhook evidence |
| Branded packaging | Required by BRD | `packaging_profile` is merged into existing order instructions. Automatic and manual checkout creation project it into `transport_details`; the active `RetrievalProductSelectionView` shows the labelled banner, and an instruction-load failure is distinct from an order with no instructions. Focused local tests passed. | Verify visibility in the staging worker app | Acceptance order records `AZY-PKG-STD-01` and warehouse handling can see it; no staging flow has run, so Websitek/Azya acceptance remains 0 of 5. |
| Exchange behavior | Required and clarified | `return_type=exchange` is accepted but no replacement is created | Process the original item through the Return flow; replacement remains a separate Delivery request | Exchange Return completes without creating an automatic replacement |

## Requirements not established by the confirmed v1 scope

The following must not be represented as accepted v1 scope without a separate written change:

- Per-designer inventory ledgers with available, reserved, dispatched, returned, damaged, and total buckets.
- Inventory reservation and release APIs.
- A public movement ledger, reconciliation API, replay API, or `updated_since` API beyond the required stored/available inventory synchronization.
- Shipping-label generation.
- Public tracking URLs.
- Cancellation endpoints for Intake, Pickup, or Return requests. V1 exposes
  cancellation only for Delivery through `DELETE /orders/{id}`.
- Returned-to-sender orchestration beyond reporting the existing Delivery
  `failed` or `returned` status, plus additional failure-state workflows beyond
  the SOW status list.

## Release gate

No production credentials or production webhook destination may be enabled until:

1. Client and environment isolation tests pass.
2. The API, SDK, and documentation contract comparison passes.
3. A complete release archive passes `dart analyze` and `dart test` after extraction.
4. All five staging acceptance flows have recorded request, response, final status, and webhook-attempt evidence.
