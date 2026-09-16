// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Address {

@JsonKey(name: 'location_id') String? get locationId; String? get name; String get street; String get city; String? get governorate; String? get district; String? get block; String? get building;@JsonKey(name: 'postal_code') String? get postalCode; String? get country;@JsonKey(name: 'contact_name') String get contactName;@JsonKey(name: 'contact_phone') String get contactPhone; double? get latitude; double? get longitude;
/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressCopyWith<Address> get copyWith => _$AddressCopyWithImpl<Address>(this as Address, _$identity);

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Address&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.name, name) || other.name == name)&&(identical(other.street, street) || other.street == street)&&(identical(other.city, city) || other.city == city)&&(identical(other.governorate, governorate) || other.governorate == governorate)&&(identical(other.district, district) || other.district == district)&&(identical(other.block, block) || other.block == block)&&(identical(other.building, building) || other.building == building)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.country, country) || other.country == country)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locationId,name,street,city,governorate,district,block,building,postalCode,country,contactName,contactPhone,latitude,longitude);

@override
String toString() {
  return 'Address(locationId: $locationId, name: $name, street: $street, city: $city, governorate: $governorate, district: $district, block: $block, building: $building, postalCode: $postalCode, country: $country, contactName: $contactName, contactPhone: $contactPhone, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $AddressCopyWith<$Res>  {
  factory $AddressCopyWith(Address value, $Res Function(Address) _then) = _$AddressCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'location_id') String? locationId, String? name, String street, String city, String? governorate, String? district, String? block, String? building,@JsonKey(name: 'postal_code') String? postalCode, String? country,@JsonKey(name: 'contact_name') String contactName,@JsonKey(name: 'contact_phone') String contactPhone, double? latitude, double? longitude
});




}
/// @nodoc
class _$AddressCopyWithImpl<$Res>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._self, this._then);

  final Address _self;
  final $Res Function(Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locationId = freezed,Object? name = freezed,Object? street = null,Object? city = null,Object? governorate = freezed,Object? district = freezed,Object? block = freezed,Object? building = freezed,Object? postalCode = freezed,Object? country = freezed,Object? contactName = null,Object? contactPhone = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,governorate: freezed == governorate ? _self.governorate : governorate // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as String?,building: freezed == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,contactName: null == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Address].
extension AddressPatterns on Address {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Address value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Address value)  $default,){
final _that = this;
switch (_that) {
case _Address():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Address value)?  $default,){
final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'location_id')  String? locationId,  String? name,  String street,  String city,  String? governorate,  String? district,  String? block,  String? building, @JsonKey(name: 'postal_code')  String? postalCode,  String? country, @JsonKey(name: 'contact_name')  String contactName, @JsonKey(name: 'contact_phone')  String contactPhone,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.locationId,_that.name,_that.street,_that.city,_that.governorate,_that.district,_that.block,_that.building,_that.postalCode,_that.country,_that.contactName,_that.contactPhone,_that.latitude,_that.longitude);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'location_id')  String? locationId,  String? name,  String street,  String city,  String? governorate,  String? district,  String? block,  String? building, @JsonKey(name: 'postal_code')  String? postalCode,  String? country, @JsonKey(name: 'contact_name')  String contactName, @JsonKey(name: 'contact_phone')  String contactPhone,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _Address():
return $default(_that.locationId,_that.name,_that.street,_that.city,_that.governorate,_that.district,_that.block,_that.building,_that.postalCode,_that.country,_that.contactName,_that.contactPhone,_that.latitude,_that.longitude);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'location_id')  String? locationId,  String? name,  String street,  String city,  String? governorate,  String? district,  String? block,  String? building, @JsonKey(name: 'postal_code')  String? postalCode,  String? country, @JsonKey(name: 'contact_name')  String contactName, @JsonKey(name: 'contact_phone')  String contactPhone,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _Address() when $default != null:
return $default(_that.locationId,_that.name,_that.street,_that.city,_that.governorate,_that.district,_that.block,_that.building,_that.postalCode,_that.country,_that.contactName,_that.contactPhone,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Address implements Address {
  const _Address({@JsonKey(name: 'location_id') this.locationId, this.name, required this.street, required this.city, this.governorate, this.district, this.block, this.building, @JsonKey(name: 'postal_code') this.postalCode, this.country, @JsonKey(name: 'contact_name') required this.contactName, @JsonKey(name: 'contact_phone') required this.contactPhone, this.latitude, this.longitude});
  factory _Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

@override@JsonKey(name: 'location_id') final  String? locationId;
@override final  String? name;
@override final  String street;
@override final  String city;
@override final  String? governorate;
@override final  String? district;
@override final  String? block;
@override final  String? building;
@override@JsonKey(name: 'postal_code') final  String? postalCode;
@override final  String? country;
@override@JsonKey(name: 'contact_name') final  String contactName;
@override@JsonKey(name: 'contact_phone') final  String contactPhone;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressCopyWith<_Address> get copyWith => __$AddressCopyWithImpl<_Address>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Address&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.name, name) || other.name == name)&&(identical(other.street, street) || other.street == street)&&(identical(other.city, city) || other.city == city)&&(identical(other.governorate, governorate) || other.governorate == governorate)&&(identical(other.district, district) || other.district == district)&&(identical(other.block, block) || other.block == block)&&(identical(other.building, building) || other.building == building)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.country, country) || other.country == country)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locationId,name,street,city,governorate,district,block,building,postalCode,country,contactName,contactPhone,latitude,longitude);

@override
String toString() {
  return 'Address(locationId: $locationId, name: $name, street: $street, city: $city, governorate: $governorate, district: $district, block: $block, building: $building, postalCode: $postalCode, country: $country, contactName: $contactName, contactPhone: $contactPhone, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) _then) = __$AddressCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'location_id') String? locationId, String? name, String street, String city, String? governorate, String? district, String? block, String? building,@JsonKey(name: 'postal_code') String? postalCode, String? country,@JsonKey(name: 'contact_name') String contactName,@JsonKey(name: 'contact_phone') String contactPhone, double? latitude, double? longitude
});




}
/// @nodoc
class __$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(this._self, this._then);

  final _Address _self;
  final $Res Function(_Address) _then;

/// Create a copy of Address
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locationId = freezed,Object? name = freezed,Object? street = null,Object? city = null,Object? governorate = freezed,Object? district = freezed,Object? block = freezed,Object? building = freezed,Object? postalCode = freezed,Object? country = freezed,Object? contactName = null,Object? contactPhone = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_Address(
locationId: freezed == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,governorate: freezed == governorate ? _self.governorate : governorate // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as String?,building: freezed == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,contactName: null == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
