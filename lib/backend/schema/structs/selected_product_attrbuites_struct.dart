// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelectedProductAttrbuitesStruct extends FFFirebaseStruct {
  SelectedProductAttrbuitesStruct({
    DocumentReference? productRef,
    String? productId,
    ProductAttributesNewStruct? productAtrbuites,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _productRef = productRef,
        _productId = productId,
        _productAtrbuites = productAtrbuites,
        super(firestoreUtilData);

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  set productRef(DocumentReference? val) => _productRef = val;

  bool hasProductRef() => _productRef != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;

  bool hasProductId() => _productId != null;

  // "product_atrbuites" field.
  ProductAttributesNewStruct? _productAtrbuites;
  ProductAttributesNewStruct get productAtrbuites =>
      _productAtrbuites ?? ProductAttributesNewStruct();
  set productAtrbuites(ProductAttributesNewStruct? val) =>
      _productAtrbuites = val;

  void updateProductAtrbuites(Function(ProductAttributesNewStruct) updateFn) {
    updateFn(_productAtrbuites ??= ProductAttributesNewStruct());
  }

  bool hasProductAtrbuites() => _productAtrbuites != null;

  static SelectedProductAttrbuitesStruct fromMap(Map<String, dynamic> data) =>
      SelectedProductAttrbuitesStruct(
        productRef: data['product_ref'] as DocumentReference?,
        productId: data['product_id'] as String?,
        productAtrbuites:
            data['product_atrbuites'] is ProductAttributesNewStruct
                ? data['product_atrbuites']
                : ProductAttributesNewStruct.maybeFromMap(
                    data['product_atrbuites']),
      );

  static SelectedProductAttrbuitesStruct? maybeFromMap(dynamic data) => data
          is Map
      ? SelectedProductAttrbuitesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'product_ref': _productRef,
        'product_id': _productId,
        'product_atrbuites': _productAtrbuites?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'product_ref': serializeParam(
          _productRef,
          ParamType.DocumentReference,
        ),
        'product_id': serializeParam(
          _productId,
          ParamType.String,
        ),
        'product_atrbuites': serializeParam(
          _productAtrbuites,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SelectedProductAttrbuitesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SelectedProductAttrbuitesStruct(
        productRef: deserializeParam(
          data['product_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['products'],
        ),
        productId: deserializeParam(
          data['product_id'],
          ParamType.String,
          false,
        ),
        productAtrbuites: deserializeStructParam(
          data['product_atrbuites'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductAttributesNewStruct.fromSerializableMap,
        ),
      );

  static SelectedProductAttrbuitesStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      SelectedProductAttrbuitesStruct(
        productRef: convertAlgoliaParam(
          data['product_ref'],
          ParamType.DocumentReference,
          false,
        ),
        productId: convertAlgoliaParam(
          data['product_id'],
          ParamType.String,
          false,
        ),
        productAtrbuites: convertAlgoliaParam(
          data['product_atrbuites'],
          ParamType.DataStruct,
          false,
          structBuilder: ProductAttributesNewStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SelectedProductAttrbuitesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SelectedProductAttrbuitesStruct &&
        productRef == other.productRef &&
        productId == other.productId &&
        productAtrbuites == other.productAtrbuites;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([productRef, productId, productAtrbuites]);
}

SelectedProductAttrbuitesStruct createSelectedProductAttrbuitesStruct({
  DocumentReference? productRef,
  String? productId,
  ProductAttributesNewStruct? productAtrbuites,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SelectedProductAttrbuitesStruct(
      productRef: productRef,
      productId: productId,
      productAtrbuites: productAtrbuites ??
          (clearUnsetFields ? ProductAttributesNewStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SelectedProductAttrbuitesStruct? updateSelectedProductAttrbuitesStruct(
  SelectedProductAttrbuitesStruct? selectedProductAttrbuites, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    selectedProductAttrbuites
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSelectedProductAttrbuitesStructData(
  Map<String, dynamic> firestoreData,
  SelectedProductAttrbuitesStruct? selectedProductAttrbuites,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (selectedProductAttrbuites == null) {
    return;
  }
  if (selectedProductAttrbuites.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      selectedProductAttrbuites.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final selectedProductAttrbuitesData =
      getSelectedProductAttrbuitesFirestoreData(
          selectedProductAttrbuites, forFieldValue);
  final nestedData =
      selectedProductAttrbuitesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      selectedProductAttrbuites.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSelectedProductAttrbuitesFirestoreData(
  SelectedProductAttrbuitesStruct? selectedProductAttrbuites, [
  bool forFieldValue = false,
]) {
  if (selectedProductAttrbuites == null) {
    return {};
  }
  final firestoreData = mapToFirestore(selectedProductAttrbuites.toMap());

  // Handle nested data for "product_atrbuites" field.
  addProductAttributesNewStructData(
    firestoreData,
    selectedProductAttrbuites.hasProductAtrbuites()
        ? selectedProductAttrbuites.productAtrbuites
        : null,
    'product_atrbuites',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(selectedProductAttrbuites.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSelectedProductAttrbuitesListFirestoreData(
  List<SelectedProductAttrbuitesStruct>? selectedProductAttrbuitess,
) =>
    selectedProductAttrbuitess
        ?.map((e) => getSelectedProductAttrbuitesFirestoreData(e, true))
        .toList() ??
    [];
