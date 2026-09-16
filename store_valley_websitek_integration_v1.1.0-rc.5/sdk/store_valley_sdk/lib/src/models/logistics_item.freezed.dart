// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logistics_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogisticsItem {

 String? get sku; int get quantity;@JsonKey(name: 'product_id') String? get productId;@JsonKey(name: 'product_name') String? get productName;@JsonKey(name: 'condition_notes') String? get conditionNotes;@JsonKey(name: 'packaging_notes') String? get packagingNotes;
/// Create a copy of LogisticsItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogisticsItemCopyWith<LogisticsItem> get copyWith => _$LogisticsItemCopyWithImpl<LogisticsItem>(this as LogisticsItem, _$identity);

  /// Serializes this LogisticsItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogisticsItem&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.conditionNotes, conditionNotes) || other.conditionNotes == conditionNotes)&&(identical(other.packagingNotes, packagingNotes) || other.packagingNotes == packagingNotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sku,quantity,productId,productName,conditionNotes,packagingNotes);

@override
String toString() {
  return 'LogisticsItem(sku: $sku, quantity: $quantity, productId: $productId, productName: $productName, conditionNotes: $conditionNotes, packagingNotes: $packagingNotes)';
}


}

/// @nodoc
abstract mixin class $LogisticsItemCopyWith<$Res>  {
  factory $LogisticsItemCopyWith(LogisticsItem value, $Res Function(LogisticsItem) _then) = _$LogisticsItemCopyWithImpl;
@useResult
$Res call({
 String? sku, int quantity,@JsonKey(name: 'product_id') String? productId,@JsonKey(name: 'product_name') String? productName,@JsonKey(name: 'condition_notes') String? conditionNotes,@JsonKey(name: 'packaging_notes') String? packagingNotes
});




}
/// @nodoc
class _$LogisticsItemCopyWithImpl<$Res>
    implements $LogisticsItemCopyWith<$Res> {
  _$LogisticsItemCopyWithImpl(this._self, this._then);

  final LogisticsItem _self;
  final $Res Function(LogisticsItem) _then;

/// Create a copy of LogisticsItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sku = freezed,Object? quantity = null,Object? productId = freezed,Object? productName = freezed,Object? conditionNotes = freezed,Object? packagingNotes = freezed,}) {
  return _then(_self.copyWith(
sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,conditionNotes: freezed == conditionNotes ? _self.conditionNotes : conditionNotes // ignore: cast_nullable_to_non_nullable
as String?,packagingNotes: freezed == packagingNotes ? _self.packagingNotes : packagingNotes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LogisticsItem].
extension LogisticsItemPatterns on LogisticsItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogisticsItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogisticsItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogisticsItem value)  $default,){
final _that = this;
switch (_that) {
case _LogisticsItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogisticsItem value)?  $default,){
final _that = this;
switch (_that) {
case _LogisticsItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? sku,  int quantity, @JsonKey(name: 'product_id')  String? productId, @JsonKey(name: 'product_name')  String? productName, @JsonKey(name: 'condition_notes')  String? conditionNotes, @JsonKey(name: 'packaging_notes')  String? packagingNotes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogisticsItem() when $default != null:
return $default(_that.sku,_that.quantity,_that.productId,_that.productName,_that.conditionNotes,_that.packagingNotes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? sku,  int quantity, @JsonKey(name: 'product_id')  String? productId, @JsonKey(name: 'product_name')  String? productName, @JsonKey(name: 'condition_notes')  String? conditionNotes, @JsonKey(name: 'packaging_notes')  String? packagingNotes)  $default,) {final _that = this;
switch (_that) {
case _LogisticsItem():
return $default(_that.sku,_that.quantity,_that.productId,_that.productName,_that.conditionNotes,_that.packagingNotes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? sku,  int quantity, @JsonKey(name: 'product_id')  String? productId, @JsonKey(name: 'product_name')  String? productName, @JsonKey(name: 'condition_notes')  String? conditionNotes, @JsonKey(name: 'packaging_notes')  String? packagingNotes)?  $default,) {final _that = this;
switch (_that) {
case _LogisticsItem() when $default != null:
return $default(_that.sku,_that.quantity,_that.productId,_that.productName,_that.conditionNotes,_that.packagingNotes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogisticsItem implements LogisticsItem {
  const _LogisticsItem({this.sku, required this.quantity, @JsonKey(name: 'product_id') this.productId, @JsonKey(name: 'product_name') this.productName, @JsonKey(name: 'condition_notes') this.conditionNotes, @JsonKey(name: 'packaging_notes') this.packagingNotes}): assert(sku != null || productId != null, 'sku or productId is required'),assert(quantity > 0, 'quantity must be positive');
  factory _LogisticsItem.fromJson(Map<String, dynamic> json) => _$LogisticsItemFromJson(json);

@override final  String? sku;
@override final  int quantity;
@override@JsonKey(name: 'product_id') final  String? productId;
@override@JsonKey(name: 'product_name') final  String? productName;
@override@JsonKey(name: 'condition_notes') final  String? conditionNotes;
@override@JsonKey(name: 'packaging_notes') final  String? packagingNotes;

/// Create a copy of LogisticsItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogisticsItemCopyWith<_LogisticsItem> get copyWith => __$LogisticsItemCopyWithImpl<_LogisticsItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogisticsItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogisticsItem&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.conditionNotes, conditionNotes) || other.conditionNotes == conditionNotes)&&(identical(other.packagingNotes, packagingNotes) || other.packagingNotes == packagingNotes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sku,quantity,productId,productName,conditionNotes,packagingNotes);

@override
String toString() {
  return 'LogisticsItem(sku: $sku, quantity: $quantity, productId: $productId, productName: $productName, conditionNotes: $conditionNotes, packagingNotes: $packagingNotes)';
}


}

/// @nodoc
abstract mixin class _$LogisticsItemCopyWith<$Res> implements $LogisticsItemCopyWith<$Res> {
  factory _$LogisticsItemCopyWith(_LogisticsItem value, $Res Function(_LogisticsItem) _then) = __$LogisticsItemCopyWithImpl;
@override @useResult
$Res call({
 String? sku, int quantity,@JsonKey(name: 'product_id') String? productId,@JsonKey(name: 'product_name') String? productName,@JsonKey(name: 'condition_notes') String? conditionNotes,@JsonKey(name: 'packaging_notes') String? packagingNotes
});




}
/// @nodoc
class __$LogisticsItemCopyWithImpl<$Res>
    implements _$LogisticsItemCopyWith<$Res> {
  __$LogisticsItemCopyWithImpl(this._self, this._then);

  final _LogisticsItem _self;
  final $Res Function(_LogisticsItem) _then;

/// Create a copy of LogisticsItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sku = freezed,Object? quantity = null,Object? productId = freezed,Object? productName = freezed,Object? conditionNotes = freezed,Object? packagingNotes = freezed,}) {
  return _then(_LogisticsItem(
sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,conditionNotes: freezed == conditionNotes ? _self.conditionNotes : conditionNotes // ignore: cast_nullable_to_non_nullable
as String?,packagingNotes: freezed == packagingNotes ? _self.packagingNotes : packagingNotes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
