// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingsAppThemeInfoStruct extends FFFirebaseStruct {
  SettingsAppThemeInfoStruct({
    Color? primaryColor,
    Color? secondaryColor,
    String? fontFamily,
    String? backgroundImageUrl,
    String? themeType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _primaryColor = primaryColor,
        _secondaryColor = secondaryColor,
        _fontFamily = fontFamily,
        _backgroundImageUrl = backgroundImageUrl,
        _themeType = themeType,
        super(firestoreUtilData);

  // "primary_color" field.
  Color? _primaryColor;
  Color? get primaryColor => _primaryColor;
  set primaryColor(Color? val) => _primaryColor = val;

  bool hasPrimaryColor() => _primaryColor != null;

  // "secondary_color" field.
  Color? _secondaryColor;
  Color? get secondaryColor => _secondaryColor;
  set secondaryColor(Color? val) => _secondaryColor = val;

  bool hasSecondaryColor() => _secondaryColor != null;

  // "font_family" field.
  String? _fontFamily;
  String get fontFamily => _fontFamily ?? '';
  set fontFamily(String? val) => _fontFamily = val;

  bool hasFontFamily() => _fontFamily != null;

  // "background_image_url" field.
  String? _backgroundImageUrl;
  String get backgroundImageUrl => _backgroundImageUrl ?? '';
  set backgroundImageUrl(String? val) => _backgroundImageUrl = val;

  bool hasBackgroundImageUrl() => _backgroundImageUrl != null;

  // "theme_type" field.
  String? _themeType;
  String get themeType => _themeType ?? '';
  set themeType(String? val) => _themeType = val;

  bool hasThemeType() => _themeType != null;

  static SettingsAppThemeInfoStruct fromMap(Map<String, dynamic> data) =>
      SettingsAppThemeInfoStruct(
        primaryColor: getSchemaColor(data['primary_color']),
        secondaryColor: getSchemaColor(data['secondary_color']),
        fontFamily: data['font_family'] as String?,
        backgroundImageUrl: data['background_image_url'] as String?,
        themeType: data['theme_type'] as String?,
      );

  static SettingsAppThemeInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? SettingsAppThemeInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'primary_color': _primaryColor,
        'secondary_color': _secondaryColor,
        'font_family': _fontFamily,
        'background_image_url': _backgroundImageUrl,
        'theme_type': _themeType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'primary_color': serializeParam(
          _primaryColor,
          ParamType.Color,
        ),
        'secondary_color': serializeParam(
          _secondaryColor,
          ParamType.Color,
        ),
        'font_family': serializeParam(
          _fontFamily,
          ParamType.String,
        ),
        'background_image_url': serializeParam(
          _backgroundImageUrl,
          ParamType.String,
        ),
        'theme_type': serializeParam(
          _themeType,
          ParamType.String,
        ),
      }.withoutNulls;

  static SettingsAppThemeInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SettingsAppThemeInfoStruct(
        primaryColor: deserializeParam(
          data['primary_color'],
          ParamType.Color,
          false,
        ),
        secondaryColor: deserializeParam(
          data['secondary_color'],
          ParamType.Color,
          false,
        ),
        fontFamily: deserializeParam(
          data['font_family'],
          ParamType.String,
          false,
        ),
        backgroundImageUrl: deserializeParam(
          data['background_image_url'],
          ParamType.String,
          false,
        ),
        themeType: deserializeParam(
          data['theme_type'],
          ParamType.String,
          false,
        ),
      );

  static SettingsAppThemeInfoStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      SettingsAppThemeInfoStruct(
        primaryColor: convertAlgoliaParam(
          data['primary_color'],
          ParamType.Color,
          false,
        ),
        secondaryColor: convertAlgoliaParam(
          data['secondary_color'],
          ParamType.Color,
          false,
        ),
        fontFamily: convertAlgoliaParam(
          data['font_family'],
          ParamType.String,
          false,
        ),
        backgroundImageUrl: convertAlgoliaParam(
          data['background_image_url'],
          ParamType.String,
          false,
        ),
        themeType: convertAlgoliaParam(
          data['theme_type'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SettingsAppThemeInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingsAppThemeInfoStruct &&
        primaryColor == other.primaryColor &&
        secondaryColor == other.secondaryColor &&
        fontFamily == other.fontFamily &&
        backgroundImageUrl == other.backgroundImageUrl &&
        themeType == other.themeType;
  }

  @override
  int get hashCode => const ListEquality().hash([
        primaryColor,
        secondaryColor,
        fontFamily,
        backgroundImageUrl,
        themeType
      ]);
}

SettingsAppThemeInfoStruct createSettingsAppThemeInfoStruct({
  Color? primaryColor,
  Color? secondaryColor,
  String? fontFamily,
  String? backgroundImageUrl,
  String? themeType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsAppThemeInfoStruct(
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      fontFamily: fontFamily,
      backgroundImageUrl: backgroundImageUrl,
      themeType: themeType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsAppThemeInfoStruct? updateSettingsAppThemeInfoStruct(
  SettingsAppThemeInfoStruct? settingsAppThemeInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settingsAppThemeInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingsAppThemeInfoStructData(
  Map<String, dynamic> firestoreData,
  SettingsAppThemeInfoStruct? settingsAppThemeInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settingsAppThemeInfo == null) {
    return;
  }
  if (settingsAppThemeInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && settingsAppThemeInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsAppThemeInfoData =
      getSettingsAppThemeInfoFirestoreData(settingsAppThemeInfo, forFieldValue);
  final nestedData =
      settingsAppThemeInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      settingsAppThemeInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsAppThemeInfoFirestoreData(
  SettingsAppThemeInfoStruct? settingsAppThemeInfo, [
  bool forFieldValue = false,
]) {
  if (settingsAppThemeInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settingsAppThemeInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(settingsAppThemeInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsAppThemeInfoListFirestoreData(
  List<SettingsAppThemeInfoStruct>? settingsAppThemeInfos,
) =>
    settingsAppThemeInfos
        ?.map((e) => getSettingsAppThemeInfoFirestoreData(e, true))
        .toList() ??
    [];
