// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TranslateLanguageListStruct extends FFFirebaseStruct {
  TranslateLanguageListStruct({
    String? en,
    String? ar,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _en = en,
        _ar = ar,
        super(firestoreUtilData);

  // "en" field.
  String? _en;
  String get en => _en ?? '';
  set en(String? val) => _en = val;

  bool hasEn() => _en != null;

  // "ar" field.
  String? _ar;
  String get ar => _ar ?? '';
  set ar(String? val) => _ar = val;

  bool hasAr() => _ar != null;

  static TranslateLanguageListStruct fromMap(Map<String, dynamic> data) =>
      TranslateLanguageListStruct(
        en: data['en'] as String?,
        ar: data['ar'] as String?,
      );

  static TranslateLanguageListStruct? maybeFromMap(dynamic data) => data is Map
      ? TranslateLanguageListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'en': _en,
        'ar': _ar,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'en': serializeParam(
          _en,
          ParamType.String,
        ),
        'ar': serializeParam(
          _ar,
          ParamType.String,
        ),
      }.withoutNulls;

  static TranslateLanguageListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TranslateLanguageListStruct(
        en: deserializeParam(
          data['en'],
          ParamType.String,
          false,
        ),
        ar: deserializeParam(
          data['ar'],
          ParamType.String,
          false,
        ),
      );

  static TranslateLanguageListStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      TranslateLanguageListStruct(
        en: convertAlgoliaParam(
          data['en'],
          ParamType.String,
          false,
        ),
        ar: convertAlgoliaParam(
          data['ar'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TranslateLanguageListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TranslateLanguageListStruct &&
        en == other.en &&
        ar == other.ar;
  }

  @override
  int get hashCode => const ListEquality().hash([en, ar]);
}

TranslateLanguageListStruct createTranslateLanguageListStruct({
  String? en,
  String? ar,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TranslateLanguageListStruct(
      en: en,
      ar: ar,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TranslateLanguageListStruct? updateTranslateLanguageListStruct(
  TranslateLanguageListStruct? translateLanguageList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    translateLanguageList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTranslateLanguageListStructData(
  Map<String, dynamic> firestoreData,
  TranslateLanguageListStruct? translateLanguageList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (translateLanguageList == null) {
    return;
  }
  if (translateLanguageList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      translateLanguageList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final translateLanguageListData = getTranslateLanguageListFirestoreData(
      translateLanguageList, forFieldValue);
  final nestedData =
      translateLanguageListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      translateLanguageList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTranslateLanguageListFirestoreData(
  TranslateLanguageListStruct? translateLanguageList, [
  bool forFieldValue = false,
]) {
  if (translateLanguageList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(translateLanguageList.toMap());

  // Add any Firestore field values
  mapToFirestore(translateLanguageList.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTranslateLanguageListListFirestoreData(
  List<TranslateLanguageListStruct>? translateLanguageLists,
) =>
    translateLanguageLists
        ?.map((e) => getTranslateLanguageListFirestoreData(e, true))
        .toList() ??
    [];
