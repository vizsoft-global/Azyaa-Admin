// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserFiltersStruct extends FFFirebaseStruct {
  UserFiltersStruct({
    String? filterStatus,
    int? categoryCount,
    List<String>? categoryId,
    int? productCount,
    List<String>? productId,
    int? attributeCount,
    List<String>? attributeId,
    int? brandCount,
    List<String>? brandId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _filterStatus = filterStatus,
        _categoryCount = categoryCount,
        _categoryId = categoryId,
        _productCount = productCount,
        _productId = productId,
        _attributeCount = attributeCount,
        _attributeId = attributeId,
        _brandCount = brandCount,
        _brandId = brandId,
        super(firestoreUtilData);

  // "filter_status" field.
  String? _filterStatus;
  String get filterStatus => _filterStatus ?? '';
  set filterStatus(String? val) => _filterStatus = val;

  bool hasFilterStatus() => _filterStatus != null;

  // "category_count" field.
  int? _categoryCount;
  int get categoryCount => _categoryCount ?? 0;
  set categoryCount(int? val) => _categoryCount = val;

  void incrementCategoryCount(int amount) =>
      categoryCount = categoryCount + amount;

  bool hasCategoryCount() => _categoryCount != null;

  // "category_id" field.
  List<String>? _categoryId;
  List<String> get categoryId => _categoryId ?? const [];
  set categoryId(List<String>? val) => _categoryId = val;

  void updateCategoryId(Function(List<String>) updateFn) {
    updateFn(_categoryId ??= []);
  }

  bool hasCategoryId() => _categoryId != null;

  // "product_count" field.
  int? _productCount;
  int get productCount => _productCount ?? 0;
  set productCount(int? val) => _productCount = val;

  void incrementProductCount(int amount) =>
      productCount = productCount + amount;

  bool hasProductCount() => _productCount != null;

  // "product_id" field.
  List<String>? _productId;
  List<String> get productId => _productId ?? const [];
  set productId(List<String>? val) => _productId = val;

  void updateProductId(Function(List<String>) updateFn) {
    updateFn(_productId ??= []);
  }

  bool hasProductId() => _productId != null;

  // "attribute_count" field.
  int? _attributeCount;
  int get attributeCount => _attributeCount ?? 0;
  set attributeCount(int? val) => _attributeCount = val;

  void incrementAttributeCount(int amount) =>
      attributeCount = attributeCount + amount;

  bool hasAttributeCount() => _attributeCount != null;

  // "attribute_id" field.
  List<String>? _attributeId;
  List<String> get attributeId => _attributeId ?? const [];
  set attributeId(List<String>? val) => _attributeId = val;

  void updateAttributeId(Function(List<String>) updateFn) {
    updateFn(_attributeId ??= []);
  }

  bool hasAttributeId() => _attributeId != null;

  // "brand_count" field.
  int? _brandCount;
  int get brandCount => _brandCount ?? 0;
  set brandCount(int? val) => _brandCount = val;

  void incrementBrandCount(int amount) => brandCount = brandCount + amount;

  bool hasBrandCount() => _brandCount != null;

  // "brand_id" field.
  List<String>? _brandId;
  List<String> get brandId => _brandId ?? const [];
  set brandId(List<String>? val) => _brandId = val;

  void updateBrandId(Function(List<String>) updateFn) {
    updateFn(_brandId ??= []);
  }

  bool hasBrandId() => _brandId != null;

  static UserFiltersStruct fromMap(Map<String, dynamic> data) =>
      UserFiltersStruct(
        filterStatus: data['filter_status'] as String?,
        categoryCount: castToType<int>(data['category_count']),
        categoryId: getDataList(data['category_id']),
        productCount: castToType<int>(data['product_count']),
        productId: getDataList(data['product_id']),
        attributeCount: castToType<int>(data['attribute_count']),
        attributeId: getDataList(data['attribute_id']),
        brandCount: castToType<int>(data['brand_count']),
        brandId: getDataList(data['brand_id']),
      );

  static UserFiltersStruct? maybeFromMap(dynamic data) => data is Map
      ? UserFiltersStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'filter_status': _filterStatus,
        'category_count': _categoryCount,
        'category_id': _categoryId,
        'product_count': _productCount,
        'product_id': _productId,
        'attribute_count': _attributeCount,
        'attribute_id': _attributeId,
        'brand_count': _brandCount,
        'brand_id': _brandId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'filter_status': serializeParam(
          _filterStatus,
          ParamType.String,
        ),
        'category_count': serializeParam(
          _categoryCount,
          ParamType.int,
        ),
        'category_id': serializeParam(
          _categoryId,
          ParamType.String,
          isList: true,
        ),
        'product_count': serializeParam(
          _productCount,
          ParamType.int,
        ),
        'product_id': serializeParam(
          _productId,
          ParamType.String,
          isList: true,
        ),
        'attribute_count': serializeParam(
          _attributeCount,
          ParamType.int,
        ),
        'attribute_id': serializeParam(
          _attributeId,
          ParamType.String,
          isList: true,
        ),
        'brand_count': serializeParam(
          _brandCount,
          ParamType.int,
        ),
        'brand_id': serializeParam(
          _brandId,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static UserFiltersStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserFiltersStruct(
        filterStatus: deserializeParam(
          data['filter_status'],
          ParamType.String,
          false,
        ),
        categoryCount: deserializeParam(
          data['category_count'],
          ParamType.int,
          false,
        ),
        categoryId: deserializeParam<String>(
          data['category_id'],
          ParamType.String,
          true,
        ),
        productCount: deserializeParam(
          data['product_count'],
          ParamType.int,
          false,
        ),
        productId: deserializeParam<String>(
          data['product_id'],
          ParamType.String,
          true,
        ),
        attributeCount: deserializeParam(
          data['attribute_count'],
          ParamType.int,
          false,
        ),
        attributeId: deserializeParam<String>(
          data['attribute_id'],
          ParamType.String,
          true,
        ),
        brandCount: deserializeParam(
          data['brand_count'],
          ParamType.int,
          false,
        ),
        brandId: deserializeParam<String>(
          data['brand_id'],
          ParamType.String,
          true,
        ),
      );

  static UserFiltersStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserFiltersStruct(
        filterStatus: convertAlgoliaParam(
          data['filter_status'],
          ParamType.String,
          false,
        ),
        categoryCount: convertAlgoliaParam(
          data['category_count'],
          ParamType.int,
          false,
        ),
        categoryId: convertAlgoliaParam<String>(
          data['category_id'],
          ParamType.String,
          true,
        ),
        productCount: convertAlgoliaParam(
          data['product_count'],
          ParamType.int,
          false,
        ),
        productId: convertAlgoliaParam<String>(
          data['product_id'],
          ParamType.String,
          true,
        ),
        attributeCount: convertAlgoliaParam(
          data['attribute_count'],
          ParamType.int,
          false,
        ),
        attributeId: convertAlgoliaParam<String>(
          data['attribute_id'],
          ParamType.String,
          true,
        ),
        brandCount: convertAlgoliaParam(
          data['brand_count'],
          ParamType.int,
          false,
        ),
        brandId: convertAlgoliaParam<String>(
          data['brand_id'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserFiltersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserFiltersStruct &&
        filterStatus == other.filterStatus &&
        categoryCount == other.categoryCount &&
        listEquality.equals(categoryId, other.categoryId) &&
        productCount == other.productCount &&
        listEquality.equals(productId, other.productId) &&
        attributeCount == other.attributeCount &&
        listEquality.equals(attributeId, other.attributeId) &&
        brandCount == other.brandCount &&
        listEquality.equals(brandId, other.brandId);
  }

  @override
  int get hashCode => const ListEquality().hash([
        filterStatus,
        categoryCount,
        categoryId,
        productCount,
        productId,
        attributeCount,
        attributeId,
        brandCount,
        brandId
      ]);
}

UserFiltersStruct createUserFiltersStruct({
  String? filterStatus,
  int? categoryCount,
  int? productCount,
  int? attributeCount,
  int? brandCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserFiltersStruct(
      filterStatus: filterStatus,
      categoryCount: categoryCount,
      productCount: productCount,
      attributeCount: attributeCount,
      brandCount: brandCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserFiltersStruct? updateUserFiltersStruct(
  UserFiltersStruct? userFilters, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userFilters
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserFiltersStructData(
  Map<String, dynamic> firestoreData,
  UserFiltersStruct? userFilters,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userFilters == null) {
    return;
  }
  if (userFilters.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userFilters.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userFiltersData =
      getUserFiltersFirestoreData(userFilters, forFieldValue);
  final nestedData =
      userFiltersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userFilters.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFiltersFirestoreData(
  UserFiltersStruct? userFilters, [
  bool forFieldValue = false,
]) {
  if (userFilters == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userFilters.toMap());

  // Add any Firestore field values
  mapToFirestore(userFilters.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserFiltersListFirestoreData(
  List<UserFiltersStruct>? userFilterss,
) =>
    userFilterss?.map((e) => getUserFiltersFirestoreData(e, true)).toList() ??
    [];
