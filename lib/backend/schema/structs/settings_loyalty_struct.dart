// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SettingsLoyaltyStruct extends FFFirebaseStruct {
  SettingsLoyaltyStruct({
    DateTime? settingsLoyaltyUpdatedAt,
    bool? settingsIsLoyaltyStatus,
    double? settingsLoyaltyRupee,
    int? settingsLoyaltyPoint,
    int? settingsLoyaltyPointMember,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _settingsLoyaltyUpdatedAt = settingsLoyaltyUpdatedAt,
        _settingsIsLoyaltyStatus = settingsIsLoyaltyStatus,
        _settingsLoyaltyRupee = settingsLoyaltyRupee,
        _settingsLoyaltyPoint = settingsLoyaltyPoint,
        _settingsLoyaltyPointMember = settingsLoyaltyPointMember,
        super(firestoreUtilData);

  // "settings_loyalty_updated_at" field.
  DateTime? _settingsLoyaltyUpdatedAt;
  DateTime? get settingsLoyaltyUpdatedAt => _settingsLoyaltyUpdatedAt;
  set settingsLoyaltyUpdatedAt(DateTime? val) =>
      _settingsLoyaltyUpdatedAt = val;

  bool hasSettingsLoyaltyUpdatedAt() => _settingsLoyaltyUpdatedAt != null;

  // "settings_is_loyalty_status" field.
  bool? _settingsIsLoyaltyStatus;
  bool get settingsIsLoyaltyStatus => _settingsIsLoyaltyStatus ?? false;
  set settingsIsLoyaltyStatus(bool? val) => _settingsIsLoyaltyStatus = val;

  bool hasSettingsIsLoyaltyStatus() => _settingsIsLoyaltyStatus != null;

  // "settings_loyalty_rupee" field.
  double? _settingsLoyaltyRupee;
  double get settingsLoyaltyRupee => _settingsLoyaltyRupee ?? 0.0;
  set settingsLoyaltyRupee(double? val) => _settingsLoyaltyRupee = val;

  void incrementSettingsLoyaltyRupee(double amount) =>
      settingsLoyaltyRupee = settingsLoyaltyRupee + amount;

  bool hasSettingsLoyaltyRupee() => _settingsLoyaltyRupee != null;

  // "settings_loyalty_point" field.
  int? _settingsLoyaltyPoint;
  int get settingsLoyaltyPoint => _settingsLoyaltyPoint ?? 0;
  set settingsLoyaltyPoint(int? val) => _settingsLoyaltyPoint = val;

  void incrementSettingsLoyaltyPoint(int amount) =>
      settingsLoyaltyPoint = settingsLoyaltyPoint + amount;

  bool hasSettingsLoyaltyPoint() => _settingsLoyaltyPoint != null;

  // "settings_loyalty_point_member" field.
  int? _settingsLoyaltyPointMember;
  int get settingsLoyaltyPointMember => _settingsLoyaltyPointMember ?? 0;
  set settingsLoyaltyPointMember(int? val) => _settingsLoyaltyPointMember = val;

  void incrementSettingsLoyaltyPointMember(int amount) =>
      settingsLoyaltyPointMember = settingsLoyaltyPointMember + amount;

  bool hasSettingsLoyaltyPointMember() => _settingsLoyaltyPointMember != null;

  static SettingsLoyaltyStruct fromMap(Map<String, dynamic> data) =>
      SettingsLoyaltyStruct(
        settingsLoyaltyUpdatedAt:
            data['settings_loyalty_updated_at'] as DateTime?,
        settingsIsLoyaltyStatus: data['settings_is_loyalty_status'] as bool?,
        settingsLoyaltyRupee:
            castToType<double>(data['settings_loyalty_rupee']),
        settingsLoyaltyPoint: castToType<int>(data['settings_loyalty_point']),
        settingsLoyaltyPointMember:
            castToType<int>(data['settings_loyalty_point_member']),
      );

  static SettingsLoyaltyStruct? maybeFromMap(dynamic data) => data is Map
      ? SettingsLoyaltyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'settings_loyalty_updated_at': _settingsLoyaltyUpdatedAt,
        'settings_is_loyalty_status': _settingsIsLoyaltyStatus,
        'settings_loyalty_rupee': _settingsLoyaltyRupee,
        'settings_loyalty_point': _settingsLoyaltyPoint,
        'settings_loyalty_point_member': _settingsLoyaltyPointMember,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'settings_loyalty_updated_at': serializeParam(
          _settingsLoyaltyUpdatedAt,
          ParamType.DateTime,
        ),
        'settings_is_loyalty_status': serializeParam(
          _settingsIsLoyaltyStatus,
          ParamType.bool,
        ),
        'settings_loyalty_rupee': serializeParam(
          _settingsLoyaltyRupee,
          ParamType.double,
        ),
        'settings_loyalty_point': serializeParam(
          _settingsLoyaltyPoint,
          ParamType.int,
        ),
        'settings_loyalty_point_member': serializeParam(
          _settingsLoyaltyPointMember,
          ParamType.int,
        ),
      }.withoutNulls;

  static SettingsLoyaltyStruct fromSerializableMap(Map<String, dynamic> data) =>
      SettingsLoyaltyStruct(
        settingsLoyaltyUpdatedAt: deserializeParam(
          data['settings_loyalty_updated_at'],
          ParamType.DateTime,
          false,
        ),
        settingsIsLoyaltyStatus: deserializeParam(
          data['settings_is_loyalty_status'],
          ParamType.bool,
          false,
        ),
        settingsLoyaltyRupee: deserializeParam(
          data['settings_loyalty_rupee'],
          ParamType.double,
          false,
        ),
        settingsLoyaltyPoint: deserializeParam(
          data['settings_loyalty_point'],
          ParamType.int,
          false,
        ),
        settingsLoyaltyPointMember: deserializeParam(
          data['settings_loyalty_point_member'],
          ParamType.int,
          false,
        ),
      );

  static SettingsLoyaltyStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SettingsLoyaltyStruct(
        settingsLoyaltyUpdatedAt: convertAlgoliaParam(
          data['settings_loyalty_updated_at'],
          ParamType.DateTime,
          false,
        ),
        settingsIsLoyaltyStatus: convertAlgoliaParam(
          data['settings_is_loyalty_status'],
          ParamType.bool,
          false,
        ),
        settingsLoyaltyRupee: convertAlgoliaParam(
          data['settings_loyalty_rupee'],
          ParamType.double,
          false,
        ),
        settingsLoyaltyPoint: convertAlgoliaParam(
          data['settings_loyalty_point'],
          ParamType.int,
          false,
        ),
        settingsLoyaltyPointMember: convertAlgoliaParam(
          data['settings_loyalty_point_member'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SettingsLoyaltyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingsLoyaltyStruct &&
        settingsLoyaltyUpdatedAt == other.settingsLoyaltyUpdatedAt &&
        settingsIsLoyaltyStatus == other.settingsIsLoyaltyStatus &&
        settingsLoyaltyRupee == other.settingsLoyaltyRupee &&
        settingsLoyaltyPoint == other.settingsLoyaltyPoint &&
        settingsLoyaltyPointMember == other.settingsLoyaltyPointMember;
  }

  @override
  int get hashCode => const ListEquality().hash([
        settingsLoyaltyUpdatedAt,
        settingsIsLoyaltyStatus,
        settingsLoyaltyRupee,
        settingsLoyaltyPoint,
        settingsLoyaltyPointMember
      ]);
}

SettingsLoyaltyStruct createSettingsLoyaltyStruct({
  DateTime? settingsLoyaltyUpdatedAt,
  bool? settingsIsLoyaltyStatus,
  double? settingsLoyaltyRupee,
  int? settingsLoyaltyPoint,
  int? settingsLoyaltyPointMember,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsLoyaltyStruct(
      settingsLoyaltyUpdatedAt: settingsLoyaltyUpdatedAt,
      settingsIsLoyaltyStatus: settingsIsLoyaltyStatus,
      settingsLoyaltyRupee: settingsLoyaltyRupee,
      settingsLoyaltyPoint: settingsLoyaltyPoint,
      settingsLoyaltyPointMember: settingsLoyaltyPointMember,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsLoyaltyStruct? updateSettingsLoyaltyStruct(
  SettingsLoyaltyStruct? settingsLoyalty, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settingsLoyalty
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingsLoyaltyStructData(
  Map<String, dynamic> firestoreData,
  SettingsLoyaltyStruct? settingsLoyalty,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settingsLoyalty == null) {
    return;
  }
  if (settingsLoyalty.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && settingsLoyalty.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsLoyaltyData =
      getSettingsLoyaltyFirestoreData(settingsLoyalty, forFieldValue);
  final nestedData =
      settingsLoyaltyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = settingsLoyalty.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsLoyaltyFirestoreData(
  SettingsLoyaltyStruct? settingsLoyalty, [
  bool forFieldValue = false,
]) {
  if (settingsLoyalty == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settingsLoyalty.toMap());

  // Add any Firestore field values
  mapToFirestore(settingsLoyalty.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsLoyaltyListFirestoreData(
  List<SettingsLoyaltyStruct>? settingsLoyaltys,
) =>
    settingsLoyaltys
        ?.map((e) => getSettingsLoyaltyFirestoreData(e, true))
        .toList() ??
    [];
