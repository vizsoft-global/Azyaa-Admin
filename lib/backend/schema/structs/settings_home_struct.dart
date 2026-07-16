// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsHomeStruct extends FFFirebaseStruct {
  SettingsHomeStruct({
    bool? settingsIsSearchStatus,
    bool? settingsIsBagStatus,
    bool? settingsIsNewStatus,
    bool? settingsIsRecentviewWidgetStatus,
    bool? settingsIsRecommendedWidgetStatus,
    bool? settingsIsCategoryWidgetStatus,
    List<String>? settingsCategoryidList,
    bool? settingsIsBannerlistWidgetStatus,
    List<InfoStruct>? settingsBannerInfoList,
    bool? settingIsCreatorBannnerWidgetStatus,
    List<InfoStruct>? settingsCreatorBannerInfoList,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _settingsIsSearchStatus = settingsIsSearchStatus,
        _settingsIsBagStatus = settingsIsBagStatus,
        _settingsIsNewStatus = settingsIsNewStatus,
        _settingsIsRecentviewWidgetStatus = settingsIsRecentviewWidgetStatus,
        _settingsIsRecommendedWidgetStatus = settingsIsRecommendedWidgetStatus,
        _settingsIsCategoryWidgetStatus = settingsIsCategoryWidgetStatus,
        _settingsCategoryidList = settingsCategoryidList,
        _settingsIsBannerlistWidgetStatus = settingsIsBannerlistWidgetStatus,
        _settingsBannerInfoList = settingsBannerInfoList,
        _settingIsCreatorBannnerWidgetStatus =
            settingIsCreatorBannnerWidgetStatus,
        _settingsCreatorBannerInfoList = settingsCreatorBannerInfoList,
        super(firestoreUtilData);

  // "settings_is_search_status" field.
  bool? _settingsIsSearchStatus;
  bool get settingsIsSearchStatus => _settingsIsSearchStatus ?? false;
  set settingsIsSearchStatus(bool? val) => _settingsIsSearchStatus = val;

  bool hasSettingsIsSearchStatus() => _settingsIsSearchStatus != null;

  // "settings_is_bag_status" field.
  bool? _settingsIsBagStatus;
  bool get settingsIsBagStatus => _settingsIsBagStatus ?? false;
  set settingsIsBagStatus(bool? val) => _settingsIsBagStatus = val;

  bool hasSettingsIsBagStatus() => _settingsIsBagStatus != null;

  // "settings_is_new_status" field.
  bool? _settingsIsNewStatus;
  bool get settingsIsNewStatus => _settingsIsNewStatus ?? false;
  set settingsIsNewStatus(bool? val) => _settingsIsNewStatus = val;

  bool hasSettingsIsNewStatus() => _settingsIsNewStatus != null;

  // "settings_is_recentview_widget_status" field.
  bool? _settingsIsRecentviewWidgetStatus;
  bool get settingsIsRecentviewWidgetStatus =>
      _settingsIsRecentviewWidgetStatus ?? false;
  set settingsIsRecentviewWidgetStatus(bool? val) =>
      _settingsIsRecentviewWidgetStatus = val;

  bool hasSettingsIsRecentviewWidgetStatus() =>
      _settingsIsRecentviewWidgetStatus != null;

  // "settings_is_recommended_widget_status" field.
  bool? _settingsIsRecommendedWidgetStatus;
  bool get settingsIsRecommendedWidgetStatus =>
      _settingsIsRecommendedWidgetStatus ?? false;
  set settingsIsRecommendedWidgetStatus(bool? val) =>
      _settingsIsRecommendedWidgetStatus = val;

  bool hasSettingsIsRecommendedWidgetStatus() =>
      _settingsIsRecommendedWidgetStatus != null;

  // "settings_is_category_widget_status" field.
  bool? _settingsIsCategoryWidgetStatus;
  bool get settingsIsCategoryWidgetStatus =>
      _settingsIsCategoryWidgetStatus ?? false;
  set settingsIsCategoryWidgetStatus(bool? val) =>
      _settingsIsCategoryWidgetStatus = val;

  bool hasSettingsIsCategoryWidgetStatus() =>
      _settingsIsCategoryWidgetStatus != null;

  // "settings_categoryid_list" field.
  List<String>? _settingsCategoryidList;
  List<String> get settingsCategoryidList =>
      _settingsCategoryidList ?? const [];
  set settingsCategoryidList(List<String>? val) =>
      _settingsCategoryidList = val;

  void updateSettingsCategoryidList(Function(List<String>) updateFn) {
    updateFn(_settingsCategoryidList ??= []);
  }

  bool hasSettingsCategoryidList() => _settingsCategoryidList != null;

  // "settings_is_bannerlist_widget_status" field.
  bool? _settingsIsBannerlistWidgetStatus;
  bool get settingsIsBannerlistWidgetStatus =>
      _settingsIsBannerlistWidgetStatus ?? false;
  set settingsIsBannerlistWidgetStatus(bool? val) =>
      _settingsIsBannerlistWidgetStatus = val;

  bool hasSettingsIsBannerlistWidgetStatus() =>
      _settingsIsBannerlistWidgetStatus != null;

  // "settings_banner_info_list" field.
  List<InfoStruct>? _settingsBannerInfoList;
  List<InfoStruct> get settingsBannerInfoList =>
      _settingsBannerInfoList ?? const [];
  set settingsBannerInfoList(List<InfoStruct>? val) =>
      _settingsBannerInfoList = val;

  void updateSettingsBannerInfoList(Function(List<InfoStruct>) updateFn) {
    updateFn(_settingsBannerInfoList ??= []);
  }

  bool hasSettingsBannerInfoList() => _settingsBannerInfoList != null;

  // "setting_is_creator_bannner_widget_status" field.
  bool? _settingIsCreatorBannnerWidgetStatus;
  bool get settingIsCreatorBannnerWidgetStatus =>
      _settingIsCreatorBannnerWidgetStatus ?? false;
  set settingIsCreatorBannnerWidgetStatus(bool? val) =>
      _settingIsCreatorBannnerWidgetStatus = val;

  bool hasSettingIsCreatorBannnerWidgetStatus() =>
      _settingIsCreatorBannnerWidgetStatus != null;

  // "settings_creator_banner_info_list" field.
  List<InfoStruct>? _settingsCreatorBannerInfoList;
  List<InfoStruct> get settingsCreatorBannerInfoList =>
      _settingsCreatorBannerInfoList ?? const [];
  set settingsCreatorBannerInfoList(List<InfoStruct>? val) =>
      _settingsCreatorBannerInfoList = val;

  void updateSettingsCreatorBannerInfoList(
      Function(List<InfoStruct>) updateFn) {
    updateFn(_settingsCreatorBannerInfoList ??= []);
  }

  bool hasSettingsCreatorBannerInfoList() =>
      _settingsCreatorBannerInfoList != null;

  static SettingsHomeStruct fromMap(Map<String, dynamic> data) =>
      SettingsHomeStruct(
        settingsIsSearchStatus: data['settings_is_search_status'] as bool?,
        settingsIsBagStatus: data['settings_is_bag_status'] as bool?,
        settingsIsNewStatus: data['settings_is_new_status'] as bool?,
        settingsIsRecentviewWidgetStatus:
            data['settings_is_recentview_widget_status'] as bool?,
        settingsIsRecommendedWidgetStatus:
            data['settings_is_recommended_widget_status'] as bool?,
        settingsIsCategoryWidgetStatus:
            data['settings_is_category_widget_status'] as bool?,
        settingsCategoryidList: getDataList(data['settings_categoryid_list']),
        settingsIsBannerlistWidgetStatus:
            data['settings_is_bannerlist_widget_status'] as bool?,
        settingsBannerInfoList: getStructList(
          data['settings_banner_info_list'],
          InfoStruct.fromMap,
        ),
        settingIsCreatorBannnerWidgetStatus:
            data['setting_is_creator_bannner_widget_status'] as bool?,
        settingsCreatorBannerInfoList: getStructList(
          data['settings_creator_banner_info_list'],
          InfoStruct.fromMap,
        ),
      );

  static SettingsHomeStruct? maybeFromMap(dynamic data) => data is Map
      ? SettingsHomeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'settings_is_search_status': _settingsIsSearchStatus,
        'settings_is_bag_status': _settingsIsBagStatus,
        'settings_is_new_status': _settingsIsNewStatus,
        'settings_is_recentview_widget_status':
            _settingsIsRecentviewWidgetStatus,
        'settings_is_recommended_widget_status':
            _settingsIsRecommendedWidgetStatus,
        'settings_is_category_widget_status': _settingsIsCategoryWidgetStatus,
        'settings_categoryid_list': _settingsCategoryidList,
        'settings_is_bannerlist_widget_status':
            _settingsIsBannerlistWidgetStatus,
        'settings_banner_info_list':
            _settingsBannerInfoList?.map((e) => e.toMap()).toList(),
        'setting_is_creator_bannner_widget_status':
            _settingIsCreatorBannnerWidgetStatus,
        'settings_creator_banner_info_list':
            _settingsCreatorBannerInfoList?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'settings_is_search_status': serializeParam(
          _settingsIsSearchStatus,
          ParamType.bool,
        ),
        'settings_is_bag_status': serializeParam(
          _settingsIsBagStatus,
          ParamType.bool,
        ),
        'settings_is_new_status': serializeParam(
          _settingsIsNewStatus,
          ParamType.bool,
        ),
        'settings_is_recentview_widget_status': serializeParam(
          _settingsIsRecentviewWidgetStatus,
          ParamType.bool,
        ),
        'settings_is_recommended_widget_status': serializeParam(
          _settingsIsRecommendedWidgetStatus,
          ParamType.bool,
        ),
        'settings_is_category_widget_status': serializeParam(
          _settingsIsCategoryWidgetStatus,
          ParamType.bool,
        ),
        'settings_categoryid_list': serializeParam(
          _settingsCategoryidList,
          ParamType.String,
          isList: true,
        ),
        'settings_is_bannerlist_widget_status': serializeParam(
          _settingsIsBannerlistWidgetStatus,
          ParamType.bool,
        ),
        'settings_banner_info_list': serializeParam(
          _settingsBannerInfoList,
          ParamType.DataStruct,
          isList: true,
        ),
        'setting_is_creator_bannner_widget_status': serializeParam(
          _settingIsCreatorBannnerWidgetStatus,
          ParamType.bool,
        ),
        'settings_creator_banner_info_list': serializeParam(
          _settingsCreatorBannerInfoList,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SettingsHomeStruct fromSerializableMap(Map<String, dynamic> data) =>
      SettingsHomeStruct(
        settingsIsSearchStatus: deserializeParam(
          data['settings_is_search_status'],
          ParamType.bool,
          false,
        ),
        settingsIsBagStatus: deserializeParam(
          data['settings_is_bag_status'],
          ParamType.bool,
          false,
        ),
        settingsIsNewStatus: deserializeParam(
          data['settings_is_new_status'],
          ParamType.bool,
          false,
        ),
        settingsIsRecentviewWidgetStatus: deserializeParam(
          data['settings_is_recentview_widget_status'],
          ParamType.bool,
          false,
        ),
        settingsIsRecommendedWidgetStatus: deserializeParam(
          data['settings_is_recommended_widget_status'],
          ParamType.bool,
          false,
        ),
        settingsIsCategoryWidgetStatus: deserializeParam(
          data['settings_is_category_widget_status'],
          ParamType.bool,
          false,
        ),
        settingsCategoryidList: deserializeParam<String>(
          data['settings_categoryid_list'],
          ParamType.String,
          true,
        ),
        settingsIsBannerlistWidgetStatus: deserializeParam(
          data['settings_is_bannerlist_widget_status'],
          ParamType.bool,
          false,
        ),
        settingsBannerInfoList: deserializeStructParam<InfoStruct>(
          data['settings_banner_info_list'],
          ParamType.DataStruct,
          true,
          structBuilder: InfoStruct.fromSerializableMap,
        ),
        settingIsCreatorBannnerWidgetStatus: deserializeParam(
          data['setting_is_creator_bannner_widget_status'],
          ParamType.bool,
          false,
        ),
        settingsCreatorBannerInfoList: deserializeStructParam<InfoStruct>(
          data['settings_creator_banner_info_list'],
          ParamType.DataStruct,
          true,
          structBuilder: InfoStruct.fromSerializableMap,
        ),
      );

  static SettingsHomeStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SettingsHomeStruct(
        settingsIsSearchStatus: convertAlgoliaParam(
          data['settings_is_search_status'],
          ParamType.bool,
          false,
        ),
        settingsIsBagStatus: convertAlgoliaParam(
          data['settings_is_bag_status'],
          ParamType.bool,
          false,
        ),
        settingsIsNewStatus: convertAlgoliaParam(
          data['settings_is_new_status'],
          ParamType.bool,
          false,
        ),
        settingsIsRecentviewWidgetStatus: convertAlgoliaParam(
          data['settings_is_recentview_widget_status'],
          ParamType.bool,
          false,
        ),
        settingsIsRecommendedWidgetStatus: convertAlgoliaParam(
          data['settings_is_recommended_widget_status'],
          ParamType.bool,
          false,
        ),
        settingsIsCategoryWidgetStatus: convertAlgoliaParam(
          data['settings_is_category_widget_status'],
          ParamType.bool,
          false,
        ),
        settingsCategoryidList: convertAlgoliaParam<String>(
          data['settings_categoryid_list'],
          ParamType.String,
          true,
        ),
        settingsIsBannerlistWidgetStatus: convertAlgoliaParam(
          data['settings_is_bannerlist_widget_status'],
          ParamType.bool,
          false,
        ),
        settingsBannerInfoList: convertAlgoliaParam<InfoStruct>(
          data['settings_banner_info_list'],
          ParamType.DataStruct,
          true,
          structBuilder: InfoStruct.fromAlgoliaData,
        ),
        settingIsCreatorBannnerWidgetStatus: convertAlgoliaParam(
          data['setting_is_creator_bannner_widget_status'],
          ParamType.bool,
          false,
        ),
        settingsCreatorBannerInfoList: convertAlgoliaParam<InfoStruct>(
          data['settings_creator_banner_info_list'],
          ParamType.DataStruct,
          true,
          structBuilder: InfoStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SettingsHomeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SettingsHomeStruct &&
        settingsIsSearchStatus == other.settingsIsSearchStatus &&
        settingsIsBagStatus == other.settingsIsBagStatus &&
        settingsIsNewStatus == other.settingsIsNewStatus &&
        settingsIsRecentviewWidgetStatus ==
            other.settingsIsRecentviewWidgetStatus &&
        settingsIsRecommendedWidgetStatus ==
            other.settingsIsRecommendedWidgetStatus &&
        settingsIsCategoryWidgetStatus ==
            other.settingsIsCategoryWidgetStatus &&
        listEquality.equals(
            settingsCategoryidList, other.settingsCategoryidList) &&
        settingsIsBannerlistWidgetStatus ==
            other.settingsIsBannerlistWidgetStatus &&
        listEquality.equals(
            settingsBannerInfoList, other.settingsBannerInfoList) &&
        settingIsCreatorBannnerWidgetStatus ==
            other.settingIsCreatorBannnerWidgetStatus &&
        listEquality.equals(
            settingsCreatorBannerInfoList, other.settingsCreatorBannerInfoList);
  }

  @override
  int get hashCode => const ListEquality().hash([
        settingsIsSearchStatus,
        settingsIsBagStatus,
        settingsIsNewStatus,
        settingsIsRecentviewWidgetStatus,
        settingsIsRecommendedWidgetStatus,
        settingsIsCategoryWidgetStatus,
        settingsCategoryidList,
        settingsIsBannerlistWidgetStatus,
        settingsBannerInfoList,
        settingIsCreatorBannnerWidgetStatus,
        settingsCreatorBannerInfoList
      ]);
}

SettingsHomeStruct createSettingsHomeStruct({
  bool? settingsIsSearchStatus,
  bool? settingsIsBagStatus,
  bool? settingsIsNewStatus,
  bool? settingsIsRecentviewWidgetStatus,
  bool? settingsIsRecommendedWidgetStatus,
  bool? settingsIsCategoryWidgetStatus,
  bool? settingsIsBannerlistWidgetStatus,
  bool? settingIsCreatorBannnerWidgetStatus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsHomeStruct(
      settingsIsSearchStatus: settingsIsSearchStatus,
      settingsIsBagStatus: settingsIsBagStatus,
      settingsIsNewStatus: settingsIsNewStatus,
      settingsIsRecentviewWidgetStatus: settingsIsRecentviewWidgetStatus,
      settingsIsRecommendedWidgetStatus: settingsIsRecommendedWidgetStatus,
      settingsIsCategoryWidgetStatus: settingsIsCategoryWidgetStatus,
      settingsIsBannerlistWidgetStatus: settingsIsBannerlistWidgetStatus,
      settingIsCreatorBannnerWidgetStatus: settingIsCreatorBannnerWidgetStatus,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsHomeStruct? updateSettingsHomeStruct(
  SettingsHomeStruct? settingsHome, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settingsHome
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingsHomeStructData(
  Map<String, dynamic> firestoreData,
  SettingsHomeStruct? settingsHome,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settingsHome == null) {
    return;
  }
  if (settingsHome.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && settingsHome.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsHomeData =
      getSettingsHomeFirestoreData(settingsHome, forFieldValue);
  final nestedData =
      settingsHomeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = settingsHome.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsHomeFirestoreData(
  SettingsHomeStruct? settingsHome, [
  bool forFieldValue = false,
]) {
  if (settingsHome == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settingsHome.toMap());

  // Add any Firestore field values
  mapToFirestore(settingsHome.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsHomeListFirestoreData(
  List<SettingsHomeStruct>? settingsHomes,
) =>
    settingsHomes?.map((e) => getSettingsHomeFirestoreData(e, true)).toList() ??
    [];
