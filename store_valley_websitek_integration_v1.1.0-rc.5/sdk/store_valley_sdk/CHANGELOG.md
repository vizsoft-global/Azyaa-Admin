# Changelog

## 1.1.0-rc.5

- Corrected the integration handoff to identify the active isolated staging
  API, provisioned warehouse/designer/product fixtures, and verified technical
  preflight results.
- The Dart models and serialized API contract are unchanged from rc.4.
- This candidate records staging readiness only; the five contractual
  acceptance flows remain 0/5 until Azya supplies its receiver URL and final
  acceptance data.

## 1.1.0-rc.4

- Defined the canonical `ReturnRequest.sourceOrderId`: use the Store Valley
  `order_id` for Warehouse Delivery or the returned `delivery_order_id` for
  Designer/Custom Pickup.
- Aligned the SDK README and packaged integration guide with that Return
  contract. The serialized request/response shape is unchanged from rc.3.

## 1.1.0-rc.3

- Added the existing logistics response routing fields `inventory_source` and
  `return_destination_type`.
- Added the existing logistics response timestamps `created_at` and
  `updated_at` so SDK JSON matches the API serializer.
- Corrected the extracted-archive package path in the SDK README.
- Identifies the locally verified Phase 1–6 backend and contract handoff.

## 1.1.0-rc.2

- Aligned the handoff contract with explicit Return verification and
  warehouse placement completion.
- Preserved the `1.1.0-rc.1` request/response model contract; this candidate
  identifies the remediated backend and documentation set.

## 1.1.0-rc.1

- Added the Websitek Warehouse Delivery request and response models.
- Added customer and complete shared address/item fields.
- Aligned optional fields and defaults with the v1 API.
- Added `original_source_location_id` to Return requests.
- Added response models used for reconciliation.
- Added the required `designer_id`, `delivery_otp`, OTP-proof, photo-proof, and
  `packaging_profile` request fields.
- Added inventory snapshot response models for `GET /v1/inventory`.
