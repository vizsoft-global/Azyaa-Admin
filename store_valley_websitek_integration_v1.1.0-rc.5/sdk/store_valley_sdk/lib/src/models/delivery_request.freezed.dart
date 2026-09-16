// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryStop {

 String get street; String get city; String? get governorate; String? get district; String? get block; String? get building;@JsonKey(name: 'postal_code') String? get postalCode; double? get latitude; double? get longitude;@JsonKey(name: 'contact_name') String get contactName;@JsonKey(name: 'contact_phone') String get contactPhone; List<LogisticsItem> get products;
/// Create a copy of DeliveryStop
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryStopCopyWith<DeliveryStop> get copyWith => _$DeliveryStopCopyWithImpl<DeliveryStop>(this as DeliveryStop, _$identity);

  /// Serializes this DeliveryStop to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryStop&&(identical(other.street, street) || other.street == street)&&(identical(other.city, city) || other.city == city)&&(identical(other.governorate, governorate) || other.governorate == governorate)&&(identical(other.district, district) || other.district == district)&&(identical(other.block, block) || other.block == block)&&(identical(other.building, building) || other.building == building)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&const DeepCollectionEquality().equals(other.products, products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,street,city,governorate,district,block,building,postalCode,latitude,longitude,contactName,contactPhone,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'DeliveryStop(street: $street, city: $city, governorate: $governorate, district: $district, block: $block, building: $building, postalCode: $postalCode, latitude: $latitude, longitude: $longitude, contactName: $contactName, contactPhone: $contactPhone, products: $products)';
}


}

/// @nodoc
abstract mixin class $DeliveryStopCopyWith<$Res>  {
  factory $DeliveryStopCopyWith(DeliveryStop value, $Res Function(DeliveryStop) _then) = _$DeliveryStopCopyWithImpl;
@useResult
$Res call({
 String street, String city, String? governorate, String? district, String? block, String? building,@JsonKey(name: 'postal_code') String? postalCode, double? latitude, double? longitude,@JsonKey(name: 'contact_name') String contactName,@JsonKey(name: 'contact_phone') String contactPhone, List<LogisticsItem> products
});




}
/// @nodoc
class _$DeliveryStopCopyWithImpl<$Res>
    implements $DeliveryStopCopyWith<$Res> {
  _$DeliveryStopCopyWithImpl(this._self, this._then);

  final DeliveryStop _self;
  final $Res Function(DeliveryStop) _then;

/// Create a copy of DeliveryStop
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? street = null,Object? city = null,Object? governorate = freezed,Object? district = freezed,Object? block = freezed,Object? building = freezed,Object? postalCode = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? contactName = null,Object? contactPhone = null,Object? products = null,}) {
  return _then(_self.copyWith(
street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,governorate: freezed == governorate ? _self.governorate : governorate // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as String?,building: freezed == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,contactName: null == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<LogisticsItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryStop].
extension DeliveryStopPatterns on DeliveryStop {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryStop value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryStop() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryStop value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryStop():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryStop value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryStop() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String street,  String city,  String? governorate,  String? district,  String? block,  String? building, @JsonKey(name: 'postal_code')  String? postalCode,  double? latitude,  double? longitude, @JsonKey(name: 'contact_name')  String contactName, @JsonKey(name: 'contact_phone')  String contactPhone,  List<LogisticsItem> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryStop() when $default != null:
return $default(_that.street,_that.city,_that.governorate,_that.district,_that.block,_that.building,_that.postalCode,_that.latitude,_that.longitude,_that.contactName,_that.contactPhone,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String street,  String city,  String? governorate,  String? district,  String? block,  String? building, @JsonKey(name: 'postal_code')  String? postalCode,  double? latitude,  double? longitude, @JsonKey(name: 'contact_name')  String contactName, @JsonKey(name: 'contact_phone')  String contactPhone,  List<LogisticsItem> products)  $default,) {final _that = this;
switch (_that) {
case _DeliveryStop():
return $default(_that.street,_that.city,_that.governorate,_that.district,_that.block,_that.building,_that.postalCode,_that.latitude,_that.longitude,_that.contactName,_that.contactPhone,_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String street,  String city,  String? governorate,  String? district,  String? block,  String? building, @JsonKey(name: 'postal_code')  String? postalCode,  double? latitude,  double? longitude, @JsonKey(name: 'contact_name')  String contactName, @JsonKey(name: 'contact_phone')  String contactPhone,  List<LogisticsItem> products)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryStop() when $default != null:
return $default(_that.street,_that.city,_that.governorate,_that.district,_that.block,_that.building,_that.postalCode,_that.latitude,_that.longitude,_that.contactName,_that.contactPhone,_that.products);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DeliveryStop implements DeliveryStop {
  const _DeliveryStop({required this.street, required this.city, this.governorate, this.district, this.block, this.building, @JsonKey(name: 'postal_code') this.postalCode, this.latitude, this.longitude, @JsonKey(name: 'contact_name') required this.contactName, @JsonKey(name: 'contact_phone') required this.contactPhone, final  List<LogisticsItem> products = const <LogisticsItem>[]}): _products = products;
  factory _DeliveryStop.fromJson(Map<String, dynamic> json) => _$DeliveryStopFromJson(json);

@override final  String street;
@override final  String city;
@override final  String? governorate;
@override final  String? district;
@override final  String? block;
@override final  String? building;
@override@JsonKey(name: 'postal_code') final  String? postalCode;
@override final  double? latitude;
@override final  double? longitude;
@override@JsonKey(name: 'contact_name') final  String contactName;
@override@JsonKey(name: 'contact_phone') final  String contactPhone;
 final  List<LogisticsItem> _products;
@override@JsonKey() List<LogisticsItem> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of DeliveryStop
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryStopCopyWith<_DeliveryStop> get copyWith => __$DeliveryStopCopyWithImpl<_DeliveryStop>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryStopToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryStop&&(identical(other.street, street) || other.street == street)&&(identical(other.city, city) || other.city == city)&&(identical(other.governorate, governorate) || other.governorate == governorate)&&(identical(other.district, district) || other.district == district)&&(identical(other.block, block) || other.block == block)&&(identical(other.building, building) || other.building == building)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.contactName, contactName) || other.contactName == contactName)&&(identical(other.contactPhone, contactPhone) || other.contactPhone == contactPhone)&&const DeepCollectionEquality().equals(other._products, _products));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,street,city,governorate,district,block,building,postalCode,latitude,longitude,contactName,contactPhone,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'DeliveryStop(street: $street, city: $city, governorate: $governorate, district: $district, block: $block, building: $building, postalCode: $postalCode, latitude: $latitude, longitude: $longitude, contactName: $contactName, contactPhone: $contactPhone, products: $products)';
}


}

/// @nodoc
abstract mixin class _$DeliveryStopCopyWith<$Res> implements $DeliveryStopCopyWith<$Res> {
  factory _$DeliveryStopCopyWith(_DeliveryStop value, $Res Function(_DeliveryStop) _then) = __$DeliveryStopCopyWithImpl;
@override @useResult
$Res call({
 String street, String city, String? governorate, String? district, String? block, String? building,@JsonKey(name: 'postal_code') String? postalCode, double? latitude, double? longitude,@JsonKey(name: 'contact_name') String contactName,@JsonKey(name: 'contact_phone') String contactPhone, List<LogisticsItem> products
});




}
/// @nodoc
class __$DeliveryStopCopyWithImpl<$Res>
    implements _$DeliveryStopCopyWith<$Res> {
  __$DeliveryStopCopyWithImpl(this._self, this._then);

  final _DeliveryStop _self;
  final $Res Function(_DeliveryStop) _then;

/// Create a copy of DeliveryStop
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? street = null,Object? city = null,Object? governorate = freezed,Object? district = freezed,Object? block = freezed,Object? building = freezed,Object? postalCode = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? contactName = null,Object? contactPhone = null,Object? products = null,}) {
  return _then(_DeliveryStop(
street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,governorate: freezed == governorate ? _self.governorate : governorate // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,block: freezed == block ? _self.block : block // ignore: cast_nullable_to_non_nullable
as String?,building: freezed == building ? _self.building : building // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,contactName: null == contactName ? _self.contactName : contactName // ignore: cast_nullable_to_non_nullable
as String,contactPhone: null == contactPhone ? _self.contactPhone : contactPhone // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<LogisticsItem>,
  ));
}


}


/// @nodoc
mixin _$DeliveryRequest {

@JsonKey(name: 'client_order_id') String get clientOrderId;@JsonKey(name: 'designer_id') String get designerId;@JsonKey(name: 'pickup_location_id') String get pickupLocationId;@JsonKey(name: 'delivery_address') Address? get deliveryAddress; List<LogisticsItem>? get items; List<DeliveryStop>? get stops;@JsonKey(name: 'requires_collection') bool get requiresCollection;@JsonKey(name: 'collection_amount') double? get collectionAmount;@JsonKey(name: 'special_instructions') String? get specialInstructions;@JsonKey(name: 'order_kind') OrderKind? get orderKind;@JsonKey(name: 'inventory_source') InventorySource get inventorySource;@JsonKey(name: 'packaging_profile') String? get packagingProfile;@JsonKey(name: 'requires_otp_proof') bool get requiresOtpProof;@JsonKey(name: 'delivery_otp') String? get deliveryOtp;@JsonKey(name: 'requires_photo_proof') bool get requiresPhotoProof; Map<String, dynamic>? get metadata;
/// Create a copy of DeliveryRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryRequestCopyWith<DeliveryRequest> get copyWith => _$DeliveryRequestCopyWithImpl<DeliveryRequest>(this as DeliveryRequest, _$identity);

  /// Serializes this DeliveryRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryRequest&&(identical(other.clientOrderId, clientOrderId) || other.clientOrderId == clientOrderId)&&(identical(other.designerId, designerId) || other.designerId == designerId)&&(identical(other.pickupLocationId, pickupLocationId) || other.pickupLocationId == pickupLocationId)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.stops, stops)&&(identical(other.requiresCollection, requiresCollection) || other.requiresCollection == requiresCollection)&&(identical(other.collectionAmount, collectionAmount) || other.collectionAmount == collectionAmount)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&(identical(other.orderKind, orderKind) || other.orderKind == orderKind)&&(identical(other.inventorySource, inventorySource) || other.inventorySource == inventorySource)&&(identical(other.packagingProfile, packagingProfile) || other.packagingProfile == packagingProfile)&&(identical(other.requiresOtpProof, requiresOtpProof) || other.requiresOtpProof == requiresOtpProof)&&(identical(other.deliveryOtp, deliveryOtp) || other.deliveryOtp == deliveryOtp)&&(identical(other.requiresPhotoProof, requiresPhotoProof) || other.requiresPhotoProof == requiresPhotoProof)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientOrderId,designerId,pickupLocationId,deliveryAddress,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(stops),requiresCollection,collectionAmount,specialInstructions,orderKind,inventorySource,packagingProfile,requiresOtpProof,deliveryOtp,requiresPhotoProof,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'DeliveryRequest(clientOrderId: $clientOrderId, designerId: $designerId, pickupLocationId: $pickupLocationId, deliveryAddress: $deliveryAddress, items: $items, stops: $stops, requiresCollection: $requiresCollection, collectionAmount: $collectionAmount, specialInstructions: $specialInstructions, orderKind: $orderKind, inventorySource: $inventorySource, packagingProfile: $packagingProfile, requiresOtpProof: $requiresOtpProof, deliveryOtp: $deliveryOtp, requiresPhotoProof: $requiresPhotoProof, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $DeliveryRequestCopyWith<$Res>  {
  factory $DeliveryRequestCopyWith(DeliveryRequest value, $Res Function(DeliveryRequest) _then) = _$DeliveryRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'client_order_id') String clientOrderId,@JsonKey(name: 'designer_id') String designerId,@JsonKey(name: 'pickup_location_id') String pickupLocationId,@JsonKey(name: 'delivery_address') Address? deliveryAddress, List<LogisticsItem>? items, List<DeliveryStop>? stops,@JsonKey(name: 'requires_collection') bool requiresCollection,@JsonKey(name: 'collection_amount') double? collectionAmount,@JsonKey(name: 'special_instructions') String? specialInstructions,@JsonKey(name: 'order_kind') OrderKind? orderKind,@JsonKey(name: 'inventory_source') InventorySource inventorySource,@JsonKey(name: 'packaging_profile') String? packagingProfile,@JsonKey(name: 'requires_otp_proof') bool requiresOtpProof,@JsonKey(name: 'delivery_otp') String? deliveryOtp,@JsonKey(name: 'requires_photo_proof') bool requiresPhotoProof, Map<String, dynamic>? metadata
});


$AddressCopyWith<$Res>? get deliveryAddress;

}
/// @nodoc
class _$DeliveryRequestCopyWithImpl<$Res>
    implements $DeliveryRequestCopyWith<$Res> {
  _$DeliveryRequestCopyWithImpl(this._self, this._then);

  final DeliveryRequest _self;
  final $Res Function(DeliveryRequest) _then;

/// Create a copy of DeliveryRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientOrderId = null,Object? designerId = null,Object? pickupLocationId = null,Object? deliveryAddress = freezed,Object? items = freezed,Object? stops = freezed,Object? requiresCollection = null,Object? collectionAmount = freezed,Object? specialInstructions = freezed,Object? orderKind = freezed,Object? inventorySource = null,Object? packagingProfile = freezed,Object? requiresOtpProof = null,Object? deliveryOtp = freezed,Object? requiresPhotoProof = null,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
clientOrderId: null == clientOrderId ? _self.clientOrderId : clientOrderId // ignore: cast_nullable_to_non_nullable
as String,designerId: null == designerId ? _self.designerId : designerId // ignore: cast_nullable_to_non_nullable
as String,pickupLocationId: null == pickupLocationId ? _self.pickupLocationId : pickupLocationId // ignore: cast_nullable_to_non_nullable
as String,deliveryAddress: freezed == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as Address?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<LogisticsItem>?,stops: freezed == stops ? _self.stops : stops // ignore: cast_nullable_to_non_nullable
as List<DeliveryStop>?,requiresCollection: null == requiresCollection ? _self.requiresCollection : requiresCollection // ignore: cast_nullable_to_non_nullable
as bool,collectionAmount: freezed == collectionAmount ? _self.collectionAmount : collectionAmount // ignore: cast_nullable_to_non_nullable
as double?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,orderKind: freezed == orderKind ? _self.orderKind : orderKind // ignore: cast_nullable_to_non_nullable
as OrderKind?,inventorySource: null == inventorySource ? _self.inventorySource : inventorySource // ignore: cast_nullable_to_non_nullable
as InventorySource,packagingProfile: freezed == packagingProfile ? _self.packagingProfile : packagingProfile // ignore: cast_nullable_to_non_nullable
as String?,requiresOtpProof: null == requiresOtpProof ? _self.requiresOtpProof : requiresOtpProof // ignore: cast_nullable_to_non_nullable
as bool,deliveryOtp: freezed == deliveryOtp ? _self.deliveryOtp : deliveryOtp // ignore: cast_nullable_to_non_nullable
as String?,requiresPhotoProof: null == requiresPhotoProof ? _self.requiresPhotoProof : requiresPhotoProof // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of DeliveryRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get deliveryAddress {
    if (_self.deliveryAddress == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.deliveryAddress!, (value) {
    return _then(_self.copyWith(deliveryAddress: value));
  });
}
}


/// Adds pattern-matching-related methods to [DeliveryRequest].
extension DeliveryRequestPatterns on DeliveryRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryRequest value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'client_order_id')  String clientOrderId, @JsonKey(name: 'designer_id')  String designerId, @JsonKey(name: 'pickup_location_id')  String pickupLocationId, @JsonKey(name: 'delivery_address')  Address? deliveryAddress,  List<LogisticsItem>? items,  List<DeliveryStop>? stops, @JsonKey(name: 'requires_collection')  bool requiresCollection, @JsonKey(name: 'collection_amount')  double? collectionAmount, @JsonKey(name: 'special_instructions')  String? specialInstructions, @JsonKey(name: 'order_kind')  OrderKind? orderKind, @JsonKey(name: 'inventory_source')  InventorySource inventorySource, @JsonKey(name: 'packaging_profile')  String? packagingProfile, @JsonKey(name: 'requires_otp_proof')  bool requiresOtpProof, @JsonKey(name: 'delivery_otp')  String? deliveryOtp, @JsonKey(name: 'requires_photo_proof')  bool requiresPhotoProof,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryRequest() when $default != null:
return $default(_that.clientOrderId,_that.designerId,_that.pickupLocationId,_that.deliveryAddress,_that.items,_that.stops,_that.requiresCollection,_that.collectionAmount,_that.specialInstructions,_that.orderKind,_that.inventorySource,_that.packagingProfile,_that.requiresOtpProof,_that.deliveryOtp,_that.requiresPhotoProof,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'client_order_id')  String clientOrderId, @JsonKey(name: 'designer_id')  String designerId, @JsonKey(name: 'pickup_location_id')  String pickupLocationId, @JsonKey(name: 'delivery_address')  Address? deliveryAddress,  List<LogisticsItem>? items,  List<DeliveryStop>? stops, @JsonKey(name: 'requires_collection')  bool requiresCollection, @JsonKey(name: 'collection_amount')  double? collectionAmount, @JsonKey(name: 'special_instructions')  String? specialInstructions, @JsonKey(name: 'order_kind')  OrderKind? orderKind, @JsonKey(name: 'inventory_source')  InventorySource inventorySource, @JsonKey(name: 'packaging_profile')  String? packagingProfile, @JsonKey(name: 'requires_otp_proof')  bool requiresOtpProof, @JsonKey(name: 'delivery_otp')  String? deliveryOtp, @JsonKey(name: 'requires_photo_proof')  bool requiresPhotoProof,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _DeliveryRequest():
return $default(_that.clientOrderId,_that.designerId,_that.pickupLocationId,_that.deliveryAddress,_that.items,_that.stops,_that.requiresCollection,_that.collectionAmount,_that.specialInstructions,_that.orderKind,_that.inventorySource,_that.packagingProfile,_that.requiresOtpProof,_that.deliveryOtp,_that.requiresPhotoProof,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'client_order_id')  String clientOrderId, @JsonKey(name: 'designer_id')  String designerId, @JsonKey(name: 'pickup_location_id')  String pickupLocationId, @JsonKey(name: 'delivery_address')  Address? deliveryAddress,  List<LogisticsItem>? items,  List<DeliveryStop>? stops, @JsonKey(name: 'requires_collection')  bool requiresCollection, @JsonKey(name: 'collection_amount')  double? collectionAmount, @JsonKey(name: 'special_instructions')  String? specialInstructions, @JsonKey(name: 'order_kind')  OrderKind? orderKind, @JsonKey(name: 'inventory_source')  InventorySource inventorySource, @JsonKey(name: 'packaging_profile')  String? packagingProfile, @JsonKey(name: 'requires_otp_proof')  bool requiresOtpProof, @JsonKey(name: 'delivery_otp')  String? deliveryOtp, @JsonKey(name: 'requires_photo_proof')  bool requiresPhotoProof,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryRequest() when $default != null:
return $default(_that.clientOrderId,_that.designerId,_that.pickupLocationId,_that.deliveryAddress,_that.items,_that.stops,_that.requiresCollection,_that.collectionAmount,_that.specialInstructions,_that.orderKind,_that.inventorySource,_that.packagingProfile,_that.requiresOtpProof,_that.deliveryOtp,_that.requiresPhotoProof,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _DeliveryRequest implements DeliveryRequest {
  const _DeliveryRequest({@JsonKey(name: 'client_order_id') required this.clientOrderId, @JsonKey(name: 'designer_id') required this.designerId, @JsonKey(name: 'pickup_location_id') required this.pickupLocationId, @JsonKey(name: 'delivery_address') this.deliveryAddress, final  List<LogisticsItem>? items, final  List<DeliveryStop>? stops, @JsonKey(name: 'requires_collection') this.requiresCollection = false, @JsonKey(name: 'collection_amount') this.collectionAmount, @JsonKey(name: 'special_instructions') this.specialInstructions, @JsonKey(name: 'order_kind') this.orderKind, @JsonKey(name: 'inventory_source') this.inventorySource = InventorySource.warehouse, @JsonKey(name: 'packaging_profile') this.packagingProfile, @JsonKey(name: 'requires_otp_proof') this.requiresOtpProof = true, @JsonKey(name: 'delivery_otp') this.deliveryOtp, @JsonKey(name: 'requires_photo_proof') this.requiresPhotoProof = true, final  Map<String, dynamic>? metadata}): assert(deliveryAddress != null || stops != null, 'deliveryAddress or stops is required'),assert(inventorySource == InventorySource.warehouse, 'DeliveryRequest is for warehouse inventory; use PickupRequest for designer inventory'),assert(!requiresOtpProof || deliveryOtp != null, 'deliveryOtp is required when requiresOtpProof is true'),_items = items,_stops = stops,_metadata = metadata;
  factory _DeliveryRequest.fromJson(Map<String, dynamic> json) => _$DeliveryRequestFromJson(json);

@override@JsonKey(name: 'client_order_id') final  String clientOrderId;
@override@JsonKey(name: 'designer_id') final  String designerId;
@override@JsonKey(name: 'pickup_location_id') final  String pickupLocationId;
@override@JsonKey(name: 'delivery_address') final  Address? deliveryAddress;
 final  List<LogisticsItem>? _items;
@override List<LogisticsItem>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<DeliveryStop>? _stops;
@override List<DeliveryStop>? get stops {
  final value = _stops;
  if (value == null) return null;
  if (_stops is EqualUnmodifiableListView) return _stops;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'requires_collection') final  bool requiresCollection;
@override@JsonKey(name: 'collection_amount') final  double? collectionAmount;
@override@JsonKey(name: 'special_instructions') final  String? specialInstructions;
@override@JsonKey(name: 'order_kind') final  OrderKind? orderKind;
@override@JsonKey(name: 'inventory_source') final  InventorySource inventorySource;
@override@JsonKey(name: 'packaging_profile') final  String? packagingProfile;
@override@JsonKey(name: 'requires_otp_proof') final  bool requiresOtpProof;
@override@JsonKey(name: 'delivery_otp') final  String? deliveryOtp;
@override@JsonKey(name: 'requires_photo_proof') final  bool requiresPhotoProof;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of DeliveryRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryRequestCopyWith<_DeliveryRequest> get copyWith => __$DeliveryRequestCopyWithImpl<_DeliveryRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryRequest&&(identical(other.clientOrderId, clientOrderId) || other.clientOrderId == clientOrderId)&&(identical(other.designerId, designerId) || other.designerId == designerId)&&(identical(other.pickupLocationId, pickupLocationId) || other.pickupLocationId == pickupLocationId)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._stops, _stops)&&(identical(other.requiresCollection, requiresCollection) || other.requiresCollection == requiresCollection)&&(identical(other.collectionAmount, collectionAmount) || other.collectionAmount == collectionAmount)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&(identical(other.orderKind, orderKind) || other.orderKind == orderKind)&&(identical(other.inventorySource, inventorySource) || other.inventorySource == inventorySource)&&(identical(other.packagingProfile, packagingProfile) || other.packagingProfile == packagingProfile)&&(identical(other.requiresOtpProof, requiresOtpProof) || other.requiresOtpProof == requiresOtpProof)&&(identical(other.deliveryOtp, deliveryOtp) || other.deliveryOtp == deliveryOtp)&&(identical(other.requiresPhotoProof, requiresPhotoProof) || other.requiresPhotoProof == requiresPhotoProof)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientOrderId,designerId,pickupLocationId,deliveryAddress,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_stops),requiresCollection,collectionAmount,specialInstructions,orderKind,inventorySource,packagingProfile,requiresOtpProof,deliveryOtp,requiresPhotoProof,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'DeliveryRequest(clientOrderId: $clientOrderId, designerId: $designerId, pickupLocationId: $pickupLocationId, deliveryAddress: $deliveryAddress, items: $items, stops: $stops, requiresCollection: $requiresCollection, collectionAmount: $collectionAmount, specialInstructions: $specialInstructions, orderKind: $orderKind, inventorySource: $inventorySource, packagingProfile: $packagingProfile, requiresOtpProof: $requiresOtpProof, deliveryOtp: $deliveryOtp, requiresPhotoProof: $requiresPhotoProof, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$DeliveryRequestCopyWith<$Res> implements $DeliveryRequestCopyWith<$Res> {
  factory _$DeliveryRequestCopyWith(_DeliveryRequest value, $Res Function(_DeliveryRequest) _then) = __$DeliveryRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'client_order_id') String clientOrderId,@JsonKey(name: 'designer_id') String designerId,@JsonKey(name: 'pickup_location_id') String pickupLocationId,@JsonKey(name: 'delivery_address') Address? deliveryAddress, List<LogisticsItem>? items, List<DeliveryStop>? stops,@JsonKey(name: 'requires_collection') bool requiresCollection,@JsonKey(name: 'collection_amount') double? collectionAmount,@JsonKey(name: 'special_instructions') String? specialInstructions,@JsonKey(name: 'order_kind') OrderKind? orderKind,@JsonKey(name: 'inventory_source') InventorySource inventorySource,@JsonKey(name: 'packaging_profile') String? packagingProfile,@JsonKey(name: 'requires_otp_proof') bool requiresOtpProof,@JsonKey(name: 'delivery_otp') String? deliveryOtp,@JsonKey(name: 'requires_photo_proof') bool requiresPhotoProof, Map<String, dynamic>? metadata
});


@override $AddressCopyWith<$Res>? get deliveryAddress;

}
/// @nodoc
class __$DeliveryRequestCopyWithImpl<$Res>
    implements _$DeliveryRequestCopyWith<$Res> {
  __$DeliveryRequestCopyWithImpl(this._self, this._then);

  final _DeliveryRequest _self;
  final $Res Function(_DeliveryRequest) _then;

/// Create a copy of DeliveryRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientOrderId = null,Object? designerId = null,Object? pickupLocationId = null,Object? deliveryAddress = freezed,Object? items = freezed,Object? stops = freezed,Object? requiresCollection = null,Object? collectionAmount = freezed,Object? specialInstructions = freezed,Object? orderKind = freezed,Object? inventorySource = null,Object? packagingProfile = freezed,Object? requiresOtpProof = null,Object? deliveryOtp = freezed,Object? requiresPhotoProof = null,Object? metadata = freezed,}) {
  return _then(_DeliveryRequest(
clientOrderId: null == clientOrderId ? _self.clientOrderId : clientOrderId // ignore: cast_nullable_to_non_nullable
as String,designerId: null == designerId ? _self.designerId : designerId // ignore: cast_nullable_to_non_nullable
as String,pickupLocationId: null == pickupLocationId ? _self.pickupLocationId : pickupLocationId // ignore: cast_nullable_to_non_nullable
as String,deliveryAddress: freezed == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as Address?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<LogisticsItem>?,stops: freezed == stops ? _self._stops : stops // ignore: cast_nullable_to_non_nullable
as List<DeliveryStop>?,requiresCollection: null == requiresCollection ? _self.requiresCollection : requiresCollection // ignore: cast_nullable_to_non_nullable
as bool,collectionAmount: freezed == collectionAmount ? _self.collectionAmount : collectionAmount // ignore: cast_nullable_to_non_nullable
as double?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,orderKind: freezed == orderKind ? _self.orderKind : orderKind // ignore: cast_nullable_to_non_nullable
as OrderKind?,inventorySource: null == inventorySource ? _self.inventorySource : inventorySource // ignore: cast_nullable_to_non_nullable
as InventorySource,packagingProfile: freezed == packagingProfile ? _self.packagingProfile : packagingProfile // ignore: cast_nullable_to_non_nullable
as String?,requiresOtpProof: null == requiresOtpProof ? _self.requiresOtpProof : requiresOtpProof // ignore: cast_nullable_to_non_nullable
as bool,deliveryOtp: freezed == deliveryOtp ? _self.deliveryOtp : deliveryOtp // ignore: cast_nullable_to_non_nullable
as String?,requiresPhotoProof: null == requiresPhotoProof ? _self.requiresPhotoProof : requiresPhotoProof // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of DeliveryRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get deliveryAddress {
    if (_self.deliveryAddress == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.deliveryAddress!, (value) {
    return _then(_self.copyWith(deliveryAddress: value));
  });
}
}

// dart format on
