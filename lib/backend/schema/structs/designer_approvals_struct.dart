// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DesignerApprovalsStruct extends FFFirebaseStruct {
  DesignerApprovalsStruct({
    String? designerRequestId,
    String? designerId,
    String? designerApprovalStatus,
    DateTime? decisionDate,
    String? comments,
    List<DateTime>? designerHoildayList,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _designerRequestId = designerRequestId,
        _designerId = designerId,
        _designerApprovalStatus = designerApprovalStatus,
        _decisionDate = decisionDate,
        _comments = comments,
        _designerHoildayList = designerHoildayList,
        super(firestoreUtilData);

  // "designer_request_id" field.
  String? _designerRequestId;
  String get designerRequestId => _designerRequestId ?? '';
  set designerRequestId(String? val) => _designerRequestId = val;

  bool hasDesignerRequestId() => _designerRequestId != null;

  // "designer_id" field.
  String? _designerId;
  String get designerId => _designerId ?? '';
  set designerId(String? val) => _designerId = val;

  bool hasDesignerId() => _designerId != null;

  // "designer_approval_status" field.
  String? _designerApprovalStatus;
  String get designerApprovalStatus => _designerApprovalStatus ?? '';
  set designerApprovalStatus(String? val) => _designerApprovalStatus = val;

  bool hasDesignerApprovalStatus() => _designerApprovalStatus != null;

  // "decision_date" field.
  DateTime? _decisionDate;
  DateTime? get decisionDate => _decisionDate;
  set decisionDate(DateTime? val) => _decisionDate = val;

  bool hasDecisionDate() => _decisionDate != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  set comments(String? val) => _comments = val;

  bool hasComments() => _comments != null;

  // "designer_hoilday_list" field.
  List<DateTime>? _designerHoildayList;
  List<DateTime> get designerHoildayList => _designerHoildayList ?? const [];
  set designerHoildayList(List<DateTime>? val) => _designerHoildayList = val;

  void updateDesignerHoildayList(Function(List<DateTime>) updateFn) {
    updateFn(_designerHoildayList ??= []);
  }

  bool hasDesignerHoildayList() => _designerHoildayList != null;

  static DesignerApprovalsStruct fromMap(Map<String, dynamic> data) =>
      DesignerApprovalsStruct(
        designerRequestId: data['designer_request_id'] as String?,
        designerId: data['designer_id'] as String?,
        designerApprovalStatus: data['designer_approval_status'] as String?,
        decisionDate: data['decision_date'] as DateTime?,
        comments: data['comments'] as String?,
        designerHoildayList: getDataList(data['designer_hoilday_list']),
      );

  static DesignerApprovalsStruct? maybeFromMap(dynamic data) => data is Map
      ? DesignerApprovalsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'designer_request_id': _designerRequestId,
        'designer_id': _designerId,
        'designer_approval_status': _designerApprovalStatus,
        'decision_date': _decisionDate,
        'comments': _comments,
        'designer_hoilday_list': _designerHoildayList,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'designer_request_id': serializeParam(
          _designerRequestId,
          ParamType.String,
        ),
        'designer_id': serializeParam(
          _designerId,
          ParamType.String,
        ),
        'designer_approval_status': serializeParam(
          _designerApprovalStatus,
          ParamType.String,
        ),
        'decision_date': serializeParam(
          _decisionDate,
          ParamType.DateTime,
        ),
        'comments': serializeParam(
          _comments,
          ParamType.String,
        ),
        'designer_hoilday_list': serializeParam(
          _designerHoildayList,
          ParamType.DateTime,
          isList: true,
        ),
      }.withoutNulls;

  static DesignerApprovalsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DesignerApprovalsStruct(
        designerRequestId: deserializeParam(
          data['designer_request_id'],
          ParamType.String,
          false,
        ),
        designerId: deserializeParam(
          data['designer_id'],
          ParamType.String,
          false,
        ),
        designerApprovalStatus: deserializeParam(
          data['designer_approval_status'],
          ParamType.String,
          false,
        ),
        decisionDate: deserializeParam(
          data['decision_date'],
          ParamType.DateTime,
          false,
        ),
        comments: deserializeParam(
          data['comments'],
          ParamType.String,
          false,
        ),
        designerHoildayList: deserializeParam<DateTime>(
          data['designer_hoilday_list'],
          ParamType.DateTime,
          true,
        ),
      );

  static DesignerApprovalsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DesignerApprovalsStruct(
        designerRequestId: convertAlgoliaParam(
          data['designer_request_id'],
          ParamType.String,
          false,
        ),
        designerId: convertAlgoliaParam(
          data['designer_id'],
          ParamType.String,
          false,
        ),
        designerApprovalStatus: convertAlgoliaParam(
          data['designer_approval_status'],
          ParamType.String,
          false,
        ),
        decisionDate: convertAlgoliaParam(
          data['decision_date'],
          ParamType.DateTime,
          false,
        ),
        comments: convertAlgoliaParam(
          data['comments'],
          ParamType.String,
          false,
        ),
        designerHoildayList: convertAlgoliaParam<DateTime>(
          data['designer_hoilday_list'],
          ParamType.DateTime,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'DesignerApprovalsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DesignerApprovalsStruct &&
        designerRequestId == other.designerRequestId &&
        designerId == other.designerId &&
        designerApprovalStatus == other.designerApprovalStatus &&
        decisionDate == other.decisionDate &&
        comments == other.comments &&
        listEquality.equals(designerHoildayList, other.designerHoildayList);
  }

  @override
  int get hashCode => const ListEquality().hash([
        designerRequestId,
        designerId,
        designerApprovalStatus,
        decisionDate,
        comments,
        designerHoildayList
      ]);
}

DesignerApprovalsStruct createDesignerApprovalsStruct({
  String? designerRequestId,
  String? designerId,
  String? designerApprovalStatus,
  DateTime? decisionDate,
  String? comments,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DesignerApprovalsStruct(
      designerRequestId: designerRequestId,
      designerId: designerId,
      designerApprovalStatus: designerApprovalStatus,
      decisionDate: decisionDate,
      comments: comments,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DesignerApprovalsStruct? updateDesignerApprovalsStruct(
  DesignerApprovalsStruct? designerApprovals, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    designerApprovals
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDesignerApprovalsStructData(
  Map<String, dynamic> firestoreData,
  DesignerApprovalsStruct? designerApprovals,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (designerApprovals == null) {
    return;
  }
  if (designerApprovals.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && designerApprovals.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final designerApprovalsData =
      getDesignerApprovalsFirestoreData(designerApprovals, forFieldValue);
  final nestedData =
      designerApprovalsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = designerApprovals.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDesignerApprovalsFirestoreData(
  DesignerApprovalsStruct? designerApprovals, [
  bool forFieldValue = false,
]) {
  if (designerApprovals == null) {
    return {};
  }
  final firestoreData = mapToFirestore(designerApprovals.toMap());

  // Add any Firestore field values
  mapToFirestore(designerApprovals.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDesignerApprovalsListFirestoreData(
  List<DesignerApprovalsStruct>? designerApprovalss,
) =>
    designerApprovalss
        ?.map((e) => getDesignerApprovalsFirestoreData(e, true))
        .toList() ??
    [];
