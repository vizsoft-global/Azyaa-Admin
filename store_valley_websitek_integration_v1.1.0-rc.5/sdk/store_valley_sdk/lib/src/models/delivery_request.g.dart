// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeliveryStop _$DeliveryStopFromJson(Map<String, dynamic> json) =>
    _DeliveryStop(
      street: json['street'] as String,
      city: json['city'] as String,
      governorate: json['governorate'] as String?,
      district: json['district'] as String?,
      block: json['block'] as String?,
      building: json['building'] as String?,
      postalCode: json['postal_code'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      contactName: json['contact_name'] as String,
      contactPhone: json['contact_phone'] as String,
      products:
          (json['products'] as List<dynamic>?)
              ?.map((e) => LogisticsItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <LogisticsItem>[],
    );

Map<String, dynamic> _$DeliveryStopToJson(_DeliveryStop instance) =>
    <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'governorate': instance.governorate,
      'district': instance.district,
      'block': instance.block,
      'building': instance.building,
      'postal_code': instance.postalCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'contact_name': instance.contactName,
      'contact_phone': instance.contactPhone,
      'products': instance.products.map((e) => e.toJson()).toList(),
    };

_DeliveryRequest _$DeliveryRequestFromJson(Map<String, dynamic> json) =>
    _DeliveryRequest(
      clientOrderId: json['client_order_id'] as String,
      designerId: json['designer_id'] as String,
      pickupLocationId: json['pickup_location_id'] as String,
      deliveryAddress: json['delivery_address'] == null
          ? null
          : Address.fromJson(json['delivery_address'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => LogisticsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      stops: (json['stops'] as List<dynamic>?)
          ?.map((e) => DeliveryStop.fromJson(e as Map<String, dynamic>))
          .toList(),
      requiresCollection: json['requires_collection'] as bool? ?? false,
      collectionAmount: (json['collection_amount'] as num?)?.toDouble(),
      specialInstructions: json['special_instructions'] as String?,
      orderKind: $enumDecodeNullable(_$OrderKindEnumMap, json['order_kind']),
      inventorySource:
          $enumDecodeNullable(
            _$InventorySourceEnumMap,
            json['inventory_source'],
          ) ??
          InventorySource.warehouse,
      packagingProfile: json['packaging_profile'] as String?,
      requiresOtpProof: json['requires_otp_proof'] as bool? ?? true,
      deliveryOtp: json['delivery_otp'] as String?,
      requiresPhotoProof: json['requires_photo_proof'] as bool? ?? true,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$DeliveryRequestToJson(_DeliveryRequest instance) =>
    <String, dynamic>{
      'client_order_id': instance.clientOrderId,
      'designer_id': instance.designerId,
      'pickup_location_id': instance.pickupLocationId,
      'delivery_address': instance.deliveryAddress?.toJson(),
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'stops': instance.stops?.map((e) => e.toJson()).toList(),
      'requires_collection': instance.requiresCollection,
      'collection_amount': instance.collectionAmount,
      'special_instructions': instance.specialInstructions,
      'order_kind': _$OrderKindEnumMap[instance.orderKind],
      'inventory_source': _$InventorySourceEnumMap[instance.inventorySource]!,
      'packaging_profile': instance.packagingProfile,
      'requires_otp_proof': instance.requiresOtpProof,
      'delivery_otp': instance.deliveryOtp,
      'requires_photo_proof': instance.requiresPhotoProof,
      'metadata': instance.metadata,
    };

const _$OrderKindEnumMap = {
  OrderKind.customMade: 'custom_made',
  OrderKind.readyMade: 'ready_made',
};

const _$InventorySourceEnumMap = {
  InventorySource.warehouse: 'warehouse',
  InventorySource.designer: 'designer',
};
