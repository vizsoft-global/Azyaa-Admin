// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserBodyInfoStruct extends FFFirebaseStruct {
  UserBodyInfoStruct({
    int? measurementId,
    double? height,
    String? heightUnit,
    double? weight,
    String? weightUnit,
    double? chest,
    String? chestUnit,
    double? waist,
    String? waistUnit,
    double? hips,
    String? hipsUnit,
    double? inseam,
    String? inseamUnit,
    double? shoulderWidth,
    String? shoulderWidthUnit,
    double? armLength,
    String? armLengthUnit,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _measurementId = measurementId,
        _height = height,
        _heightUnit = heightUnit,
        _weight = weight,
        _weightUnit = weightUnit,
        _chest = chest,
        _chestUnit = chestUnit,
        _waist = waist,
        _waistUnit = waistUnit,
        _hips = hips,
        _hipsUnit = hipsUnit,
        _inseam = inseam,
        _inseamUnit = inseamUnit,
        _shoulderWidth = shoulderWidth,
        _shoulderWidthUnit = shoulderWidthUnit,
        _armLength = armLength,
        _armLengthUnit = armLengthUnit,
        super(firestoreUtilData);

  // "measurement_id" field.
  int? _measurementId;
  int get measurementId => _measurementId ?? 0;
  set measurementId(int? val) => _measurementId = val;

  void incrementMeasurementId(int amount) =>
      measurementId = measurementId + amount;

  bool hasMeasurementId() => _measurementId != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  set height(double? val) => _height = val;

  void incrementHeight(double amount) => height = height + amount;

  bool hasHeight() => _height != null;

  // "height_unit" field.
  String? _heightUnit;
  String get heightUnit => _heightUnit ?? '';
  set heightUnit(String? val) => _heightUnit = val;

  bool hasHeightUnit() => _heightUnit != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;

  void incrementWeight(double amount) => weight = weight + amount;

  bool hasWeight() => _weight != null;

  // "weight_unit" field.
  String? _weightUnit;
  String get weightUnit => _weightUnit ?? '';
  set weightUnit(String? val) => _weightUnit = val;

  bool hasWeightUnit() => _weightUnit != null;

  // "chest" field.
  double? _chest;
  double get chest => _chest ?? 0.0;
  set chest(double? val) => _chest = val;

  void incrementChest(double amount) => chest = chest + amount;

  bool hasChest() => _chest != null;

  // "chest_unit" field.
  String? _chestUnit;
  String get chestUnit => _chestUnit ?? '';
  set chestUnit(String? val) => _chestUnit = val;

  bool hasChestUnit() => _chestUnit != null;

  // "waist" field.
  double? _waist;
  double get waist => _waist ?? 0.0;
  set waist(double? val) => _waist = val;

  void incrementWaist(double amount) => waist = waist + amount;

  bool hasWaist() => _waist != null;

  // "waist_unit" field.
  String? _waistUnit;
  String get waistUnit => _waistUnit ?? '';
  set waistUnit(String? val) => _waistUnit = val;

  bool hasWaistUnit() => _waistUnit != null;

  // "hips" field.
  double? _hips;
  double get hips => _hips ?? 0.0;
  set hips(double? val) => _hips = val;

  void incrementHips(double amount) => hips = hips + amount;

  bool hasHips() => _hips != null;

  // "hips_unit" field.
  String? _hipsUnit;
  String get hipsUnit => _hipsUnit ?? '';
  set hipsUnit(String? val) => _hipsUnit = val;

  bool hasHipsUnit() => _hipsUnit != null;

  // "inseam" field.
  double? _inseam;
  double get inseam => _inseam ?? 0.0;
  set inseam(double? val) => _inseam = val;

  void incrementInseam(double amount) => inseam = inseam + amount;

  bool hasInseam() => _inseam != null;

  // "inseam_unit" field.
  String? _inseamUnit;
  String get inseamUnit => _inseamUnit ?? '';
  set inseamUnit(String? val) => _inseamUnit = val;

  bool hasInseamUnit() => _inseamUnit != null;

  // "shoulder_width" field.
  double? _shoulderWidth;
  double get shoulderWidth => _shoulderWidth ?? 0.0;
  set shoulderWidth(double? val) => _shoulderWidth = val;

  void incrementShoulderWidth(double amount) =>
      shoulderWidth = shoulderWidth + amount;

  bool hasShoulderWidth() => _shoulderWidth != null;

  // "shoulder_width_unit" field.
  String? _shoulderWidthUnit;
  String get shoulderWidthUnit => _shoulderWidthUnit ?? '';
  set shoulderWidthUnit(String? val) => _shoulderWidthUnit = val;

  bool hasShoulderWidthUnit() => _shoulderWidthUnit != null;

  // "arm_length" field.
  double? _armLength;
  double get armLength => _armLength ?? 0.0;
  set armLength(double? val) => _armLength = val;

  void incrementArmLength(double amount) => armLength = armLength + amount;

  bool hasArmLength() => _armLength != null;

  // "arm_length_unit" field.
  String? _armLengthUnit;
  String get armLengthUnit => _armLengthUnit ?? '';
  set armLengthUnit(String? val) => _armLengthUnit = val;

  bool hasArmLengthUnit() => _armLengthUnit != null;

  static UserBodyInfoStruct fromMap(Map<String, dynamic> data) =>
      UserBodyInfoStruct(
        measurementId: castToType<int>(data['measurement_id']),
        height: castToType<double>(data['height']),
        heightUnit: data['height_unit'] as String?,
        weight: castToType<double>(data['weight']),
        weightUnit: data['weight_unit'] as String?,
        chest: castToType<double>(data['chest']),
        chestUnit: data['chest_unit'] as String?,
        waist: castToType<double>(data['waist']),
        waistUnit: data['waist_unit'] as String?,
        hips: castToType<double>(data['hips']),
        hipsUnit: data['hips_unit'] as String?,
        inseam: castToType<double>(data['inseam']),
        inseamUnit: data['inseam_unit'] as String?,
        shoulderWidth: castToType<double>(data['shoulder_width']),
        shoulderWidthUnit: data['shoulder_width_unit'] as String?,
        armLength: castToType<double>(data['arm_length']),
        armLengthUnit: data['arm_length_unit'] as String?,
      );

  static UserBodyInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? UserBodyInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'measurement_id': _measurementId,
        'height': _height,
        'height_unit': _heightUnit,
        'weight': _weight,
        'weight_unit': _weightUnit,
        'chest': _chest,
        'chest_unit': _chestUnit,
        'waist': _waist,
        'waist_unit': _waistUnit,
        'hips': _hips,
        'hips_unit': _hipsUnit,
        'inseam': _inseam,
        'inseam_unit': _inseamUnit,
        'shoulder_width': _shoulderWidth,
        'shoulder_width_unit': _shoulderWidthUnit,
        'arm_length': _armLength,
        'arm_length_unit': _armLengthUnit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'measurement_id': serializeParam(
          _measurementId,
          ParamType.int,
        ),
        'height': serializeParam(
          _height,
          ParamType.double,
        ),
        'height_unit': serializeParam(
          _heightUnit,
          ParamType.String,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'weight_unit': serializeParam(
          _weightUnit,
          ParamType.String,
        ),
        'chest': serializeParam(
          _chest,
          ParamType.double,
        ),
        'chest_unit': serializeParam(
          _chestUnit,
          ParamType.String,
        ),
        'waist': serializeParam(
          _waist,
          ParamType.double,
        ),
        'waist_unit': serializeParam(
          _waistUnit,
          ParamType.String,
        ),
        'hips': serializeParam(
          _hips,
          ParamType.double,
        ),
        'hips_unit': serializeParam(
          _hipsUnit,
          ParamType.String,
        ),
        'inseam': serializeParam(
          _inseam,
          ParamType.double,
        ),
        'inseam_unit': serializeParam(
          _inseamUnit,
          ParamType.String,
        ),
        'shoulder_width': serializeParam(
          _shoulderWidth,
          ParamType.double,
        ),
        'shoulder_width_unit': serializeParam(
          _shoulderWidthUnit,
          ParamType.String,
        ),
        'arm_length': serializeParam(
          _armLength,
          ParamType.double,
        ),
        'arm_length_unit': serializeParam(
          _armLengthUnit,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserBodyInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserBodyInfoStruct(
        measurementId: deserializeParam(
          data['measurement_id'],
          ParamType.int,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.double,
          false,
        ),
        heightUnit: deserializeParam(
          data['height_unit'],
          ParamType.String,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        weightUnit: deserializeParam(
          data['weight_unit'],
          ParamType.String,
          false,
        ),
        chest: deserializeParam(
          data['chest'],
          ParamType.double,
          false,
        ),
        chestUnit: deserializeParam(
          data['chest_unit'],
          ParamType.String,
          false,
        ),
        waist: deserializeParam(
          data['waist'],
          ParamType.double,
          false,
        ),
        waistUnit: deserializeParam(
          data['waist_unit'],
          ParamType.String,
          false,
        ),
        hips: deserializeParam(
          data['hips'],
          ParamType.double,
          false,
        ),
        hipsUnit: deserializeParam(
          data['hips_unit'],
          ParamType.String,
          false,
        ),
        inseam: deserializeParam(
          data['inseam'],
          ParamType.double,
          false,
        ),
        inseamUnit: deserializeParam(
          data['inseam_unit'],
          ParamType.String,
          false,
        ),
        shoulderWidth: deserializeParam(
          data['shoulder_width'],
          ParamType.double,
          false,
        ),
        shoulderWidthUnit: deserializeParam(
          data['shoulder_width_unit'],
          ParamType.String,
          false,
        ),
        armLength: deserializeParam(
          data['arm_length'],
          ParamType.double,
          false,
        ),
        armLengthUnit: deserializeParam(
          data['arm_length_unit'],
          ParamType.String,
          false,
        ),
      );

  static UserBodyInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserBodyInfoStruct(
        measurementId: convertAlgoliaParam(
          data['measurement_id'],
          ParamType.int,
          false,
        ),
        height: convertAlgoliaParam(
          data['height'],
          ParamType.double,
          false,
        ),
        heightUnit: convertAlgoliaParam(
          data['height_unit'],
          ParamType.String,
          false,
        ),
        weight: convertAlgoliaParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        weightUnit: convertAlgoliaParam(
          data['weight_unit'],
          ParamType.String,
          false,
        ),
        chest: convertAlgoliaParam(
          data['chest'],
          ParamType.double,
          false,
        ),
        chestUnit: convertAlgoliaParam(
          data['chest_unit'],
          ParamType.String,
          false,
        ),
        waist: convertAlgoliaParam(
          data['waist'],
          ParamType.double,
          false,
        ),
        waistUnit: convertAlgoliaParam(
          data['waist_unit'],
          ParamType.String,
          false,
        ),
        hips: convertAlgoliaParam(
          data['hips'],
          ParamType.double,
          false,
        ),
        hipsUnit: convertAlgoliaParam(
          data['hips_unit'],
          ParamType.String,
          false,
        ),
        inseam: convertAlgoliaParam(
          data['inseam'],
          ParamType.double,
          false,
        ),
        inseamUnit: convertAlgoliaParam(
          data['inseam_unit'],
          ParamType.String,
          false,
        ),
        shoulderWidth: convertAlgoliaParam(
          data['shoulder_width'],
          ParamType.double,
          false,
        ),
        shoulderWidthUnit: convertAlgoliaParam(
          data['shoulder_width_unit'],
          ParamType.String,
          false,
        ),
        armLength: convertAlgoliaParam(
          data['arm_length'],
          ParamType.double,
          false,
        ),
        armLengthUnit: convertAlgoliaParam(
          data['arm_length_unit'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserBodyInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserBodyInfoStruct &&
        measurementId == other.measurementId &&
        height == other.height &&
        heightUnit == other.heightUnit &&
        weight == other.weight &&
        weightUnit == other.weightUnit &&
        chest == other.chest &&
        chestUnit == other.chestUnit &&
        waist == other.waist &&
        waistUnit == other.waistUnit &&
        hips == other.hips &&
        hipsUnit == other.hipsUnit &&
        inseam == other.inseam &&
        inseamUnit == other.inseamUnit &&
        shoulderWidth == other.shoulderWidth &&
        shoulderWidthUnit == other.shoulderWidthUnit &&
        armLength == other.armLength &&
        armLengthUnit == other.armLengthUnit;
  }

  @override
  int get hashCode => const ListEquality().hash([
        measurementId,
        height,
        heightUnit,
        weight,
        weightUnit,
        chest,
        chestUnit,
        waist,
        waistUnit,
        hips,
        hipsUnit,
        inseam,
        inseamUnit,
        shoulderWidth,
        shoulderWidthUnit,
        armLength,
        armLengthUnit
      ]);
}

UserBodyInfoStruct createUserBodyInfoStruct({
  int? measurementId,
  double? height,
  String? heightUnit,
  double? weight,
  String? weightUnit,
  double? chest,
  String? chestUnit,
  double? waist,
  String? waistUnit,
  double? hips,
  String? hipsUnit,
  double? inseam,
  String? inseamUnit,
  double? shoulderWidth,
  String? shoulderWidthUnit,
  double? armLength,
  String? armLengthUnit,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserBodyInfoStruct(
      measurementId: measurementId,
      height: height,
      heightUnit: heightUnit,
      weight: weight,
      weightUnit: weightUnit,
      chest: chest,
      chestUnit: chestUnit,
      waist: waist,
      waistUnit: waistUnit,
      hips: hips,
      hipsUnit: hipsUnit,
      inseam: inseam,
      inseamUnit: inseamUnit,
      shoulderWidth: shoulderWidth,
      shoulderWidthUnit: shoulderWidthUnit,
      armLength: armLength,
      armLengthUnit: armLengthUnit,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserBodyInfoStruct? updateUserBodyInfoStruct(
  UserBodyInfoStruct? userBodyInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userBodyInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserBodyInfoStructData(
  Map<String, dynamic> firestoreData,
  UserBodyInfoStruct? userBodyInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userBodyInfo == null) {
    return;
  }
  if (userBodyInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userBodyInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userBodyInfoData =
      getUserBodyInfoFirestoreData(userBodyInfo, forFieldValue);
  final nestedData =
      userBodyInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userBodyInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserBodyInfoFirestoreData(
  UserBodyInfoStruct? userBodyInfo, [
  bool forFieldValue = false,
]) {
  if (userBodyInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userBodyInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(userBodyInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserBodyInfoListFirestoreData(
  List<UserBodyInfoStruct>? userBodyInfos,
) =>
    userBodyInfos?.map((e) => getUserBodyInfoFirestoreData(e, true)).toList() ??
    [];
