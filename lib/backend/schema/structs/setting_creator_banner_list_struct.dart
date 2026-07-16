// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SettingCreatorBannerListStruct extends FFFirebaseStruct {
  SettingCreatorBannerListStruct({
    String? titleEn,
    String? titleAr,
    String? subtitleEn,
    String? subtitleAr,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _titleEn = titleEn,
        _titleAr = titleAr,
        _subtitleEn = subtitleEn,
        _subtitleAr = subtitleAr,
        super(firestoreUtilData);

  // "title_en" field.
  String? _titleEn;
  String get titleEn => _titleEn ?? '';
  set titleEn(String? val) => _titleEn = val;

  bool hasTitleEn() => _titleEn != null;

  // "title_ar" field.
  String? _titleAr;
  String get titleAr => _titleAr ?? '';
  set titleAr(String? val) => _titleAr = val;

  bool hasTitleAr() => _titleAr != null;

  // "subtitle_en" field.
  String? _subtitleEn;
  String get subtitleEn => _subtitleEn ?? '';
  set subtitleEn(String? val) => _subtitleEn = val;

  bool hasSubtitleEn() => _subtitleEn != null;

  // "subtitle_ar" field.
  String? _subtitleAr;
  String get subtitleAr => _subtitleAr ?? '';
  set subtitleAr(String? val) => _subtitleAr = val;

  bool hasSubtitleAr() => _subtitleAr != null;

  static SettingCreatorBannerListStruct fromMap(Map<String, dynamic> data) =>
      SettingCreatorBannerListStruct(
        titleEn: data['title_en'] as String?,
        titleAr: data['title_ar'] as String?,
        subtitleEn: data['subtitle_en'] as String?,
        subtitleAr: data['subtitle_ar'] as String?,
      );

  static SettingCreatorBannerListStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? SettingCreatorBannerListStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'title_en': _titleEn,
        'title_ar': _titleAr,
        'subtitle_en': _subtitleEn,
        'subtitle_ar': _subtitleAr,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title_en': serializeParam(
          _titleEn,
          ParamType.String,
        ),
        'title_ar': serializeParam(
          _titleAr,
          ParamType.String,
        ),
        'subtitle_en': serializeParam(
          _subtitleEn,
          ParamType.String,
        ),
        'subtitle_ar': serializeParam(
          _subtitleAr,
          ParamType.String,
        ),
      }.withoutNulls;

  static SettingCreatorBannerListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SettingCreatorBannerListStruct(
        titleEn: deserializeParam(
          data['title_en'],
          ParamType.String,
          false,
        ),
        titleAr: deserializeParam(
          data['title_ar'],
          ParamType.String,
          false,
        ),
        subtitleEn: deserializeParam(
          data['subtitle_en'],
          ParamType.String,
          false,
        ),
        subtitleAr: deserializeParam(
          data['subtitle_ar'],
          ParamType.String,
          false,
        ),
      );

  static SettingCreatorBannerListStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      SettingCreatorBannerListStruct(
        titleEn: convertAlgoliaParam(
          data['title_en'],
          ParamType.String,
          false,
        ),
        titleAr: convertAlgoliaParam(
          data['title_ar'],
          ParamType.String,
          false,
        ),
        subtitleEn: convertAlgoliaParam(
          data['subtitle_en'],
          ParamType.String,
          false,
        ),
        subtitleAr: convertAlgoliaParam(
          data['subtitle_ar'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SettingCreatorBannerListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingCreatorBannerListStruct &&
        titleEn == other.titleEn &&
        titleAr == other.titleAr &&
        subtitleEn == other.subtitleEn &&
        subtitleAr == other.subtitleAr;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([titleEn, titleAr, subtitleEn, subtitleAr]);
}

SettingCreatorBannerListStruct createSettingCreatorBannerListStruct({
  String? titleEn,
  String? titleAr,
  String? subtitleEn,
  String? subtitleAr,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingCreatorBannerListStruct(
      titleEn: titleEn,
      titleAr: titleAr,
      subtitleEn: subtitleEn,
      subtitleAr: subtitleAr,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingCreatorBannerListStruct? updateSettingCreatorBannerListStruct(
  SettingCreatorBannerListStruct? settingCreatorBannerList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settingCreatorBannerList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingCreatorBannerListStructData(
  Map<String, dynamic> firestoreData,
  SettingCreatorBannerListStruct? settingCreatorBannerList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settingCreatorBannerList == null) {
    return;
  }
  if (settingCreatorBannerList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      settingCreatorBannerList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingCreatorBannerListData = getSettingCreatorBannerListFirestoreData(
      settingCreatorBannerList, forFieldValue);
  final nestedData =
      settingCreatorBannerListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      settingCreatorBannerList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingCreatorBannerListFirestoreData(
  SettingCreatorBannerListStruct? settingCreatorBannerList, [
  bool forFieldValue = false,
]) {
  if (settingCreatorBannerList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settingCreatorBannerList.toMap());

  // Add any Firestore field values
  mapToFirestore(settingCreatorBannerList.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingCreatorBannerListListFirestoreData(
  List<SettingCreatorBannerListStruct>? settingCreatorBannerLists,
) =>
    settingCreatorBannerLists
        ?.map((e) => getSettingCreatorBannerListFirestoreData(e, true))
        .toList() ??
    [];
