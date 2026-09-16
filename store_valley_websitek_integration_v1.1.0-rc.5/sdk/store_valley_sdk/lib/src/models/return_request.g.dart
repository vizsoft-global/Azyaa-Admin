// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReturnRequest _$ReturnRequestFromJson(Map<String, dynamic> json) =>
    _ReturnRequest(
      externalRequestId: json['external_request_id'] as String,
      sourceOrderId: json['source_order_id'] as String,
      designerId: json['designer_id'] as String,
      originalSourceLocationId: json['original_source_location_id'] as String,
      returnType:
          $enumDecodeNullable(_$ReturnTypeEnumMap, json['return_type']) ??
          ReturnType.returnRequest,
      originalInventorySource: $enumDecodeNullable(
        _$InventorySourceEnumMap,
        json['original_inventory_source'],
      ),
      warehouseId: json['warehouse_id'] as String?,
      designerReturnAddress: json['designer_return_address'] == null
          ? null
          : Address.fromJson(
              json['designer_return_address'] as Map<String, dynamic>,
            ),
      customerPickupAddress: Address.fromJson(
        json['customer_pickup_address'] as Map<String, dynamic>,
      ),
      items: (json['items'] as List<dynamic>)
          .map((e) => LogisticsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      reason: json['reason'] as String?,
      requestedPickupAt: json['requested_pickup_at'] == null
          ? null
          : DateTime.parse(json['requested_pickup_at'] as String),
      specialInstructions: json['special_instructions'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ReturnRequestToJson(_ReturnRequest instance) =>
    <String, dynamic>{
      'external_request_id': instance.externalRequestId,
      'source_order_id': instance.sourceOrderId,
      'designer_id': instance.designerId,
      'original_source_location_id': instance.originalSourceLocationId,
      'return_type': _$ReturnTypeEnumMap[instance.returnType]!,
      'original_inventory_source':
          _$InventorySourceEnumMap[instance.originalInventorySource],
      'warehouse_id': instance.warehouseId,
      'designer_return_address': instance.designerReturnAddress?.toJson(),
      'customer_pickup_address': instance.customerPickupAddress.toJson(),
      'items': instance.items.map((e) => e.toJson()).toList(),
      'reason': instance.reason,
      'requested_pickup_at': instance.requestedPickupAt?.toIso8601String(),
      'special_instructions': instance.specialInstructions,
      'metadata': instance.metadata,
    };

const _$ReturnTypeEnumMap = {
  ReturnType.returnRequest: 'return',
  ReturnType.exchange: 'exchange',
};

const _$InventorySourceEnumMap = {
  InventorySource.warehouse: 'warehouse',
  InventorySource.designer: 'designer',
};
