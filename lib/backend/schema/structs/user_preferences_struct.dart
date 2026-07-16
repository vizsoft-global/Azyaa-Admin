// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPreferencesStruct extends FFFirebaseStruct {
  UserPreferencesStruct({
    int? preferencesId,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<UserPreferencesCategoriesStruct>? categories,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _preferencesId = preferencesId,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _categories = categories,
        super(firestoreUtilData);

  // "preferences_id" field.
  int? _preferencesId;
  int get preferencesId => _preferencesId ?? 0;
  set preferencesId(int? val) => _preferencesId = val;

  void incrementPreferencesId(int amount) =>
      preferencesId = preferencesId + amount;

  bool hasPreferencesId() => _preferencesId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "categories" field.
  List<UserPreferencesCategoriesStruct>? _categories;
  List<UserPreferencesCategoriesStruct> get categories =>
      _categories ?? const [];
  set categories(List<UserPreferencesCategoriesStruct>? val) =>
      _categories = val;

  void updateCategories(
      Function(List<UserPreferencesCategoriesStruct>) updateFn) {
    updateFn(_categories ??= []);
  }

  bool hasCategories() => _categories != null;

  static UserPreferencesStruct fromMap(Map<String, dynamic> data) =>
      UserPreferencesStruct(
        preferencesId: castToType<int>(data['preferences_id']),
        createdAt: data['created_at'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
        categories: getStructList(
          data['categories'],
          UserPreferencesCategoriesStruct.fromMap,
        ),
      );

  static UserPreferencesStruct? maybeFromMap(dynamic data) => data is Map
      ? UserPreferencesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'preferences_id': _preferencesId,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'categories': _categories?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'preferences_id': serializeParam(
          _preferencesId,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'categories': serializeParam(
          _categories,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static UserPreferencesStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserPreferencesStruct(
        preferencesId: deserializeParam(
          data['preferences_id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        categories: deserializeStructParam<UserPreferencesCategoriesStruct>(
          data['categories'],
          ParamType.DataStruct,
          true,
          structBuilder: UserPreferencesCategoriesStruct.fromSerializableMap,
        ),
      );

  static UserPreferencesStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserPreferencesStruct(
        preferencesId: convertAlgoliaParam(
          data['preferences_id'],
          ParamType.int,
          false,
        ),
        createdAt: convertAlgoliaParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: convertAlgoliaParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        categories: convertAlgoliaParam<UserPreferencesCategoriesStruct>(
          data['categories'],
          ParamType.DataStruct,
          true,
          structBuilder: UserPreferencesCategoriesStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserPreferencesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserPreferencesStruct &&
        preferencesId == other.preferencesId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        listEquality.equals(categories, other.categories);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([preferencesId, createdAt, updatedAt, categories]);
}

UserPreferencesStruct createUserPreferencesStruct({
  int? preferencesId,
  DateTime? createdAt,
  DateTime? updatedAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserPreferencesStruct(
      preferencesId: preferencesId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserPreferencesStruct? updateUserPreferencesStruct(
  UserPreferencesStruct? userPreferences, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userPreferences
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserPreferencesStructData(
  Map<String, dynamic> firestoreData,
  UserPreferencesStruct? userPreferences,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userPreferences == null) {
    return;
  }
  if (userPreferences.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userPreferences.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userPreferencesData =
      getUserPreferencesFirestoreData(userPreferences, forFieldValue);
  final nestedData =
      userPreferencesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userPreferences.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserPreferencesFirestoreData(
  UserPreferencesStruct? userPreferences, [
  bool forFieldValue = false,
]) {
  if (userPreferences == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userPreferences.toMap());

  // Add any Firestore field values
  mapToFirestore(userPreferences.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserPreferencesListFirestoreData(
  List<UserPreferencesStruct>? userPreferencess,
) =>
    userPreferencess
        ?.map((e) => getUserPreferencesFirestoreData(e, true))
        .toList() ??
    [];
