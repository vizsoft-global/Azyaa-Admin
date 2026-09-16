// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeliveryOrderResponse _$DeliveryOrderResponseFromJson(
  Map<String, dynamic> json,
) => _DeliveryOrderResponse(
  orderId: json['order_id'] as String,
  clientOrderId: json['client_order_id'] as String?,
  status: json['status'] as String,
  originalSourceLocationId: json['original_source_location_id'] as String,
  driverId: json['driver_id'] as String?,
  estimatedDeliveryTime: json['estimated_delivery_time'] == null
      ? null
      : DateTime.parse(json['estimated_delivery_time'] as String),
  actualDeliveryTime: json['actual_delivery_time'] == null
      ? null
      : DateTime.parse(json['actual_delivery_time'] as String),
  proofPhotoUrl: json['proof_photo_url'] as String?,
  proofSignatureUrl: json['proof_signature_url'] as String?,
  isTest: json['is_test'] as bool? ?? false,
);

Map<String, dynamic> _$DeliveryOrderResponseToJson(
  _DeliveryOrderResponse instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'client_order_id': instance.clientOrderId,
  'status': instance.status,
  'original_source_location_id': instance.originalSourceLocationId,
  'driver_id': instance.driverId,
  'estimated_delivery_time': instance.estimatedDeliveryTime?.toIso8601String(),
  'actual_delivery_time': instance.actualDeliveryTime?.toIso8601String(),
  'proof_photo_url': instance.proofPhotoUrl,
  'proof_signature_url': instance.proofSignatureUrl,
  'is_test': instance.isTest,
};

_LogisticsRequestResponse _$LogisticsRequestResponseFromJson(
  Map<String, dynamic> json,
) => _LogisticsRequestResponse(
  requestId: json['request_id'] as String,
  externalRequestId: json['external_request_id'] as String,
  sourceOrderId: json['source_order_id'] as String?,
  status: json['status'] as String,
  deliveryOrderId: json['delivery_order_id'] as String?,
  originalSourceLocationId: json['original_source_location_id'] as String?,
  warehouseId: json['warehouse_id'] as String?,
  inventorySource: $enumDecodeNullable(
    _$InventorySourceEnumMap,
    json['inventory_source'],
  ),
  returnDestinationType: $enumDecodeNullable(
    _$InventorySourceEnumMap,
    json['return_destination_type'],
  ),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  isTest: json['is_test'] as bool? ?? false,
);

Map<String, dynamic> _$LogisticsRequestResponseToJson(
  _LogisticsRequestResponse instance,
) => <String, dynamic>{
  'request_id': instance.requestId,
  'external_request_id': instance.externalRequestId,
  'source_order_id': instance.sourceOrderId,
  'status': instance.status,
  'delivery_order_id': instance.deliveryOrderId,
  'original_source_location_id': instance.originalSourceLocationId,
  'warehouse_id': instance.warehouseId,
  'inventory_source': _$InventorySourceEnumMap[instance.inventorySource],
  'return_destination_type':
      _$InventorySourceEnumMap[instance.returnDestinationType],
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'is_test': instance.isTest,
};

const _$InventorySourceEnumMap = {
  InventorySource.warehouse: 'warehouse',
  InventorySource.designer: 'designer',
};

_InventorySnapshotItem _$InventorySnapshotItemFromJson(
  Map<String, dynamic> json,
) => _InventorySnapshotItem(
  designerId: json['designer_id'] as String,
  productId: json['product_id'] as String,
  storeValleyProductId: json['store_valley_product_id'] as String,
  sku: json['sku'] as String,
  warehouseId: json['warehouse_id'] as String,
  storedQuantity: json['stored_quantity'] as num,
  available: json['available'] as num,
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$InventorySnapshotItemToJson(
  _InventorySnapshotItem instance,
) => <String, dynamic>{
  'designer_id': instance.designerId,
  'product_id': instance.productId,
  'store_valley_product_id': instance.storeValleyProductId,
  'sku': instance.sku,
  'warehouse_id': instance.warehouseId,
  'stored_quantity': instance.storedQuantity,
  'available': instance.available,
  'updated_at': instance.updatedAt?.toIso8601String(),
};

_InventorySnapshotResponse _$InventorySnapshotResponseFromJson(
  Map<String, dynamic> json,
) => _InventorySnapshotResponse(
  inventory: (json['inventory'] as List<dynamic>)
      .map((e) => InventorySnapshotItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  count: (json['count'] as num).toInt(),
  nextCursor: json['next_cursor'] as String?,
  hasMore: json['has_more'] as bool,
  asOf: DateTime.parse(json['as_of'] as String),
  isTest: json['is_test'] as bool? ?? false,
);

Map<String, dynamic> _$InventorySnapshotResponseToJson(
  _InventorySnapshotResponse instance,
) => <String, dynamic>{
  'inventory': instance.inventory,
  'count': instance.count,
  'next_cursor': instance.nextCursor,
  'has_more': instance.hasMore,
  'as_of': instance.asOf.toIso8601String(),
  'is_test': instance.isTest,
};
