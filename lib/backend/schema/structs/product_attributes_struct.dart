// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductAttributesStruct extends FFFirebaseStruct {
  ProductAttributesStruct({
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

  static ProductAttributesStruct fromMap(Map<String, dynamic> data) =>
      ProductAttributesStruct(
        attributesId: data['attributes_id'] as String?,
        attributesDefaultTermId: data['attributes_default_term_id'] as String?,
        attributesBrandTermIds: getDataList(data['attributes_brand_term_ids']),
        isBrandVisible: data['is_brand_visible'] as bool?,
        isVaritionUse: data['is_varition_use'] as bool?,
      );

  static ProductAttributesStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductAttributesStruct.fromMap(data.cast<String, dynamic>())
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

  static ProductAttributesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductAttributesStruct(
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

  static ProductAttributesStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ProductAttributesStruct(
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
  String toString() => 'ProductAttributesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductAttributesStruct &&
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

ProductAttributesStruct createProductAttributesStruct({
  String? attributesId,
  String? attributesDefaultTermId,
  bool? isBrandVisible,
  bool? isVaritionUse,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductAttributesStruct(
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

ProductAttributesStruct? updateProductAttributesStruct(
  ProductAttributesStruct? productAttributes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productAttributes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductAttributesStructData(
  Map<String, dynamic> firestoreData,
  ProductAttributesStruct? productAttributes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productAttributes == null) {
    return;
  }
  if (productAttributes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productAttributes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productAttributesData =
      getProductAttributesFirestoreData(productAttributes, forFieldValue);
  final nestedData =
      productAttributesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productAttributes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductAttributesFirestoreData(
  ProductAttributesStruct? productAttributes, [
  bool forFieldValue = false,
]) {
  if (productAttributes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productAttributes.toMap());

  // Add any Firestore field values
  mapToFirestore(productAttributes.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductAttributesListFirestoreData(
  List<ProductAttributesStruct>? productAttributess,
) =>
    productAttributess
        ?.map((e) => getProductAttributesFirestoreData(e, true))
        .toList() ??
    [];
