// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReturnRequest {

@JsonKey(name: 'external_request_id') String get externalRequestId;@JsonKey(name: 'source_order_id') String get sourceOrderId;@JsonKey(name: 'designer_id') String get designerId;@JsonKey(name: 'original_source_location_id') String get originalSourceLocationId;@JsonKey(name: 'return_type') ReturnType get returnType;@JsonKey(name: 'original_inventory_source') InventorySource? get originalInventorySource;@JsonKey(name: 'warehouse_id') String? get warehouseId;@JsonKey(name: 'designer_return_address') Address? get designerReturnAddress;@JsonKey(name: 'customer_pickup_address') Address get customerPickupAddress; List<LogisticsItem> get items; String? get reason;@JsonKey(name: 'requested_pickup_at') DateTime? get requestedPickupAt;@JsonKey(name: 'special_instructions') String? get specialInstructions; Map<String, dynamic>? get metadata;
/// Create a copy of ReturnRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReturnRequestCopyWith<ReturnRequest> get copyWith => _$ReturnRequestCopyWithImpl<ReturnRequest>(this as ReturnRequest, _$identity);

  /// Serializes this ReturnRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReturnRequest&&(identical(other.externalRequestId, externalRequestId) || other.externalRequestId == externalRequestId)&&(identical(other.sourceOrderId, sourceOrderId) || other.sourceOrderId == sourceOrderId)&&(identical(other.designerId, designerId) || other.designerId == designerId)&&(identical(other.originalSourceLocationId, originalSourceLocationId) || other.originalSourceLocationId == originalSourceLocationId)&&(identical(other.returnType, returnType) || other.returnType == returnType)&&(identical(other.originalInventorySource, originalInventorySource) || other.originalInventorySource == originalInventorySource)&&(identical(other.warehouseId, warehouseId) || other.warehouseId == warehouseId)&&(identical(other.designerReturnAddress, designerReturnAddress) || other.designerReturnAddress == designerReturnAddress)&&(identical(other.customerPickupAddress, customerPickupAddress) || other.customerPickupAddress == customerPickupAddress)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requestedPickupAt, requestedPickupAt) || other.requestedPickupAt == requestedPickupAt)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,externalRequestId,sourceOrderId,designerId,originalSourceLocationId,returnType,originalInventorySource,warehouseId,designerReturnAddress,customerPickupAddress,const DeepCollectionEquality().hash(items),reason,requestedPickupAt,specialInstructions,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ReturnRequest(externalRequestId: $externalRequestId, sourceOrderId: $sourceOrderId, designerId: $designerId, originalSourceLocationId: $originalSourceLocationId, returnType: $returnType, originalInventorySource: $originalInventorySource, warehouseId: $warehouseId, designerReturnAddress: $designerReturnAddress, customerPickupAddress: $customerPickupAddress, items: $items, reason: $reason, requestedPickupAt: $requestedPickupAt, specialInstructions: $specialInstructions, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ReturnRequestCopyWith<$Res>  {
  factory $ReturnRequestCopyWith(ReturnRequest value, $Res Function(ReturnRequest) _then) = _$ReturnRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'external_request_id') String externalRequestId,@JsonKey(name: 'source_order_id') String sourceOrderId,@JsonKey(name: 'designer_id') String designerId,@JsonKey(name: 'original_source_location_id') String originalSourceLocationId,@JsonKey(name: 'return_type') ReturnType returnType,@JsonKey(name: 'original_inventory_source') InventorySource? originalInventorySource,@JsonKey(name: 'warehouse_id') String? warehouseId,@JsonKey(name: 'designer_return_address') Address? designerReturnAddress,@JsonKey(name: 'customer_pickup_address') Address customerPickupAddress, List<LogisticsItem> items, String? reason,@JsonKey(name: 'requested_pickup_at') DateTime? requestedPickupAt,@JsonKey(name: 'special_instructions') String? specialInstructions, Map<String, dynamic>? metadata
});


$AddressCopyWith<$Res>? get designerReturnAddress;$AddressCopyWith<$Res> get customerPickupAddress;

}
/// @nodoc
class _$ReturnRequestCopyWithImpl<$Res>
    implements $ReturnRequestCopyWith<$Res> {
  _$ReturnRequestCopyWithImpl(this._self, this._then);

  final ReturnRequest _self;
  final $Res Function(ReturnRequest) _then;

/// Create a copy of ReturnRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? externalRequestId = null,Object? sourceOrderId = null,Object? designerId = null,Object? originalSourceLocationId = null,Object? returnType = null,Object? originalInventorySource = freezed,Object? warehouseId = freezed,Object? designerReturnAddress = freezed,Object? customerPickupAddress = null,Object? items = null,Object? reason = freezed,Object? requestedPickupAt = freezed,Object? specialInstructions = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
externalRequestId: null == externalRequestId ? _self.externalRequestId : externalRequestId // ignore: cast_nullable_to_non_nullable
as String,sourceOrderId: null == sourceOrderId ? _self.sourceOrderId : sourceOrderId // ignore: cast_nullable_to_non_nullable
as String,designerId: null == designerId ? _self.designerId : designerId // ignore: cast_nullable_to_non_nullable
as String,originalSourceLocationId: null == originalSourceLocationId ? _self.originalSourceLocationId : originalSourceLocationId // ignore: cast_nullable_to_non_nullable
as String,returnType: null == returnType ? _self.returnType : returnType // ignore: cast_nullable_to_non_nullable
as ReturnType,originalInventorySource: freezed == originalInventorySource ? _self.originalInventorySource : originalInventorySource // ignore: cast_nullable_to_non_nullable
as InventorySource?,warehouseId: freezed == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as String?,designerReturnAddress: freezed == designerReturnAddress ? _self.designerReturnAddress : designerReturnAddress // ignore: cast_nullable_to_non_nullable
as Address?,customerPickupAddress: null == customerPickupAddress ? _self.customerPickupAddress : customerPickupAddress // ignore: cast_nullable_to_non_nullable
as Address,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<LogisticsItem>,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,requestedPickupAt: freezed == requestedPickupAt ? _self.requestedPickupAt : requestedPickupAt // ignore: cast_nullable_to_non_nullable
as DateTime?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of ReturnRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get designerReturnAddress {
    if (_self.designerReturnAddress == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.designerReturnAddress!, (value) {
    return _then(_self.copyWith(designerReturnAddress: value));
  });
}/// Create a copy of ReturnRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get customerPickupAddress {

  return $AddressCopyWith<$Res>(_self.customerPickupAddress, (value) {
    return _then(_self.copyWith(customerPickupAddress: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReturnRequest].
extension ReturnRequestPatterns on ReturnRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReturnRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReturnRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReturnRequest value)  $default,){
final _that = this;
switch (_that) {
case _ReturnRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReturnRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ReturnRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'external_request_id')  String externalRequestId, @JsonKey(name: 'source_order_id')  String sourceOrderId, @JsonKey(name: 'designer_id')  String designerId, @JsonKey(name: 'original_source_location_id')  String originalSourceLocationId, @JsonKey(name: 'return_type')  ReturnType returnType, @JsonKey(name: 'original_inventory_source')  InventorySource? originalInventorySource, @JsonKey(name: 'warehouse_id')  String? warehouseId, @JsonKey(name: 'designer_return_address')  Address? designerReturnAddress, @JsonKey(name: 'customer_pickup_address')  Address customerPickupAddress,  List<LogisticsItem> items,  String? reason, @JsonKey(name: 'requested_pickup_at')  DateTime? requestedPickupAt, @JsonKey(name: 'special_instructions')  String? specialInstructions,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReturnRequest() when $default != null:
return $default(_that.externalRequestId,_that.sourceOrderId,_that.designerId,_that.originalSourceLocationId,_that.returnType,_that.originalInventorySource,_that.warehouseId,_that.designerReturnAddress,_that.customerPickupAddress,_that.items,_that.reason,_that.requestedPickupAt,_that.specialInstructions,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'external_request_id')  String externalRequestId, @JsonKey(name: 'source_order_id')  String sourceOrderId, @JsonKey(name: 'designer_id')  String designerId, @JsonKey(name: 'original_source_location_id')  String originalSourceLocationId, @JsonKey(name: 'return_type')  ReturnType returnType, @JsonKey(name: 'original_inventory_source')  InventorySource? originalInventorySource, @JsonKey(name: 'warehouse_id')  String? warehouseId, @JsonKey(name: 'designer_return_address')  Address? designerReturnAddress, @JsonKey(name: 'customer_pickup_address')  Address customerPickupAddress,  List<LogisticsItem> items,  String? reason, @JsonKey(name: 'requested_pickup_at')  DateTime? requestedPickupAt, @JsonKey(name: 'special_instructions')  String? specialInstructions,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _ReturnRequest():
return $default(_that.externalRequestId,_that.sourceOrderId,_that.designerId,_that.originalSourceLocationId,_that.returnType,_that.originalInventorySource,_that.warehouseId,_that.designerReturnAddress,_that.customerPickupAddress,_that.items,_that.reason,_that.requestedPickupAt,_that.specialInstructions,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'external_request_id')  String externalRequestId, @JsonKey(name: 'source_order_id')  String sourceOrderId, @JsonKey(name: 'designer_id')  String designerId, @JsonKey(name: 'original_source_location_id')  String originalSourceLocationId, @JsonKey(name: 'return_type')  ReturnType returnType, @JsonKey(name: 'original_inventory_source')  InventorySource? originalInventorySource, @JsonKey(name: 'warehouse_id')  String? warehouseId, @JsonKey(name: 'designer_return_address')  Address? designerReturnAddress, @JsonKey(name: 'customer_pickup_address')  Address customerPickupAddress,  List<LogisticsItem> items,  String? reason, @JsonKey(name: 'requested_pickup_at')  DateTime? requestedPickupAt, @JsonKey(name: 'special_instructions')  String? specialInstructions,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _ReturnRequest() when $default != null:
return $default(_that.externalRequestId,_that.sourceOrderId,_that.designerId,_that.originalSourceLocationId,_that.returnType,_that.originalInventorySource,_that.warehouseId,_that.designerReturnAddress,_that.customerPickupAddress,_that.items,_that.reason,_that.requestedPickupAt,_that.specialInstructions,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ReturnRequest implements ReturnRequest {
  const _ReturnRequest({@JsonKey(name: 'external_request_id') required this.externalRequestId, @JsonKey(name: 'source_order_id') required this.sourceOrderId, @JsonKey(name: 'designer_id') required this.designerId, @JsonKey(name: 'original_source_location_id') required this.originalSourceLocationId, @JsonKey(name: 'return_type') this.returnType = ReturnType.returnRequest, @JsonKey(name: 'original_inventory_source') this.originalInventorySource, @JsonKey(name: 'warehouse_id') this.warehouseId, @JsonKey(name: 'designer_return_address') this.designerReturnAddress, @JsonKey(name: 'customer_pickup_address') required this.customerPickupAddress, required final  List<LogisticsItem> items, this.reason, @JsonKey(name: 'requested_pickup_at') this.requestedPickupAt, @JsonKey(name: 'special_instructions') this.specialInstructions, final  Map<String, dynamic>? metadata}): _items = items,_metadata = metadata;
  factory _ReturnRequest.fromJson(Map<String, dynamic> json) => _$ReturnRequestFromJson(json);

@override@JsonKey(name: 'external_request_id') final  String externalRequestId;
@override@JsonKey(name: 'source_order_id') final  String sourceOrderId;
@override@JsonKey(name: 'designer_id') final  String designerId;
@override@JsonKey(name: 'original_source_location_id') final  String originalSourceLocationId;
@override@JsonKey(name: 'return_type') final  ReturnType returnType;
@override@JsonKey(name: 'original_inventory_source') final  InventorySource? originalInventorySource;
@override@JsonKey(name: 'warehouse_id') final  String? warehouseId;
@override@JsonKey(name: 'designer_return_address') final  Address? designerReturnAddress;
@override@JsonKey(name: 'customer_pickup_address') final  Address customerPickupAddress;
 final  List<LogisticsItem> _items;
@override List<LogisticsItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? reason;
@override@JsonKey(name: 'requested_pickup_at') final  DateTime? requestedPickupAt;
@override@JsonKey(name: 'special_instructions') final  String? specialInstructions;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ReturnRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReturnRequestCopyWith<_ReturnRequest> get copyWith => __$ReturnRequestCopyWithImpl<_ReturnRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReturnRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReturnRequest&&(identical(other.externalRequestId, externalRequestId) || other.externalRequestId == externalRequestId)&&(identical(other.sourceOrderId, sourceOrderId) || other.sourceOrderId == sourceOrderId)&&(identical(other.designerId, designerId) || other.designerId == designerId)&&(identical(other.originalSourceLocationId, originalSourceLocationId) || other.originalSourceLocationId == originalSourceLocationId)&&(identical(other.returnType, returnType) || other.returnType == returnType)&&(identical(other.originalInventorySource, originalInventorySource) || other.originalInventorySource == originalInventorySource)&&(identical(other.warehouseId, warehouseId) || other.warehouseId == warehouseId)&&(identical(other.designerReturnAddress, designerReturnAddress) || other.designerReturnAddress == designerReturnAddress)&&(identical(other.customerPickupAddress, customerPickupAddress) || other.customerPickupAddress == customerPickupAddress)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requestedPickupAt, requestedPickupAt) || other.requestedPickupAt == requestedPickupAt)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,externalRequestId,sourceOrderId,designerId,originalSourceLocationId,returnType,originalInventorySource,warehouseId,designerReturnAddress,customerPickupAddress,const DeepCollectionEquality().hash(_items),reason,requestedPickupAt,specialInstructions,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ReturnRequest(externalRequestId: $externalRequestId, sourceOrderId: $sourceOrderId, designerId: $designerId, originalSourceLocationId: $originalSourceLocationId, returnType: $returnType, originalInventorySource: $originalInventorySource, warehouseId: $warehouseId, designerReturnAddress: $designerReturnAddress, customerPickupAddress: $customerPickupAddress, items: $items, reason: $reason, requestedPickupAt: $requestedPickupAt, specialInstructions: $specialInstructions, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ReturnRequestCopyWith<$Res> implements $ReturnRequestCopyWith<$Res> {
  factory _$ReturnRequestCopyWith(_ReturnRequest value, $Res Function(_ReturnRequest) _then) = __$ReturnRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'external_request_id') String externalRequestId,@JsonKey(name: 'source_order_id') String sourceOrderId,@JsonKey(name: 'designer_id') String designerId,@JsonKey(name: 'original_source_location_id') String originalSourceLocationId,@JsonKey(name: 'return_type') ReturnType returnType,@JsonKey(name: 'original_inventory_source') InventorySource? originalInventorySource,@JsonKey(name: 'warehouse_id') String? warehouseId,@JsonKey(name: 'designer_return_address') Address? designerReturnAddress,@JsonKey(name: 'customer_pickup_address') Address customerPickupAddress, List<LogisticsItem> items, String? reason,@JsonKey(name: 'requested_pickup_at') DateTime? requestedPickupAt,@JsonKey(name: 'special_instructions') String? specialInstructions, Map<String, dynamic>? metadata
});


@override $AddressCopyWith<$Res>? get designerReturnAddress;@override $AddressCopyWith<$Res> get customerPickupAddress;

}
/// @nodoc
class __$ReturnRequestCopyWithImpl<$Res>
    implements _$ReturnRequestCopyWith<$Res> {
  __$ReturnRequestCopyWithImpl(this._self, this._then);

  final _ReturnRequest _self;
  final $Res Function(_ReturnRequest) _then;

/// Create a copy of ReturnRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? externalRequestId = null,Object? sourceOrderId = null,Object? designerId = null,Object? originalSourceLocationId = null,Object? returnType = null,Object? originalInventorySource = freezed,Object? warehouseId = freezed,Object? designerReturnAddress = freezed,Object? customerPickupAddress = null,Object? items = null,Object? reason = freezed,Object? requestedPickupAt = freezed,Object? specialInstructions = freezed,Object? metadata = freezed,}) {
  return _then(_ReturnRequest(
externalRequestId: null == externalRequestId ? _self.externalRequestId : externalRequestId // ignore: cast_nullable_to_non_nullable
as String,sourceOrderId: null == sourceOrderId ? _self.sourceOrderId : sourceOrderId // ignore: cast_nullable_to_non_nullable
as String,designerId: null == designerId ? _self.designerId : designerId // ignore: cast_nullable_to_non_nullable
as String,originalSourceLocationId: null == originalSourceLocationId ? _self.originalSourceLocationId : originalSourceLocationId // ignore: cast_nullable_to_non_nullable
as String,returnType: null == returnType ? _self.returnType : returnType // ignore: cast_nullable_to_non_nullable
as ReturnType,originalInventorySource: freezed == originalInventorySource ? _self.originalInventorySource : originalInventorySource // ignore: cast_nullable_to_non_nullable
as InventorySource?,warehouseId: freezed == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as String?,designerReturnAddress: freezed == designerReturnAddress ? _self.designerReturnAddress : designerReturnAddress // ignore: cast_nullable_to_non_nullable
as Address?,customerPickupAddress: null == customerPickupAddress ? _self.customerPickupAddress : customerPickupAddress // ignore: cast_nullable_to_non_nullable
as Address,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<LogisticsItem>,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,requestedPickupAt: freezed == requestedPickupAt ? _self.requestedPickupAt : requestedPickupAt // ignore: cast_nullable_to_non_nullable
as DateTime?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of ReturnRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res>? get designerReturnAddress {
    if (_self.designerReturnAddress == null) {
    return null;
  }

  return $AddressCopyWith<$Res>(_self.designerReturnAddress!, (value) {
    return _then(_self.copyWith(designerReturnAddress: value));
  });
}/// Create a copy of ReturnRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get customerPickupAddress {

  return $AddressCopyWith<$Res>(_self.customerPickupAddress, (value) {
    return _then(_self.copyWith(customerPickupAddress: value));
  });
}
}

// dart format on
