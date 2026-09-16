// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Customer _$CustomerFromJson(Map<String, dynamic> json) => _Customer(
  customerId: json['customer_id'] as String?,
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$CustomerToJson(_Customer instance) => <String, dynamic>{
  'customer_id': instance.customerId,
  'name': instance.name,
  'phone': instance.phone,
  'email': instance.email,
};
