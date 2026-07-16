// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CreatorApprovalsStruct extends FFFirebaseStruct {
  CreatorApprovalsStruct({
    String? creatorRequestId,
    String? creatorId,
    String? creatorApprovalStatus,
    DateTime? decisionDate,
    String? comments,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _creatorRequestId = creatorRequestId,
        _creatorId = creatorId,
        _creatorApprovalStatus = creatorApprovalStatus,
        _decisionDate = decisionDate,
        _comments = comments,
        super(firestoreUtilData);

  // "creator_request_id" field.
  String? _creatorRequestId;
  String get creatorRequestId => _creatorRequestId ?? '';
  set creatorRequestId(String? val) => _creatorRequestId = val;

  bool hasCreatorRequestId() => _creatorRequestId != null;

  // "creator_id" field.
  String? _creatorId;
  String get creatorId => _creatorId ?? '';
  set creatorId(String? val) => _creatorId = val;

  bool hasCreatorId() => _creatorId != null;

  // "creator_approval_status" field.
  String? _creatorApprovalStatus;
  String get creatorApprovalStatus => _creatorApprovalStatus ?? '';
  set creatorApprovalStatus(String? val) => _creatorApprovalStatus = val;

  bool hasCreatorApprovalStatus() => _creatorApprovalStatus != null;

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

  static CreatorApprovalsStruct fromMap(Map<String, dynamic> data) =>
      CreatorApprovalsStruct(
        creatorRequestId: data['creator_request_id'] as String?,
        creatorId: data['creator_id'] as String?,
        creatorApprovalStatus: data['creator_approval_status'] as String?,
        decisionDate: data['decision_date'] as DateTime?,
        comments: data['comments'] as String?,
      );

  static CreatorApprovalsStruct? maybeFromMap(dynamic data) => data is Map
      ? CreatorApprovalsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'creator_request_id': _creatorRequestId,
        'creator_id': _creatorId,
        'creator_approval_status': _creatorApprovalStatus,
        'decision_date': _decisionDate,
        'comments': _comments,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'creator_request_id': serializeParam(
          _creatorRequestId,
          ParamType.String,
        ),
        'creator_id': serializeParam(
          _creatorId,
          ParamType.String,
        ),
        'creator_approval_status': serializeParam(
          _creatorApprovalStatus,
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
      }.withoutNulls;

  static CreatorApprovalsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CreatorApprovalsStruct(
        creatorRequestId: deserializeParam(
          data['creator_request_id'],
          ParamType.String,
          false,
        ),
        creatorId: deserializeParam(
          data['creator_id'],
          ParamType.String,
          false,
        ),
        creatorApprovalStatus: deserializeParam(
          data['creator_approval_status'],
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
      );

  static CreatorApprovalsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CreatorApprovalsStruct(
        creatorRequestId: convertAlgoliaParam(
          data['creator_request_id'],
          ParamType.String,
          false,
        ),
        creatorId: convertAlgoliaParam(
          data['creator_id'],
          ParamType.String,
          false,
        ),
        creatorApprovalStatus: convertAlgoliaParam(
          data['creator_approval_status'],
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
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CreatorApprovalsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CreatorApprovalsStruct &&
        creatorRequestId == other.creatorRequestId &&
        creatorId == other.creatorId &&
        creatorApprovalStatus == other.creatorApprovalStatus &&
        decisionDate == other.decisionDate &&
        comments == other.comments;
  }

  @override
  int get hashCode => const ListEquality().hash([
        creatorRequestId,
        creatorId,
        creatorApprovalStatus,
        decisionDate,
        comments
      ]);
}

CreatorApprovalsStruct createCreatorApprovalsStruct({
  String? creatorRequestId,
  String? creatorId,
  String? creatorApprovalStatus,
  DateTime? decisionDate,
  String? comments,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CreatorApprovalsStruct(
      creatorRequestId: creatorRequestId,
      creatorId: creatorId,
      creatorApprovalStatus: creatorApprovalStatus,
      decisionDate: decisionDate,
      comments: comments,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CreatorApprovalsStruct? updateCreatorApprovalsStruct(
  CreatorApprovalsStruct? creatorApprovals, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    creatorApprovals
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCreatorApprovalsStructData(
  Map<String, dynamic> firestoreData,
  CreatorApprovalsStruct? creatorApprovals,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (creatorApprovals == null) {
    return;
  }
  if (creatorApprovals.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && creatorApprovals.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final creatorApprovalsData =
      getCreatorApprovalsFirestoreData(creatorApprovals, forFieldValue);
  final nestedData =
      creatorApprovalsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = creatorApprovals.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCreatorApprovalsFirestoreData(
  CreatorApprovalsStruct? creatorApprovals, [
  bool forFieldValue = false,
]) {
  if (creatorApprovals == null) {
    return {};
  }
  final firestoreData = mapToFirestore(creatorApprovals.toMap());

  // Add any Firestore field values
  mapToFirestore(creatorApprovals.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCreatorApprovalsListFirestoreData(
  List<CreatorApprovalsStruct>? creatorApprovalss,
) =>
    creatorApprovalss
        ?.map((e) => getCreatorApprovalsFirestoreData(e, true))
        .toList() ??
    [];
