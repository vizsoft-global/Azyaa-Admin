// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SettingsWorkingHoursStruct extends FFFirebaseStruct {
  SettingsWorkingHoursStruct({
    bool? isActiveStatus,
    String? dayName,
    DateTime? startTime,
    DateTime? endTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isActiveStatus = isActiveStatus,
        _dayName = dayName,
        _startTime = startTime,
        _endTime = endTime,
        super(firestoreUtilData);

  // "is_active_status" field.
  bool? _isActiveStatus;
  bool get isActiveStatus => _isActiveStatus ?? false;
  set isActiveStatus(bool? val) => _isActiveStatus = val;

  bool hasIsActiveStatus() => _isActiveStatus != null;

  // "day_name" field.
  String? _dayName;
  String get dayName => _dayName ?? '';
  set dayName(String? val) => _dayName = val;

  bool hasDayName() => _dayName != null;

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  static SettingsWorkingHoursStruct fromMap(Map<String, dynamic> data) =>
      SettingsWorkingHoursStruct(
        isActiveStatus: data['is_active_status'] as bool?,
        dayName: data['day_name'] as String?,
        startTime: data['start_time'] as DateTime?,
        endTime: data['end_time'] as DateTime?,
      );

  static SettingsWorkingHoursStruct? maybeFromMap(dynamic data) => data is Map
      ? SettingsWorkingHoursStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'is_active_status': _isActiveStatus,
        'day_name': _dayName,
        'start_time': _startTime,
        'end_time': _endTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'is_active_status': serializeParam(
          _isActiveStatus,
          ParamType.bool,
        ),
        'day_name': serializeParam(
          _dayName,
          ParamType.String,
        ),
        'start_time': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
        'end_time': serializeParam(
          _endTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static SettingsWorkingHoursStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SettingsWorkingHoursStruct(
        isActiveStatus: deserializeParam(
          data['is_active_status'],
          ParamType.bool,
          false,
        ),
        dayName: deserializeParam(
          data['day_name'],
          ParamType.String,
          false,
        ),
        startTime: deserializeParam(
          data['start_time'],
          ParamType.DateTime,
          false,
        ),
        endTime: deserializeParam(
          data['end_time'],
          ParamType.DateTime,
          false,
        ),
      );

  static SettingsWorkingHoursStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      SettingsWorkingHoursStruct(
        isActiveStatus: convertAlgoliaParam(
          data['is_active_status'],
          ParamType.bool,
          false,
        ),
        dayName: convertAlgoliaParam(
          data['day_name'],
          ParamType.String,
          false,
        ),
        startTime: convertAlgoliaParam(
          data['start_time'],
          ParamType.DateTime,
          false,
        ),
        endTime: convertAlgoliaParam(
          data['end_time'],
          ParamType.DateTime,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SettingsWorkingHoursStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingsWorkingHoursStruct &&
        isActiveStatus == other.isActiveStatus &&
        dayName == other.dayName &&
        startTime == other.startTime &&
        endTime == other.endTime;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([isActiveStatus, dayName, startTime, endTime]);
}

SettingsWorkingHoursStruct createSettingsWorkingHoursStruct({
  bool? isActiveStatus,
  String? dayName,
  DateTime? startTime,
  DateTime? endTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsWorkingHoursStruct(
      isActiveStatus: isActiveStatus,
      dayName: dayName,
      startTime: startTime,
      endTime: endTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsWorkingHoursStruct? updateSettingsWorkingHoursStruct(
  SettingsWorkingHoursStruct? settingsWorkingHours, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settingsWorkingHours
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingsWorkingHoursStructData(
  Map<String, dynamic> firestoreData,
  SettingsWorkingHoursStruct? settingsWorkingHours,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settingsWorkingHours == null) {
    return;
  }
  if (settingsWorkingHours.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && settingsWorkingHours.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsWorkingHoursData =
      getSettingsWorkingHoursFirestoreData(settingsWorkingHours, forFieldValue);
  final nestedData =
      settingsWorkingHoursData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      settingsWorkingHours.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsWorkingHoursFirestoreData(
  SettingsWorkingHoursStruct? settingsWorkingHours, [
  bool forFieldValue = false,
]) {
  if (settingsWorkingHours == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settingsWorkingHours.toMap());

  // Add any Firestore field values
  mapToFirestore(settingsWorkingHours.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsWorkingHoursListFirestoreData(
  List<SettingsWorkingHoursStruct>? settingsWorkingHourss,
) =>
    settingsWorkingHourss
        ?.map((e) => getSettingsWorkingHoursFirestoreData(e, true))
        .toList() ??
    [];
