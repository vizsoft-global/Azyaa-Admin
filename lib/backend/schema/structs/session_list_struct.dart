// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SessionListStruct extends FFFirebaseStruct {
  SessionListStruct({
    String? sessionId,
    String? sessionStatus,
    String? sessionOrder,
    String? sessionName,
    DateTime? sessionCreatedAt,
    List<String>? sessionDayList,
    DateTime? sessionFromTime,
    DateTime? sessionToTime,
    int? sessionDuration,
    int? sessionIntervalTime,
    int? sessionPerOrderMemberLimit,
    bool? sessionCustomEditStatus,
    List<SessionSlotStruct>? sessionSlotList,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _sessionId = sessionId,
        _sessionStatus = sessionStatus,
        _sessionOrder = sessionOrder,
        _sessionName = sessionName,
        _sessionCreatedAt = sessionCreatedAt,
        _sessionDayList = sessionDayList,
        _sessionFromTime = sessionFromTime,
        _sessionToTime = sessionToTime,
        _sessionDuration = sessionDuration,
        _sessionIntervalTime = sessionIntervalTime,
        _sessionPerOrderMemberLimit = sessionPerOrderMemberLimit,
        _sessionCustomEditStatus = sessionCustomEditStatus,
        _sessionSlotList = sessionSlotList,
        super(firestoreUtilData);

  // "session_id" field.
  String? _sessionId;
  String get sessionId => _sessionId ?? '';
  set sessionId(String? val) => _sessionId = val;

  bool hasSessionId() => _sessionId != null;

  // "session_status" field.
  String? _sessionStatus;
  String get sessionStatus => _sessionStatus ?? '';
  set sessionStatus(String? val) => _sessionStatus = val;

  bool hasSessionStatus() => _sessionStatus != null;

  // "session_order" field.
  String? _sessionOrder;
  String get sessionOrder => _sessionOrder ?? '';
  set sessionOrder(String? val) => _sessionOrder = val;

  bool hasSessionOrder() => _sessionOrder != null;

  // "session_name" field.
  String? _sessionName;
  String get sessionName => _sessionName ?? '';
  set sessionName(String? val) => _sessionName = val;

  bool hasSessionName() => _sessionName != null;

  // "session_created_at" field.
  DateTime? _sessionCreatedAt;
  DateTime? get sessionCreatedAt => _sessionCreatedAt;
  set sessionCreatedAt(DateTime? val) => _sessionCreatedAt = val;

  bool hasSessionCreatedAt() => _sessionCreatedAt != null;

  // "session_day_list" field.
  List<String>? _sessionDayList;
  List<String> get sessionDayList => _sessionDayList ?? const [];
  set sessionDayList(List<String>? val) => _sessionDayList = val;

  void updateSessionDayList(Function(List<String>) updateFn) {
    updateFn(_sessionDayList ??= []);
  }

  bool hasSessionDayList() => _sessionDayList != null;

  // "session_from_time" field.
  DateTime? _sessionFromTime;
  DateTime? get sessionFromTime => _sessionFromTime;
  set sessionFromTime(DateTime? val) => _sessionFromTime = val;

  bool hasSessionFromTime() => _sessionFromTime != null;

  // "session_to_time" field.
  DateTime? _sessionToTime;
  DateTime? get sessionToTime => _sessionToTime;
  set sessionToTime(DateTime? val) => _sessionToTime = val;

  bool hasSessionToTime() => _sessionToTime != null;

  // "session_duration" field.
  int? _sessionDuration;
  int get sessionDuration => _sessionDuration ?? 0;
  set sessionDuration(int? val) => _sessionDuration = val;

  void incrementSessionDuration(int amount) =>
      sessionDuration = sessionDuration + amount;

  bool hasSessionDuration() => _sessionDuration != null;

  // "session_interval_time" field.
  int? _sessionIntervalTime;
  int get sessionIntervalTime => _sessionIntervalTime ?? 0;
  set sessionIntervalTime(int? val) => _sessionIntervalTime = val;

  void incrementSessionIntervalTime(int amount) =>
      sessionIntervalTime = sessionIntervalTime + amount;

  bool hasSessionIntervalTime() => _sessionIntervalTime != null;

  // "session_per_order_member_limit" field.
  int? _sessionPerOrderMemberLimit;
  int get sessionPerOrderMemberLimit => _sessionPerOrderMemberLimit ?? 0;
  set sessionPerOrderMemberLimit(int? val) => _sessionPerOrderMemberLimit = val;

  void incrementSessionPerOrderMemberLimit(int amount) =>
      sessionPerOrderMemberLimit = sessionPerOrderMemberLimit + amount;

  bool hasSessionPerOrderMemberLimit() => _sessionPerOrderMemberLimit != null;

  // "session_custom_edit_status" field.
  bool? _sessionCustomEditStatus;
  bool get sessionCustomEditStatus => _sessionCustomEditStatus ?? false;
  set sessionCustomEditStatus(bool? val) => _sessionCustomEditStatus = val;

  bool hasSessionCustomEditStatus() => _sessionCustomEditStatus != null;

  // "session_slot_list" field.
  List<SessionSlotStruct>? _sessionSlotList;
  List<SessionSlotStruct> get sessionSlotList => _sessionSlotList ?? const [];
  set sessionSlotList(List<SessionSlotStruct>? val) => _sessionSlotList = val;

  void updateSessionSlotList(Function(List<SessionSlotStruct>) updateFn) {
    updateFn(_sessionSlotList ??= []);
  }

  bool hasSessionSlotList() => _sessionSlotList != null;

  static SessionListStruct fromMap(Map<String, dynamic> data) =>
      SessionListStruct(
        sessionId: data['session_id'] as String?,
        sessionStatus: data['session_status'] as String?,
        sessionOrder: data['session_order'] as String?,
        sessionName: data['session_name'] as String?,
        sessionCreatedAt: data['session_created_at'] as DateTime?,
        sessionDayList: getDataList(data['session_day_list']),
        sessionFromTime: data['session_from_time'] as DateTime?,
        sessionToTime: data['session_to_time'] as DateTime?,
        sessionDuration: castToType<int>(data['session_duration']),
        sessionIntervalTime: castToType<int>(data['session_interval_time']),
        sessionPerOrderMemberLimit:
            castToType<int>(data['session_per_order_member_limit']),
        sessionCustomEditStatus: data['session_custom_edit_status'] as bool?,
        sessionSlotList: getStructList(
          data['session_slot_list'],
          SessionSlotStruct.fromMap,
        ),
      );

  static SessionListStruct? maybeFromMap(dynamic data) => data is Map
      ? SessionListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'session_id': _sessionId,
        'session_status': _sessionStatus,
        'session_order': _sessionOrder,
        'session_name': _sessionName,
        'session_created_at': _sessionCreatedAt,
        'session_day_list': _sessionDayList,
        'session_from_time': _sessionFromTime,
        'session_to_time': _sessionToTime,
        'session_duration': _sessionDuration,
        'session_interval_time': _sessionIntervalTime,
        'session_per_order_member_limit': _sessionPerOrderMemberLimit,
        'session_custom_edit_status': _sessionCustomEditStatus,
        'session_slot_list': _sessionSlotList?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'session_id': serializeParam(
          _sessionId,
          ParamType.String,
        ),
        'session_status': serializeParam(
          _sessionStatus,
          ParamType.String,
        ),
        'session_order': serializeParam(
          _sessionOrder,
          ParamType.String,
        ),
        'session_name': serializeParam(
          _sessionName,
          ParamType.String,
        ),
        'session_created_at': serializeParam(
          _sessionCreatedAt,
          ParamType.DateTime,
        ),
        'session_day_list': serializeParam(
          _sessionDayList,
          ParamType.String,
          isList: true,
        ),
        'session_from_time': serializeParam(
          _sessionFromTime,
          ParamType.DateTime,
        ),
        'session_to_time': serializeParam(
          _sessionToTime,
          ParamType.DateTime,
        ),
        'session_duration': serializeParam(
          _sessionDuration,
          ParamType.int,
        ),
        'session_interval_time': serializeParam(
          _sessionIntervalTime,
          ParamType.int,
        ),
        'session_per_order_member_limit': serializeParam(
          _sessionPerOrderMemberLimit,
          ParamType.int,
        ),
        'session_custom_edit_status': serializeParam(
          _sessionCustomEditStatus,
          ParamType.bool,
        ),
        'session_slot_list': serializeParam(
          _sessionSlotList,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static SessionListStruct fromSerializableMap(Map<String, dynamic> data) =>
      SessionListStruct(
        sessionId: deserializeParam(
          data['session_id'],
          ParamType.String,
          false,
        ),
        sessionStatus: deserializeParam(
          data['session_status'],
          ParamType.String,
          false,
        ),
        sessionOrder: deserializeParam(
          data['session_order'],
          ParamType.String,
          false,
        ),
        sessionName: deserializeParam(
          data['session_name'],
          ParamType.String,
          false,
        ),
        sessionCreatedAt: deserializeParam(
          data['session_created_at'],
          ParamType.DateTime,
          false,
        ),
        sessionDayList: deserializeParam<String>(
          data['session_day_list'],
          ParamType.String,
          true,
        ),
        sessionFromTime: deserializeParam(
          data['session_from_time'],
          ParamType.DateTime,
          false,
        ),
        sessionToTime: deserializeParam(
          data['session_to_time'],
          ParamType.DateTime,
          false,
        ),
        sessionDuration: deserializeParam(
          data['session_duration'],
          ParamType.int,
          false,
        ),
        sessionIntervalTime: deserializeParam(
          data['session_interval_time'],
          ParamType.int,
          false,
        ),
        sessionPerOrderMemberLimit: deserializeParam(
          data['session_per_order_member_limit'],
          ParamType.int,
          false,
        ),
        sessionCustomEditStatus: deserializeParam(
          data['session_custom_edit_status'],
          ParamType.bool,
          false,
        ),
        sessionSlotList: deserializeStructParam<SessionSlotStruct>(
          data['session_slot_list'],
          ParamType.DataStruct,
          true,
          structBuilder: SessionSlotStruct.fromSerializableMap,
        ),
      );

  static SessionListStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SessionListStruct(
        sessionId: convertAlgoliaParam(
          data['session_id'],
          ParamType.String,
          false,
        ),
        sessionStatus: convertAlgoliaParam(
          data['session_status'],
          ParamType.String,
          false,
        ),
        sessionOrder: convertAlgoliaParam(
          data['session_order'],
          ParamType.String,
          false,
        ),
        sessionName: convertAlgoliaParam(
          data['session_name'],
          ParamType.String,
          false,
        ),
        sessionCreatedAt: convertAlgoliaParam(
          data['session_created_at'],
          ParamType.DateTime,
          false,
        ),
        sessionDayList: convertAlgoliaParam<String>(
          data['session_day_list'],
          ParamType.String,
          true,
        ),
        sessionFromTime: convertAlgoliaParam(
          data['session_from_time'],
          ParamType.DateTime,
          false,
        ),
        sessionToTime: convertAlgoliaParam(
          data['session_to_time'],
          ParamType.DateTime,
          false,
        ),
        sessionDuration: convertAlgoliaParam(
          data['session_duration'],
          ParamType.int,
          false,
        ),
        sessionIntervalTime: convertAlgoliaParam(
          data['session_interval_time'],
          ParamType.int,
          false,
        ),
        sessionPerOrderMemberLimit: convertAlgoliaParam(
          data['session_per_order_member_limit'],
          ParamType.int,
          false,
        ),
        sessionCustomEditStatus: convertAlgoliaParam(
          data['session_custom_edit_status'],
          ParamType.bool,
          false,
        ),
        sessionSlotList: convertAlgoliaParam<SessionSlotStruct>(
          data['session_slot_list'],
          ParamType.DataStruct,
          true,
          structBuilder: SessionSlotStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SessionListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SessionListStruct &&
        sessionId == other.sessionId &&
        sessionStatus == other.sessionStatus &&
        sessionOrder == other.sessionOrder &&
        sessionName == other.sessionName &&
        sessionCreatedAt == other.sessionCreatedAt &&
        listEquality.equals(sessionDayList, other.sessionDayList) &&
        sessionFromTime == other.sessionFromTime &&
        sessionToTime == other.sessionToTime &&
        sessionDuration == other.sessionDuration &&
        sessionIntervalTime == other.sessionIntervalTime &&
        sessionPerOrderMemberLimit == other.sessionPerOrderMemberLimit &&
        sessionCustomEditStatus == other.sessionCustomEditStatus &&
        listEquality.equals(sessionSlotList, other.sessionSlotList);
  }

  @override
  int get hashCode => const ListEquality().hash([
        sessionId,
        sessionStatus,
        sessionOrder,
        sessionName,
        sessionCreatedAt,
        sessionDayList,
        sessionFromTime,
        sessionToTime,
        sessionDuration,
        sessionIntervalTime,
        sessionPerOrderMemberLimit,
        sessionCustomEditStatus,
        sessionSlotList
      ]);
}

SessionListStruct createSessionListStruct({
  String? sessionId,
  String? sessionStatus,
  String? sessionOrder,
  String? sessionName,
  DateTime? sessionCreatedAt,
  DateTime? sessionFromTime,
  DateTime? sessionToTime,
  int? sessionDuration,
  int? sessionIntervalTime,
  int? sessionPerOrderMemberLimit,
  bool? sessionCustomEditStatus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SessionListStruct(
      sessionId: sessionId,
      sessionStatus: sessionStatus,
      sessionOrder: sessionOrder,
      sessionName: sessionName,
      sessionCreatedAt: sessionCreatedAt,
      sessionFromTime: sessionFromTime,
      sessionToTime: sessionToTime,
      sessionDuration: sessionDuration,
      sessionIntervalTime: sessionIntervalTime,
      sessionPerOrderMemberLimit: sessionPerOrderMemberLimit,
      sessionCustomEditStatus: sessionCustomEditStatus,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SessionListStruct? updateSessionListStruct(
  SessionListStruct? sessionList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sessionList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSessionListStructData(
  Map<String, dynamic> firestoreData,
  SessionListStruct? sessionList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sessionList == null) {
    return;
  }
  if (sessionList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sessionList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sessionListData =
      getSessionListFirestoreData(sessionList, forFieldValue);
  final nestedData =
      sessionListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sessionList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSessionListFirestoreData(
  SessionListStruct? sessionList, [
  bool forFieldValue = false,
]) {
  if (sessionList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sessionList.toMap());

  // Add any Firestore field values
  mapToFirestore(sessionList.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSessionListListFirestoreData(
  List<SessionListStruct>? sessionLists,
) =>
    sessionLists?.map((e) => getSessionListFirestoreData(e, true)).toList() ??
    [];
