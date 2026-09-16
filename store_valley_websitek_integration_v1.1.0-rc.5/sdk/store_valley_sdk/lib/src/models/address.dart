import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    @JsonKey(name: 'location_id') String? locationId,
    String? name,
    required String street,
    required String city,
    String? governorate,
    String? district,
    String? block,
    String? building,
    @JsonKey(name: 'postal_code') String? postalCode,
    String? country,
    @JsonKey(name: 'contact_name') required String contactName,
    @JsonKey(name: 'contact_phone') required String contactPhone,
    double? latitude,
    double? longitude,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
