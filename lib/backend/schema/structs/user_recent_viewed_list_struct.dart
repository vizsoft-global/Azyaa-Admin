// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecentViewedListStruct extends FFFirebaseStruct {
  UserRecentViewedListStruct({
    DateTime? createdAt,
    String? viewedItemId,
    List<ProductAttributesStruct>? productAttribute,
    String? viewedEntityType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdAt = createdAt,
        _viewedItemId = viewedItemId,
        _productAttribute = productAttribute,
        _viewedEntityType = viewedEntityType,
        super(firestoreUtilData);

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "viewed_item_id" field.
  String? _viewedItemId;
  String get viewedItemId => _viewedItemId ?? '';
  set viewedItemId(String? val) => _viewedItemId = val;

  bool hasViewedItemId() => _viewedItemId != null;

  // "product_attribute" field.
  List<ProductAttributesStruct>? _productAttribute;
  List<ProductAttributesStruct> get productAttribute =>
      _productAttribute ?? const [];
  set productAttribute(List<ProductAttributesStruct>? val) =>
      _productAttribute = val;

  void updateProductAttribute(
      Function(List<ProductAttributesStruct>) updateFn) {
    updateFn(_productAttribute ??= []);
  }

  bool hasProductAttribute() => _productAttribute != null;

  // "viewed_entity_type" field.
  String? _viewedEntityType;
  String get viewedEntityType => _viewedEntityType ?? '';
  set viewedEntityType(String? val) => _viewedEntityType = val;

  bool hasViewedEntityType() => _viewedEntityType != null;

  static UserRecentViewedListStruct fromMap(Map<String, dynamic> data) =>
      UserRecentViewedListStruct(
        createdAt: data['created_at'] as DateTime?,
        viewedItemId: data['viewed_item_id'] as String?,
        productAttribute: getStructList(
          data['product_attribute'],
          ProductAttributesStruct.fromMap,
        ),
        viewedEntityType: data['viewed_entity_type'] as String?,
      );

  static UserRecentViewedListStruct? maybeFromMap(dynamic data) => data is Map
      ? UserRecentViewedListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'created_at': _createdAt,
        'viewed_item_id': _viewedItemId,
        'product_attribute': _productAttribute?.map((e) => e.toMap()).toList(),
        'viewed_entity_type': _viewedEntityType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'viewed_item_id': serializeParam(
          _viewedItemId,
          ParamType.String,
        ),
        'product_attribute': serializeParam(
          _productAttribute,
          ParamType.DataStruct,
          isList: true,
        ),
        'viewed_entity_type': serializeParam(
          _viewedEntityType,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserRecentViewedListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserRecentViewedListStruct(
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        viewedItemId: deserializeParam(
          data['viewed_item_id'],
          ParamType.String,
          false,
        ),
        productAttribute: deserializeStructParam<ProductAttributesStruct>(
          data['product_attribute'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductAttributesStruct.fromSerializableMap,
        ),
        viewedEntityType: deserializeParam(
          data['viewed_entity_type'],
          ParamType.String,
          false,
        ),
      );

  static UserRecentViewedListStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      UserRecentViewedListStruct(
        createdAt: convertAlgoliaParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        viewedItemId: convertAlgoliaParam(
          data['viewed_item_id'],
          ParamType.String,
          false,
        ),
        productAttribute: convertAlgoliaParam<ProductAttributesStruct>(
          data['product_attribute'],
          ParamType.DataStruct,
          true,
          structBuilder: ProductAttributesStruct.fromAlgoliaData,
        ),
        viewedEntityType: convertAlgoliaParam(
          data['viewed_entity_type'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserRecentViewedListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserRecentViewedListStruct &&
        createdAt == other.createdAt &&
        viewedItemId == other.viewedItemId &&
        listEquality.equals(productAttribute, other.productAttribute) &&
        viewedEntityType == other.viewedEntityType;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([createdAt, viewedItemId, productAttribute, viewedEntityType]);
}

UserRecentViewedListStruct createUserRecentViewedListStruct({
  DateTime? createdAt,
  String? viewedItemId,
  String? viewedEntityType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserRecentViewedListStruct(
      createdAt: createdAt,
      viewedItemId: viewedItemId,
      viewedEntityType: viewedEntityType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserRecentViewedListStruct? updateUserRecentViewedListStruct(
  UserRecentViewedListStruct? userRecentViewedList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userRecentViewedList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserRecentViewedListStructData(
  Map<String, dynamic> firestoreData,
  UserRecentViewedListStruct? userRecentViewedList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userRecentViewedList == null) {
    return;
  }
  if (userRecentViewedList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userRecentViewedList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userRecentViewedListData =
      getUserRecentViewedListFirestoreData(userRecentViewedList, forFieldValue);
  final nestedData =
      userRecentViewedListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userRecentViewedList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserRecentViewedListFirestoreData(
  UserRecentViewedListStruct? userRecentViewedList, [
  bool forFieldValue = false,
]) {
  if (userRecentViewedList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userRecentViewedList.toMap());

  // Add any Firestore field values
  mapToFirestore(userRecentViewedList.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserRecentViewedListListFirestoreData(
  List<UserRecentViewedListStruct>? userRecentViewedLists,
) =>
    userRecentViewedLists
        ?.map((e) => getUserRecentViewedListFirestoreData(e, true))
        .toList() ??
    [];
