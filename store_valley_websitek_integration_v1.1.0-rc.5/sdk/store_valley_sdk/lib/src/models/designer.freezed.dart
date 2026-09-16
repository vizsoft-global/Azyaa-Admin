// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'designer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Designer {

@JsonKey(name: 'designer_id') String get designerId; String? get name;@JsonKey(name: 'pickup_address') Address get pickupAddress;
/// Create a copy of Designer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignerCopyWith<Designer> get copyWith => _$DesignerCopyWithImpl<Designer>(this as Designer, _$identity);

  /// Serializes this Designer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Designer&&(identical(other.designerId, designerId) || other.designerId == designerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.pickupAddress, pickupAddress) || other.pickupAddress == pickupAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,designerId,name,pickupAddress);

@override
String toString() {
  return 'Designer(designerId: $designerId, name: $name, pickupAddress: $pickupAddress)';
}


}

/// @nodoc
abstract mixin class $DesignerCopyWith<$Res>  {
  factory $DesignerCopyWith(Designer value, $Res Function(Designer) _then) = _$DesignerCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'designer_id') String designerId, String? name,@JsonKey(name: 'pickup_address') Address pickupAddress
});


$AddressCopyWith<$Res> get pickupAddress;

}
/// @nodoc
class _$DesignerCopyWithImpl<$Res>
    implements $DesignerCopyWith<$Res> {
  _$DesignerCopyWithImpl(this._self, this._then);

  final Designer _self;
  final $Res Function(Designer) _then;

/// Create a copy of Designer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? designerId = null,Object? name = freezed,Object? pickupAddress = null,}) {
  return _then(_self.copyWith(
designerId: null == designerId ? _self.designerId : designerId // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,pickupAddress: null == pickupAddress ? _self.pickupAddress : pickupAddress // ignore: cast_nullable_to_non_nullable
as Address,
  ));
}
/// Create a copy of Designer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get pickupAddress {

  return $AddressCopyWith<$Res>(_self.pickupAddress, (value) {
    return _then(_self.copyWith(pickupAddress: value));
  });
}
}


/// Adds pattern-matching-related methods to [Designer].
extension DesignerPatterns on Designer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Designer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Designer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Designer value)  $default,){
final _that = this;
switch (_that) {
case _Designer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Designer value)?  $default,){
final _that = this;
switch (_that) {
case _Designer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'designer_id')  String designerId,  String? name, @JsonKey(name: 'pickup_address')  Address pickupAddress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Designer() when $default != null:
return $default(_that.designerId,_that.name,_that.pickupAddress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'designer_id')  String designerId,  String? name, @JsonKey(name: 'pickup_address')  Address pickupAddress)  $default,) {final _that = this;
switch (_that) {
case _Designer():
return $default(_that.designerId,_that.name,_that.pickupAddress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'designer_id')  String designerId,  String? name, @JsonKey(name: 'pickup_address')  Address pickupAddress)?  $default,) {final _that = this;
switch (_that) {
case _Designer() when $default != null:
return $default(_that.designerId,_that.name,_that.pickupAddress);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _Designer implements Designer {
  const _Designer({@JsonKey(name: 'designer_id') required this.designerId, this.name, @JsonKey(name: 'pickup_address') required this.pickupAddress});
  factory _Designer.fromJson(Map<String, dynamic> json) => _$DesignerFromJson(json);

@override@JsonKey(name: 'designer_id') final  String designerId;
@override final  String? name;
@override@JsonKey(name: 'pickup_address') final  Address pickupAddress;

/// Create a copy of Designer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignerCopyWith<_Designer> get copyWith => __$DesignerCopyWithImpl<_Designer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DesignerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Designer&&(identical(other.designerId, designerId) || other.designerId == designerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.pickupAddress, pickupAddress) || other.pickupAddress == pickupAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,designerId,name,pickupAddress);

@override
String toString() {
  return 'Designer(designerId: $designerId, name: $name, pickupAddress: $pickupAddress)';
}


}

/// @nodoc
abstract mixin class _$DesignerCopyWith<$Res> implements $DesignerCopyWith<$Res> {
  factory _$DesignerCopyWith(_Designer value, $Res Function(_Designer) _then) = __$DesignerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'designer_id') String designerId, String? name,@JsonKey(name: 'pickup_address') Address pickupAddress
});


@override $AddressCopyWith<$Res> get pickupAddress;

}
/// @nodoc
class __$DesignerCopyWithImpl<$Res>
    implements _$DesignerCopyWith<$Res> {
  __$DesignerCopyWithImpl(this._self, this._then);

  final _Designer _self;
  final $Res Function(_Designer) _then;

/// Create a copy of Designer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? designerId = null,Object? name = freezed,Object? pickupAddress = null,}) {
  return _then(_Designer(
designerId: null == designerId ? _self.designerId : designerId // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,pickupAddress: null == pickupAddress ? _self.pickupAddress : pickupAddress // ignore: cast_nullable_to_non_nullable
as Address,
  ));
}

/// Create a copy of Designer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressCopyWith<$Res> get pickupAddress {

  return $AddressCopyWith<$Res>(_self.pickupAddress, (value) {
    return _then(_self.copyWith(pickupAddress: value));
  });
}
}

// dart format on
