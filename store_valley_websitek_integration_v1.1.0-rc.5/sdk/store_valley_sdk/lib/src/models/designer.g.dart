// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'designer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Designer _$DesignerFromJson(Map<String, dynamic> json) => _Designer(
  designerId: json['designer_id'] as String,
  name: json['name'] as String?,
  pickupAddress: Address.fromJson(
    json['pickup_address'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$DesignerToJson(_Designer instance) => <String, dynamic>{
  'designer_id': instance.designerId,
  'name': instance.name,
  'pickup_address': instance.pickupAddress.toJson(),
};
