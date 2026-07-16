// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MainTranslateInfoStruct extends FFFirebaseStruct {
  MainTranslateInfoStruct({
    TranslateLanguageListStruct? mainName,
    TranslateLanguageListStruct? mainDescription,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mainName = mainName,
        _mainDescription = mainDescription,
        super(firestoreUtilData);

  // "main_name" field.
  TranslateLanguageListStruct? _mainName;
  TranslateLanguageListStruct get mainName =>
      _mainName ?? TranslateLanguageListStruct();
  set mainName(TranslateLanguageListStruct? val) => _mainName = val;

  void updateMainName(Function(TranslateLanguageListStruct) updateFn) {
    updateFn(_mainName ??= TranslateLanguageListStruct());
  }

  bool hasMainName() => _mainName != null;

  // "main_description" field.
  TranslateLanguageListStruct? _mainDescription;
  TranslateLanguageListStruct get mainDescription =>
      _mainDescription ?? TranslateLanguageListStruct();
  set mainDescription(TranslateLanguageListStruct? val) =>
      _mainDescription = val;

  void updateMainDescription(Function(TranslateLanguageListStruct) updateFn) {
    updateFn(_mainDescription ??= TranslateLanguageListStruct());
  }

  bool hasMainDescription() => _mainDescription != null;

  static MainTranslateInfoStruct fromMap(Map<String, dynamic> data) =>
      MainTranslateInfoStruct(
        mainName: data['main_name'] is TranslateLanguageListStruct
            ? data['main_name']
            : TranslateLanguageListStruct.maybeFromMap(data['main_name']),
        mainDescription: data['main_description'] is TranslateLanguageListStruct
            ? data['main_description']
            : TranslateLanguageListStruct.maybeFromMap(
                data['main_description']),
      );

  static MainTranslateInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? MainTranslateInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'main_name': _mainName?.toMap(),
        'main_description': _mainDescription?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'main_name': serializeParam(
          _mainName,
          ParamType.DataStruct,
        ),
        'main_description': serializeParam(
          _mainDescription,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static MainTranslateInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MainTranslateInfoStruct(
        mainName: deserializeStructParam(
          data['main_name'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLanguageListStruct.fromSerializableMap,
        ),
        mainDescription: deserializeStructParam(
          data['main_description'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLanguageListStruct.fromSerializableMap,
        ),
      );

  static MainTranslateInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      MainTranslateInfoStruct(
        mainName: convertAlgoliaParam(
          data['main_name'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLanguageListStruct.fromAlgoliaData,
        ),
        mainDescription: convertAlgoliaParam(
          data['main_description'],
          ParamType.DataStruct,
          false,
          structBuilder: TranslateLanguageListStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MainTranslateInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MainTranslateInfoStruct &&
        mainName == other.mainName &&
        mainDescription == other.mainDescription;
  }

  @override
  int get hashCode => const ListEquality().hash([mainName, mainDescription]);
}

MainTranslateInfoStruct createMainTranslateInfoStruct({
  TranslateLanguageListStruct? mainName,
  TranslateLanguageListStruct? mainDescription,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MainTranslateInfoStruct(
      mainName:
          mainName ?? (clearUnsetFields ? TranslateLanguageListStruct() : null),
      mainDescription: mainDescription ??
          (clearUnsetFields ? TranslateLanguageListStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MainTranslateInfoStruct? updateMainTranslateInfoStruct(
  MainTranslateInfoStruct? mainTranslateInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mainTranslateInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMainTranslateInfoStructData(
  Map<String, dynamic> firestoreData,
  MainTranslateInfoStruct? mainTranslateInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mainTranslateInfo == null) {
    return;
  }
  if (mainTranslateInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mainTranslateInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mainTranslateInfoData =
      getMainTranslateInfoFirestoreData(mainTranslateInfo, forFieldValue);
  final nestedData =
      mainTranslateInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mainTranslateInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMainTranslateInfoFirestoreData(
  MainTranslateInfoStruct? mainTranslateInfo, [
  bool forFieldValue = false,
]) {
  if (mainTranslateInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mainTranslateInfo.toMap());

  // Handle nested data for "main_name" field.
  addTranslateLanguageListStructData(
    firestoreData,
    mainTranslateInfo.hasMainName() ? mainTranslateInfo.mainName : null,
    'main_name',
    forFieldValue,
  );

  // Handle nested data for "main_description" field.
  addTranslateLanguageListStructData(
    firestoreData,
    mainTranslateInfo.hasMainDescription()
        ? mainTranslateInfo.mainDescription
        : null,
    'main_description',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(mainTranslateInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMainTranslateInfoListFirestoreData(
  List<MainTranslateInfoStruct>? mainTranslateInfos,
) =>
    mainTranslateInfos
        ?.map((e) => getMainTranslateInfoFirestoreData(e, true))
        .toList() ??
    [];
