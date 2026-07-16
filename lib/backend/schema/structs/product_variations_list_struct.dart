// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductVariationsListStruct extends FFFirebaseStruct {
  ProductVariationsListStruct({
    int? variationListId,
    List<ProductAttributesStruct>? productAttributeList,
    ProductStockStruct? productStock,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _variationListId = variationListId,
        _productAttributeList = productAttributeList,
        _productStock = productStock,
        super(firestoreUtilData);

  // "variation_list_id" field.
  int? _variationListId;
  int get variationListId => _variationListId ?? 0;
  set variationListId(int? val) => _variationListId = val;

  void incrementVariationListId(int amount) =>
      variationListId = variationListId + amount;

  bool hasVariationListId() => _variationListId != null;

  // "product_attribute_list" field.
  List<ProductAttributesStruct>? _productAttributeList;
  List<ProductAttributesStruct> get productAttributeList =>
      _productAttributeList ?? const [];
  set productAttributeList(List<ProductAttributesStruct>? val) =>
      _productAttributeList = val;

  void updateProductAttributeList(
      Function(List<ProductAttributesStruct>) updateFn) {
    updateFn(_productAttributeList ??= []);
  }

  bool hasProductAttributeList() => _productAttributeList != null;

  // "product_stock" field.
  ProductStockStruct? _productStock;
  ProductStockStruct get productStock => _productStock ?? ProductStockStruct();
  set productStock(ProductStockStruct? val) => _productStock = val;

  void updateProductStock(Function(ProductStockStruct) updateFn) {
    updateFn(_productStock ??= ProductStockStruct());
  }

  bool hasProductStock() => _productStock != null;

  static ProductVariationsListStruct fromMap(Map<String, dynamic> data) =>
      ProductVariationsListStruct(
        variationListId: castToType<int>(data['variation_list_id']),
        productAttributeList: getStructList(
          data['product_attribute_list'],
          ProductAttributesStruct.fromMap,
        ),
        productStock: data['product_stock'] is ProductStockStruct
            ? data['product_stock']
            : ProductStockStruct.maybeFromMap(data['product_stock']),
      );

  static ProductVariationsListStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductVariationsListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'variation_list_id': _variationListId,
        'product_attribute_list':
            _productAttributeList?.map((e) => e.toMap()).toList(),
        'product_stock': _productStock?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'variation_list_id': serializeParam(
          _variationListId,
          ParamType.int,
        ),
        'product_attribute_list': serializeParam(
          _productAttributeList,
          ParamType.DataStruct,
          isList: true,
        ),
        'product_stock': serializeParam(
          _productStock,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ProductVariationsListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductVariationsListStruct(
        variationListId: deserializeParam(
          data['variation_list_id'],
          ParamType.int,
          false,
        ),
        productAttributeList: deserializeStructParam<ProductAttributesStruct>(
          data['product_attribute_list'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductAttributesStruct.fromSerializableMap,
        ),
        productStock: deserializeStructParam(
          data['product_stock'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductStockStruct.fromSerializableMap,
        ),
      );

  static ProductVariationsListStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      ProductVariationsListStruct(
        variationListId: convertAlgoliaParam(
          data['variation_list_id'],
          ParamType.int,
          false,
        ),
        productAttributeList: convertAlgoliaParam<ProductAttributesStruct>(
          data['product_attribute_list'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductAttributesStruct.fromAlgoliaData,
        ),
        productStock: convertAlgoliaParam(
          data['product_stock'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductStockStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProductVariationsListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductVariationsListStruct &&
        variationListId == other.variationListId &&
        listEquality.equals(productAttributeList, other.productAttributeList) &&
        productStock == other.productStock;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([variationListId, productAttributeList, productStock]);
}

ProductVariationsListStruct createProductVariationsListStruct({
  int? variationListId,
  ProductStockStruct? productStock,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductVariationsListStruct(
      variationListId: variationListId,
      productStock:
          productStock ?? (clearUnsetFields ? ProductStockStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductVariationsListStruct? updateProductVariationsListStruct(
  ProductVariationsListStruct? productVariationsList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productVariationsList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductVariationsListStructData(
  Map<String, dynamic> firestoreData,
  ProductVariationsListStruct? productVariationsList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productVariationsList == null) {
    return;
  }
  if (productVariationsList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      productVariationsList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productVariationsListData = getProductVariationsListFirestoreData(
      productVariationsList, forFieldValue);
  final nestedData =
      productVariationsListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      productVariationsList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductVariationsListFirestoreData(
  ProductVariationsListStruct? productVariationsList, [
  bool forFieldValue = false,
]) {
  if (productVariationsList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productVariationsList.toMap());

  // Handle nested data for "product_stock" field.
  addProductStockStructData(
    firestoreData,
    productVariationsList.hasProductStock()
        ? productVariationsList.productStock
        : null,
    'product_stock',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(productVariationsList.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductVariationsListListFirestoreData(
  List<ProductVariationsListStruct>? productVariationsLists,
) =>
    productVariationsLists
        ?.map((e) => getProductVariationsListFirestoreData(e, true))
        .toList() ??
    [];
