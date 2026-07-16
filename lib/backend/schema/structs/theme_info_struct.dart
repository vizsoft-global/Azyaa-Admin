// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThemeInfoStruct extends FFFirebaseStruct {
  ThemeInfoStruct({
    int? themeId,
    ThemeColourStruct? themeMain,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _themeId = themeId,
        _themeMain = themeMain,
        super(firestoreUtilData);

  // "theme_id" field.
  int? _themeId;
  int get themeId => _themeId ?? 0;
  set themeId(int? val) => _themeId = val;

  void incrementThemeId(int amount) => themeId = themeId + amount;

  bool hasThemeId() => _themeId != null;

  // "theme_main" field.
  ThemeColourStruct? _themeMain;
  ThemeColourStruct get themeMain => _themeMain ?? ThemeColourStruct();
  set themeMain(ThemeColourStruct? val) => _themeMain = val;

  void updateThemeMain(Function(ThemeColourStruct) updateFn) {
    updateFn(_themeMain ??= ThemeColourStruct());
  }

  bool hasThemeMain() => _themeMain != null;

  static ThemeInfoStruct fromMap(Map<String, dynamic> data) => ThemeInfoStruct(
        themeId: castToType<int>(data['theme_id']),
        themeMain: data['theme_main'] is ThemeColourStruct
            ? data['theme_main']
            : ThemeColourStruct.maybeFromMap(data['theme_main']),
      );

  static ThemeInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? ThemeInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'theme_id': _themeId,
        'theme_main': _themeMain?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'theme_id': serializeParam(
          _themeId,
          ParamType.int,
        ),
        'theme_main': serializeParam(
          _themeMain,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ThemeInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThemeInfoStruct(
        themeId: deserializeParam(
          data['theme_id'],
          ParamType.int,
          false,
        ),
        themeMain: deserializeStructParam(
          data['theme_main'],
          ParamType.DataStruct,
          false,
          structBuilder: ThemeColourStruct.fromSerializableMap,
        ),
      );

  static ThemeInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ThemeInfoStruct(
        themeId: convertAlgoliaParam(
          data['theme_id'],
          ParamType.int,
          false,
        ),
        themeMain: convertAlgoliaParam(
          data['theme_main'],
          ParamType.DataStruct,
          false,
          structBuilder: ThemeColourStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ThemeInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ThemeInfoStruct &&
        themeId == other.themeId &&
        themeMain == other.themeMain;
  }

  @override
  int get hashCode => const ListEquality().hash([themeId, themeMain]);
}

ThemeInfoStruct createThemeInfoStruct({
  int? themeId,
  ThemeColourStruct? themeMain,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThemeInfoStruct(
      themeId: themeId,
      themeMain: themeMain ?? (clearUnsetFields ? ThemeColourStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThemeInfoStruct? updateThemeInfoStruct(
  ThemeInfoStruct? themeInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    themeInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThemeInfoStructData(
  Map<String, dynamic> firestoreData,
  ThemeInfoStruct? themeInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (themeInfo == null) {
    return;
  }
  if (themeInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && themeInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final themeInfoData = getThemeInfoFirestoreData(themeInfo, forFieldValue);
  final nestedData = themeInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = themeInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThemeInfoFirestoreData(
  ThemeInfoStruct? themeInfo, [
  bool forFieldValue = false,
]) {
  if (themeInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(themeInfo.toMap());

  // Handle nested data for "theme_main" field.
  addThemeColourStructData(
    firestoreData,
    themeInfo.hasThemeMain() ? themeInfo.themeMain : null,
    'theme_main',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(themeInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThemeInfoListFirestoreData(
  List<ThemeInfoStruct>? themeInfos,
) =>
    themeInfos?.map((e) => getThemeInfoFirestoreData(e, true)).toList() ?? [];
