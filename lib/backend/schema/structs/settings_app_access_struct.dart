// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsAppAccessStruct extends FFFirebaseStruct {
  SettingsAppAccessStruct({
    bool? settingsCatllogFeature,
    bool? settingsCategoryFeature,
    bool? settingsSecretFeature,
    bool? settingsWaitlistFeature,
    List<SettingsAppAccessDataStruct>? settingsAppAccessList,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _settingsCatllogFeature = settingsCatllogFeature,
        _settingsCategoryFeature = settingsCategoryFeature,
        _settingsSecretFeature = settingsSecretFeature,
        _settingsWaitlistFeature = settingsWaitlistFeature,
        _settingsAppAccessList = settingsAppAccessList,
        super(firestoreUtilData);

  // "settings_catllog_feature" field.
  bool? _settingsCatllogFeature;
  bool get settingsCatllogFeature => _settingsCatllogFeature ?? false;
  set settingsCatllogFeature(bool? val) => _settingsCatllogFeature = val;

  bool hasSettingsCatllogFeature() => _settingsCatllogFeature != null;

  // "settings_category_feature" field.
  bool? _settingsCategoryFeature;
  bool get settingsCategoryFeature => _settingsCategoryFeature ?? false;
  set settingsCategoryFeature(bool? val) => _settingsCategoryFeature = val;

  bool hasSettingsCategoryFeature() => _settingsCategoryFeature != null;

  // "settings_secret_feature" field.
  bool? _settingsSecretFeature;
  bool get settingsSecretFeature => _settingsSecretFeature ?? false;
  set settingsSecretFeature(bool? val) => _settingsSecretFeature = val;

  bool hasSettingsSecretFeature() => _settingsSecretFeature != null;

  // "settings_waitlist_feature" field.
  bool? _settingsWaitlistFeature;
  bool get settingsWaitlistFeature => _settingsWaitlistFeature ?? false;
  set settingsWaitlistFeature(bool? val) => _settingsWaitlistFeature = val;

  bool hasSettingsWaitlistFeature() => _settingsWaitlistFeature != null;

  // "settings_app_access_list" field.
  List<SettingsAppAccessDataStruct>? _settingsAppAccessList;
  List<SettingsAppAccessDataStruct> get settingsAppAccessList =>
      _settingsAppAccessList ?? const [];
  set settingsAppAccessList(List<SettingsAppAccessDataStruct>? val) =>
      _settingsAppAccessList = val;

  void updateSettingsAppAccessList(
      Function(List<SettingsAppAccessDataStruct>) updateFn) {
    updateFn(_settingsAppAccessList ??= []);
  }

  bool hasSettingsAppAccessList() => _settingsAppAccessList != null;

  static SettingsAppAccessStruct fromMap(Map<String, dynamic> data) =>
      SettingsAppAccessStruct(
        settingsCatllogFeature: data['settings_catllog_feature'] as bool?,
        settingsCategoryFeature: data['settings_category_feature'] as bool?,
        settingsSecretFeature: data['settings_secret_feature'] as bool?,
        settingsWaitlistFeature: data['settings_waitlist_feature'] as bool?,
        settingsAppAccessList: getStructList(
          data['settings_app_access_list'],
          SettingsAppAccessDataStruct.fromMap,
        ),
      );

  static SettingsAppAccessStruct? maybeFromMap(dynamic data) => data is Map
      ? SettingsAppAccessStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'settings_catllog_feature': _settingsCatllogFeature,
        'settings_category_feature': _settingsCategoryFeature,
        'settings_secret_feature': _settingsSecretFeature,
        'settings_waitlist_feature': _settingsWaitlistFeature,
        'settings_app_access_list':
            _settingsAppAccessList?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'settings_catllog_feature': serializeParam(
          _settingsCatllogFeature,
          ParamType.bool,
        ),
        'settings_category_feature': serializeParam(
          _settingsCategoryFeature,
          ParamType.bool,
        ),
        'settings_secret_feature': serializeParam(
          _settingsSecretFeature,
          ParamType.bool,
        ),
        'settings_waitlist_feature': serializeParam(
          _settingsWaitlistFeature,
          ParamType.bool,
        ),
        'settings_app_access_list': serializeParam(
          _settingsAppAccessList,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SettingsAppAccessStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SettingsAppAccessStruct(
        settingsCatllogFeature: deserializeParam(
          data['settings_catllog_feature'],
          ParamType.bool,
          false,
        ),
        settingsCategoryFeature: deserializeParam(
          data['settings_category_feature'],
          ParamType.bool,
          false,
        ),
        settingsSecretFeature: deserializeParam(
          data['settings_secret_feature'],
          ParamType.bool,
          false,
        ),
        settingsWaitlistFeature: deserializeParam(
          data['settings_waitlist_feature'],
          ParamType.bool,
          false,
        ),
        settingsAppAccessList:
            deserializeStructParam<SettingsAppAccessDataStruct>(
          data['settings_app_access_list'],
          ParamType.DataStruct,
          true,
          structBuilder: SettingsAppAccessDataStruct.fromSerializableMap,
        ),
      );

  static SettingsAppAccessStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SettingsAppAccessStruct(
        settingsCatllogFeature: convertAlgoliaParam(
          data['settings_catllog_feature'],
          ParamType.bool,
          false,
        ),
        settingsCategoryFeature: convertAlgoliaParam(
          data['settings_category_feature'],
          ParamType.bool,
          false,
        ),
        settingsSecretFeature: convertAlgoliaParam(
          data['settings_secret_feature'],
          ParamType.bool,
          false,
        ),
        settingsWaitlistFeature: convertAlgoliaParam(
          data['settings_waitlist_feature'],
          ParamType.bool,
          false,
        ),
        settingsAppAccessList: convertAlgoliaParam<SettingsAppAccessDataStruct>(
          data['settings_app_access_list'],
          ParamType.DataStruct,
          true,
          structBuilder: SettingsAppAccessDataStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SettingsAppAccessStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SettingsAppAccessStruct &&
        settingsCatllogFeature == other.settingsCatllogFeature &&
        settingsCategoryFeature == other.settingsCategoryFeature &&
        settingsSecretFeature == other.settingsSecretFeature &&
        settingsWaitlistFeature == other.settingsWaitlistFeature &&
        listEquality.equals(settingsAppAccessList, other.settingsAppAccessList);
  }

  @override
  int get hashCode => const ListEquality().hash([
        settingsCatllogFeature,
        settingsCategoryFeature,
        settingsSecretFeature,
        settingsWaitlistFeature,
        settingsAppAccessList
      ]);
}

SettingsAppAccessStruct createSettingsAppAccessStruct({
  bool? settingsCatllogFeature,
  bool? settingsCategoryFeature,
  bool? settingsSecretFeature,
  bool? settingsWaitlistFeature,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsAppAccessStruct(
      settingsCatllogFeature: settingsCatllogFeature,
      settingsCategoryFeature: settingsCategoryFeature,
      settingsSecretFeature: settingsSecretFeature,
      settingsWaitlistFeature: settingsWaitlistFeature,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsAppAccessStruct? updateSettingsAppAccessStruct(
  SettingsAppAccessStruct? settingsAppAccess, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settingsAppAccess
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingsAppAccessStructData(
  Map<String, dynamic> firestoreData,
  SettingsAppAccessStruct? settingsAppAccess,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settingsAppAccess == null) {
    return;
  }
  if (settingsAppAccess.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && settingsAppAccess.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsAppAccessData =
      getSettingsAppAccessFirestoreData(settingsAppAccess, forFieldValue);
  final nestedData =
      settingsAppAccessData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = settingsAppAccess.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsAppAccessFirestoreData(
  SettingsAppAccessStruct? settingsAppAccess, [
  bool forFieldValue = false,
]) {
  if (settingsAppAccess == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settingsAppAccess.toMap());

  // Add any Firestore field values
  mapToFirestore(settingsAppAccess.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsAppAccessListFirestoreData(
  List<SettingsAppAccessStruct>? settingsAppAccesss,
) =>
    settingsAppAccesss
        ?.map((e) => getSettingsAppAccessFirestoreData(e, true))
        .toList() ??
    [];
