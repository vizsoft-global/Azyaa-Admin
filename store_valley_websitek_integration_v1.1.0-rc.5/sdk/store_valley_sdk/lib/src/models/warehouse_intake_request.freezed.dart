// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warehouse_intake_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WarehouseIntakeRequest {

@JsonKey(name: 'external_request_id') String get externalRequestId;@JsonKey(name: 'warehouse_id') String get warehouseId; Designer get designer; List<LogisticsItem> get items;@JsonKey(name: 'requested_pickup_at') DateTime? get requestedPickupAt;@JsonKey(name: 'special_instructions') String? get specialInstructions; Map<String, dynamic>? get metadata;
/// Create a copy of WarehouseIntakeRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarehouseIntakeRequestCopyWith<WarehouseIntakeRequest> get copyWith => _$WarehouseIntakeRequestCopyWithImpl<WarehouseIntakeRequest>(this as WarehouseIntakeRequest, _$identity);

  /// Serializes this WarehouseIntakeRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarehouseIntakeRequest&&(identical(other.externalRequestId, externalRequestId) || other.externalRequestId == externalRequestId)&&(identical(other.warehouseId, warehouseId) || other.warehouseId == warehouseId)&&(identical(other.designer, designer) || other.designer == designer)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.requestedPickupAt, requestedPickupAt) || other.requestedPickupAt == requestedPickupAt)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,externalRequestId,warehouseId,designer,const DeepCollectionEquality().hash(items),requestedPickupAt,specialInstructions,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'WarehouseIntakeRequest(externalRequestId: $externalRequestId, warehouseId: $warehouseId, designer: $designer, items: $items, requestedPickupAt: $requestedPickupAt, specialInstructions: $specialInstructions, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $WarehouseIntakeRequestCopyWith<$Res>  {
  factory $WarehouseIntakeRequestCopyWith(WarehouseIntakeRequest value, $Res Function(WarehouseIntakeRequest) _then) = _$WarehouseIntakeRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'external_request_id') String externalRequestId,@JsonKey(name: 'warehouse_id') String warehouseId, Designer designer, List<LogisticsItem> items,@JsonKey(name: 'requested_pickup_at') DateTime? requestedPickupAt,@JsonKey(name: 'special_instructions') String? specialInstructions, Map<String, dynamic>? metadata
});


$DesignerCopyWith<$Res> get designer;

}
/// @nodoc
class _$WarehouseIntakeRequestCopyWithImpl<$Res>
    implements $WarehouseIntakeRequestCopyWith<$Res> {
  _$WarehouseIntakeRequestCopyWithImpl(this._self, this._then);

  final WarehouseIntakeRequest _self;
  final $Res Function(WarehouseIntakeRequest) _then;

/// Create a copy of WarehouseIntakeRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? externalRequestId = null,Object? warehouseId = null,Object? designer = null,Object? items = null,Object? requestedPickupAt = freezed,Object? specialInstructions = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
externalRequestId: null == externalRequestId ? _self.externalRequestId : externalRequestId // ignore: cast_nullable_to_non_nullable
as String,warehouseId: null == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as String,designer: null == designer ? _self.designer : designer // ignore: cast_nullable_to_non_nullable
as Designer,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<LogisticsItem>,requestedPickupAt: freezed == requestedPickupAt ? _self.requestedPickupAt : requestedPickupAt // ignore: cast_nullable_to_non_nullable
as DateTime?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of WarehouseIntakeRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignerCopyWith<$Res> get designer {

  return $DesignerCopyWith<$Res>(_self.designer, (value) {
    return _then(_self.copyWith(designer: value));
  });
}
}


/// Adds pattern-matching-related methods to [WarehouseIntakeRequest].
extension WarehouseIntakeRequestPatterns on WarehouseIntakeRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarehouseIntakeRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarehouseIntakeRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarehouseIntakeRequest value)  $default,){
final _that = this;
switch (_that) {
case _WarehouseIntakeRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarehouseIntakeRequest value)?  $default,){
final _that = this;
switch (_that) {
case _WarehouseIntakeRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'external_request_id')  String externalRequestId, @JsonKey(name: 'warehouse_id')  String warehouseId,  Designer designer,  List<LogisticsItem> items, @JsonKey(name: 'requested_pickup_at')  DateTime? requestedPickupAt, @JsonKey(name: 'special_instructions')  String? specialInstructions,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarehouseIntakeRequest() when $default != null:
return $default(_that.externalRequestId,_that.warehouseId,_that.designer,_that.items,_that.requestedPickupAt,_that.specialInstructions,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'external_request_id')  String externalRequestId, @JsonKey(name: 'warehouse_id')  String warehouseId,  Designer designer,  List<LogisticsItem> items, @JsonKey(name: 'requested_pickup_at')  DateTime? requestedPickupAt, @JsonKey(name: 'special_instructions')  String? specialInstructions,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _WarehouseIntakeRequest():
return $default(_that.externalRequestId,_that.warehouseId,_that.designer,_that.items,_that.requestedPickupAt,_that.specialInstructions,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'external_request_id')  String externalRequestId, @JsonKey(name: 'warehouse_id')  String warehouseId,  Designer designer,  List<LogisticsItem> items, @JsonKey(name: 'requested_pickup_at')  DateTime? requestedPickupAt, @JsonKey(name: 'special_instructions')  String? specialInstructions,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _WarehouseIntakeRequest() when $default != null:
return $default(_that.externalRequestId,_that.warehouseId,_that.designer,_that.items,_that.requestedPickupAt,_that.specialInstructions,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _WarehouseIntakeRequest implements WarehouseIntakeRequest {
  const _WarehouseIntakeRequest({@JsonKey(name: 'external_request_id') required this.externalRequestId, @JsonKey(name: 'warehouse_id') required this.warehouseId, required this.designer, required final  List<LogisticsItem> items, @JsonKey(name: 'requested_pickup_at') this.requestedPickupAt, @JsonKey(name: 'special_instructions') this.specialInstructions, final  Map<String, dynamic>? metadata}): _items = items,_metadata = metadata;
  factory _WarehouseIntakeRequest.fromJson(Map<String, dynamic> json) => _$WarehouseIntakeRequestFromJson(json);

@override@JsonKey(name: 'external_request_id') final  String externalRequestId;
@override@JsonKey(name: 'warehouse_id') final  String warehouseId;
@override final  Designer designer;
 final  List<LogisticsItem> _items;
@override List<LogisticsItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

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


/// Create a copy of WarehouseIntakeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarehouseIntakeRequestCopyWith<_WarehouseIntakeRequest> get copyWith => __$WarehouseIntakeRequestCopyWithImpl<_WarehouseIntakeRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WarehouseIntakeRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarehouseIntakeRequest&&(identical(other.externalRequestId, externalRequestId) || other.externalRequestId == externalRequestId)&&(identical(other.warehouseId, warehouseId) || other.warehouseId == warehouseId)&&(identical(other.designer, designer) || other.designer == designer)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.requestedPickupAt, requestedPickupAt) || other.requestedPickupAt == requestedPickupAt)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,externalRequestId,warehouseId,designer,const DeepCollectionEquality().hash(_items),requestedPickupAt,specialInstructions,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'WarehouseIntakeRequest(externalRequestId: $externalRequestId, warehouseId: $warehouseId, designer: $designer, items: $items, requestedPickupAt: $requestedPickupAt, specialInstructions: $specialInstructions, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$WarehouseIntakeRequestCopyWith<$Res> implements $WarehouseIntakeRequestCopyWith<$Res> {
  factory _$WarehouseIntakeRequestCopyWith(_WarehouseIntakeRequest value, $Res Function(_WarehouseIntakeRequest) _then) = __$WarehouseIntakeRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'external_request_id') String externalRequestId,@JsonKey(name: 'warehouse_id') String warehouseId, Designer designer, List<LogisticsItem> items,@JsonKey(name: 'requested_pickup_at') DateTime? requestedPickupAt,@JsonKey(name: 'special_instructions') String? specialInstructions, Map<String, dynamic>? metadata
});


@override $DesignerCopyWith<$Res> get designer;

}
/// @nodoc
class __$WarehouseIntakeRequestCopyWithImpl<$Res>
    implements _$WarehouseIntakeRequestCopyWith<$Res> {
  __$WarehouseIntakeRequestCopyWithImpl(this._self, this._then);

  final _WarehouseIntakeRequest _self;
  final $Res Function(_WarehouseIntakeRequest) _then;

/// Create a copy of WarehouseIntakeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? externalRequestId = null,Object? warehouseId = null,Object? designer = null,Object? items = null,Object? requestedPickupAt = freezed,Object? specialInstructions = freezed,Object? metadata = freezed,}) {
  return _then(_WarehouseIntakeRequest(
externalRequestId: null == externalRequestId ? _self.externalRequestId : externalRequestId // ignore: cast_nullable_to_non_nullable
as String,warehouseId: null == warehouseId ? _self.warehouseId : warehouseId // ignore: cast_nullable_to_non_nullable
as String,designer: null == designer ? _self.designer : designer // ignore: cast_nullable_to_non_nullable
as Designer,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<LogisticsItem>,requestedPickupAt: freezed == requestedPickupAt ? _self.requestedPickupAt : requestedPickupAt // ignore: cast_nullable_to_non_nullable
as DateTime?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of WarehouseIntakeRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DesignerCopyWith<$Res> get designer {

  return $DesignerCopyWith<$Res>(_self.designer, (value) {
    return _then(_self.copyWith(designer: value));
  });
}
}

// dart format on
