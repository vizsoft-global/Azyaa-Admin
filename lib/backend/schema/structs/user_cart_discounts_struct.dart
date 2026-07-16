// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCartDiscountsStruct extends FFFirebaseStruct {
  UserCartDiscountsStruct({
    int? couponId,
    String? couponCode,
    InfoStruct? discountType,
    double? discountValue,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _couponId = couponId,
        _couponCode = couponCode,
        _discountType = discountType,
        _discountValue = discountValue,
        super(firestoreUtilData);

  // "coupon_id" field.
  int? _couponId;
  int get couponId => _couponId ?? 0;
  set couponId(int? val) => _couponId = val;

  void incrementCouponId(int amount) => couponId = couponId + amount;

  bool hasCouponId() => _couponId != null;

  // "coupon_code" field.
  String? _couponCode;
  String get couponCode => _couponCode ?? '';
  set couponCode(String? val) => _couponCode = val;

  bool hasCouponCode() => _couponCode != null;

  // "discount_type" field.
  InfoStruct? _discountType;
  InfoStruct get discountType => _discountType ?? InfoStruct();
  set discountType(InfoStruct? val) => _discountType = val;

  void updateDiscountType(Function(InfoStruct) updateFn) {
    updateFn(_discountType ??= InfoStruct());
  }

  bool hasDiscountType() => _discountType != null;

  // "discount_value" field.
  double? _discountValue;
  double get discountValue => _discountValue ?? 0.0;
  set discountValue(double? val) => _discountValue = val;

  void incrementDiscountValue(double amount) =>
      discountValue = discountValue + amount;

  bool hasDiscountValue() => _discountValue != null;

  static UserCartDiscountsStruct fromMap(Map<String, dynamic> data) =>
      UserCartDiscountsStruct(
        couponId: castToType<int>(data['coupon_id']),
        couponCode: data['coupon_code'] as String?,
        discountType: data['discount_type'] is InfoStruct
            ? data['discount_type']
            : InfoStruct.maybeFromMap(data['discount_type']),
        discountValue: castToType<double>(data['discount_value']),
      );

  static UserCartDiscountsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserCartDiscountsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'coupon_id': _couponId,
        'coupon_code': _couponCode,
        'discount_type': _discountType?.toMap(),
        'discount_value': _discountValue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'coupon_id': serializeParam(
          _couponId,
          ParamType.int,
        ),
        'coupon_code': serializeParam(
          _couponCode,
          ParamType.String,
        ),
        'discount_type': serializeParam(
          _discountType,
          ParamType.DataStruct,
        ),
        'discount_value': serializeParam(
          _discountValue,
          ParamType.double,
        ),
      }.withoutNulls;

  static UserCartDiscountsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserCartDiscountsStruct(
        couponId: deserializeParam(
          data['coupon_id'],
          ParamType.int,
          false,
        ),
        couponCode: deserializeParam(
          data['coupon_code'],
          ParamType.String,
          false,
        ),
        discountType: deserializeStructParam(
          data['discount_type'],
          ParamType.DataStruct,
          false,
          structBuilder: InfoStruct.fromSerializableMap,
        ),
        discountValue: deserializeParam(
          data['discount_value'],
          ParamType.double,
          false,
        ),
      );

  static UserCartDiscountsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserCartDiscountsStruct(
        couponId: convertAlgoliaParam(
          data['coupon_id'],
          ParamType.int,
          false,
        ),
        couponCode: convertAlgoliaParam(
          data['coupon_code'],
          ParamType.String,
          false,
        ),
        discountType: convertAlgoliaParam(
          data['discount_type'],
          ParamType.DataStruct,
          false,
          structBuilder: InfoStruct.fromAlgoliaData,
        ),
        discountValue: convertAlgoliaParam(
          data['discount_value'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserCartDiscountsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserCartDiscountsStruct &&
        couponId == other.couponId &&
        couponCode == other.couponCode &&
        discountType == other.discountType &&
        discountValue == other.discountValue;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([couponId, couponCode, discountType, discountValue]);
}

UserCartDiscountsStruct createUserCartDiscountsStruct({
  int? couponId,
  String? couponCode,
  InfoStruct? discountType,
  double? discountValue,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserCartDiscountsStruct(
      couponId: couponId,
      couponCode: couponCode,
      discountType: discountType ?? (clearUnsetFields ? InfoStruct() : null),
      discountValue: discountValue,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserCartDiscountsStruct? updateUserCartDiscountsStruct(
  UserCartDiscountsStruct? userCartDiscounts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userCartDiscounts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserCartDiscountsStructData(
  Map<String, dynamic> firestoreData,
  UserCartDiscountsStruct? userCartDiscounts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userCartDiscounts == null) {
    return;
  }
  if (userCartDiscounts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userCartDiscounts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userCartDiscountsData =
      getUserCartDiscountsFirestoreData(userCartDiscounts, forFieldValue);
  final nestedData =
      userCartDiscountsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userCartDiscounts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserCartDiscountsFirestoreData(
  UserCartDiscountsStruct? userCartDiscounts, [
  bool forFieldValue = false,
]) {
  if (userCartDiscounts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userCartDiscounts.toMap());

  // Handle nested data for "discount_type" field.
  addInfoStructData(
    firestoreData,
    userCartDiscounts.hasDiscountType() ? userCartDiscounts.discountType : null,
    'discount_type',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(userCartDiscounts.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserCartDiscountsListFirestoreData(
  List<UserCartDiscountsStruct>? userCartDiscountss,
) =>
    userCartDiscountss
        ?.map((e) => getUserCartDiscountsFirestoreData(e, true))
        .toList() ??
    [];
