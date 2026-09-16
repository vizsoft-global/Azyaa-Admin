// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PickupRequest _$PickupRequestFromJson(Map<String, dynamic> json) =>
    _PickupRequest(
      externalRequestId: json['external_request_id'] as String,
      sourceOrderId: json['source_order_id'] as String?,
      pickupPurpose:
          $enumDecodeNullable(_$PickupPurposeEnumMap, json['pickup_purpose']) ??
          PickupPurpose.designerOrderFulfillment,
      orderKind: $enumDecodeNullable(_$OrderKindEnumMap, json['order_kind']),
      designer: Designer.fromJson(json['designer'] as Map<String, dynamic>),
      deliveryAddress: Address.fromJson(
        json['delivery_address'] as Map<String, dynamic>,
      ),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => LogisticsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestedPickupAt: json['requested_pickup_at'] == null
          ? null
          : DateTime.parse(json['requested_pickup_at'] as String),
      requiresCollection: json['requires_collection'] as bool? ?? false,
      collectionAmount: (json['collection_amount'] as num?)?.toDouble(),
      requiresOtpProof: json['requires_otp_proof'] as bool? ?? true,
      deliveryOtp: json['delivery_otp'] as String?,
      requiresPhotoProof: json['requires_photo_proof'] as bool? ?? true,
      packagingProfile: json['packaging_profile'] as String?,
      specialInstructions: json['special_instructions'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PickupRequestToJson(_PickupRequest instance) =>
    <String, dynamic>{
      'external_request_id': instance.externalRequestId,
      'source_order_id': instance.sourceOrderId,
      'pickup_purpose': _$PickupPurposeEnumMap[instance.pickupPurpose]!,
      'order_kind': _$OrderKindEnumMap[instance.orderKind],
      'designer': instance.designer.toJson(),
      'delivery_address': instance.deliveryAddress.toJson(),
      'customer': instance.customer?.toJson(),
      'items': instance.items.map((e) => e.toJson()).toList(),
      'requested_pickup_at': instance.requestedPickupAt?.toIso8601String(),
      'requires_collection': instance.requiresCollection,
      'collection_amount': instance.collectionAmount,
      'requires_otp_proof': instance.requiresOtpProof,
      'delivery_otp': instance.deliveryOtp,
      'requires_photo_proof': instance.requiresPhotoProof,
      'packaging_profile': instance.packagingProfile,
      'special_instructions': instance.specialInstructions,
      'metadata': instance.metadata,
    };

const _$PickupPurposeEnumMap = {
  PickupPurpose.designerOrderFulfillment: 'designer_order_fulfillment',
  PickupPurpose.customMadeFulfillment: 'custom_made_fulfillment',
  PickupPurpose.warehouseIntake: 'warehouse_intake',
};

const _$OrderKindEnumMap = {
  OrderKind.customMade: 'custom_made',
  OrderKind.readyMade: 'ready_made',
};
