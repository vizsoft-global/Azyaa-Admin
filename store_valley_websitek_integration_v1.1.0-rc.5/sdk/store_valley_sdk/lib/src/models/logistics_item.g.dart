// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logistics_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LogisticsItem _$LogisticsItemFromJson(Map<String, dynamic> json) =>
    _LogisticsItem(
      sku: json['sku'] as String?,
      quantity: (json['quantity'] as num).toInt(),
      productId: json['product_id'] as String?,
      productName: json['product_name'] as String?,
      conditionNotes: json['condition_notes'] as String?,
      packagingNotes: json['packaging_notes'] as String?,
    );

Map<String, dynamic> _$LogisticsItemToJson(_LogisticsItem instance) =>
    <String, dynamic>{
      'sku': instance.sku,
      'quantity': instance.quantity,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'condition_notes': instance.conditionNotes,
      'packaging_notes': instance.packagingNotes,
    };
