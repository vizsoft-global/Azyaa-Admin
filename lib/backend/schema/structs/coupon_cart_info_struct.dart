// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CouponCartInfoStruct extends FFFirebaseStruct {
  CouponCartInfoStruct({
    DocumentReference? couponRef,
    String? couponId,
    String? couponValue,
    double? couponDiscountedPrice,
    String? couponDiscountType,
    CouponUserInfoStruct? couponUserInfo,
    double? couponDiscountAmountValue,
    double? couponMaximumDiscount,
    double? couponMaximumAmount,
    double? couponMinimumAmount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _couponRef = couponRef,
        _couponId = couponId,
        _couponValue = couponValue,
        _couponDiscountedPrice = couponDiscountedPrice,
        _couponDiscountType = couponDiscountType,
        _couponUserInfo = couponUserInfo,
        _couponDiscountAmountValue = couponDiscountAmountValue,
        _couponMaximumDiscount = couponMaximumDiscount,
        _couponMaximumAmount = couponMaximumAmount,
        _couponMinimumAmount = couponMinimumAmount,
        super(firestoreUtilData);

  // "coupon_ref" field.
  DocumentReference? _couponRef;
  DocumentReference? get couponRef => _couponRef;
  set couponRef(DocumentReference? val) => _couponRef = val;

  bool hasCouponRef() => _couponRef != null;

  // "coupon_id" field.
  String? _couponId;
  String get couponId => _couponId ?? '';
  set couponId(String? val) => _couponId = val;

  bool hasCouponId() => _couponId != null;

  // "coupon_value" field.
  String? _couponValue;
  String get couponValue => _couponValue ?? '';
  set couponValue(String? val) => _couponValue = val;

  bool hasCouponValue() => _couponValue != null;

  // "coupon_discounted_price" field.
  double? _couponDiscountedPrice;
  double get couponDiscountedPrice => _couponDiscountedPrice ?? 0.0;
  set couponDiscountedPrice(double? val) => _couponDiscountedPrice = val;

  void incrementCouponDiscountedPrice(double amount) =>
      couponDiscountedPrice = couponDiscountedPrice + amount;

  bool hasCouponDiscountedPrice() => _couponDiscountedPrice != null;

  // "coupon_discount_type" field.
  String? _couponDiscountType;
  String get couponDiscountType => _couponDiscountType ?? '';
  set couponDiscountType(String? val) => _couponDiscountType = val;

  bool hasCouponDiscountType() => _couponDiscountType != null;

  // "coupon_user_info" field.
  CouponUserInfoStruct? _couponUserInfo;
  CouponUserInfoStruct get couponUserInfo =>
      _couponUserInfo ?? CouponUserInfoStruct();
  set couponUserInfo(CouponUserInfoStruct? val) => _couponUserInfo = val;

  void updateCouponUserInfo(Function(CouponUserInfoStruct) updateFn) {
    updateFn(_couponUserInfo ??= CouponUserInfoStruct());
  }

  bool hasCouponUserInfo() => _couponUserInfo != null;

  // "coupon_discount_amount_value" field.
  double? _couponDiscountAmountValue;
  double get couponDiscountAmountValue => _couponDiscountAmountValue ?? 0.0;
  set couponDiscountAmountValue(double? val) =>
      _couponDiscountAmountValue = val;

  void incrementCouponDiscountAmountValue(double amount) =>
      couponDiscountAmountValue = couponDiscountAmountValue + amount;

  bool hasCouponDiscountAmountValue() => _couponDiscountAmountValue != null;

  // "coupon_maximum_discount" field.
  double? _couponMaximumDiscount;
  double get couponMaximumDiscount => _couponMaximumDiscount ?? 0.0;
  set couponMaximumDiscount(double? val) => _couponMaximumDiscount = val;

  void incrementCouponMaximumDiscount(double amount) =>
      couponMaximumDiscount = couponMaximumDiscount + amount;

  bool hasCouponMaximumDiscount() => _couponMaximumDiscount != null;

  // "coupon_maximum_amount" field.
  double? _couponMaximumAmount;
  double get couponMaximumAmount => _couponMaximumAmount ?? 0.0;
  set couponMaximumAmount(double? val) => _couponMaximumAmount = val;

  void incrementCouponMaximumAmount(double amount) =>
      couponMaximumAmount = couponMaximumAmount + amount;

  bool hasCouponMaximumAmount() => _couponMaximumAmount != null;

  // "coupon_minimum_amount" field.
  double? _couponMinimumAmount;
  double get couponMinimumAmount => _couponMinimumAmount ?? 0.0;
  set couponMinimumAmount(double? val) => _couponMinimumAmount = val;

  void incrementCouponMinimumAmount(double amount) =>
      couponMinimumAmount = couponMinimumAmount + amount;

  bool hasCouponMinimumAmount() => _couponMinimumAmount != null;

  static CouponCartInfoStruct fromMap(Map<String, dynamic> data) =>
      CouponCartInfoStruct(
        couponRef: data['coupon_ref'] as DocumentReference?,
        couponId: data['coupon_id'] as String?,
        couponValue: data['coupon_value'] as String?,
        couponDiscountedPrice:
            castToType<double>(data['coupon_discounted_price']),
        couponDiscountType: data['coupon_discount_type'] as String?,
        couponUserInfo: data['coupon_user_info'] is CouponUserInfoStruct
            ? data['coupon_user_info']
            : CouponUserInfoStruct.maybeFromMap(data['coupon_user_info']),
        couponDiscountAmountValue:
            castToType<double>(data['coupon_discount_amount_value']),
        couponMaximumDiscount:
            castToType<double>(data['coupon_maximum_discount']),
        couponMaximumAmount: castToType<double>(data['coupon_maximum_amount']),
        couponMinimumAmount: castToType<double>(data['coupon_minimum_amount']),
      );

  static CouponCartInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? CouponCartInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'coupon_ref': _couponRef,
        'coupon_id': _couponId,
        'coupon_value': _couponValue,
        'coupon_discounted_price': _couponDiscountedPrice,
        'coupon_discount_type': _couponDiscountType,
        'coupon_user_info': _couponUserInfo?.toMap(),
        'coupon_discount_amount_value': _couponDiscountAmountValue,
        'coupon_maximum_discount': _couponMaximumDiscount,
        'coupon_maximum_amount': _couponMaximumAmount,
        'coupon_minimum_amount': _couponMinimumAmount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'coupon_ref': serializeParam(
          _couponRef,
          ParamType.DocumentReference,
        ),
        'coupon_id': serializeParam(
          _couponId,
          ParamType.String,
        ),
        'coupon_value': serializeParam(
          _couponValue,
          ParamType.String,
        ),
        'coupon_discounted_price': serializeParam(
          _couponDiscountedPrice,
          ParamType.double,
        ),
        'coupon_discount_type': serializeParam(
          _couponDiscountType,
          ParamType.String,
        ),
        'coupon_user_info': serializeParam(
          _couponUserInfo,
          ParamType.DataStruct,
        ),
        'coupon_discount_amount_value': serializeParam(
          _couponDiscountAmountValue,
          ParamType.double,
        ),
        'coupon_maximum_discount': serializeParam(
          _couponMaximumDiscount,
          ParamType.double,
        ),
        'coupon_maximum_amount': serializeParam(
          _couponMaximumAmount,
          ParamType.double,
        ),
        'coupon_minimum_amount': serializeParam(
          _couponMinimumAmount,
          ParamType.double,
        ),
      }.withoutNulls;

  static CouponCartInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      CouponCartInfoStruct(
        couponRef: deserializeParam(
          data['coupon_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['coupon'],
        ),
        couponId: deserializeParam(
          data['coupon_id'],
          ParamType.String,
          false,
        ),
        couponValue: deserializeParam(
          data['coupon_value'],
          ParamType.String,
          false,
        ),
        couponDiscountedPrice: deserializeParam(
          data['coupon_discounted_price'],
          ParamType.double,
          false,
        ),
        couponDiscountType: deserializeParam(
          data['coupon_discount_type'],
          ParamType.String,
          false,
        ),
        couponUserInfo: deserializeStructParam(
          data['coupon_user_info'],
          ParamType.DataStruct,
          false,
          structBuilder: CouponUserInfoStruct.fromSerializableMap,
        ),
        couponDiscountAmountValue: deserializeParam(
          data['coupon_discount_amount_value'],
          ParamType.double,
          false,
        ),
        couponMaximumDiscount: deserializeParam(
          data['coupon_maximum_discount'],
          ParamType.double,
          false,
        ),
        couponMaximumAmount: deserializeParam(
          data['coupon_maximum_amount'],
          ParamType.double,
          false,
        ),
        couponMinimumAmount: deserializeParam(
          data['coupon_minimum_amount'],
          ParamType.double,
          false,
        ),
      );

  static CouponCartInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CouponCartInfoStruct(
        couponRef: convertAlgoliaParam(
          data['coupon_ref'],
          ParamType.DocumentReference,
          false,
        ),
        couponId: convertAlgoliaParam(
          data['coupon_id'],
          ParamType.String,
          false,
        ),
        couponValue: convertAlgoliaParam(
          data['coupon_value'],
          ParamType.String,
          false,
        ),
        couponDiscountedPrice: convertAlgoliaParam(
          data['coupon_discounted_price'],
          ParamType.double,
          false,
        ),
        couponDiscountType: convertAlgoliaParam(
          data['coupon_discount_type'],
          ParamType.String,
          false,
        ),
        couponUserInfo: convertAlgoliaParam(
          data['coupon_user_info'],
          ParamType.DataStruct,
          false,
          structBuilder: CouponUserInfoStruct.fromAlgoliaData,
        ),
        couponDiscountAmountValue: convertAlgoliaParam(
          data['coupon_discount_amount_value'],
          ParamType.double,
          false,
        ),
        couponMaximumDiscount: convertAlgoliaParam(
          data['coupon_maximum_discount'],
          ParamType.double,
          false,
        ),
        couponMaximumAmount: convertAlgoliaParam(
          data['coupon_maximum_amount'],
          ParamType.double,
          false,
        ),
        couponMinimumAmount: convertAlgoliaParam(
          data['coupon_minimum_amount'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CouponCartInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CouponCartInfoStruct &&
        couponRef == other.couponRef &&
        couponId == other.couponId &&
        couponValue == other.couponValue &&
        couponDiscountedPrice == other.couponDiscountedPrice &&
        couponDiscountType == other.couponDiscountType &&
        couponUserInfo == other.couponUserInfo &&
        couponDiscountAmountValue == other.couponDiscountAmountValue &&
        couponMaximumDiscount == other.couponMaximumDiscount &&
        couponMaximumAmount == other.couponMaximumAmount &&
        couponMinimumAmount == other.couponMinimumAmount;
  }

  @override
  int get hashCode => const ListEquality().hash([
        couponRef,
        couponId,
        couponValue,
        couponDiscountedPrice,
        couponDiscountType,
        couponUserInfo,
        couponDiscountAmountValue,
        couponMaximumDiscount,
        couponMaximumAmount,
        couponMinimumAmount
      ]);
}

CouponCartInfoStruct createCouponCartInfoStruct({
  DocumentReference? couponRef,
  String? couponId,
  String? couponValue,
  double? couponDiscountedPrice,
  String? couponDiscountType,
  CouponUserInfoStruct? couponUserInfo,
  double? couponDiscountAmountValue,
  double? couponMaximumDiscount,
  double? couponMaximumAmount,
  double? couponMinimumAmount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CouponCartInfoStruct(
      couponRef: couponRef,
      couponId: couponId,
      couponValue: couponValue,
      couponDiscountedPrice: couponDiscountedPrice,
      couponDiscountType: couponDiscountType,
      couponUserInfo:
          couponUserInfo ?? (clearUnsetFields ? CouponUserInfoStruct() : null),
      couponDiscountAmountValue: couponDiscountAmountValue,
      couponMaximumDiscount: couponMaximumDiscount,
      couponMaximumAmount: couponMaximumAmount,
      couponMinimumAmount: couponMinimumAmount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CouponCartInfoStruct? updateCouponCartInfoStruct(
  CouponCartInfoStruct? couponCartInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    couponCartInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCouponCartInfoStructData(
  Map<String, dynamic> firestoreData,
  CouponCartInfoStruct? couponCartInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (couponCartInfo == null) {
    return;
  }
  if (couponCartInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && couponCartInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final couponCartInfoData =
      getCouponCartInfoFirestoreData(couponCartInfo, forFieldValue);
  final nestedData =
      couponCartInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = couponCartInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCouponCartInfoFirestoreData(
  CouponCartInfoStruct? couponCartInfo, [
  bool forFieldValue = false,
]) {
  if (couponCartInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(couponCartInfo.toMap());

  // Handle nested data for "coupon_user_info" field.
  addCouponUserInfoStructData(
    firestoreData,
    couponCartInfo.hasCouponUserInfo() ? couponCartInfo.couponUserInfo : null,
    'coupon_user_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(couponCartInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCouponCartInfoListFirestoreData(
  List<CouponCartInfoStruct>? couponCartInfos,
) =>
    couponCartInfos
        ?.map((e) => getCouponCartInfoFirestoreData(e, true))
        .toList() ??
    [];
