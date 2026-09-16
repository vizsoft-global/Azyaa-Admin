# Store Valley Websitek SDK

Private Dart models for the Store Valley Websitek v1 HTTP API.

## Install

The package is located at `sdk/store_valley_sdk` inside the extracted Store
Valley release archive. If the consuming application's `pubspec.yaml` is at
the extracted archive root, use:

```yaml
dependencies:
  store_valley_sdk:
    path: sdk/store_valley_sdk
```

If the package is copied beside or into another project, replace the value
with the correct relative path from that project's `pubspec.yaml`.

## Warehouse delivery

For a warehouse-held order, send a `DeliveryRequest` to `POST /v1/orders`.
Use `pickupLocationId` for the Store Valley warehouse location. To attach
products, use a one-element `stops` list with `DeliveryStop.products`.
When `requiresOtpProof` is true, `deliveryOtp` is required. The API stores only
an HMAC and never returns the plaintext value. `packagingProfile` carries the
Azya packaging code into the warehouse order instructions.

## Inventory

Deserialize `GET /v1/inventory` with `InventorySnapshotResponse`. The response
is scoped by the shared Azya key, `designer_id`, and `warehouse_id` and reads
Store Valley's existing warehouse-stock projection.

## Returns

`ReturnRequest.originalSourceLocationId` must equal the
`original_source_location_id` returned for the original delivery. Store Valley
uses that location to route the return to its original warehouse or designer.

Set `ReturnRequest.sourceOrderId` to Store Valley's returned delivery
identifier: `DeliveryOrderResponse.orderId` for a Warehouse Delivery, or
`LogisticsRequestResponse.deliveryOrderId` for a Designer/Custom Pickup. Do not
use the pickup request ID or external request ID for a Designer-source Return.

## Verification

Run:

```text
dart analyze
dart test
```
