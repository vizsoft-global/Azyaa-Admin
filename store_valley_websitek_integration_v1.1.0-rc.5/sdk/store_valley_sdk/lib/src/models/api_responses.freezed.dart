// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryOrderResponse {

@JsonKey(name: 'order_id') String get orderId;@JsonKey(name: 'client_order_id') String? get clientOrderId; String get status;@JsonKey(name: 'original_source_location_id') String get originalSourceLocationId;@JsonKey(name: 'driver_id') String? get driverId;@JsonKey(name: 'estimated_delivery_time') DateTime? get estimatedDeliveryTime;@JsonKey(name: 'actual_delivery_time') DateTime? get actualDeliveryTime;@JsonKey(name: 'proof_photo_url') String? get proofPhotoUrl;@JsonKey(name: 'proof_signature_url') String? get proofSignatureUrl;@JsonKey(name: 'is_test') bool get isTest;
/// Create a copy of DeliveryOrderResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryOrderResponseCopyWith<DeliveryOrderResponse> get copyWith => _$DeliveryOrderResponseCopyWithImpl<DeliveryOrderResponse>(this as DeliveryOrderResponse, _$identity);

  /// Serializes this DeliveryOrderResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryOrderResponse&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.clientOrderId, clientOrderId) || other.clientOrderId == clientOrderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.originalSourceLocationId, originalSourceLocationId) || other.originalSourceLocationId == originalSourceLocationId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.estimatedDeliveryTime, estimatedDeliveryTime) || other.estimatedDeliveryTime == estimatedDeliveryTime)&&(identical(other.actualDeliveryTime, actualDeliveryTime) || other.actualDeliveryTime == actualDeliveryTime)&&(identical(other.proofPhotoUrl, proofPhotoUrl) || other.proofPhotoUrl == proofPhotoUrl)&&(identical(other.proofSignatureUrl, proofSignatureUrl) || other.proofSignatureUrl == proofSignatureUrl)&&(identical(other.isTest, isTest) || other.isTest == isTest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,clientOrderId,status,originalSourceLocationId,driverId,estimatedDeliveryTime,actualDeliveryTime,proofPhotoUrl,proofSignatureUrl,isTest);

@override
String toString() {
  return 'DeliveryOrderResponse(orderId: $orderId, clientOrderId: $clientOrderId, status: $status, originalSourceLocationId: $originalSourceLocationId, driverId: $driverId, estimatedDeliveryTime: $estimatedDeliveryTime, actualDeliveryTime: $actualDeliveryTime, proofPhotoUrl: $proofPhotoUrl, proofSignatureUrl: $proofSignatureUrl, isTest: $isTest)';
}


}

/// @nodoc
abstract mixin class $DeliveryOrderResponseCopyWith<$Res>  {
  factory $DeliveryOrderResponseCopyWith(DeliveryOrderResponse value, $Res Function(DeliveryOrderResponse) _then) = _$DeliveryOrderResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'order_id') String orderId,@JsonKey(name: 'client_order_id') String? clientOrderId, String status,@JsonKey(name: 'original_source_location_id') String originalSourceLocationId,@JsonKey(name: 'driver_id') String? driverId,@JsonKey(name: 'estimated_delivery_time') DateTime? estimatedDeliveryTime,@JsonKey(name: 'actual_delivery_time') DateTime? actualDeliveryTime,@JsonKey(name: 'proof_photo_url') String? proofPhotoUrl,@JsonKey(name: 'proof_signature_url') String? proofSignatureUrl,@JsonKey(name: 'is_test') bool isTest
});




}
/// @nodoc
class _$DeliveryOrderResponseCopyWithImpl<$Res>
    implements $DeliveryOrderResponseCopyWith<$Res> {
  _$DeliveryOrderResponseCopyWithImpl(this._self, this._then);

  final DeliveryOrderResponse _self;
  final $Res Function(DeliveryOrderResponse) _then;

/// Create a copy of DeliveryOrderResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? clientOrderId = freezed,Object? status = null,Object? originalSourceLocationId = null,Object? driverId = freezed,Object? estimatedDeliveryTime = freezed,Object? actualDeliveryTime = freezed,Object? proofPhotoUrl = freezed,Object? proofSignatureUrl = freezed,Object? isTest = null,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,clientOrderId: freezed == clientOrderId ? _self.clientOrderId : clientOrderId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,originalSourceLocationId: null == originalSourceLocationId ? _self.originalSourceLocationId : originalSourceLocationId // ignore: cast_nullable_to_non_nullable
as String,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,estimatedDeliveryTime: freezed == estimatedDeliveryTime ? _self.estimatedDeliveryTime : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
as DateTime?,actualDeliveryTime: freezed == actualDeliveryTime ? _self.actualDeliveryTime : actualDeliveryTime // ignore: cast_nullable_to_non_nullable
as DateTime?,proofPhotoUrl: freezed == proofPhotoUrl ? _self.proofPhotoUrl : proofPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,proofSignatureUrl: freezed == proofSignatureUrl ? _self.proofSignatureUrl : proofSignatureUrl // ignore: cast_nullable_to_non_nullable
as String?,isTest: null == isTest ? _self.isTest : isTest // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryOrderResponse].
extension DeliveryOrderResponsePatterns on DeliveryOrderResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryOrderResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryOrderResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryOrderResponse value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryOrderResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryOrderResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryOrderResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'client_order_id')  String? clientOrderId,  String status, @JsonKey(name: 'original_source_location_id')  String originalSourceLocationId, @JsonKey(name: 'driver_id')  String? driverId, @JsonKey(name: 'estimated_delivery_time')  DateTime? estimatedDeliveryTime, @JsonKey(name: 'actual_delivery_time')  DateTime? actualDeliveryTime, @JsonKey(name: 'proof_photo_url')  String? proofPhotoUrl, @JsonKey(name: 'proof_signature_url')  String? proofSignatureUrl, @JsonKey(name: 'is_test')  bool isTest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryOrderResponse() when $default != null:
return $default(_that.orderId,_that.clientOrderId,_that.status,_that.originalSourceLocationId,_that.driverId,_that.estimatedDeliveryTime,_that.actualDeliveryTime,_that.proofPhotoUrl,_that.proofSignatureUrl,_that.isTest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'client_order_id')  String? clientOrderId,  String status, @JsonKey(name: 'original_source_location_id')  String originalSourceLocationId, @JsonKey(name: 'driver_id')  String? driverId, @JsonKey(name: 'estimated_delivery_time')  DateTime? estimatedDeliveryTime, @JsonKey(name: 'actual_delivery_time')  DateTime? actualDeliveryTime, @JsonKey(name: 'proof_photo_url')  String? proofPhotoUrl, @JsonKey(name: 'proof_signature_url')  String? proofSignatureUrl, @JsonKey(name: 'is_test')  bool isTest)  $default,) {final _that = this;
switch (_that) {
case _DeliveryOrderResponse():
return $default(_that.orderId,_that.clientOrderId,_that.status,_that.originalSourceLocationId,_that.driverId,_that.estimatedDeliveryTime,_that.actualDeliveryTime,_that.proofPhotoUrl,_that.proofSignatureUrl,_that.isTest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'client_order_id')  String? clientOrderId,  String status, @JsonKey(name: 'original_source_location_id')  String originalSourceLocationId, @JsonKey(name: 'driver_id')  String? driverId, @JsonKey(name: 'estimated_delivery_time')  DateTime? estimatedDeliveryTime, @JsonKey(name: 'actual_delivery_time')  DateTime? actualDeliveryTime, @JsonKey(name: 'proof_photo_url')  String? proofPhotoUrl, @JsonKey(name: 'proof_signature_url')  String? proofSignatureUrl, @JsonKey(name: 'is_test')  bool isTest)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryOrderResponse() when $default != null:
return $default(_that.orderId,_that.clientOrderId,_that.status,_that.originalSourceLocationId,_that.driverId,_that.estimatedDeliveryTime,_that.actualDeliveryTime,_that.proofPhotoUrl,_that.proofSignatureUrl,_that.isTest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryOrderResponse implements DeliveryOrderResponse {
  const _DeliveryOrderResponse({@JsonKey(name: 'order_id') required this.orderId, @JsonKey(name: 'client_order_id') this.clientOrderId, required this.status, @JsonKey(name: 'original_source_location_id') required this.originalSourceLocationId, @JsonKey(name: 'driver_id') this.driverId, @JsonKey(name: 'estimated_delivery_time') this.estimatedDeliveryTime, @JsonKey(name: 'actual_delivery_time') this.actualDeliveryTime, @JsonKey(name: 'proof_photo_url') this.proofPhotoUrl, @JsonKey(name: 'proof_signature_url') this.proofSignatureUrl, @JsonKey(name: 'is_test') this.isTest = false});
  factory _DeliveryOrderResponse.fromJson(Map<String, dynamic> json) => _$DeliveryOrderResponseFromJson(json);

@override@JsonKey(name: 'order_id') final  String orderId;
@override@JsonKey(name: 'client_order_id') final  String? clientOrderId;
@override final  String status;
@override@JsonKey(name: 'original_source_location_id') final  String originalSourceLocationId;
@override@JsonKey(name: 'driver_id') final  String? driverId;
@override@JsonKey(name: 'estimated_delivery_time') final  DateTime? estimatedDeliveryTime;
@override@JsonKey(name: 'actual_delivery_time') final  DateTime? actualDeliveryTime;
@override@JsonKey(name: 'proof_photo_url') final  String? proofPhotoUrl;
@override@JsonKey(name: 'proof_signature_url') final  String? proofSignatureUrl;
@override@JsonKey(name: 'is_test') final  bool isTest;

/// Create a copy of DeliveryOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryOrderResponseCopyWith<_DeliveryOrderResponse> get copyWith => __$DeliveryOrderResponseCopyWithImpl<_DeliveryOrderResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryOrderResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryOrderResponse&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.clientOrderId, clientOrderId) || other.clientOrderId == clientOrderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.originalSourceLocationId, originalSourceLocationId) || other.originalSourceLocationId == originalSourceLocationId)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.estimatedDeliveryTime, estimatedDeliveryTime) || other.estimatedDeliveryTime == estimatedDeliveryTime)&&(identical(other.actualDeliveryTime, actualDeliveryTime) || other.actualDeliveryTime == actualDeliveryTime)&&(identical(other.proofPhotoUrl, proofPhotoUrl) || other.proofPhotoUrl == proofPhotoUrl)&&(identical(other.proofSignatureUrl, proofSignatureUrl) || other.proofSignatureUrl == proofSignatureUrl)&&(identical(other.isTest, isTest) || other.isTest == isTest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,clientOrderId,status,originalSourceLocationId,driverId,estimatedDeliveryTime,actualDeliveryTime,proofPhotoUrl,proofSignatureUrl,isTest);

@override
String toString() {
  return 'DeliveryOrderResponse(orderId: $orderId, clientOrderId: $clientOrderId, status: $status, originalSourceLocationId: $originalSourceLocationId, driverId: $driverId, estimatedDeliveryTime: $estimatedDeliveryTime, actualDeliveryTime: $actualDeliveryTime, proofPhotoUrl: $proofPhotoUrl, proofSignatureUrl: $proofSignatureUrl, isTest: $isTest)';
}


}

/// @nodoc
abstract mixin class _$DeliveryOrderResponseCopyWith<$Res> implements $DeliveryOrderResponseCopyWith<$Res> {
  factory _$DeliveryOrderResponseCopyWith(_DeliveryOrderResponse value, $Res Function(_DeliveryOrderResponse) _then) = __$DeliveryOrderResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'order_id') String orderId,@JsonKey(name: 'client_order_id') String? clientOrderId, String status,@JsonKey(name: 'original_source_location_id') String originalSourceLocationId,@JsonKey(name: 'driver_id') String? driverId,@JsonKey(name: 'estimated_delivery_time') DateTime? estimatedDeliveryTime,@JsonKey(name: 'actual_delivery_time') DateTime? actualDeliveryTime,@JsonKey(name: 'proof_photo_url') String? proofPhotoUrl,@JsonKey(name: 'proof_signature_url') String? proofSignatureUrl,@JsonKey(name: 'is_test') bool isTest
});




}
/// @nodoc
class __$DeliveryOrderResponseCopyWithImpl<$Res>
    implements _$DeliveryOrderResponseCopyWith<$Res> {
  __$DeliveryOrderResponseCopyWithImpl(this._self, this._then);

  final _DeliveryOrderResponse _self;
  final $Res Function(_DeliveryOrderResponse) _then;

/// Create a copy of DeliveryOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? clientOrderId = freezed,Object? status = null,Object? originalSourceLocationId = null,Object? driverId = freezed,Object? estimatedDeliveryTime = freezed,Object? actualDeliveryTime = freezed,Object? proofPhotoUrl = freezed,Object? proofSignatureUrl = freezed,Object? isTest = null,}) {
  return _then(_DeliveryOrderResponse(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,clientOrderId: freezed == clientOrderId ? _self.clientOrderId : clientOrderId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,originalSourceLocationId: null == originalSourceLocationId ? _self.originalSourceLocationId : originalSourceLocationId // ignore: cast_nullable_to_non_nullable
as String,driverId: freezed == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String?,estimatedDeliveryTime: freezed == estimatedDeliveryTime ? _self.estimatedDeliveryTime : estimatedDeliveryTime // ignore: cast_nullable_to_non_nullable
as DateTime?,actualDeliveryTime: freezed == actualDeliveryTime ? _self.actualDeliveryTime : actualDeliveryTime // ignore: cast_nullable_to_non_nullable
as DateTime?,proofPhotoUrl: freezed == proofPhotoUrl ? _self.proofPhotoUrl : proofPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,proofSignatureUrl: freezed == proofSignatureUrl ? _self.proofSignatureUrl : proofSignatureUrl // ignore: cast_nullable_to_non_nullable
as String?,isTest: null == isTest ? _self.isTest : isTest // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$LogisticsRequestResponse {

@JsonKey(name: 'request_id') String get requestId;@JsonKey(name: 'external_request_id') String get externalRequestId;@JsonKey(name: 'source_order_id') String? get sourceOrderId; String get status;@JsonKey(name: 'delivery_order_id') String? get deliveryOrderId;@JsonKey(name: 'original_source_location_id') String? get originalSourceLocationId;@JsonKey(name: 'warehouse_id') String? get warehouseId;@JsonKey(name: 'inventory_source') InventorySource? get inventorySource;@JsonKey(name: 'return_destination_type') InventorySource? get returnDestinationType;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;@JsonKey(name: 'is_test') bool get isTest;
/// Create a copy of LogisticsRequestResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogisticsRequestResponseCopyWith<LogisticsRequestResponse> get copyWith => _$LogisticsRequestResponseCopyWithImpl<LogisticsRequestResponse>(this as LogisticsRequestResponse, _$identity);

  /// Serializes this LogisticsRequestResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogisticsRequestResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.externalRequestId, externalRequestId) || other.externalRequestId == externalRequestId)&&(identical(other.sourceOrderId, sourceOrderId) || other.sourceOrderId == sourceOrderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.deliveryOrderId, deliveryOrderId) || other.deliveryOrderId == deliveryOrderId)&&(identical(other.originalSourceLocationId, originalSourceLocationId) || other.originalSourceLocationId == originalSourceLocationId)&&(identical(other.warehouseId, warehouseId) || other.warehouseId == warehouseId)&&(identical(other.inventorySource, inventorySource) || other.inventorySource == inventorySource)&&(identical(other.returnDestinationType, returnDestinationType) || other.returnDestinationType == returnDestinationType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isTest, isTest) || other.isTest == isTest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,externalRequestId,sourceOrderId,status,deliveryOrderId,originalSourceLocationId,warehouseId,inventorySource,returnDestinationType,createdAt,updatedAt,isTest);

@override
String toString() {
  return 'LogisticsRequestResponse(requestId: $requestId, externalRequestId: $externalRequestId, sourceOrderId: $sourceOrderId, status: $status, deliveryOrderId: $deliveryOrderId, originalSourceLocationId: $originalSourceLocationId, warehouseId: $warehouseId, inventorySource: $inventorySource, returnDestinationType: $returnDestinationType, createdAt: $createdAt, updatedAt: $updatedAt, isTest: $isTest)';
}


}

/// @nodoc
abstract mixin class $LogisticsRequestResponseCopyWith<$Res>  {
  factory $LogisticsRequestResponseCopyWith(LogisticsRequestResponse value, $Res Function(LogisticsRequestResponse) _then) = _$LogisticsRequestResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'request_id') String requestId,@JsonKey(name: 'external_request_id') String externalRequestId,@JsonKey(name: 'source_order_id') String? sourceOrderId, String status,@JsonKey(name: 'delivery_order_id') String? deliveryOrderId,@JsonKey(name: 'original_source_location_id') String? originalSourceLocationId,@JsonKey(name: 'warehouse_id') String? warehouseId,@JsonKey(name: 'inventory_source') InventorySource? inventorySource,@JsonKey(name: 'return_destination_type') InventorySource? returnDestinationType,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'is_test') bool isTest
});




}
/// @nodoc
class _$LogisticsRequestResponseCopyWithImpl<$Res>
    implements $LogisticsRequestResponseCopyWith<$Res> {
  _$LogisticsRequestResponseCopyWithImpl(this._self, this._then);

  final LogisticsRequestResponse _self;
  final $Res Function(LogisticsRequestResponse) _then;

/// Create a copy of LogisticsRequestResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requestId = null,Object? externalRequestId = null,Object? sourceOrderId = freezed,Object? status = null,Object? deliveryOrderId = freezed,Object? originalSourceLocationId = freezed,Object? warehouseId = freezed,Object? inventorySource = freezed,Object? returnDestinationType = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isTest = null,}) {
  return _then(_self.copyWith(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,externalRequestId: null == externalRequestId ? _self.externalRequestId : externalRequestId // ignore: cast_nullable_to_non_nullable
as String,sourceOrderId: freezed == sourceOrderId ? _self.sourceOrderId : sourceOrderId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,deliveryOrderId: freezed == deliveryOrderId ? _self.deliveryOrderId : deliveryOrderId // ignore: cast_nullable_to_non_nullable
as String?,originalSourceLocationId: freezed == originalSourceLocationId ? _self.originalSourceLocationId : originalSourceLocationId // ignore: cast_nullable_to_non_nullable
as String?,warehouseId: freezed == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as String?,inventorySource: freezed == inventorySource ? _self.inventorySource : inventorySource // ignore: cast_nullable_to_non_nullable
as InventorySource?,returnDestinationType: freezed == returnDestinationType ? _self.returnDestinationType : returnDestinationType // ignore: cast_nullable_to_non_nullable
as InventorySource?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isTest: null == isTest ? _self.isTest : isTest // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LogisticsRequestResponse].
extension LogisticsRequestResponsePatterns on LogisticsRequestResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogisticsRequestResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogisticsRequestResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogisticsRequestResponse value)  $default,){
final _that = this;
switch (_that) {
case _LogisticsRequestResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogisticsRequestResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LogisticsRequestResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'request_id')  String requestId, @JsonKey(name: 'external_request_id')  String externalRequestId, @JsonKey(name: 'source_order_id')  String? sourceOrderId,  String status, @JsonKey(name: 'delivery_order_id')  String? deliveryOrderId, @JsonKey(name: 'original_source_location_id')  String? originalSourceLocationId, @JsonKey(name: 'warehouse_id')  String? warehouseId, @JsonKey(name: 'inventory_source')  InventorySource? inventorySource, @JsonKey(name: 'return_destination_type')  InventorySource? returnDestinationType, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'is_test')  bool isTest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogisticsRequestResponse() when $default != null:
return $default(_that.requestId,_that.externalRequestId,_that.sourceOrderId,_that.status,_that.deliveryOrderId,_that.originalSourceLocationId,_that.warehouseId,_that.inventorySource,_that.returnDestinationType,_that.createdAt,_that.updatedAt,_that.isTest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'request_id')  String requestId, @JsonKey(name: 'external_request_id')  String externalRequestId, @JsonKey(name: 'source_order_id')  String? sourceOrderId,  String status, @JsonKey(name: 'delivery_order_id')  String? deliveryOrderId, @JsonKey(name: 'original_source_location_id')  String? originalSourceLocationId, @JsonKey(name: 'warehouse_id')  String? warehouseId, @JsonKey(name: 'inventory_source')  InventorySource? inventorySource, @JsonKey(name: 'return_destination_type')  InventorySource? returnDestinationType, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'is_test')  bool isTest)  $default,) {final _that = this;
switch (_that) {
case _LogisticsRequestResponse():
return $default(_that.requestId,_that.externalRequestId,_that.sourceOrderId,_that.status,_that.deliveryOrderId,_that.originalSourceLocationId,_that.warehouseId,_that.inventorySource,_that.returnDestinationType,_that.createdAt,_that.updatedAt,_that.isTest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'request_id')  String requestId, @JsonKey(name: 'external_request_id')  String externalRequestId, @JsonKey(name: 'source_order_id')  String? sourceOrderId,  String status, @JsonKey(name: 'delivery_order_id')  String? deliveryOrderId, @JsonKey(name: 'original_source_location_id')  String? originalSourceLocationId, @JsonKey(name: 'warehouse_id')  String? warehouseId, @JsonKey(name: 'inventory_source')  InventorySource? inventorySource, @JsonKey(name: 'return_destination_type')  InventorySource? returnDestinationType, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt, @JsonKey(name: 'is_test')  bool isTest)?  $default,) {final _that = this;
switch (_that) {
case _LogisticsRequestResponse() when $default != null:
return $default(_that.requestId,_that.externalRequestId,_that.sourceOrderId,_that.status,_that.deliveryOrderId,_that.originalSourceLocationId,_that.warehouseId,_that.inventorySource,_that.returnDestinationType,_that.createdAt,_that.updatedAt,_that.isTest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogisticsRequestResponse implements LogisticsRequestResponse {
  const _LogisticsRequestResponse({@JsonKey(name: 'request_id') required this.requestId, @JsonKey(name: 'external_request_id') required this.externalRequestId, @JsonKey(name: 'source_order_id') this.sourceOrderId, required this.status, @JsonKey(name: 'delivery_order_id') this.deliveryOrderId, @JsonKey(name: 'original_source_location_id') this.originalSourceLocationId, @JsonKey(name: 'warehouse_id') this.warehouseId, @JsonKey(name: 'inventory_source') this.inventorySource, @JsonKey(name: 'return_destination_type') this.returnDestinationType, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'is_test') this.isTest = false});
  factory _LogisticsRequestResponse.fromJson(Map<String, dynamic> json) => _$LogisticsRequestResponseFromJson(json);

@override@JsonKey(name: 'request_id') final  String requestId;
@override@JsonKey(name: 'external_request_id') final  String externalRequestId;
@override@JsonKey(name: 'source_order_id') final  String? sourceOrderId;
@override final  String status;
@override@JsonKey(name: 'delivery_order_id') final  String? deliveryOrderId;
@override@JsonKey(name: 'original_source_location_id') final  String? originalSourceLocationId;
@override@JsonKey(name: 'warehouse_id') final  String? warehouseId;
@override@JsonKey(name: 'inventory_source') final  InventorySource? inventorySource;
@override@JsonKey(name: 'return_destination_type') final  InventorySource? returnDestinationType;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override@JsonKey(name: 'is_test') final  bool isTest;

/// Create a copy of LogisticsRequestResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogisticsRequestResponseCopyWith<_LogisticsRequestResponse> get copyWith => __$LogisticsRequestResponseCopyWithImpl<_LogisticsRequestResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogisticsRequestResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogisticsRequestResponse&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.externalRequestId, externalRequestId) || other.externalRequestId == externalRequestId)&&(identical(other.sourceOrderId, sourceOrderId) || other.sourceOrderId == sourceOrderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.deliveryOrderId, deliveryOrderId) || other.deliveryOrderId == deliveryOrderId)&&(identical(other.originalSourceLocationId, originalSourceLocationId) || other.originalSourceLocationId == originalSourceLocationId)&&(identical(other.warehouseId, warehouseId) || other.warehouseId == warehouseId)&&(identical(other.inventorySource, inventorySource) || other.inventorySource == inventorySource)&&(identical(other.returnDestinationType, returnDestinationType) || other.returnDestinationType == returnDestinationType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isTest, isTest) || other.isTest == isTest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requestId,externalRequestId,sourceOrderId,status,deliveryOrderId,originalSourceLocationId,warehouseId,inventorySource,returnDestinationType,createdAt,updatedAt,isTest);

@override
String toString() {
  return 'LogisticsRequestResponse(requestId: $requestId, externalRequestId: $externalRequestId, sourceOrderId: $sourceOrderId, status: $status, deliveryOrderId: $deliveryOrderId, originalSourceLocationId: $originalSourceLocationId, warehouseId: $warehouseId, inventorySource: $inventorySource, returnDestinationType: $returnDestinationType, createdAt: $createdAt, updatedAt: $updatedAt, isTest: $isTest)';
}


}

/// @nodoc
abstract mixin class _$LogisticsRequestResponseCopyWith<$Res> implements $LogisticsRequestResponseCopyWith<$Res> {
  factory _$LogisticsRequestResponseCopyWith(_LogisticsRequestResponse value, $Res Function(_LogisticsRequestResponse) _then) = __$LogisticsRequestResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'request_id') String requestId,@JsonKey(name: 'external_request_id') String externalRequestId,@JsonKey(name: 'source_order_id') String? sourceOrderId, String status,@JsonKey(name: 'delivery_order_id') String? deliveryOrderId,@JsonKey(name: 'original_source_location_id') String? originalSourceLocationId,@JsonKey(name: 'warehouse_id') String? warehouseId,@JsonKey(name: 'inventory_source') InventorySource? inventorySource,@JsonKey(name: 'return_destination_type') InventorySource? returnDestinationType,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt,@JsonKey(name: 'is_test') bool isTest
});




}
/// @nodoc
class __$LogisticsRequestResponseCopyWithImpl<$Res>
    implements _$LogisticsRequestResponseCopyWith<$Res> {
  __$LogisticsRequestResponseCopyWithImpl(this._self, this._then);

  final _LogisticsRequestResponse _self;
  final $Res Function(_LogisticsRequestResponse) _then;

/// Create a copy of LogisticsRequestResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requestId = null,Object? externalRequestId = null,Object? sourceOrderId = freezed,Object? status = null,Object? deliveryOrderId = freezed,Object? originalSourceLocationId = freezed,Object? warehouseId = freezed,Object? inventorySource = freezed,Object? returnDestinationType = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isTest = null,}) {
  return _then(_LogisticsRequestResponse(
requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,externalRequestId: null == externalRequestId ? _self.externalRequestId : externalRequestId // ignore: cast_nullable_to_non_nullable
as String,sourceOrderId: freezed == sourceOrderId ? _self.sourceOrderId : sourceOrderId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,deliveryOrderId: freezed == deliveryOrderId ? _self.deliveryOrderId : deliveryOrderId // ignore: cast_nullable_to_non_nullable
as String?,originalSourceLocationId: freezed == originalSourceLocationId ? _self.originalSourceLocationId : originalSourceLocationId // ignore: cast_nullable_to_non_nullable
as String?,warehouseId: freezed == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as String?,inventorySource: freezed == inventorySource ? _self.inventorySource : inventorySource // ignore: cast_nullable_to_non_nullable
as InventorySource?,returnDestinationType: freezed == returnDestinationType ? _self.returnDestinationType : returnDestinationType // ignore: cast_nullable_to_non_nullable
as InventorySource?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isTest: null == isTest ? _self.isTest : isTest // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$InventorySnapshotItem {

@JsonKey(name: 'designer_id') String get designerId;@JsonKey(name: 'product_id') String get productId;@JsonKey(name: 'store_valley_product_id') String get storeValleyProductId; String get sku;@JsonKey(name: 'warehouse_id') String get warehouseId;@JsonKey(name: 'stored_quantity') num get storedQuantity; num get available;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of InventorySnapshotItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventorySnapshotItemCopyWith<InventorySnapshotItem> get copyWith => _$InventorySnapshotItemCopyWithImpl<InventorySnapshotItem>(this as InventorySnapshotItem, _$identity);

  /// Serializes this InventorySnapshotItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventorySnapshotItem&&(identical(other.designerId, designerId) || other.designerId == designerId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.storeValleyProductId, storeValleyProductId) || other.storeValleyProductId == storeValleyProductId)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.warehouseId, warehouseId) || other.warehouseId == warehouseId)&&(identical(other.storedQuantity, storedQuantity) || other.storedQuantity == storedQuantity)&&(identical(other.available, available) || other.available == available)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,designerId,productId,storeValleyProductId,sku,warehouseId,storedQuantity,available,updatedAt);

@override
String toString() {
  return 'InventorySnapshotItem(designerId: $designerId, productId: $productId, storeValleyProductId: $storeValleyProductId, sku: $sku, warehouseId: $warehouseId, storedQuantity: $storedQuantity, available: $available, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $InventorySnapshotItemCopyWith<$Res>  {
  factory $InventorySnapshotItemCopyWith(InventorySnapshotItem value, $Res Function(InventorySnapshotItem) _then) = _$InventorySnapshotItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'designer_id') String designerId,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'store_valley_product_id') String storeValleyProductId, String sku,@JsonKey(name: 'warehouse_id') String warehouseId,@JsonKey(name: 'stored_quantity') num storedQuantity, num available,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$InventorySnapshotItemCopyWithImpl<$Res>
    implements $InventorySnapshotItemCopyWith<$Res> {
  _$InventorySnapshotItemCopyWithImpl(this._self, this._then);

  final InventorySnapshotItem _self;
  final $Res Function(InventorySnapshotItem) _then;

/// Create a copy of InventorySnapshotItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? designerId = null,Object? productId = null,Object? storeValleyProductId = null,Object? sku = null,Object? warehouseId = null,Object? storedQuantity = null,Object? available = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
designerId: null == designerId ? _self.designerId : designerId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,storeValleyProductId: null == storeValleyProductId ? _self.storeValleyProductId : storeValleyProductId // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,warehouseId: null == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as String,storedQuantity: null == storedQuantity ? _self.storedQuantity : storedQuantity // ignore: cast_nullable_to_non_nullable
as num,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as num,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [InventorySnapshotItem].
extension InventorySnapshotItemPatterns on InventorySnapshotItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventorySnapshotItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventorySnapshotItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventorySnapshotItem value)  $default,){
final _that = this;
switch (_that) {
case _InventorySnapshotItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventorySnapshotItem value)?  $default,){
final _that = this;
switch (_that) {
case _InventorySnapshotItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'designer_id')  String designerId, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'store_valley_product_id')  String storeValleyProductId,  String sku, @JsonKey(name: 'warehouse_id')  String warehouseId, @JsonKey(name: 'stored_quantity')  num storedQuantity,  num available, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventorySnapshotItem() when $default != null:
return $default(_that.designerId,_that.productId,_that.storeValleyProductId,_that.sku,_that.warehouseId,_that.storedQuantity,_that.available,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'designer_id')  String designerId, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'store_valley_product_id')  String storeValleyProductId,  String sku, @JsonKey(name: 'warehouse_id')  String warehouseId, @JsonKey(name: 'stored_quantity')  num storedQuantity,  num available, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _InventorySnapshotItem():
return $default(_that.designerId,_that.productId,_that.storeValleyProductId,_that.sku,_that.warehouseId,_that.storedQuantity,_that.available,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'designer_id')  String designerId, @JsonKey(name: 'product_id')  String productId, @JsonKey(name: 'store_valley_product_id')  String storeValleyProductId,  String sku, @JsonKey(name: 'warehouse_id')  String warehouseId, @JsonKey(name: 'stored_quantity')  num storedQuantity,  num available, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _InventorySnapshotItem() when $default != null:
return $default(_that.designerId,_that.productId,_that.storeValleyProductId,_that.sku,_that.warehouseId,_that.storedQuantity,_that.available,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InventorySnapshotItem implements InventorySnapshotItem {
  const _InventorySnapshotItem({@JsonKey(name: 'designer_id') required this.designerId, @JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'store_valley_product_id') required this.storeValleyProductId, required this.sku, @JsonKey(name: 'warehouse_id') required this.warehouseId, @JsonKey(name: 'stored_quantity') required this.storedQuantity, required this.available, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _InventorySnapshotItem.fromJson(Map<String, dynamic> json) => _$InventorySnapshotItemFromJson(json);

@override@JsonKey(name: 'designer_id') final  String designerId;
@override@JsonKey(name: 'product_id') final  String productId;
@override@JsonKey(name: 'store_valley_product_id') final  String storeValleyProductId;
@override final  String sku;
@override@JsonKey(name: 'warehouse_id') final  String warehouseId;
@override@JsonKey(name: 'stored_quantity') final  num storedQuantity;
@override final  num available;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of InventorySnapshotItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventorySnapshotItemCopyWith<_InventorySnapshotItem> get copyWith => __$InventorySnapshotItemCopyWithImpl<_InventorySnapshotItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InventorySnapshotItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventorySnapshotItem&&(identical(other.designerId, designerId) || other.designerId == designerId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.storeValleyProductId, storeValleyProductId) || other.storeValleyProductId == storeValleyProductId)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.warehouseId, warehouseId) || other.warehouseId == warehouseId)&&(identical(other.storedQuantity, storedQuantity) || other.storedQuantity == storedQuantity)&&(identical(other.available, available) || other.available == available)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,designerId,productId,storeValleyProductId,sku,warehouseId,storedQuantity,available,updatedAt);

@override
String toString() {
  return 'InventorySnapshotItem(designerId: $designerId, productId: $productId, storeValleyProductId: $storeValleyProductId, sku: $sku, warehouseId: $warehouseId, storedQuantity: $storedQuantity, available: $available, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$InventorySnapshotItemCopyWith<$Res> implements $InventorySnapshotItemCopyWith<$Res> {
  factory _$InventorySnapshotItemCopyWith(_InventorySnapshotItem value, $Res Function(_InventorySnapshotItem) _then) = __$InventorySnapshotItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'designer_id') String designerId,@JsonKey(name: 'product_id') String productId,@JsonKey(name: 'store_valley_product_id') String storeValleyProductId, String sku,@JsonKey(name: 'warehouse_id') String warehouseId,@JsonKey(name: 'stored_quantity') num storedQuantity, num available,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$InventorySnapshotItemCopyWithImpl<$Res>
    implements _$InventorySnapshotItemCopyWith<$Res> {
  __$InventorySnapshotItemCopyWithImpl(this._self, this._then);

  final _InventorySnapshotItem _self;
  final $Res Function(_InventorySnapshotItem) _then;

/// Create a copy of InventorySnapshotItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? designerId = null,Object? productId = null,Object? storeValleyProductId = null,Object? sku = null,Object? warehouseId = null,Object? storedQuantity = null,Object? available = null,Object? updatedAt = freezed,}) {
  return _then(_InventorySnapshotItem(
designerId: null == designerId ? _self.designerId : designerId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,storeValleyProductId: null == storeValleyProductId ? _self.storeValleyProductId : storeValleyProductId // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,warehouseId: null == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as String,storedQuantity: null == storedQuantity ? _self.storedQuantity : storedQuantity // ignore: cast_nullable_to_non_nullable
as num,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as num,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$InventorySnapshotResponse {

 List<InventorySnapshotItem> get inventory; int get count;@JsonKey(name: 'next_cursor') String? get nextCursor;@JsonKey(name: 'has_more') bool get hasMore;@JsonKey(name: 'as_of') DateTime get asOf;@JsonKey(name: 'is_test') bool get isTest;
/// Create a copy of InventorySnapshotResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventorySnapshotResponseCopyWith<InventorySnapshotResponse> get copyWith => _$InventorySnapshotResponseCopyWithImpl<InventorySnapshotResponse>(this as InventorySnapshotResponse, _$identity);

  /// Serializes this InventorySnapshotResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventorySnapshotResponse&&const DeepCollectionEquality().equals(other.inventory, inventory)&&(identical(other.count, count) || other.count == count)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.isTest, isTest) || other.isTest == isTest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(inventory),count,nextCursor,hasMore,asOf,isTest);

@override
String toString() {
  return 'InventorySnapshotResponse(inventory: $inventory, count: $count, nextCursor: $nextCursor, hasMore: $hasMore, asOf: $asOf, isTest: $isTest)';
}


}

/// @nodoc
abstract mixin class $InventorySnapshotResponseCopyWith<$Res>  {
  factory $InventorySnapshotResponseCopyWith(InventorySnapshotResponse value, $Res Function(InventorySnapshotResponse) _then) = _$InventorySnapshotResponseCopyWithImpl;
@useResult
$Res call({
 List<InventorySnapshotItem> inventory, int count,@JsonKey(name: 'next_cursor') String? nextCursor,@JsonKey(name: 'has_more') bool hasMore,@JsonKey(name: 'as_of') DateTime asOf,@JsonKey(name: 'is_test') bool isTest
});




}
/// @nodoc
class _$InventorySnapshotResponseCopyWithImpl<$Res>
    implements $InventorySnapshotResponseCopyWith<$Res> {
  _$InventorySnapshotResponseCopyWithImpl(this._self, this._then);

  final InventorySnapshotResponse _self;
  final $Res Function(InventorySnapshotResponse) _then;

/// Create a copy of InventorySnapshotResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inventory = null,Object? count = null,Object? nextCursor = freezed,Object? hasMore = null,Object? asOf = null,Object? isTest = null,}) {
  return _then(_self.copyWith(
inventory: null == inventory ? _self.inventory : inventory // ignore: cast_nullable_to_non_nullable
as List<InventorySnapshotItem>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime,isTest: null == isTest ? _self.isTest : isTest // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [InventorySnapshotResponse].
extension InventorySnapshotResponsePatterns on InventorySnapshotResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventorySnapshotResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventorySnapshotResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventorySnapshotResponse value)  $default,){
final _that = this;
switch (_that) {
case _InventorySnapshotResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventorySnapshotResponse value)?  $default,){
final _that = this;
switch (_that) {
case _InventorySnapshotResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<InventorySnapshotItem> inventory,  int count, @JsonKey(name: 'next_cursor')  String? nextCursor, @JsonKey(name: 'has_more')  bool hasMore, @JsonKey(name: 'as_of')  DateTime asOf, @JsonKey(name: 'is_test')  bool isTest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventorySnapshotResponse() when $default != null:
return $default(_that.inventory,_that.count,_that.nextCursor,_that.hasMore,_that.asOf,_that.isTest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<InventorySnapshotItem> inventory,  int count, @JsonKey(name: 'next_cursor')  String? nextCursor, @JsonKey(name: 'has_more')  bool hasMore, @JsonKey(name: 'as_of')  DateTime asOf, @JsonKey(name: 'is_test')  bool isTest)  $default,) {final _that = this;
switch (_that) {
case _InventorySnapshotResponse():
return $default(_that.inventory,_that.count,_that.nextCursor,_that.hasMore,_that.asOf,_that.isTest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<InventorySnapshotItem> inventory,  int count, @JsonKey(name: 'next_cursor')  String? nextCursor, @JsonKey(name: 'has_more')  bool hasMore, @JsonKey(name: 'as_of')  DateTime asOf, @JsonKey(name: 'is_test')  bool isTest)?  $default,) {final _that = this;
switch (_that) {
case _InventorySnapshotResponse() when $default != null:
return $default(_that.inventory,_that.count,_that.nextCursor,_that.hasMore,_that.asOf,_that.isTest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InventorySnapshotResponse implements InventorySnapshotResponse {
  const _InventorySnapshotResponse({required final  List<InventorySnapshotItem> inventory, required this.count, @JsonKey(name: 'next_cursor') this.nextCursor, @JsonKey(name: 'has_more') required this.hasMore, @JsonKey(name: 'as_of') required this.asOf, @JsonKey(name: 'is_test') this.isTest = false}): _inventory = inventory;
  factory _InventorySnapshotResponse.fromJson(Map<String, dynamic> json) => _$InventorySnapshotResponseFromJson(json);

 final  List<InventorySnapshotItem> _inventory;
@override List<InventorySnapshotItem> get inventory {
  if (_inventory is EqualUnmodifiableListView) return _inventory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inventory);
}

@override final  int count;
@override@JsonKey(name: 'next_cursor') final  String? nextCursor;
@override@JsonKey(name: 'has_more') final  bool hasMore;
@override@JsonKey(name: 'as_of') final  DateTime asOf;
@override@JsonKey(name: 'is_test') final  bool isTest;

/// Create a copy of InventorySnapshotResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventorySnapshotResponseCopyWith<_InventorySnapshotResponse> get copyWith => __$InventorySnapshotResponseCopyWithImpl<_InventorySnapshotResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InventorySnapshotResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventorySnapshotResponse&&const DeepCollectionEquality().equals(other._inventory, _inventory)&&(identical(other.count, count) || other.count == count)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.isTest, isTest) || other.isTest == isTest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_inventory),count,nextCursor,hasMore,asOf,isTest);

@override
String toString() {
  return 'InventorySnapshotResponse(inventory: $inventory, count: $count, nextCursor: $nextCursor, hasMore: $hasMore, asOf: $asOf, isTest: $isTest)';
}


}

/// @nodoc
abstract mixin class _$InventorySnapshotResponseCopyWith<$Res> implements $InventorySnapshotResponseCopyWith<$Res> {
  factory _$InventorySnapshotResponseCopyWith(_InventorySnapshotResponse value, $Res Function(_InventorySnapshotResponse) _then) = __$InventorySnapshotResponseCopyWithImpl;
@override @useResult
$Res call({
 List<InventorySnapshotItem> inventory, int count,@JsonKey(name: 'next_cursor') String? nextCursor,@JsonKey(name: 'has_more') bool hasMore,@JsonKey(name: 'as_of') DateTime asOf,@JsonKey(name: 'is_test') bool isTest
});




}
/// @nodoc
class __$InventorySnapshotResponseCopyWithImpl<$Res>
    implements _$InventorySnapshotResponseCopyWith<$Res> {
  __$InventorySnapshotResponseCopyWithImpl(this._self, this._then);

  final _InventorySnapshotResponse _self;
  final $Res Function(_InventorySnapshotResponse) _then;

/// Create a copy of InventorySnapshotResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inventory = null,Object? count = null,Object? nextCursor = freezed,Object? hasMore = null,Object? asOf = null,Object? isTest = null,}) {
  return _then(_InventorySnapshotResponse(
inventory: null == inventory ? _self._inventory : inventory // ignore: cast_nullable_to_non_nullable
as List<InventorySnapshotItem>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as DateTime,isTest: null == isTest ? _self.isTest : isTest // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
