// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MenuSettingsPageWidgetListStruct extends FFFirebaseStruct {
  MenuSettingsPageWidgetListStruct({
    int? menuSettingsWidgetId,
    String? menuSettingsWidgetName,
    bool? menuSettingsWidgetStatus,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _menuSettingsWidgetId = menuSettingsWidgetId,
        _menuSettingsWidgetName = menuSettingsWidgetName,
        _menuSettingsWidgetStatus = menuSettingsWidgetStatus,
        super(firestoreUtilData);

  // "menu_settings_widget_id" field.
  int? _menuSettingsWidgetId;
  int get menuSettingsWidgetId => _menuSettingsWidgetId ?? 0;
  set menuSettingsWidgetId(int? val) => _menuSettingsWidgetId = val;

  void incrementMenuSettingsWidgetId(int amount) =>
      menuSettingsWidgetId = menuSettingsWidgetId + amount;

  bool hasMenuSettingsWidgetId() => _menuSettingsWidgetId != null;

  // "menu_settings_widget_name" field.
  String? _menuSettingsWidgetName;
  String get menuSettingsWidgetName => _menuSettingsWidgetName ?? '';
  set menuSettingsWidgetName(String? val) => _menuSettingsWidgetName = val;

  bool hasMenuSettingsWidgetName() => _menuSettingsWidgetName != null;

  // "menu_settings_widget_status" field.
  bool? _menuSettingsWidgetStatus;
  bool get menuSettingsWidgetStatus => _menuSettingsWidgetStatus ?? false;
  set menuSettingsWidgetStatus(bool? val) => _menuSettingsWidgetStatus = val;

  bool hasMenuSettingsWidgetStatus() => _menuSettingsWidgetStatus != null;

  static MenuSettingsPageWidgetListStruct fromMap(Map<String, dynamic> data) =>
      MenuSettingsPageWidgetListStruct(
        menuSettingsWidgetId: castToType<int>(data['menu_settings_widget_id']),
        menuSettingsWidgetName: data['menu_settings_widget_name'] as String?,
        menuSettingsWidgetStatus: data['menu_settings_widget_status'] as bool?,
      );

  static MenuSettingsPageWidgetListStruct? maybeFromMap(dynamic data) => data
          is Map
      ? MenuSettingsPageWidgetListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'menu_settings_widget_id': _menuSettingsWidgetId,
        'menu_settings_widget_name': _menuSettingsWidgetName,
        'menu_settings_widget_status': _menuSettingsWidgetStatus,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'menu_settings_widget_id': serializeParam(
          _menuSettingsWidgetId,
          ParamType.int,
        ),
        'menu_settings_widget_name': serializeParam(
          _menuSettingsWidgetName,
          ParamType.String,
        ),
        'menu_settings_widget_status': serializeParam(
          _menuSettingsWidgetStatus,
          ParamType.bool,
        ),
      }.withoutNulls;

  static MenuSettingsPageWidgetListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MenuSettingsPageWidgetListStruct(
        menuSettingsWidgetId: deserializeParam(
          data['menu_settings_widget_id'],
          ParamType.int,
          false,
        ),
        menuSettingsWidgetName: deserializeParam(
          data['menu_settings_widget_name'],
          ParamType.String,
          false,
        ),
        menuSettingsWidgetStatus: deserializeParam(
          data['menu_settings_widget_status'],
          ParamType.bool,
          false,
        ),
      );

  static MenuSettingsPageWidgetListStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      MenuSettingsPageWidgetListStruct(
        menuSettingsWidgetId: convertAlgoliaParam(
          data['menu_settings_widget_id'],
          ParamType.int,
          false,
        ),
        menuSettingsWidgetName: convertAlgoliaParam(
          data['menu_settings_widget_name'],
          ParamType.String,
          false,
        ),
        menuSettingsWidgetStatus: convertAlgoliaParam(
          data['menu_settings_widget_status'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MenuSettingsPageWidgetListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MenuSettingsPageWidgetListStruct &&
        menuSettingsWidgetId == other.menuSettingsWidgetId &&
        menuSettingsWidgetName == other.menuSettingsWidgetName &&
        menuSettingsWidgetStatus == other.menuSettingsWidgetStatus;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [menuSettingsWidgetId, menuSettingsWidgetName, menuSettingsWidgetStatus]);
}

MenuSettingsPageWidgetListStruct createMenuSettingsPageWidgetListStruct({
  int? menuSettingsWidgetId,
  String? menuSettingsWidgetName,
  bool? menuSettingsWidgetStatus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MenuSettingsPageWidgetListStruct(
      menuSettingsWidgetId: menuSettingsWidgetId,
      menuSettingsWidgetName: menuSettingsWidgetName,
      menuSettingsWidgetStatus: menuSettingsWidgetStatus,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MenuSettingsPageWidgetListStruct? updateMenuSettingsPageWidgetListStruct(
  MenuSettingsPageWidgetListStruct? menuSettingsPageWidgetList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    menuSettingsPageWidgetList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMenuSettingsPageWidgetListStructData(
  Map<String, dynamic> firestoreData,
  MenuSettingsPageWidgetListStruct? menuSettingsPageWidgetList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (menuSettingsPageWidgetList == null) {
    return;
  }
  if (menuSettingsPageWidgetList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      menuSettingsPageWidgetList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final menuSettingsPageWidgetListData =
      getMenuSettingsPageWidgetListFirestoreData(
          menuSettingsPageWidgetList, forFieldValue);
  final nestedData = menuSettingsPageWidgetListData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      menuSettingsPageWidgetList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMenuSettingsPageWidgetListFirestoreData(
  MenuSettingsPageWidgetListStruct? menuSettingsPageWidgetList, [
  bool forFieldValue = false,
]) {
  if (menuSettingsPageWidgetList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(menuSettingsPageWidgetList.toMap());

  // Add any Firestore field values
  mapToFirestore(menuSettingsPageWidgetList.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMenuSettingsPageWidgetListListFirestoreData(
  List<MenuSettingsPageWidgetListStruct>? menuSettingsPageWidgetLists,
) =>
    menuSettingsPageWidgetLists
        ?.map((e) => getMenuSettingsPageWidgetListFirestoreData(e, true))
        .toList() ??
    [];
