// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductVariationStruct extends FFFirebaseStruct {
  ProductVariationStruct({
    String? status,
    int? variationId,
    ProductVariationsListStruct? productDefaultVariation,
    List<ProductVariationsListStruct>? productVariationList,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _variationId = variationId,
        _productDefaultVariation = productDefaultVariation,
        _productVariationList = productVariationList,
        super(firestoreUtilData);

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "variation_id" field.
  int? _variationId;
  int get variationId => _variationId ?? 0;
  set variationId(int? val) => _variationId = val;

  void incrementVariationId(int amount) => variationId = variationId + amount;

  bool hasVariationId() => _variationId != null;

  // "product_default_variation" field.
  ProductVariationsListStruct? _productDefaultVariation;
  ProductVariationsListStruct get productDefaultVariation =>
      _productDefaultVariation ?? ProductVariationsListStruct();
  set productDefaultVariation(ProductVariationsListStruct? val) =>
      _productDefaultVariation = val;

  void updateProductDefaultVariation(
      Function(ProductVariationsListStruct) updateFn) {
    updateFn(_productDefaultVariation ??= ProductVariationsListStruct());
  }

  bool hasProductDefaultVariation() => _productDefaultVariation != null;

  // "product_variation_list" field.
  List<ProductVariationsListStruct>? _productVariationList;
  List<ProductVariationsListStruct> get productVariationList =>
      _productVariationList ?? const [];
  set productVariationList(List<ProductVariationsListStruct>? val) =>
      _productVariationList = val;

  void updateProductVariationList(
      Function(List<ProductVariationsListStruct>) updateFn) {
    updateFn(_productVariationList ??= []);
  }

  bool hasProductVariationList() => _productVariationList != null;

  static ProductVariationStruct fromMap(Map<String, dynamic> data) =>
      ProductVariationStruct(
        status: data['status'] as String?,
        variationId: castToType<int>(data['variation_id']),
        productDefaultVariation:
            data['product_default_variation'] is ProductVariationsListStruct
                ? data['product_default_variation']
                : ProductVariationsListStruct.maybeFromMap(
                    data['product_default_variation']),
        productVariationList: getStructList(
          data['product_variation_list'],
          ProductVariationsListStruct.fromMap,
        ),
      );

  static ProductVariationStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductVariationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'variation_id': _variationId,
        'product_default_variation': _productDefaultVariation?.toMap(),
        'product_variation_list':
            _productVariationList?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'variation_id': serializeParam(
          _variationId,
          ParamType.int,
        ),
        'product_default_variation': serializeParam(
          _productDefaultVariation,
          ParamType.DataStruct,
        ),
        'product_variation_list': serializeParam(
          _productVariationList,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ProductVariationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductVariationStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        variationId: deserializeParam(
          data['variation_id'],
          ParamType.int,
          false,
        ),
        productDefaultVariation: deserializeStructParam(
          data['product_default_variation'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductVariationsListStruct.fromSerializableMap,
        ),
        productVariationList:
            deserializeStructParam<ProductVariationsListStruct>(
          data['product_variation_list'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductVariationsListStruct.fromSerializableMap,
        ),
      );

  static ProductVariationStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ProductVariationStruct(
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        variationId: convertAlgoliaParam(
          data['variation_id'],
          ParamType.int,
          false,
        ),
        productDefaultVariation: convertAlgoliaParam(
          data['product_default_variation'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductVariationsListStruct.fromAlgoliaData,
        ),
        productVariationList: convertAlgoliaParam<ProductVariationsListStruct>(
          data['product_variation_list'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductVariationsListStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProductVariationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductVariationStruct &&
        status == other.status &&
        variationId == other.variationId &&
        productDefaultVariation == other.productDefaultVariation &&
        listEquality.equals(productVariationList, other.productVariationList);
  }

  @override
  int get hashCode => const ListEquality().hash(
      [status, variationId, productDefaultVariation, productVariationList]);
}

ProductVariationStruct createProductVariationStruct({
  String? status,
  int? variationId,
  ProductVariationsListStruct? productDefaultVariation,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductVariationStruct(
      status: status,
      variationId: variationId,
      productDefaultVariation: productDefaultVariation ??
          (clearUnsetFields ? ProductVariationsListStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductVariationStruct? updateProductVariationStruct(
  ProductVariationStruct? productVariation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productVariation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductVariationStructData(
  Map<String, dynamic> firestoreData,
  ProductVariationStruct? productVariation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productVariation == null) {
    return;
  }
  if (productVariation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productVariation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productVariationData =
      getProductVariationFirestoreData(productVariation, forFieldValue);
  final nestedData =
      productVariationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productVariation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductVariationFirestoreData(
  ProductVariationStruct? productVariation, [
  bool forFieldValue = false,
]) {
  if (productVariation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productVariation.toMap());

  // Handle nested data for "product_default_variation" field.
  addProductVariationsListStructData(
    firestoreData,
    productVariation.hasProductDefaultVariation()
        ? productVariation.productDefaultVariation
        : null,
    'product_default_variation',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(productVariation.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductVariationListFirestoreData(
  List<ProductVariationStruct>? productVariations,
) =>
    productVariations
        ?.map((e) => getProductVariationFirestoreData(e, true))
        .toList() ??
    [];
