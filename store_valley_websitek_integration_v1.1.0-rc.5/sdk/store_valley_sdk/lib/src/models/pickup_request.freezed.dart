// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pickup_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PickupRequest {

@JsonKey(name: 'external_request_id') String get externalRequestId;@JsonKey(name: 'source_order_id') String? get sourceOrderId;@JsonKey(name: 'pickup_purpose') PickupPurpose get pickupPurpose;@JsonKey(name: 'order_kind') OrderKind? get orderKind; Designer get designer;@JsonKey(name: 'delivery_address') Address get deliveryAddress; Customer? get customer; List<LogisticsItem> get items;@JsonKey(name: 'requested_pickup_at') DateTime? get requestedPickupAt;@JsonKey(name: 'requires_collection') bool get requiresCollection;@JsonKey(name: 'collection_amount') double? get collectionAmount;@JsonKey(name: 'requires_otp_proof') bool get requiresOtpProof;@JsonKey(name: 'delivery_otp') String? get deliveryOtp;@JsonKey(name: 'requires_photo_proof') bool get requiresPhotoProof;@JsonKey(name: 'packaging_profile') String? get packagingProfile;@JsonKey(name: 'special_instructions') String? get specialInstructions; Map<String, dynamic>? get metadata;
/// Create a copy of PickupRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PickupRequestCopyWith<PickupRequest> get copyWith => _$PickupRequestCopyWithImpl<PickupRequest>(this as PickupRequest, _$identity);

  /// Serializes this PickupRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickupRequest&&(identical(other.externalRequestId, externalRequestId) || other.externalRequestId == externalRequestId)&&(identical(other.sourceOrderId, sourceOrderId) || other.sourceOrderId == sourceOrderId)&&(identical(other.pickupPurpose, pickupPurpose) || other.pickupPurpose == pickupPurpose)&&(identical(other.orderKind, orderKind) || other.orderKind == orderKind)&&(identical(other.designer, designer) || other.designer == designer)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.customer, customer) || other.customer == customer)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.requestedPickupAt, requestedPickupAt) || other.requestedPickupAt == requestedPickupAt)&&(identical(other.requiresCollection, requiresCollection) || other.requiresCollection == requiresCollection)&&(identical(other.collectionAmount, collectionAmount) || other.collectionAmount == collectionAmount)&&(identical(other.requiresOtpProof, requiresOtpProof) || other.requiresOtpProof == requiresOtpProof)&&(identical(other.deliveryOtp, deliveryOtp) || other.deliveryOtp == deliveryOtp)&&(identical(other.requiresPhotoProof, requiresPhotoProof) || other.requiresPhotoProof == requiresPhotoProof)&&(identical(other.packagingProfile, packagingProfile) || other.packagingProfile == packagingProfile)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,externalRequestId,sourceOrderId,pickupPurpose,orderKind,designer,deliveryAddress,customer,const DeepCollectionEquality().hash(items),requestedPickupAt,requiresCollection,collectionAmount,requiresOtpProof,deliveryOtp,requiresPhotoProof,packagingProfile,specialInstructions,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'PickupRequest(externalRequestId: $externalRequestId, sourceOrderId: $sourceOrderId, pickupPurpose: $pickupPurpose, orderKind: $orderKind, designer: $designer, deliveryAddress: $deliveryAddress, customer: $customer, items: $items, requestedPickupAt: $requestedPickupAt, requiresCollection: $requiresCollection, collectionAmount: $collectionAmount, requiresOtpProof: $requiresOtpProof, deliveryOtp: $deliveryOtp, requiresPhotoProof: $requiresPhotoProof, packagingProfile: $packagingProfile, specialInstructions: $specialInstructions, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $PickupRequestCopyWith<$Res>  {
  factory $PickupRequestCopyWith(PickupRequest value, $Res Function(PickupRequest) _then) = _$PickupRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'external_request_id') String externalRequestId,@JsonKey(name: 'source_order_id') String? sourceOrderId,@JsonKey(name: 'pickup_purpose') PickupPurpose pickupPurpose,@JsonKey(name: 'order_kind') OrderKind? orderKind, Designer designer,@JsonKey(name: 'delivery_address') Address deliveryAddress, Customer? customer, List<LogisticsItem> items,@JsonKey(name: 'requested_pickup_at') DateTime? requestedPickupAt,@JsonKey(name: 'requires_collection') bool requiresCollection,@JsonKey(name: 'collection_amount') double? collectionAmount,@JsonKey(name: 'requires_otp_proof') bool requiresOtpProof,@JsonKey(name: 'delivery_otp') String? deliveryOtp,@JsonKey(name: 'requires_photo_proof') bool requiresPhotoProof,@JsonKey(name: 'packaging_profile') String? packagingProfile,@JsonKey(name: 'special_instructions') String? specialInstructions, Map<String, dynamic>? metadata
});


$DesignerCopyWith<$Res> get designer;$AddressCopyWith<$Res> get deliveryAddress;$CustomerCopyWith<$Res>? get customer;

}
/// @nodoc
class _$PickupRequestCopyWithImpl<$Res>
    implements $PickupRequestCopyWith<$Res> {
  _$PickupRequestCopyWithImpl(this._self, this._then);

  final PickupRequest _self;
  final $Res Function(PickupRequest) _then;

/// Create a copy of PickupRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? externalRequestId = null,Object? sourceOrderId = freezed,Object? pickupPurpose = null,Object? orderKind = freezed,Object? designer = null,Object? deliveryAddress = null,Object? customer = freezed,Object? items = null,Object? requestedPickupAt = freezed,Object? requiresCollection = null,Object? collectionAmount = freezed,Object? requiresOtpProof = null,Object? deliveryOtp = freezed,Object? requiresPhotoProof = null,Object? packagingProfile = freezed,Object? specialInstructions = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
externalRequestId: null == externalRequestId ? _self.externalRequestId : externalRequestId // ignore: cast_nullable_to_non_nullable
as String,sourceOrderId: freezed == sourceOrderId ? _self.sourceOrderId : sourceOrderId // ignore: cast_nullable_to_non_nullable
as String?,pickupPurpose: null == pickupPurpose ? _self.pickupPurpose : pickupPurpose // ignore: cast_nullable_to_non_nullable
as PickupPurpose,orderKind: freezed == orderKind ? _self.orderKind : orderKind // ignore: cast_nullable_to_non_nullable
as OrderKind?,designer: null == designer ? _self.designer : designer // ignore: cast_nullable_to_non_nullable
as Designer,deliveryAddress: null == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as Address,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as Customer?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<LogisticsItem>,requestedPickupAt: freezed == requestedPickupAt ? _self.requestedPickupAt : requestedPickupAt // ignore: cast_nullable_to_non_nullable
as DateTime?,requiresCollection: null == requiresCollection ? _self.requiresCollection : requiresCollection // ignore: cast_nullable_to_non_nullable
as bool,collectionAmount: freezed == collectionAmount ? _self.collectionAmount : collectionAmount // ignore: cast_nullable_to_non_nullable
as double?,requiresOtpProof: null == requiresOtpProof ? _self.requiresOtpProof : requiresOtpProof // ignore: cast_nullable_to_non_nullable
as bool,deliveryOtp: freezed == deliveryOtp ? _self.deliveryOtp : deliveryOtp // ignore: cast_nullable_to_non_nullable
as String?,requiresPhotoProof: null == requiresPhotoProof ? _self.requiresPhotoProof : requiresPhotoProof // ignore: cast_nullable_to_non_nullable
as bool,packagingProfile: freezed == packagingProfile ? _self.packagingProfile : packagingProfile // ignore: cast_nullable_to_non_nullable
as String?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of PickupRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignerCopyWith<$Res> get designer {

  return $DesignerCopyWith<$Res>(_self.designer, (value) {
    return _then(_self.copyWith(designer: value));
  });
}/// Create a copy of PickupRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get deliveryAddress {

  return $AddressCopyWith<$Res>(_self.deliveryAddress, (value) {
    return _then(_self.copyWith(deliveryAddress: value));
  });
}/// Create a copy of PickupRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}


/// Adds pattern-matching-related methods to [PickupRequest].
extension PickupRequestPatterns on PickupRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PickupRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickupRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PickupRequest value)  $default,){
final _that = this;
switch (_that) {
case _PickupRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PickupRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PickupRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'external_request_id')  String externalRequestId, @JsonKey(name: 'source_order_id')  String? sourceOrderId, @JsonKey(name: 'pickup_purpose')  PickupPurpose pickupPurpose, @JsonKey(name: 'order_kind')  OrderKind? orderKind,  Designer designer, @JsonKey(name: 'delivery_address')  Address deliveryAddress,  Customer? customer,  List<LogisticsItem> items, @JsonKey(name: 'requested_pickup_at')  DateTime? requestedPickupAt, @JsonKey(name: 'requires_collection')  bool requiresCollection, @JsonKey(name: 'collection_amount')  double? collectionAmount, @JsonKey(name: 'requires_otp_proof')  bool requiresOtpProof, @JsonKey(name: 'delivery_otp')  String? deliveryOtp, @JsonKey(name: 'requires_photo_proof')  bool requiresPhotoProof, @JsonKey(name: 'packaging_profile')  String? packagingProfile, @JsonKey(name: 'special_instructions')  String? specialInstructions,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickupRequest() when $default != null:
return $default(_that.externalRequestId,_that.sourceOrderId,_that.pickupPurpose,_that.orderKind,_that.designer,_that.deliveryAddress,_that.customer,_that.items,_that.requestedPickupAt,_that.requiresCollection,_that.collectionAmount,_that.requiresOtpProof,_that.deliveryOtp,_that.requiresPhotoProof,_that.packagingProfile,_that.specialInstructions,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'external_request_id')  String externalRequestId, @JsonKey(name: 'source_order_id')  String? sourceOrderId, @JsonKey(name: 'pickup_purpose')  PickupPurpose pickupPurpose, @JsonKey(name: 'order_kind')  OrderKind? orderKind,  Designer designer, @JsonKey(name: 'delivery_address')  Address deliveryAddress,  Customer? customer,  List<LogisticsItem> items, @JsonKey(name: 'requested_pickup_at')  DateTime? requestedPickupAt, @JsonKey(name: 'requires_collection')  bool requiresCollection, @JsonKey(name: 'collection_amount')  double? collectionAmount, @JsonKey(name: 'requires_otp_proof')  bool requiresOtpProof, @JsonKey(name: 'delivery_otp')  String? deliveryOtp, @JsonKey(name: 'requires_photo_proof')  bool requiresPhotoProof, @JsonKey(name: 'packaging_profile')  String? packagingProfile, @JsonKey(name: 'special_instructions')  String? specialInstructions,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _PickupRequest():
return $default(_that.externalRequestId,_that.sourceOrderId,_that.pickupPurpose,_that.orderKind,_that.designer,_that.deliveryAddress,_that.customer,_that.items,_that.requestedPickupAt,_that.requiresCollection,_that.collectionAmount,_that.requiresOtpProof,_that.deliveryOtp,_that.requiresPhotoProof,_that.packagingProfile,_that.specialInstructions,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'external_request_id')  String externalRequestId, @JsonKey(name: 'source_order_id')  String? sourceOrderId, @JsonKey(name: 'pickup_purpose')  PickupPurpose pickupPurpose, @JsonKey(name: 'order_kind')  OrderKind? orderKind,  Designer designer, @JsonKey(name: 'delivery_address')  Address deliveryAddress,  Customer? customer,  List<LogisticsItem> items, @JsonKey(name: 'requested_pickup_at')  DateTime? requestedPickupAt, @JsonKey(name: 'requires_collection')  bool requiresCollection, @JsonKey(name: 'collection_amount')  double? collectionAmount, @JsonKey(name: 'requires_otp_proof')  bool requiresOtpProof, @JsonKey(name: 'delivery_otp')  String? deliveryOtp, @JsonKey(name: 'requires_photo_proof')  bool requiresPhotoProof, @JsonKey(name: 'packaging_profile')  String? packagingProfile, @JsonKey(name: 'special_instructions')  String? specialInstructions,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _PickupRequest() when $default != null:
return $default(_that.externalRequestId,_that.sourceOrderId,_that.pickupPurpose,_that.orderKind,_that.designer,_that.deliveryAddress,_that.customer,_that.items,_that.requestedPickupAt,_that.requiresCollection,_that.collectionAmount,_that.requiresOtpProof,_that.deliveryOtp,_that.requiresPhotoProof,_that.packagingProfile,_that.specialInstructions,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _PickupRequest implements PickupRequest {
  const _PickupRequest({@JsonKey(name: 'external_request_id') required this.externalRequestId, @JsonKey(name: 'source_order_id') this.sourceOrderId, @JsonKey(name: 'pickup_purpose') this.pickupPurpose = PickupPurpose.designerOrderFulfillment, @JsonKey(name: 'order_kind') this.orderKind, required this.designer, @JsonKey(name: 'delivery_address') required this.deliveryAddress, this.customer, required final  List<LogisticsItem> items, @JsonKey(name: 'requested_pickup_at') this.requestedPickupAt, @JsonKey(name: 'requires_collection') this.requiresCollection = false, @JsonKey(name: 'collection_amount') this.collectionAmount, @JsonKey(name: 'requires_otp_proof') this.requiresOtpProof = true, @JsonKey(name: 'delivery_otp') this.deliveryOtp, @JsonKey(name: 'requires_photo_proof') this.requiresPhotoProof = true, @JsonKey(name: 'packaging_profile') this.packagingProfile, @JsonKey(name: 'special_instructions') this.specialInstructions, final  Map<String, dynamic>? metadata}): assert(!requiresOtpProof || deliveryOtp != null, 'deliveryOtp is required when requiresOtpProof is true'),_items = items,_metadata = metadata;
  factory _PickupRequest.fromJson(Map<String, dynamic> json) => _$PickupRequestFromJson(json);

@override@JsonKey(name: 'external_request_id') final  String externalRequestId;
@override@JsonKey(name: 'source_order_id') final  String? sourceOrderId;
@override@JsonKey(name: 'pickup_purpose') final  PickupPurpose pickupPurpose;
@override@JsonKey(name: 'order_kind') final  OrderKind? orderKind;
@override final  Designer designer;
@override@JsonKey(name: 'delivery_address') final  Address deliveryAddress;
@override final  Customer? customer;
 final  List<LogisticsItem> _items;
@override List<LogisticsItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'requested_pickup_at') final  DateTime? requestedPickupAt;
@override@JsonKey(name: 'requires_collection') final  bool requiresCollection;
@override@JsonKey(name: 'collection_amount') final  double? collectionAmount;
@override@JsonKey(name: 'requires_otp_proof') final  bool requiresOtpProof;
@override@JsonKey(name: 'delivery_otp') final  String? deliveryOtp;
@override@JsonKey(name: 'requires_photo_proof') final  bool requiresPhotoProof;
@override@JsonKey(name: 'packaging_profile') final  String? packagingProfile;
@override@JsonKey(name: 'special_instructions') final  String? specialInstructions;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of PickupRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PickupRequestCopyWith<_PickupRequest> get copyWith => __$PickupRequestCopyWithImpl<_PickupRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PickupRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickupRequest&&(identical(other.externalRequestId, externalRequestId) || other.externalRequestId == externalRequestId)&&(identical(other.sourceOrderId, sourceOrderId) || other.sourceOrderId == sourceOrderId)&&(identical(other.pickupPurpose, pickupPurpose) || other.pickupPurpose == pickupPurpose)&&(identical(other.orderKind, orderKind) || other.orderKind == orderKind)&&(identical(other.designer, designer) || other.designer == designer)&&(identical(other.deliveryAddress, deliveryAddress) || other.deliveryAddress == deliveryAddress)&&(identical(other.customer, customer) || other.customer == customer)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.requestedPickupAt, requestedPickupAt) || other.requestedPickupAt == requestedPickupAt)&&(identical(other.requiresCollection, requiresCollection) || other.requiresCollection == requiresCollection)&&(identical(other.collectionAmount, collectionAmount) || other.collectionAmount == collectionAmount)&&(identical(other.requiresOtpProof, requiresOtpProof) || other.requiresOtpProof == requiresOtpProof)&&(identical(other.deliveryOtp, deliveryOtp) || other.deliveryOtp == deliveryOtp)&&(identical(other.requiresPhotoProof, requiresPhotoProof) || other.requiresPhotoProof == requiresPhotoProof)&&(identical(other.packagingProfile, packagingProfile) || other.packagingProfile == packagingProfile)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,externalRequestId,sourceOrderId,pickupPurpose,orderKind,designer,deliveryAddress,customer,const DeepCollectionEquality().hash(_items),requestedPickupAt,requiresCollection,collectionAmount,requiresOtpProof,deliveryOtp,requiresPhotoProof,packagingProfile,specialInstructions,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'PickupRequest(externalRequestId: $externalRequestId, sourceOrderId: $sourceOrderId, pickupPurpose: $pickupPurpose, orderKind: $orderKind, designer: $designer, deliveryAddress: $deliveryAddress, customer: $customer, items: $items, requestedPickupAt: $requestedPickupAt, requiresCollection: $requiresCollection, collectionAmount: $collectionAmount, requiresOtpProof: $requiresOtpProof, deliveryOtp: $deliveryOtp, requiresPhotoProof: $requiresPhotoProof, packagingProfile: $packagingProfile, specialInstructions: $specialInstructions, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$PickupRequestCopyWith<$Res> implements $PickupRequestCopyWith<$Res> {
  factory _$PickupRequestCopyWith(_PickupRequest value, $Res Function(_PickupRequest) _then) = __$PickupRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'external_request_id') String externalRequestId,@JsonKey(name: 'source_order_id') String? sourceOrderId,@JsonKey(name: 'pickup_purpose') PickupPurpose pickupPurpose,@JsonKey(name: 'order_kind') OrderKind? orderKind, Designer designer,@JsonKey(name: 'delivery_address') Address deliveryAddress, Customer? customer, List<LogisticsItem> items,@JsonKey(name: 'requested_pickup_at') DateTime? requestedPickupAt,@JsonKey(name: 'requires_collection') bool requiresCollection,@JsonKey(name: 'collection_amount') double? collectionAmount,@JsonKey(name: 'requires_otp_proof') bool requiresOtpProof,@JsonKey(name: 'delivery_otp') String? deliveryOtp,@JsonKey(name: 'requires_photo_proof') bool requiresPhotoProof,@JsonKey(name: 'packaging_profile') String? packagingProfile,@JsonKey(name: 'special_instructions') String? specialInstructions, Map<String, dynamic>? metadata
});


@override $DesignerCopyWith<$Res> get designer;@override $AddressCopyWith<$Res> get deliveryAddress;@override $CustomerCopyWith<$Res>? get customer;

}
/// @nodoc
class __$PickupRequestCopyWithImpl<$Res>
    implements _$PickupRequestCopyWith<$Res> {
  __$PickupRequestCopyWithImpl(this._self, this._then);

  final _PickupRequest _self;
  final $Res Function(_PickupRequest) _then;

/// Create a copy of PickupRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? externalRequestId = null,Object? sourceOrderId = freezed,Object? pickupPurpose = null,Object? orderKind = freezed,Object? designer = null,Object? deliveryAddress = null,Object? customer = freezed,Object? items = null,Object? requestedPickupAt = freezed,Object? requiresCollection = null,Object? collectionAmount = freezed,Object? requiresOtpProof = null,Object? deliveryOtp = freezed,Object? requiresPhotoProof = null,Object? packagingProfile = freezed,Object? specialInstructions = freezed,Object? metadata = freezed,}) {
  return _then(_PickupRequest(
externalRequestId: null == externalRequestId ? _self.externalRequestId : externalRequestId // ignore: cast_nullable_to_non_nullable
as String,sourceOrderId: freezed == sourceOrderId ? _self.sourceOrderId : sourceOrderId // ignore: cast_nullable_to_non_nullable
as String?,pickupPurpose: null == pickupPurpose ? _self.pickupPurpose : pickupPurpose // ignore: cast_nullable_to_non_nullable
as PickupPurpose,orderKind: freezed == orderKind ? _self.orderKind : orderKind // ignore: cast_nullable_to_non_nullable
as OrderKind?,designer: null == designer ? _self.designer : designer // ignore: cast_nullable_to_non_nullable
as Designer,deliveryAddress: null == deliveryAddress ? _self.deliveryAddress : deliveryAddress // ignore: cast_nullable_to_non_nullable
as Address,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as Customer?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<LogisticsItem>,requestedPickupAt: freezed == requestedPickupAt ? _self.requestedPickupAt : requestedPickupAt // ignore: cast_nullable_to_non_nullable
as DateTime?,requiresCollection: null == requiresCollection ? _self.requiresCollection : requiresCollection // ignore: cast_nullable_to_non_nullable
as bool,collectionAmount: freezed == collectionAmount ? _self.collectionAmount : collectionAmount // ignore: cast_nullable_to_non_nullable
as double?,requiresOtpProof: null == requiresOtpProof ? _self.requiresOtpProof : requiresOtpProof // ignore: cast_nullable_to_non_nullable
as bool,deliveryOtp: freezed == deliveryOtp ? _self.deliveryOtp : deliveryOtp // ignore: cast_nullable_to_non_nullable
as String?,requiresPhotoProof: null == requiresPhotoProof ? _self.requiresPhotoProof : requiresPhotoProof // ignore: cast_nullable_to_non_nullable
as bool,packagingProfile: freezed == packagingProfile ? _self.packagingProfile : packagingProfile // ignore: cast_nullable_to_non_nullable
as String?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of PickupRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignerCopyWith<$Res> get designer {

  return $DesignerCopyWith<$Res>(_self.designer, (value) {
    return _then(_self.copyWith(designer: value));
  });
}/// Create a copy of PickupRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get deliveryAddress {

  return $AddressCopyWith<$Res>(_self.deliveryAddress, (value) {
    return _then(_self.copyWith(deliveryAddress: value));
  });
}/// Create a copy of PickupRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}
}

// dart format on
