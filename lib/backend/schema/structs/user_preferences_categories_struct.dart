// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPreferencesCategoriesStruct extends FFFirebaseStruct {
  UserPreferencesCategoriesStruct({
    String? categoriesId,
    int? categoriesPriority,
    InfoStruct? categoriesInfo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _categoriesId = categoriesId,
        _categoriesPriority = categoriesPriority,
        _categoriesInfo = categoriesInfo,
        super(firestoreUtilData);

  // "categories_id" field.
  String? _categoriesId;
  String get categoriesId => _categoriesId ?? '';
  set categoriesId(String? val) => _categoriesId = val;

  bool hasCategoriesId() => _categoriesId != null;

  // "categories_priority" field.
  int? _categoriesPriority;
  int get categoriesPriority => _categoriesPriority ?? 0;
  set categoriesPriority(int? val) => _categoriesPriority = val;

  void incrementCategoriesPriority(int amount) =>
      categoriesPriority = categoriesPriority + amount;

  bool hasCategoriesPriority() => _categoriesPriority != null;

  // "categories_info" field.
  InfoStruct? _categoriesInfo;
  InfoStruct get categoriesInfo => _categoriesInfo ?? InfoStruct();
  set categoriesInfo(InfoStruct? val) => _categoriesInfo = val;

  void updateCategoriesInfo(Function(InfoStruct) updateFn) {
    updateFn(_categoriesInfo ??= InfoStruct());
  }

  bool hasCategoriesInfo() => _categoriesInfo != null;

  static UserPreferencesCategoriesStruct fromMap(Map<String, dynamic> data) =>
      UserPreferencesCategoriesStruct(
        categoriesId: data['categories_id'] as String?,
        categoriesPriority: castToType<int>(data['categories_priority']),
        categoriesInfo: data['categories_info'] is InfoStruct
            ? data['categories_info']
            : InfoStruct.maybeFromMap(data['categories_info']),
      );

  static UserPreferencesCategoriesStruct? maybeFromMap(dynamic data) => data
          is Map
      ? UserPreferencesCategoriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'categories_id': _categoriesId,
        'categories_priority': _categoriesPriority,
        'categories_info': _categoriesInfo?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'categories_id': serializeParam(
          _categoriesId,
          ParamType.String,
        ),
        'categories_priority': serializeParam(
          _categoriesPriority,
          ParamType.int,
        ),
        'categories_info': serializeParam(
          _categoriesInfo,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static UserPreferencesCategoriesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserPreferencesCategoriesStruct(
        categoriesId: deserializeParam(
          data['categories_id'],
          ParamType.String,
          false,
        ),
        categoriesPriority: deserializeParam(
          data['categories_priority'],
          ParamType.int,
          false,
        ),
        categoriesInfo: deserializeStructParam(
          data['categories_info'],
          ParamType.DataStruct,
          false,
          structBuilder: InfoStruct.fromSerializableMap,
        ),
      );

  static UserPreferencesCategoriesStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      UserPreferencesCategoriesStruct(
        categoriesId: convertAlgoliaParam(
          data['categories_id'],
          ParamType.String,
          false,
        ),
        categoriesPriority: convertAlgoliaParam(
          data['categories_priority'],
          ParamType.int,
          false,
        ),
        categoriesInfo: convertAlgoliaParam(
          data['categories_info'],
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
  String toString() => 'UserPreferencesCategoriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserPreferencesCategoriesStruct &&
        categoriesId == other.categoriesId &&
        categoriesPriority == other.categoriesPriority &&
        categoriesInfo == other.categoriesInfo;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([categoriesId, categoriesPriority, categoriesInfo]);
}

UserPreferencesCategoriesStruct createUserPreferencesCategoriesStruct({
  String? categoriesId,
  int? categoriesPriority,
  InfoStruct? categoriesInfo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserPreferencesCategoriesStruct(
      categoriesId: categoriesId,
      categoriesPriority: categoriesPriority,
      categoriesInfo:
          categoriesInfo ?? (clearUnsetFields ? InfoStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserPreferencesCategoriesStruct? updateUserPreferencesCategoriesStruct(
  UserPreferencesCategoriesStruct? userPreferencesCategories, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userPreferencesCategories
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserPreferencesCategoriesStructData(
  Map<String, dynamic> firestoreData,
  UserPreferencesCategoriesStruct? userPreferencesCategories,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userPreferencesCategories == null) {
    return;
  }
  if (userPreferencesCategories.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      userPreferencesCategories.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userPreferencesCategoriesData =
      getUserPreferencesCategoriesFirestoreData(
          userPreferencesCategories, forFieldValue);
  final nestedData =
      userPreferencesCategoriesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userPreferencesCategories.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserPreferencesCategoriesFirestoreData(
  UserPreferencesCategoriesStruct? userPreferencesCategories, [
  bool forFieldValue = false,
]) {
  if (userPreferencesCategories == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userPreferencesCategories.toMap());

  // Handle nested data for "categories_info" field.
  addInfoStructData(
    firestoreData,
    userPreferencesCategories.hasCategoriesInfo()
        ? userPreferencesCategories.categoriesInfo
        : null,
    'categories_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(userPreferencesCategories.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserPreferencesCategoriesListFirestoreData(
  List<UserPreferencesCategoriesStruct>? userPreferencesCategoriess,
) =>
    userPreferencesCategoriess
        ?.map((e) => getUserPreferencesCategoriesFirestoreData(e, true))
        .toList() ??
    [];
