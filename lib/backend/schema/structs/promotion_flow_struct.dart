// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromotionFlowStruct extends FFFirebaseStruct {
  PromotionFlowStruct({
    List<InfoStruct>? productDetails,
    List<DocumentReference>? productRef,
    List<ProductStockStruct>? productPricesInfo,
    InfoStruct? promotionInfo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productDetails = productDetails,
        _productRef = productRef,
        _productPricesInfo = productPricesInfo,
        _promotionInfo = promotionInfo,
        super(firestoreUtilData);

  // "product_details" field.
  List<InfoStruct>? _productDetails;
  List<InfoStruct> get productDetails => _productDetails ?? const [];
  set productDetails(List<InfoStruct>? val) => _productDetails = val;

  void updateProductDetails(Function(List<InfoStruct>) updateFn) {
    updateFn(_productDetails ??= []);
  }

  bool hasProductDetails() => _productDetails != null;

  // "product_ref" field.
  List<DocumentReference>? _productRef;
  List<DocumentReference> get productRef => _productRef ?? const [];
  set productRef(List<DocumentReference>? val) => _productRef = val;

  void updateProductRef(Function(List<DocumentReference>) updateFn) {
    updateFn(_productRef ??= []);
  }

  bool hasProductRef() => _productRef != null;

  // "product_prices_info" field.
  List<ProductStockStruct>? _productPricesInfo;
  List<ProductStockStruct> get productPricesInfo =>
      _productPricesInfo ?? const [];
  set productPricesInfo(List<ProductStockStruct>? val) =>
      _productPricesInfo = val;

  void updateProductPricesInfo(Function(List<ProductStockStruct>) updateFn) {
    updateFn(_productPricesInfo ??= []);
  }

  bool hasProductPricesInfo() => _productPricesInfo != null;

  // "promotion_info" field.
  InfoStruct? _promotionInfo;
  InfoStruct get promotionInfo => _promotionInfo ?? InfoStruct();
  set promotionInfo(InfoStruct? val) => _promotionInfo = val;

  void updatePromotionInfo(Function(InfoStruct) updateFn) {
    updateFn(_promotionInfo ??= InfoStruct());
  }

  bool hasPromotionInfo() => _promotionInfo != null;

  static PromotionFlowStruct fromMap(Map<String, dynamic> data) =>
      PromotionFlowStruct(
        productDetails: getStructList(
          data['product_details'],
          InfoStruct.fromMap,
        ),
        productRef: getDataList(data['product_ref']),
        productPricesInfo: getStructList(
          data['product_prices_info'],
          ProductStockStruct.fromMap,
        ),
        promotionInfo: data['promotion_info'] is InfoStruct
            ? data['promotion_info']
            : InfoStruct.maybeFromMap(data['promotion_info']),
      );

  static PromotionFlowStruct? maybeFromMap(dynamic data) => data is Map
      ? PromotionFlowStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_details': _productDetails?.map((e) => e.toMap()).toList(),
        'product_ref': _productRef,
        'product_prices_info':
            _productPricesInfo?.map((e) => e.toMap()).toList(),
        'promotion_info': _promotionInfo?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_details': serializeParam(
          _productDetails,
          ParamType.DataStruct,
          isList: true,
        ),
        'product_ref': serializeParam(
          _productRef,
          ParamType.DocumentReference,
          isList: true,
        ),
        'product_prices_info': serializeParam(
          _productPricesInfo,
          ParamType.DataStruct,
          isList: true,
        ),
        'promotion_info': serializeParam(
          _promotionInfo,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static PromotionFlowStruct fromSerializableMap(Map<String, dynamic> data) =>
      PromotionFlowStruct(
        productDetails: deserializeStructParam<InfoStruct>(
          data['product_details'],
          ParamType.DataStruct,
          true,
          structBuilder: InfoStruct.fromSerializableMap,
        ),
        productRef: deserializeParam<DocumentReference>(
          data['product_ref'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['products'],
        ),
        productPricesInfo: deserializeStructParam<ProductStockStruct>(
          data['product_prices_info'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductStockStruct.fromSerializableMap,
        ),
        promotionInfo: deserializeStructParam(
          data['promotion_info'],
          ParamType.DataStruct,
          false,
          structBuilder: InfoStruct.fromSerializableMap,
        ),
      );

  static PromotionFlowStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PromotionFlowStruct(
        productDetails: convertAlgoliaParam<InfoStruct>(
          data['product_details'],
          ParamType.DataStruct,
          true,
          structBuilder: InfoStruct.fromAlgoliaData,
        ),
        productRef: convertAlgoliaParam<DocumentReference>(
          data['product_ref'],
          ParamType.DocumentReference,
          true,
        ),
        productPricesInfo: convertAlgoliaParam<ProductStockStruct>(
          data['product_prices_info'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductStockStruct.fromAlgoliaData,
        ),
        promotionInfo: convertAlgoliaParam(
          data['promotion_info'],
          ParamType.DataStruct,
          false,
          structBuilder: InfoStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PromotionFlowStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PromotionFlowStruct &&
        listEquality.equals(productDetails, other.productDetails) &&
        listEquality.equals(productRef, other.productRef) &&
        listEquality.equals(productPricesInfo, other.productPricesInfo) &&
        promotionInfo == other.promotionInfo;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([productDetails, productRef, productPricesInfo, promotionInfo]);
}

PromotionFlowStruct createPromotionFlowStruct({
  InfoStruct? promotionInfo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PromotionFlowStruct(
      promotionInfo: promotionInfo ?? (clearUnsetFields ? InfoStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PromotionFlowStruct? updatePromotionFlowStruct(
  PromotionFlowStruct? promotionFlow, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    promotionFlow
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPromotionFlowStructData(
  Map<String, dynamic> firestoreData,
  PromotionFlowStruct? promotionFlow,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (promotionFlow == null) {
    return;
  }
  if (promotionFlow.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && promotionFlow.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final promotionFlowData =
      getPromotionFlowFirestoreData(promotionFlow, forFieldValue);
  final nestedData =
      promotionFlowData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = promotionFlow.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPromotionFlowFirestoreData(
  PromotionFlowStruct? promotionFlow, [
  bool forFieldValue = false,
]) {
  if (promotionFlow == null) {
    return {};
  }
  final firestoreData = mapToFirestore(promotionFlow.toMap());

  // Handle nested data for "promotion_info" field.
  addInfoStructData(
    firestoreData,
    promotionFlow.hasPromotionInfo() ? promotionFlow.promotionInfo : null,
    'promotion_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(promotionFlow.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPromotionFlowListFirestoreData(
  List<PromotionFlowStruct>? promotionFlows,
) =>
    promotionFlows
        ?.map((e) => getPromotionFlowFirestoreData(e, true))
        .toList() ??
    [];
