// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SessionSlotStruct extends FFFirebaseStruct {
  SessionSlotStruct({
    String? slotStatus,
    int? slotOrder,
    DateTime? slotFromTime,
    DateTime? slotToTime,
    int? slotPerPersonLimit,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _slotStatus = slotStatus,
        _slotOrder = slotOrder,
        _slotFromTime = slotFromTime,
        _slotToTime = slotToTime,
        _slotPerPersonLimit = slotPerPersonLimit,
        super(firestoreUtilData);

  // "slot_status" field.
  String? _slotStatus;
  String get slotStatus => _slotStatus ?? '';
  set slotStatus(String? val) => _slotStatus = val;

  bool hasSlotStatus() => _slotStatus != null;

  // "slot_order" field.
  int? _slotOrder;
  int get slotOrder => _slotOrder ?? 0;
  set slotOrder(int? val) => _slotOrder = val;

  void incrementSlotOrder(int amount) => slotOrder = slotOrder + amount;

  bool hasSlotOrder() => _slotOrder != null;

  // "slot_from_time" field.
  DateTime? _slotFromTime;
  DateTime? get slotFromTime => _slotFromTime;
  set slotFromTime(DateTime? val) => _slotFromTime = val;

  bool hasSlotFromTime() => _slotFromTime != null;

  // "slot_to_time" field.
  DateTime? _slotToTime;
  DateTime? get slotToTime => _slotToTime;
  set slotToTime(DateTime? val) => _slotToTime = val;

  bool hasSlotToTime() => _slotToTime != null;

  // "slot_per_person_limit" field.
  int? _slotPerPersonLimit;
  int get slotPerPersonLimit => _slotPerPersonLimit ?? 0;
  set slotPerPersonLimit(int? val) => _slotPerPersonLimit = val;

  void incrementSlotPerPersonLimit(int amount) =>
      slotPerPersonLimit = slotPerPersonLimit + amount;

  bool hasSlotPerPersonLimit() => _slotPerPersonLimit != null;

  static SessionSlotStruct fromMap(Map<String, dynamic> data) =>
      SessionSlotStruct(
        slotStatus: data['slot_status'] as String?,
        slotOrder: castToType<int>(data['slot_order']),
        slotFromTime: data['slot_from_time'] as DateTime?,
        slotToTime: data['slot_to_time'] as DateTime?,
        slotPerPersonLimit: castToType<int>(data['slot_per_person_limit']),
      );

  static SessionSlotStruct? maybeFromMap(dynamic data) => data is Map
      ? SessionSlotStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'slot_status': _slotStatus,
        'slot_order': _slotOrder,
        'slot_from_time': _slotFromTime,
        'slot_to_time': _slotToTime,
        'slot_per_person_limit': _slotPerPersonLimit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'slot_status': serializeParam(
          _slotStatus,
          ParamType.String,
        ),
        'slot_order': serializeParam(
          _slotOrder,
          ParamType.int,
        ),
        'slot_from_time': serializeParam(
          _slotFromTime,
          ParamType.DateTime,
        ),
        'slot_to_time': serializeParam(
          _slotToTime,
          ParamType.DateTime,
        ),
        'slot_per_person_limit': serializeParam(
          _slotPerPersonLimit,
          ParamType.int,
        ),
      }.withoutNulls;

  static SessionSlotStruct fromSerializableMap(Map<String, dynamic> data) =>
      SessionSlotStruct(
        slotStatus: deserializeParam(
          data['slot_status'],
          ParamType.String,
          false,
        ),
        slotOrder: deserializeParam(
          data['slot_order'],
          ParamType.int,
          false,
        ),
        slotFromTime: deserializeParam(
          data['slot_from_time'],
          ParamType.DateTime,
          false,
        ),
        slotToTime: deserializeParam(
          data['slot_to_time'],
          ParamType.DateTime,
          false,
        ),
        slotPerPersonLimit: deserializeParam(
          data['slot_per_person_limit'],
          ParamType.int,
          false,
        ),
      );

  static SessionSlotStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SessionSlotStruct(
        slotStatus: convertAlgoliaParam(
          data['slot_status'],
          ParamType.String,
          false,
        ),
        slotOrder: convertAlgoliaParam(
          data['slot_order'],
          ParamType.int,
          false,
        ),
        slotFromTime: convertAlgoliaParam(
          data['slot_from_time'],
          ParamType.DateTime,
          false,
        ),
        slotToTime: convertAlgoliaParam(
          data['slot_to_time'],
          ParamType.DateTime,
          false,
        ),
        slotPerPersonLimit: convertAlgoliaParam(
          data['slot_per_person_limit'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SessionSlotStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SessionSlotStruct &&
        slotStatus == other.slotStatus &&
        slotOrder == other.slotOrder &&
        slotFromTime == other.slotFromTime &&
        slotToTime == other.slotToTime &&
        slotPerPersonLimit == other.slotPerPersonLimit;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [slotStatus, slotOrder, slotFromTime, slotToTime, slotPerPersonLimit]);
}

SessionSlotStruct createSessionSlotStruct({
  String? slotStatus,
  int? slotOrder,
  DateTime? slotFromTime,
  DateTime? slotToTime,
  int? slotPerPersonLimit,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SessionSlotStruct(
      slotStatus: slotStatus,
      slotOrder: slotOrder,
      slotFromTime: slotFromTime,
      slotToTime: slotToTime,
      slotPerPersonLimit: slotPerPersonLimit,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SessionSlotStruct? updateSessionSlotStruct(
  SessionSlotStruct? sessionSlot, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sessionSlot
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSessionSlotStructData(
  Map<String, dynamic> firestoreData,
  SessionSlotStruct? sessionSlot,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sessionSlot == null) {
    return;
  }
  if (sessionSlot.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sessionSlot.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sessionSlotData =
      getSessionSlotFirestoreData(sessionSlot, forFieldValue);
  final nestedData =
      sessionSlotData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sessionSlot.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSessionSlotFirestoreData(
  SessionSlotStruct? sessionSlot, [
  bool forFieldValue = false,
]) {
  if (sessionSlot == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sessionSlot.toMap());

  // Add any Firestore field values
  mapToFirestore(sessionSlot.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSessionSlotListFirestoreData(
  List<SessionSlotStruct>? sessionSlots,
) =>
    sessionSlots?.map((e) => getSessionSlotFirestoreData(e, true)).toList() ??
    [];
