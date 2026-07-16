// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CouponProductInfoStruct extends FFFirebaseStruct {
  CouponProductInfoStruct({
    String? productId,
    MainStruct? productMainInfo,
    String? productSku,
    double? productPrice,
    int? productQuantity,
    DocumentReference? productRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productId = productId,
        _productMainInfo = productMainInfo,
        _productSku = productSku,
        _productPrice = productPrice,
        _productQuantity = productQuantity,
        _productRef = productRef,
        super(firestoreUtilData);

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  // "product_main_info" field.
  MainStruct? _productMainInfo;
  MainStruct get productMainInfo => _productMainInfo ?? MainStruct();
  set productMainInfo(MainStruct? val) => _productMainInfo = val;

  void updateProductMainInfo(Function(MainStruct) updateFn) {
    updateFn(_productMainInfo ??= MainStruct());
  }

  bool hasProductMainInfo() => _productMainInfo != null;

  // "product_sku" field.
  String? _productSku;
  String get productSku => _productSku ?? '';
  set productSku(String? val) => _productSku = val;

  bool hasProductSku() => _productSku != null;

  // "product_price" field.
  double? _productPrice;
  double get productPrice => _productPrice ?? 0.0;
  set productPrice(double? val) => _productPrice = val;

  void incrementProductPrice(double amount) =>
      productPrice = productPrice + amount;

  bool hasProductPrice() => _productPrice != null;

  // "product_quantity" field.
  int? _productQuantity;
  int get productQuantity => _productQuantity ?? 0;
  set productQuantity(int? val) => _productQuantity = val;

  void incrementProductQuantity(int amount) =>
      productQuantity = productQuantity + amount;

  bool hasProductQuantity() => _productQuantity != null;

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  set productRef(DocumentReference? val) => _productRef = val;

  bool hasProductRef() => _productRef != null;

  static CouponProductInfoStruct fromMap(Map<String, dynamic> data) =>
      CouponProductInfoStruct(
        productId: data['product_id'] as String?,
        productMainInfo: data['product_main_info'] is MainStruct
            ? data['product_main_info']
            : MainStruct.maybeFromMap(data['product_main_info']),
        productSku: data['product_sku'] as String?,
        productPrice: castToType<double>(data['product_price']),
        productQuantity: castToType<int>(data['product_quantity']),
        productRef: data['product_ref'] as DocumentReference?,
      );

  static CouponProductInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? CouponProductInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_id': _productId,
        'product_main_info': _productMainInfo?.toMap(),
        'product_sku': _productSku,
        'product_price': _productPrice,
        'product_quantity': _productQuantity,
        'product_ref': _productRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_id': serializeParam(
          _productId,
          ParamType.String,
        ),
        'product_main_info': serializeParam(
          _productMainInfo,
          ParamType.DataStruct,
        ),
        'product_sku': serializeParam(
          _productSku,
          ParamType.String,
        ),
        'product_price': serializeParam(
          _productPrice,
          ParamType.double,
        ),
        'product_quantity': serializeParam(
          _productQuantity,
          ParamType.int,
        ),
        'product_ref': serializeParam(
          _productRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CouponProductInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CouponProductInfoStruct(
        productId: deserializeParam(
          data['product_id'],
          ParamType.String,
          false,
        ),
        productMainInfo: deserializeStructParam(
          data['product_main_info'],
          ParamType.DataStruct,
          false,
          structBuilder: MainStruct.fromSerializableMap,
        ),
        productSku: deserializeParam(
          data['product_sku'],
          ParamType.String,
          false,
        ),
        productPrice: deserializeParam(
          data['product_price'],
          ParamType.double,
          false,
        ),
        productQuantity: deserializeParam(
          data['product_quantity'],
          ParamType.int,
          false,
        ),
        productRef: deserializeParam(
          data['product_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
      );

  static CouponProductInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CouponProductInfoStruct(
        productId: convertAlgoliaParam(
          data['product_id'],
          ParamType.String,
          false,
        ),
        productMainInfo: convertAlgoliaParam(
          data['product_main_info'],
          ParamType.DataStruct,
          false,
          structBuilder: MainStruct.fromAlgoliaData,
        ),
        productSku: convertAlgoliaParam(
          data['product_sku'],
          ParamType.String,
          false,
        ),
        productPrice: convertAlgoliaParam(
          data['product_price'],
          ParamType.double,
          false,
        ),
        productQuantity: convertAlgoliaParam(
          data['product_quantity'],
          ParamType.int,
          false,
        ),
        productRef: convertAlgoliaParam(
          data['product_ref'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CouponProductInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CouponProductInfoStruct &&
        productId == other.productId &&
        productMainInfo == other.productMainInfo &&
        productSku == other.productSku &&
        productPrice == other.productPrice &&
        productQuantity == other.productQuantity &&
        productRef == other.productRef;
  }

  @override
  int get hashCode => const ListEquality().hash([
        productId,
        productMainInfo,
        productSku,
        productPrice,
        productQuantity,
        productRef
      ]);
}

CouponProductInfoStruct createCouponProductInfoStruct({
  String? productId,
  MainStruct? productMainInfo,
  String? productSku,
  double? productPrice,
  int? productQuantity,
  DocumentReference? productRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CouponProductInfoStruct(
      productId: productId,
      productMainInfo:
          productMainInfo ?? (clearUnsetFields ? MainStruct() : null),
      productSku: productSku,
      productPrice: productPrice,
      productQuantity: productQuantity,
      productRef: productRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CouponProductInfoStruct? updateCouponProductInfoStruct(
  CouponProductInfoStruct? couponProductInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    couponProductInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCouponProductInfoStructData(
  Map<String, dynamic> firestoreData,
  CouponProductInfoStruct? couponProductInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (couponProductInfo == null) {
    return;
  }
  if (couponProductInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && couponProductInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final couponProductInfoData =
      getCouponProductInfoFirestoreData(couponProductInfo, forFieldValue);
  final nestedData =
      couponProductInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = couponProductInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCouponProductInfoFirestoreData(
  CouponProductInfoStruct? couponProductInfo, [
  bool forFieldValue = false,
]) {
  if (couponProductInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(couponProductInfo.toMap());

  // Handle nested data for "product_main_info" field.
  addMainStructData(
    firestoreData,
    couponProductInfo.hasProductMainInfo()
        ? couponProductInfo.productMainInfo
        : null,
    'product_main_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(couponProductInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCouponProductInfoListFirestoreData(
  List<CouponProductInfoStruct>? couponProductInfos,
) =>
    couponProductInfos
        ?.map((e) => getCouponProductInfoFirestoreData(e, true))
        .toList() ??
    [];
