// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThemeColourStruct extends FFFirebaseStruct {
  ThemeColourStruct({
    Color? primary,
    Color? secondary,
    Color? primaryGradientColor1,
    Color? primaryGradientColor2,
    Color? secondaryGradientColor1,
    Color? secondaryGradientColor2,
    Color? tertiary,
    Color? alternate,
    Color? primaryText,
    Color? secondaryText,
    Color? accent1,
    Color? accent2,
    Color? primaryBackground,
    Color? secondaryBackground,
    Color? primaryButtoncolor,
    Color? secondaryButtonColor,
    Color? primaryButtonTextColor,
    Color? secondaryButtonTextColor,
    Color? primaryButtonBorder,
    Color? secondaryButtonBorder,
    int? themeId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _primary = primary,
        _secondary = secondary,
        _primaryGradientColor1 = primaryGradientColor1,
        _primaryGradientColor2 = primaryGradientColor2,
        _secondaryGradientColor1 = secondaryGradientColor1,
        _secondaryGradientColor2 = secondaryGradientColor2,
        _tertiary = tertiary,
        _alternate = alternate,
        _primaryText = primaryText,
        _secondaryText = secondaryText,
        _accent1 = accent1,
        _accent2 = accent2,
        _primaryBackground = primaryBackground,
        _secondaryBackground = secondaryBackground,
        _primaryButtoncolor = primaryButtoncolor,
        _secondaryButtonColor = secondaryButtonColor,
        _primaryButtonTextColor = primaryButtonTextColor,
        _secondaryButtonTextColor = secondaryButtonTextColor,
        _primaryButtonBorder = primaryButtonBorder,
        _secondaryButtonBorder = secondaryButtonBorder,
        _themeId = themeId,
        super(firestoreUtilData);

  // "Primary" field.
  Color? _primary;
  Color? get primary => _primary;
  set primary(Color? val) => _primary = val;

  bool hasPrimary() => _primary != null;

  // "Secondary" field.
  Color? _secondary;
  Color? get secondary => _secondary;
  set secondary(Color? val) => _secondary = val;

  bool hasSecondary() => _secondary != null;

  // "PrimaryGradientColor1" field.
  Color? _primaryGradientColor1;
  Color? get primaryGradientColor1 => _primaryGradientColor1;
  set primaryGradientColor1(Color? val) => _primaryGradientColor1 = val;

  bool hasPrimaryGradientColor1() => _primaryGradientColor1 != null;

  // "PrimaryGradientColor2" field.
  Color? _primaryGradientColor2;
  Color? get primaryGradientColor2 => _primaryGradientColor2;
  set primaryGradientColor2(Color? val) => _primaryGradientColor2 = val;

  bool hasPrimaryGradientColor2() => _primaryGradientColor2 != null;

  // "SecondaryGradientColor1" field.
  Color? _secondaryGradientColor1;
  Color? get secondaryGradientColor1 => _secondaryGradientColor1;
  set secondaryGradientColor1(Color? val) => _secondaryGradientColor1 = val;

  bool hasSecondaryGradientColor1() => _secondaryGradientColor1 != null;

  // "SecondaryGradientColor2" field.
  Color? _secondaryGradientColor2;
  Color? get secondaryGradientColor2 => _secondaryGradientColor2;
  set secondaryGradientColor2(Color? val) => _secondaryGradientColor2 = val;

  bool hasSecondaryGradientColor2() => _secondaryGradientColor2 != null;

  // "Tertiary" field.
  Color? _tertiary;
  Color? get tertiary => _tertiary;
  set tertiary(Color? val) => _tertiary = val;

  bool hasTertiary() => _tertiary != null;

  // "Alternate" field.
  Color? _alternate;
  Color? get alternate => _alternate;
  set alternate(Color? val) => _alternate = val;

  bool hasAlternate() => _alternate != null;

  // "PrimaryText" field.
  Color? _primaryText;
  Color? get primaryText => _primaryText;
  set primaryText(Color? val) => _primaryText = val;

  bool hasPrimaryText() => _primaryText != null;

  // "SecondaryText" field.
  Color? _secondaryText;
  Color? get secondaryText => _secondaryText;
  set secondaryText(Color? val) => _secondaryText = val;

  bool hasSecondaryText() => _secondaryText != null;

  // "Accent1" field.
  Color? _accent1;
  Color? get accent1 => _accent1;
  set accent1(Color? val) => _accent1 = val;

  bool hasAccent1() => _accent1 != null;

  // "Accent2" field.
  Color? _accent2;
  Color? get accent2 => _accent2;
  set accent2(Color? val) => _accent2 = val;

  bool hasAccent2() => _accent2 != null;

  // "PrimaryBackground" field.
  Color? _primaryBackground;
  Color? get primaryBackground => _primaryBackground;
  set primaryBackground(Color? val) => _primaryBackground = val;

  bool hasPrimaryBackground() => _primaryBackground != null;

  // "SecondaryBackground" field.
  Color? _secondaryBackground;
  Color? get secondaryBackground => _secondaryBackground;
  set secondaryBackground(Color? val) => _secondaryBackground = val;

  bool hasSecondaryBackground() => _secondaryBackground != null;

  // "primaryButtoncolor" field.
  Color? _primaryButtoncolor;
  Color? get primaryButtoncolor => _primaryButtoncolor;
  set primaryButtoncolor(Color? val) => _primaryButtoncolor = val;

  bool hasPrimaryButtoncolor() => _primaryButtoncolor != null;

  // "secondaryButtonColor" field.
  Color? _secondaryButtonColor;
  Color? get secondaryButtonColor => _secondaryButtonColor;
  set secondaryButtonColor(Color? val) => _secondaryButtonColor = val;

  bool hasSecondaryButtonColor() => _secondaryButtonColor != null;

  // "primaryButtonTextColor" field.
  Color? _primaryButtonTextColor;
  Color? get primaryButtonTextColor => _primaryButtonTextColor;
  set primaryButtonTextColor(Color? val) => _primaryButtonTextColor = val;

  bool hasPrimaryButtonTextColor() => _primaryButtonTextColor != null;

  // "secondaryButtonTextColor" field.
  Color? _secondaryButtonTextColor;
  Color? get secondaryButtonTextColor => _secondaryButtonTextColor;
  set secondaryButtonTextColor(Color? val) => _secondaryButtonTextColor = val;

  bool hasSecondaryButtonTextColor() => _secondaryButtonTextColor != null;

  // "primaryButtonBorder" field.
  Color? _primaryButtonBorder;
  Color? get primaryButtonBorder => _primaryButtonBorder;
  set primaryButtonBorder(Color? val) => _primaryButtonBorder = val;

  bool hasPrimaryButtonBorder() => _primaryButtonBorder != null;

  // "secondaryButtonBorder" field.
  Color? _secondaryButtonBorder;
  Color? get secondaryButtonBorder => _secondaryButtonBorder;
  set secondaryButtonBorder(Color? val) => _secondaryButtonBorder = val;

  bool hasSecondaryButtonBorder() => _secondaryButtonBorder != null;

  // "theme_id" field.
  int? _themeId;
  int get themeId => _themeId ?? 0;
  set themeId(int? val) => _themeId = val;

  void incrementThemeId(int amount) => themeId = themeId + amount;

  bool hasThemeId() => _themeId != null;

  static ThemeColourStruct fromMap(Map<String, dynamic> data) =>
      ThemeColourStruct(
        primary: getSchemaColor(data['Primary']),
        secondary: getSchemaColor(data['Secondary']),
        primaryGradientColor1: getSchemaColor(data['PrimaryGradientColor1']),
        primaryGradientColor2: getSchemaColor(data['PrimaryGradientColor2']),
        secondaryGradientColor1:
            getSchemaColor(data['SecondaryGradientColor1']),
        secondaryGradientColor2:
            getSchemaColor(data['SecondaryGradientColor2']),
        tertiary: getSchemaColor(data['Tertiary']),
        alternate: getSchemaColor(data['Alternate']),
        primaryText: getSchemaColor(data['PrimaryText']),
        secondaryText: getSchemaColor(data['SecondaryText']),
        accent1: getSchemaColor(data['Accent1']),
        accent2: getSchemaColor(data['Accent2']),
        primaryBackground: getSchemaColor(data['PrimaryBackground']),
        secondaryBackground: getSchemaColor(data['SecondaryBackground']),
        primaryButtoncolor: getSchemaColor(data['primaryButtoncolor']),
        secondaryButtonColor: getSchemaColor(data['secondaryButtonColor']),
        primaryButtonTextColor: getSchemaColor(data['primaryButtonTextColor']),
        secondaryButtonTextColor:
            getSchemaColor(data['secondaryButtonTextColor']),
        primaryButtonBorder: getSchemaColor(data['primaryButtonBorder']),
        secondaryButtonBorder: getSchemaColor(data['secondaryButtonBorder']),
        themeId: castToType<int>(data['theme_id']),
      );

  static ThemeColourStruct? maybeFromMap(dynamic data) => data is Map
      ? ThemeColourStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Primary': _primary,
        'Secondary': _secondary,
        'PrimaryGradientColor1': _primaryGradientColor1,
        'PrimaryGradientColor2': _primaryGradientColor2,
        'SecondaryGradientColor1': _secondaryGradientColor1,
        'SecondaryGradientColor2': _secondaryGradientColor2,
        'Tertiary': _tertiary,
        'Alternate': _alternate,
        'PrimaryText': _primaryText,
        'SecondaryText': _secondaryText,
        'Accent1': _accent1,
        'Accent2': _accent2,
        'PrimaryBackground': _primaryBackground,
        'SecondaryBackground': _secondaryBackground,
        'primaryButtoncolor': _primaryButtoncolor,
        'secondaryButtonColor': _secondaryButtonColor,
        'primaryButtonTextColor': _primaryButtonTextColor,
        'secondaryButtonTextColor': _secondaryButtonTextColor,
        'primaryButtonBorder': _primaryButtonBorder,
        'secondaryButtonBorder': _secondaryButtonBorder,
        'theme_id': _themeId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Primary': serializeParam(
          _primary,
          ParamType.Color,
        ),
        'Secondary': serializeParam(
          _secondary,
          ParamType.Color,
        ),
        'PrimaryGradientColor1': serializeParam(
          _primaryGradientColor1,
          ParamType.Color,
        ),
        'PrimaryGradientColor2': serializeParam(
          _primaryGradientColor2,
          ParamType.Color,
        ),
        'SecondaryGradientColor1': serializeParam(
          _secondaryGradientColor1,
          ParamType.Color,
        ),
        'SecondaryGradientColor2': serializeParam(
          _secondaryGradientColor2,
          ParamType.Color,
        ),
        'Tertiary': serializeParam(
          _tertiary,
          ParamType.Color,
        ),
        'Alternate': serializeParam(
          _alternate,
          ParamType.Color,
        ),
        'PrimaryText': serializeParam(
          _primaryText,
          ParamType.Color,
        ),
        'SecondaryText': serializeParam(
          _secondaryText,
          ParamType.Color,
        ),
        'Accent1': serializeParam(
          _accent1,
          ParamType.Color,
        ),
        'Accent2': serializeParam(
          _accent2,
          ParamType.Color,
        ),
        'PrimaryBackground': serializeParam(
          _primaryBackground,
          ParamType.Color,
        ),
        'SecondaryBackground': serializeParam(
          _secondaryBackground,
          ParamType.Color,
        ),
        'primaryButtoncolor': serializeParam(
          _primaryButtoncolor,
          ParamType.Color,
        ),
        'secondaryButtonColor': serializeParam(
          _secondaryButtonColor,
          ParamType.Color,
        ),
        'primaryButtonTextColor': serializeParam(
          _primaryButtonTextColor,
          ParamType.Color,
        ),
        'secondaryButtonTextColor': serializeParam(
          _secondaryButtonTextColor,
          ParamType.Color,
        ),
        'primaryButtonBorder': serializeParam(
          _primaryButtonBorder,
          ParamType.Color,
        ),
        'secondaryButtonBorder': serializeParam(
          _secondaryButtonBorder,
          ParamType.Color,
        ),
        'theme_id': serializeParam(
          _themeId,
          ParamType.int,
        ),
      }.withoutNulls;

  static ThemeColourStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThemeColourStruct(
        primary: deserializeParam(
          data['Primary'],
          ParamType.Color,
          false,
        ),
        secondary: deserializeParam(
          data['Secondary'],
          ParamType.Color,
          false,
        ),
        primaryGradientColor1: deserializeParam(
          data['PrimaryGradientColor1'],
          ParamType.Color,
          false,
        ),
        primaryGradientColor2: deserializeParam(
          data['PrimaryGradientColor2'],
          ParamType.Color,
          false,
        ),
        secondaryGradientColor1: deserializeParam(
          data['SecondaryGradientColor1'],
          ParamType.Color,
          false,
        ),
        secondaryGradientColor2: deserializeParam(
          data['SecondaryGradientColor2'],
          ParamType.Color,
          false,
        ),
        tertiary: deserializeParam(
          data['Tertiary'],
          ParamType.Color,
          false,
        ),
        alternate: deserializeParam(
          data['Alternate'],
          ParamType.Color,
          false,
        ),
        primaryText: deserializeParam(
          data['PrimaryText'],
          ParamType.Color,
          false,
        ),
        secondaryText: deserializeParam(
          data['SecondaryText'],
          ParamType.Color,
          false,
        ),
        accent1: deserializeParam(
          data['Accent1'],
          ParamType.Color,
          false,
        ),
        accent2: deserializeParam(
          data['Accent2'],
          ParamType.Color,
          false,
        ),
        primaryBackground: deserializeParam(
          data['PrimaryBackground'],
          ParamType.Color,
          false,
        ),
        secondaryBackground: deserializeParam(
          data['SecondaryBackground'],
          ParamType.Color,
          false,
        ),
        primaryButtoncolor: deserializeParam(
          data['primaryButtoncolor'],
          ParamType.Color,
          false,
        ),
        secondaryButtonColor: deserializeParam(
          data['secondaryButtonColor'],
          ParamType.Color,
          false,
        ),
        primaryButtonTextColor: deserializeParam(
          data['primaryButtonTextColor'],
          ParamType.Color,
          false,
        ),
        secondaryButtonTextColor: deserializeParam(
          data['secondaryButtonTextColor'],
          ParamType.Color,
          false,
        ),
        primaryButtonBorder: deserializeParam(
          data['primaryButtonBorder'],
          ParamType.Color,
          false,
        ),
        secondaryButtonBorder: deserializeParam(
          data['secondaryButtonBorder'],
          ParamType.Color,
          false,
        ),
        themeId: deserializeParam(
          data['theme_id'],
          ParamType.int,
          false,
        ),
      );

  static ThemeColourStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ThemeColourStruct(
        primary: convertAlgoliaParam(
          data['Primary'],
          ParamType.Color,
          false,
        ),
        secondary: convertAlgoliaParam(
          data['Secondary'],
          ParamType.Color,
          false,
        ),
        primaryGradientColor1: convertAlgoliaParam(
          data['PrimaryGradientColor1'],
          ParamType.Color,
          false,
        ),
        primaryGradientColor2: convertAlgoliaParam(
          data['PrimaryGradientColor2'],
          ParamType.Color,
          false,
        ),
        secondaryGradientColor1: convertAlgoliaParam(
          data['SecondaryGradientColor1'],
          ParamType.Color,
          false,
        ),
        secondaryGradientColor2: convertAlgoliaParam(
          data['SecondaryGradientColor2'],
          ParamType.Color,
          false,
        ),
        tertiary: convertAlgoliaParam(
          data['Tertiary'],
          ParamType.Color,
          false,
        ),
        alternate: convertAlgoliaParam(
          data['Alternate'],
          ParamType.Color,
          false,
        ),
        primaryText: convertAlgoliaParam(
          data['PrimaryText'],
          ParamType.Color,
          false,
        ),
        secondaryText: convertAlgoliaParam(
          data['SecondaryText'],
          ParamType.Color,
          false,
        ),
        accent1: convertAlgoliaParam(
          data['Accent1'],
          ParamType.Color,
          false,
        ),
        accent2: convertAlgoliaParam(
          data['Accent2'],
          ParamType.Color,
          false,
        ),
        primaryBackground: convertAlgoliaParam(
          data['PrimaryBackground'],
          ParamType.Color,
          false,
        ),
        secondaryBackground: convertAlgoliaParam(
          data['SecondaryBackground'],
          ParamType.Color,
          false,
        ),
        primaryButtoncolor: convertAlgoliaParam(
          data['primaryButtoncolor'],
          ParamType.Color,
          false,
        ),
        secondaryButtonColor: convertAlgoliaParam(
          data['secondaryButtonColor'],
          ParamType.Color,
          false,
        ),
        primaryButtonTextColor: convertAlgoliaParam(
          data['primaryButtonTextColor'],
          ParamType.Color,
          false,
        ),
        secondaryButtonTextColor: convertAlgoliaParam(
          data['secondaryButtonTextColor'],
          ParamType.Color,
          false,
        ),
        primaryButtonBorder: convertAlgoliaParam(
          data['primaryButtonBorder'],
          ParamType.Color,
          false,
        ),
        secondaryButtonBorder: convertAlgoliaParam(
          data['secondaryButtonBorder'],
          ParamType.Color,
          false,
        ),
        themeId: convertAlgoliaParam(
          data['theme_id'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ThemeColourStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ThemeColourStruct &&
        primary == other.primary &&
        secondary == other.secondary &&
        primaryGradientColor1 == other.primaryGradientColor1 &&
        primaryGradientColor2 == other.primaryGradientColor2 &&
        secondaryGradientColor1 == other.secondaryGradientColor1 &&
        secondaryGradientColor2 == other.secondaryGradientColor2 &&
        tertiary == other.tertiary &&
        alternate == other.alternate &&
        primaryText == other.primaryText &&
        secondaryText == other.secondaryText &&
        accent1 == other.accent1 &&
        accent2 == other.accent2 &&
        primaryBackground == other.primaryBackground &&
        secondaryBackground == other.secondaryBackground &&
        primaryButtoncolor == other.primaryButtoncolor &&
        secondaryButtonColor == other.secondaryButtonColor &&
        primaryButtonTextColor == other.primaryButtonTextColor &&
        secondaryButtonTextColor == other.secondaryButtonTextColor &&
        primaryButtonBorder == other.primaryButtonBorder &&
        secondaryButtonBorder == other.secondaryButtonBorder &&
        themeId == other.themeId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        primary,
        secondary,
        primaryGradientColor1,
        primaryGradientColor2,
        secondaryGradientColor1,
        secondaryGradientColor2,
        tertiary,
        alternate,
        primaryText,
        secondaryText,
        accent1,
        accent2,
        primaryBackground,
        secondaryBackground,
        primaryButtoncolor,
        secondaryButtonColor,
        primaryButtonTextColor,
        secondaryButtonTextColor,
        primaryButtonBorder,
        secondaryButtonBorder,
        themeId
      ]);
}

ThemeColourStruct createThemeColourStruct({
  Color? primary,
  Color? secondary,
  Color? primaryGradientColor1,
  Color? primaryGradientColor2,
  Color? secondaryGradientColor1,
  Color? secondaryGradientColor2,
  Color? tertiary,
  Color? alternate,
  Color? primaryText,
  Color? secondaryText,
  Color? accent1,
  Color? accent2,
  Color? primaryBackground,
  Color? secondaryBackground,
  Color? primaryButtoncolor,
  Color? secondaryButtonColor,
  Color? primaryButtonTextColor,
  Color? secondaryButtonTextColor,
  Color? primaryButtonBorder,
  Color? secondaryButtonBorder,
  int? themeId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThemeColourStruct(
      primary: primary,
      secondary: secondary,
      primaryGradientColor1: primaryGradientColor1,
      primaryGradientColor2: primaryGradientColor2,
      secondaryGradientColor1: secondaryGradientColor1,
      secondaryGradientColor2: secondaryGradientColor2,
      tertiary: tertiary,
      alternate: alternate,
      primaryText: primaryText,
      secondaryText: secondaryText,
      accent1: accent1,
      accent2: accent2,
      primaryBackground: primaryBackground,
      secondaryBackground: secondaryBackground,
      primaryButtoncolor: primaryButtoncolor,
      secondaryButtonColor: secondaryButtonColor,
      primaryButtonTextColor: primaryButtonTextColor,
      secondaryButtonTextColor: secondaryButtonTextColor,
      primaryButtonBorder: primaryButtonBorder,
      secondaryButtonBorder: secondaryButtonBorder,
      themeId: themeId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThemeColourStruct? updateThemeColourStruct(
  ThemeColourStruct? themeColour, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    themeColour
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThemeColourStructData(
  Map<String, dynamic> firestoreData,
  ThemeColourStruct? themeColour,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (themeColour == null) {
    return;
  }
  if (themeColour.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && themeColour.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final themeColourData =
      getThemeColourFirestoreData(themeColour, forFieldValue);
  final nestedData =
      themeColourData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = themeColour.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThemeColourFirestoreData(
  ThemeColourStruct? themeColour, [
  bool forFieldValue = false,
]) {
  if (themeColour == null) {
    return {};
  }
  final firestoreData = mapToFirestore(themeColour.toMap());

  // Add any Firestore field values
  mapToFirestore(themeColour.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThemeColourListFirestoreData(
  List<ThemeColourStruct>? themeColours,
) =>
    themeColours?.map((e) => getThemeColourFirestoreData(e, true)).toList() ??
    [];
