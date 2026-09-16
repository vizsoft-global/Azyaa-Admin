import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/inventory_source.dart';

part 'api_responses.freezed.dart';
part 'api_responses.g.dart';

@freezed
abstract class DeliveryOrderResponse with _$DeliveryOrderResponse {
  const factory DeliveryOrderResponse({
    @JsonKey(name: 'order_id') required String orderId,
    @JsonKey(name: 'client_order_id') String? clientOrderId,
    required String status,
    @JsonKey(name: 'original_source_location_id')
    required String originalSourceLocationId,
    @JsonKey(name: 'driver_id') String? driverId,
    @JsonKey(name: 'estimated_delivery_time') DateTime? estimatedDeliveryTime,
    @JsonKey(name: 'actual_delivery_time') DateTime? actualDeliveryTime,
    @JsonKey(name: 'proof_photo_url') String? proofPhotoUrl,
    @JsonKey(name: 'proof_signature_url') String? proofSignatureUrl,
    @JsonKey(name: 'is_test') @Default(false) bool isTest,
  }) = _DeliveryOrderResponse;

  factory DeliveryOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrderResponseFromJson(json);
}

@freezed
abstract class LogisticsRequestResponse with _$LogisticsRequestResponse {
  const factory LogisticsRequestResponse({
    @JsonKey(name: 'request_id') required String requestId,
    @JsonKey(name: 'external_request_id') required String externalRequestId,
    @JsonKey(name: 'source_order_id') String? sourceOrderId,
    required String status,
    @JsonKey(name: 'delivery_order_id') String? deliveryOrderId,
    @JsonKey(name: 'original_source_location_id')
    String? originalSourceLocationId,
    @JsonKey(name: 'warehouse_id') String? warehouseId,
    @JsonKey(name: 'inventory_source') InventorySource? inventorySource,
    @JsonKey(name: 'return_destination_type')
    InventorySource? returnDestinationType,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'is_test') @Default(false) bool isTest,
  }) = _LogisticsRequestResponse;

  factory LogisticsRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$LogisticsRequestResponseFromJson(json);
}

@freezed
abstract class InventorySnapshotItem with _$InventorySnapshotItem {
  const factory InventorySnapshotItem({
    @JsonKey(name: 'designer_id') required String designerId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'store_valley_product_id')
    required String storeValleyProductId,
    required String sku,
    @JsonKey(name: 'warehouse_id') required String warehouseId,
    @JsonKey(name: 'stored_quantity') required num storedQuantity,
    required num available,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _InventorySnapshotItem;

  factory InventorySnapshotItem.fromJson(Map<String, dynamic> json) =>
      _$InventorySnapshotItemFromJson(json);
}

@freezed
abstract class InventorySnapshotResponse with _$InventorySnapshotResponse {
  const factory InventorySnapshotResponse({
    required List<InventorySnapshotItem> inventory,
    required int count,
    @JsonKey(name: 'next_cursor') String? nextCursor,
    @JsonKey(name: 'has_more') required bool hasMore,
    @JsonKey(name: 'as_of') required DateTime asOf,
    @JsonKey(name: 'is_test') @Default(false) bool isTest,
  }) = _InventorySnapshotResponse;

  factory InventorySnapshotResponse.fromJson(Map<String, dynamic> json) =>
      _$InventorySnapshotResponseFromJson(json);
}
