// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductAttributesNewStruct extends FFFirebaseStruct {
  ProductAttributesNewStruct({
    String? attributesId,
    String? attributesDefaultTermId,
    List<String>? attributesBrandTermIds,
    bool? isBrandVisible,
    bool? isVaritionUse,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _attributesId = attributesId,
        _attributesDefaultTermId = attributesDefaultTermId,
        _attributesBrandTermIds = attributesBrandTermIds,
        _isBrandVisible = isBrandVisible,
        _isVaritionUse = isVaritionUse,
        super(firestoreUtilData);

  // "attributes_id" field.
  String? _attributesId;
  String get attributesId => _attributesId ?? '';
  set attributesId(String? val) => _attributesId = val;

  bool hasAttributesId() => _attributesId != null;

  // "attributes_default_term_id" field.
  String? _attributesDefaultTermId;
  String get attributesDefaultTermId => _attributesDefaultTermId ?? '';
  set attributesDefaultTermId(String? val) => _attributesDefaultTermId = val;

  bool hasAttributesDefaultTermId() => _attributesDefaultTermId != null;

  // "attributes_brand_term_ids" field.
  List<String>? _attributesBrandTermIds;
  List<String> get attributesBrandTermIds =>
      _attributesBrandTermIds ?? const [];
  set attributesBrandTermIds(List<String>? val) =>
      _attributesBrandTermIds = val;

  void updateAttributesBrandTermIds(Function(List<String>) updateFn) {
    updateFn(_attributesBrandTermIds ??= []);
  }

  bool hasAttributesBrandTermIds() => _attributesBrandTermIds != null;

  // "is_brand_visible" field.
  bool? _isBrandVisible;
  bool get isBrandVisible => _isBrandVisible ?? false;
  set isBrandVisible(bool? val) => _isBrandVisible = val;

  bool hasIsBrandVisible() => _isBrandVisible != null;

  // "is_varition_use" field.
  bool? _isVaritionUse;
  bool get isVaritionUse => _isVaritionUse ?? false;
  set isVaritionUse(bool? val) => _isVaritionUse = val;

  bool hasIsVaritionUse() => _isVaritionUse != null;

  static ProductAttributesNewStruct fromMap(Map<String, dynamic> data) =>
      ProductAttributesNewStruct(
        attributesId: data['attributes_id'] as String?,
        attributesDefaultTermId: data['attributes_default_term_id'] as String?,
        attributesBrandTermIds: getDataList(data['attributes_brand_term_ids']),
        isBrandVisible: data['is_brand_visible'] as bool?,
        isVaritionUse: data['is_varition_use'] as bool?,
      );

  static ProductAttributesNewStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductAttributesNewStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'attributes_id': _attributesId,
        'attributes_default_term_id': _attributesDefaultTermId,
        'attributes_brand_term_ids': _attributesBrandTermIds,
        'is_brand_visible': _isBrandVisible,
        'is_varition_use': _isVaritionUse,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'attributes_id': serializeParam(
          _attributesId,
          ParamType.String,
        ),
        'attributes_default_term_id': serializeParam(
          _attributesDefaultTermId,
          ParamType.String,
        ),
        'attributes_brand_term_ids': serializeParam(
          _attributesBrandTermIds,
          ParamType.String,
          isList: true,
        ),
        'is_brand_visible': serializeParam(
          _isBrandVisible,
          ParamType.bool,
        ),
        'is_varition_use': serializeParam(
          _isVaritionUse,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ProductAttributesNewStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductAttributesNewStruct(
        attributesId: deserializeParam(
          data['attributes_id'],
          ParamType.String,
          false,
        ),
        attributesDefaultTermId: deserializeParam(
          data['attributes_default_term_id'],
          ParamType.String,
          false,
        ),
        attributesBrandTermIds: deserializeParam<String>(
          data['attributes_brand_term_ids'],
          ParamType.String,
          true,
        ),
        isBrandVisible: deserializeParam(
          data['is_brand_visible'],
          ParamType.bool,
          false,
        ),
        isVaritionUse: deserializeParam(
          data['is_varition_use'],
          ParamType.bool,
          false,
        ),
      );

  static ProductAttributesNewStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      ProductAttributesNewStruct(
        attributesId: convertAlgoliaParam(
          data['attributes_id'],
          ParamType.String,
          false,
        ),
        attributesDefaultTermId: convertAlgoliaParam(
          data['attributes_default_term_id'],
          ParamType.String,
          false,
        ),
        attributesBrandTermIds: convertAlgoliaParam<String>(
          data['attributes_brand_term_ids'],
          ParamType.String,
          true,
        ),
        isBrandVisible: convertAlgoliaParam(
          data['is_brand_visible'],
          ParamType.bool,
          false,
        ),
        isVaritionUse: convertAlgoliaParam(
          data['is_varition_use'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ProductAttributesNewStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductAttributesNewStruct &&
        attributesId == other.attributesId &&
        attributesDefaultTermId == other.attributesDefaultTermId &&
        listEquality.equals(
            attributesBrandTermIds, other.attributesBrandTermIds) &&
        isBrandVisible == other.isBrandVisible &&
        isVaritionUse == other.isVaritionUse;
  }

  @override
  int get hashCode => const ListEquality().hash([
        attributesId,
        attributesDefaultTermId,
        attributesBrandTermIds,
        isBrandVisible,
        isVaritionUse
      ]);
}

ProductAttributesNewStruct createProductAttributesNewStruct({
  String? attributesId,
  String? attributesDefaultTermId,
  bool? isBrandVisible,
  bool? isVaritionUse,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductAttributesNewStruct(
      attributesId: attributesId,
      attributesDefaultTermId: attributesDefaultTermId,
      isBrandVisible: isBrandVisible,
      isVaritionUse: isVaritionUse,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductAttributesNewStruct? updateProductAttributesNewStruct(
  ProductAttributesNewStruct? productAttributesNew, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productAttributesNew
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductAttributesNewStructData(
  Map<String, dynamic> firestoreData,
  ProductAttributesNewStruct? productAttributesNew,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productAttributesNew == null) {
    return;
  }
  if (productAttributesNew.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productAttributesNew.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productAttributesNewData =
      getProductAttributesNewFirestoreData(productAttributesNew, forFieldValue);
  final nestedData =
      productAttributesNewData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      productAttributesNew.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductAttributesNewFirestoreData(
  ProductAttributesNewStruct? productAttributesNew, [
  bool forFieldValue = false,
]) {
  if (productAttributesNew == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productAttributesNew.toMap());

  // Add any Firestore field values
  mapToFirestore(productAttributesNew.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductAttributesNewListFirestoreData(
  List<ProductAttributesNewStruct>? productAttributesNews,
) =>
    productAttributesNews
        ?.map((e) => getProductAttributesNewFirestoreData(e, true))
        .toList() ??
    [];
