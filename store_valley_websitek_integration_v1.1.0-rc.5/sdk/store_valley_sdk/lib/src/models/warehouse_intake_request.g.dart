// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_intake_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WarehouseIntakeRequest _$WarehouseIntakeRequestFromJson(
  Map<String, dynamic> json,
) => _WarehouseIntakeRequest(
  externalRequestId: json['external_request_id'] as String,
  warehouseId: json['warehouse_id'] as String,
  designer: Designer.fromJson(json['designer'] as Map<String, dynamic>),
  items: (json['items'] as List<dynamic>)
      .map((e) => LogisticsItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  requestedPickupAt: json['requested_pickup_at'] == null
      ? null
      : DateTime.parse(json['requested_pickup_at'] as String),
  specialInstructions: json['special_instructions'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$WarehouseIntakeRequestToJson(
  _WarehouseIntakeRequest instance,
) => <String, dynamic>{
  'external_request_id': instance.externalRequestId,
  'warehouse_id': instance.warehouseId,
  'designer': instance.designer.toJson(),
  'items': instance.items.map((e) => e.toJson()).toList(),
  'requested_pickup_at': instance.requestedPickupAt?.toIso8601String(),
  'special_instructions': instance.specialInstructions,
  'metadata': instance.metadata,
};
