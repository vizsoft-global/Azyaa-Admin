// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Address _$AddressFromJson(Map<String, dynamic> json) => _Address(
  locationId: json['location_id'] as String?,
  name: json['name'] as String?,
  street: json['street'] as String,
  city: json['city'] as String,
  governorate: json['governorate'] as String?,
  district: json['district'] as String?,
  block: json['block'] as String?,
  building: json['building'] as String?,
  postalCode: json['postal_code'] as String?,
  country: json['country'] as String?,
  contactName: json['contact_name'] as String,
  contactPhone: json['contact_phone'] as String,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$AddressToJson(_Address instance) => <String, dynamic>{
  'location_id': instance.locationId,
  'name': instance.name,
  'street': instance.street,
  'city': instance.city,
  'governorate': instance.governorate,
  'district': instance.district,
  'block': instance.block,
  'building': instance.building,
  'postal_code': instance.postalCode,
  'country': instance.country,
  'contact_name': instance.contactName,
  'contact_phone': instance.contactPhone,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
