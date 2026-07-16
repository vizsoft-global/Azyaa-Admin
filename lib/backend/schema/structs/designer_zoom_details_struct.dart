// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DesignerZoomDetailsStruct extends FFFirebaseStruct {
  DesignerZoomDetailsStruct({
    String? zoomCallId,
    String? zoomCallMeetingId,
    String? zoomCallPassword,
    DateTime? zoomCallScheduleCreatedat,
    DateTime? zoomCallFromTime,
    DateTime? zoomCallToTime,
    DesignerApprovalsStruct? designerInfo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _zoomCallId = zoomCallId,
        _zoomCallMeetingId = zoomCallMeetingId,
        _zoomCallPassword = zoomCallPassword,
        _zoomCallScheduleCreatedat = zoomCallScheduleCreatedat,
        _zoomCallFromTime = zoomCallFromTime,
        _zoomCallToTime = zoomCallToTime,
        _designerInfo = designerInfo,
        super(firestoreUtilData);

  // "zoom_call_id" field.
  String? _zoomCallId;
  String get zoomCallId => _zoomCallId ?? '';
  set zoomCallId(String? val) => _zoomCallId = val;

  bool hasZoomCallId() => _zoomCallId != null;

  // "zoom_call_meeting_id" field.
  String? _zoomCallMeetingId;
  String get zoomCallMeetingId => _zoomCallMeetingId ?? '';
  set zoomCallMeetingId(String? val) => _zoomCallMeetingId = val;

  bool hasZoomCallMeetingId() => _zoomCallMeetingId != null;

  // "zoom_call_password" field.
  String? _zoomCallPassword;
  String get zoomCallPassword => _zoomCallPassword ?? '';
  set zoomCallPassword(String? val) => _zoomCallPassword = val;

  bool hasZoomCallPassword() => _zoomCallPassword != null;

  // "zoom_call_schedule_createdat" field.
  DateTime? _zoomCallScheduleCreatedat;
  DateTime? get zoomCallScheduleCreatedat => _zoomCallScheduleCreatedat;
  set zoomCallScheduleCreatedat(DateTime? val) =>
      _zoomCallScheduleCreatedat = val;

  bool hasZoomCallScheduleCreatedat() => _zoomCallScheduleCreatedat != null;

  // "zoom_call_from_time" field.
  DateTime? _zoomCallFromTime;
  DateTime? get zoomCallFromTime => _zoomCallFromTime;
  set zoomCallFromTime(DateTime? val) => _zoomCallFromTime = val;

  bool hasZoomCallFromTime() => _zoomCallFromTime != null;

  // "zoom_call_to_time" field.
  DateTime? _zoomCallToTime;
  DateTime? get zoomCallToTime => _zoomCallToTime;
  set zoomCallToTime(DateTime? val) => _zoomCallToTime = val;

  bool hasZoomCallToTime() => _zoomCallToTime != null;

  // "designer_info" field.
  DesignerApprovalsStruct? _designerInfo;
  DesignerApprovalsStruct get designerInfo =>
      _designerInfo ?? DesignerApprovalsStruct();
  set designerInfo(DesignerApprovalsStruct? val) => _designerInfo = val;

  void updateDesignerInfo(Function(DesignerApprovalsStruct) updateFn) {
    updateFn(_designerInfo ??= DesignerApprovalsStruct());
  }

  bool hasDesignerInfo() => _designerInfo != null;

  static DesignerZoomDetailsStruct fromMap(Map<String, dynamic> data) =>
      DesignerZoomDetailsStruct(
        zoomCallId: data['zoom_call_id'] as String?,
        zoomCallMeetingId: data['zoom_call_meeting_id'] as String?,
        zoomCallPassword: data['zoom_call_password'] as String?,
        zoomCallScheduleCreatedat:
            data['zoom_call_schedule_createdat'] as DateTime?,
        zoomCallFromTime: data['zoom_call_from_time'] as DateTime?,
        zoomCallToTime: data['zoom_call_to_time'] as DateTime?,
        designerInfo: data['designer_info'] is DesignerApprovalsStruct
            ? data['designer_info']
            : DesignerApprovalsStruct.maybeFromMap(data['designer_info']),
      );

  static DesignerZoomDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? DesignerZoomDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'zoom_call_id': _zoomCallId,
        'zoom_call_meeting_id': _zoomCallMeetingId,
        'zoom_call_password': _zoomCallPassword,
        'zoom_call_schedule_createdat': _zoomCallScheduleCreatedat,
        'zoom_call_from_time': _zoomCallFromTime,
        'zoom_call_to_time': _zoomCallToTime,
        'designer_info': _designerInfo?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'zoom_call_id': serializeParam(
          _zoomCallId,
          ParamType.String,
        ),
        'zoom_call_meeting_id': serializeParam(
          _zoomCallMeetingId,
          ParamType.String,
        ),
        'zoom_call_password': serializeParam(
          _zoomCallPassword,
          ParamType.String,
        ),
        'zoom_call_schedule_createdat': serializeParam(
          _zoomCallScheduleCreatedat,
          ParamType.DateTime,
        ),
        'zoom_call_from_time': serializeParam(
          _zoomCallFromTime,
          ParamType.DateTime,
        ),
        'zoom_call_to_time': serializeParam(
          _zoomCallToTime,
          ParamType.DateTime,
        ),
        'designer_info': serializeParam(
          _designerInfo,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static DesignerZoomDetailsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DesignerZoomDetailsStruct(
        zoomCallId: deserializeParam(
          data['zoom_call_id'],
          ParamType.String,
          false,
        ),
        zoomCallMeetingId: deserializeParam(
          data['zoom_call_meeting_id'],
          ParamType.String,
          false,
        ),
        zoomCallPassword: deserializeParam(
          data['zoom_call_password'],
          ParamType.String,
          false,
        ),
        zoomCallScheduleCreatedat: deserializeParam(
          data['zoom_call_schedule_createdat'],
          ParamType.DateTime,
          false,
        ),
        zoomCallFromTime: deserializeParam(
          data['zoom_call_from_time'],
          ParamType.DateTime,
          false,
        ),
        zoomCallToTime: deserializeParam(
          data['zoom_call_to_time'],
          ParamType.DateTime,
          false,
        ),
        designerInfo: deserializeStructParam(
          data['designer_info'],
          ParamType.DataStruct,
          false,
          structBuilder: DesignerApprovalsStruct.fromSerializableMap,
        ),
      );

  static DesignerZoomDetailsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DesignerZoomDetailsStruct(
        zoomCallId: convertAlgoliaParam(
          data['zoom_call_id'],
          ParamType.String,
          false,
        ),
        zoomCallMeetingId: convertAlgoliaParam(
          data['zoom_call_meeting_id'],
          ParamType.String,
          false,
        ),
        zoomCallPassword: convertAlgoliaParam(
          data['zoom_call_password'],
          ParamType.String,
          false,
        ),
        zoomCallScheduleCreatedat: convertAlgoliaParam(
          data['zoom_call_schedule_createdat'],
          ParamType.DateTime,
          false,
        ),
        zoomCallFromTime: convertAlgoliaParam(
          data['zoom_call_from_time'],
          ParamType.DateTime,
          false,
        ),
        zoomCallToTime: convertAlgoliaParam(
          data['zoom_call_to_time'],
          ParamType.DateTime,
          false,
        ),
        designerInfo: convertAlgoliaParam(
          data['designer_info'],
          ParamType.DataStruct,
          false,
          structBuilder: DesignerApprovalsStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DesignerZoomDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DesignerZoomDetailsStruct &&
        zoomCallId == other.zoomCallId &&
        zoomCallMeetingId == other.zoomCallMeetingId &&
        zoomCallPassword == other.zoomCallPassword &&
        zoomCallScheduleCreatedat == other.zoomCallScheduleCreatedat &&
        zoomCallFromTime == other.zoomCallFromTime &&
        zoomCallToTime == other.zoomCallToTime &&
        designerInfo == other.designerInfo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        zoomCallId,
        zoomCallMeetingId,
        zoomCallPassword,
        zoomCallScheduleCreatedat,
        zoomCallFromTime,
        zoomCallToTime,
        designerInfo
      ]);
}

DesignerZoomDetailsStruct createDesignerZoomDetailsStruct({
  String? zoomCallId,
  String? zoomCallMeetingId,
  String? zoomCallPassword,
  DateTime? zoomCallScheduleCreatedat,
  DateTime? zoomCallFromTime,
  DateTime? zoomCallToTime,
  DesignerApprovalsStruct? designerInfo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DesignerZoomDetailsStruct(
      zoomCallId: zoomCallId,
      zoomCallMeetingId: zoomCallMeetingId,
      zoomCallPassword: zoomCallPassword,
      zoomCallScheduleCreatedat: zoomCallScheduleCreatedat,
      zoomCallFromTime: zoomCallFromTime,
      zoomCallToTime: zoomCallToTime,
      designerInfo:
          designerInfo ?? (clearUnsetFields ? DesignerApprovalsStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DesignerZoomDetailsStruct? updateDesignerZoomDetailsStruct(
  DesignerZoomDetailsStruct? designerZoomDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    designerZoomDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDesignerZoomDetailsStructData(
  Map<String, dynamic> firestoreData,
  DesignerZoomDetailsStruct? designerZoomDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (designerZoomDetails == null) {
    return;
  }
  if (designerZoomDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && designerZoomDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final designerZoomDetailsData =
      getDesignerZoomDetailsFirestoreData(designerZoomDetails, forFieldValue);
  final nestedData =
      designerZoomDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      designerZoomDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDesignerZoomDetailsFirestoreData(
  DesignerZoomDetailsStruct? designerZoomDetails, [
  bool forFieldValue = false,
]) {
  if (designerZoomDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(designerZoomDetails.toMap());

  // Handle nested data for "designer_info" field.
  addDesignerApprovalsStructData(
    firestoreData,
    designerZoomDetails.hasDesignerInfo()
        ? designerZoomDetails.designerInfo
        : null,
    'designer_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(designerZoomDetails.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDesignerZoomDetailsListFirestoreData(
  List<DesignerZoomDetailsStruct>? designerZoomDetailss,
) =>
    designerZoomDetailss
        ?.map((e) => getDesignerZoomDetailsFirestoreData(e, true))
        .toList() ??
    [];
