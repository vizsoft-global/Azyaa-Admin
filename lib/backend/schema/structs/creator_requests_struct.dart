// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreatorRequestsStruct extends FFFirebaseStruct {
  CreatorRequestsStruct({
    String? creatorRequestId,
    String? requestType,
    DateTime? submissionDate,
    String? status,
    DateTime? updatedAt,
    FormListStruct? formData,
    String? creatorSelfie,
    bool? isCreatorRequestStatus,
    String? rejectReason,
    String? rejectMessage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _creatorRequestId = creatorRequestId,
        _requestType = requestType,
        _submissionDate = submissionDate,
        _status = status,
        _updatedAt = updatedAt,
        _formData = formData,
        _creatorSelfie = creatorSelfie,
        _isCreatorRequestStatus = isCreatorRequestStatus,
        _rejectReason = rejectReason,
        _rejectMessage = rejectMessage,
        super(firestoreUtilData);

  // "creator_request_id" field.
  String? _creatorRequestId;
  String get creatorRequestId => _creatorRequestId ?? '';
  set creatorRequestId(String? val) => _creatorRequestId = val;

  bool hasCreatorRequestId() => _creatorRequestId != null;

  // "request_type" field.
  String? _requestType;
  String get requestType => _requestType ?? '';
  set requestType(String? val) => _requestType = val;

  bool hasRequestType() => _requestType != null;

  // "submission_date" field.
  DateTime? _submissionDate;
  DateTime? get submissionDate => _submissionDate;
  set submissionDate(DateTime? val) => _submissionDate = val;

  bool hasSubmissionDate() => _submissionDate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "form_data" field.
  FormListStruct? _formData;
  FormListStruct get formData => _formData ?? FormListStruct();
  set formData(FormListStruct? val) => _formData = val;

  void updateFormData(Function(FormListStruct) updateFn) {
    updateFn(_formData ??= FormListStruct());
  }

  bool hasFormData() => _formData != null;

  // "creator_selfie" field.
  String? _creatorSelfie;
  String get creatorSelfie => _creatorSelfie ?? '';
  set creatorSelfie(String? val) => _creatorSelfie = val;

  bool hasCreatorSelfie() => _creatorSelfie != null;

  // "is_creator_request_status" field.
  bool? _isCreatorRequestStatus;
  bool get isCreatorRequestStatus => _isCreatorRequestStatus ?? false;
  set isCreatorRequestStatus(bool? val) => _isCreatorRequestStatus = val;

  bool hasIsCreatorRequestStatus() => _isCreatorRequestStatus != null;

  // "reject_reason" field.
  String? _rejectReason;
  String get rejectReason => _rejectReason ?? '';
  set rejectReason(String? val) => _rejectReason = val;

  bool hasRejectReason() => _rejectReason != null;

  // "reject_message" field.
  String? _rejectMessage;
  String get rejectMessage => _rejectMessage ?? '';
  set rejectMessage(String? val) => _rejectMessage = val;

  bool hasRejectMessage() => _rejectMessage != null;

  static CreatorRequestsStruct fromMap(Map<String, dynamic> data) =>
      CreatorRequestsStruct(
        creatorRequestId: data['creator_request_id'] as String?,
        requestType: data['request_type'] as String?,
        submissionDate: data['submission_date'] as DateTime?,
        status: data['status'] as String?,
        updatedAt: data['updated_at'] as DateTime?,
        formData: data['form_data'] is FormListStruct
            ? data['form_data']
            : FormListStruct.maybeFromMap(data['form_data']),
        creatorSelfie: data['creator_selfie'] as String?,
        isCreatorRequestStatus: data['is_creator_request_status'] as bool?,
        rejectReason: data['reject_reason'] as String?,
        rejectMessage: data['reject_message'] as String?,
      );

  static CreatorRequestsStruct? maybeFromMap(dynamic data) => data is Map
      ? CreatorRequestsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'creator_request_id': _creatorRequestId,
        'request_type': _requestType,
        'submission_date': _submissionDate,
        'status': _status,
        'updated_at': _updatedAt,
        'form_data': _formData?.toMap(),
        'creator_selfie': _creatorSelfie,
        'is_creator_request_status': _isCreatorRequestStatus,
        'reject_reason': _rejectReason,
        'reject_message': _rejectMessage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'creator_request_id': serializeParam(
          _creatorRequestId,
          ParamType.String,
        ),
        'request_type': serializeParam(
          _requestType,
          ParamType.String,
        ),
        'submission_date': serializeParam(
          _submissionDate,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'form_data': serializeParam(
          _formData,
          ParamType.DataStruct,
        ),
        'creator_selfie': serializeParam(
          _creatorSelfie,
          ParamType.String,
        ),
        'is_creator_request_status': serializeParam(
          _isCreatorRequestStatus,
          ParamType.bool,
        ),
        'reject_reason': serializeParam(
          _rejectReason,
          ParamType.String,
        ),
        'reject_message': serializeParam(
          _rejectMessage,
          ParamType.String,
        ),
      }.withoutNulls;

  static CreatorRequestsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CreatorRequestsStruct(
        creatorRequestId: deserializeParam(
          data['creator_request_id'],
          ParamType.String,
          false,
        ),
        requestType: deserializeParam(
          data['request_type'],
          ParamType.String,
          false,
        ),
        submissionDate: deserializeParam(
          data['submission_date'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        formData: deserializeStructParam(
          data['form_data'],
          ParamType.DataStruct,
          false,
          structBuilder: FormListStruct.fromSerializableMap,
        ),
        creatorSelfie: deserializeParam(
          data['creator_selfie'],
          ParamType.String,
          false,
        ),
        isCreatorRequestStatus: deserializeParam(
          data['is_creator_request_status'],
          ParamType.bool,
          false,
        ),
        rejectReason: deserializeParam(
          data['reject_reason'],
          ParamType.String,
          false,
        ),
        rejectMessage: deserializeParam(
          data['reject_message'],
          ParamType.String,
          false,
        ),
      );

  static CreatorRequestsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CreatorRequestsStruct(
        creatorRequestId: convertAlgoliaParam(
          data['creator_request_id'],
          ParamType.String,
          false,
        ),
        requestType: convertAlgoliaParam(
          data['request_type'],
          ParamType.String,
          false,
        ),
        submissionDate: convertAlgoliaParam(
          data['submission_date'],
          ParamType.DateTime,
          false,
        ),
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        updatedAt: convertAlgoliaParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        formData: convertAlgoliaParam(
          data['form_data'],
          ParamType.DataStruct,
          false,
          structBuilder: FormListStruct.fromAlgoliaData,
        ),
        creatorSelfie: convertAlgoliaParam(
          data['creator_selfie'],
          ParamType.String,
          false,
        ),
        isCreatorRequestStatus: convertAlgoliaParam(
          data['is_creator_request_status'],
          ParamType.bool,
          false,
        ),
        rejectReason: convertAlgoliaParam(
          data['reject_reason'],
          ParamType.String,
          false,
        ),
        rejectMessage: convertAlgoliaParam(
          data['reject_message'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CreatorRequestsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CreatorRequestsStruct &&
        creatorRequestId == other.creatorRequestId &&
        requestType == other.requestType &&
        submissionDate == other.submissionDate &&
        status == other.status &&
        updatedAt == other.updatedAt &&
        formData == other.formData &&
        creatorSelfie == other.creatorSelfie &&
        isCreatorRequestStatus == other.isCreatorRequestStatus &&
        rejectReason == other.rejectReason &&
        rejectMessage == other.rejectMessage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        creatorRequestId,
        requestType,
        submissionDate,
        status,
        updatedAt,
        formData,
        creatorSelfie,
        isCreatorRequestStatus,
        rejectReason,
        rejectMessage
      ]);
}

CreatorRequestsStruct createCreatorRequestsStruct({
  String? creatorRequestId,
  String? requestType,
  DateTime? submissionDate,
  String? status,
  DateTime? updatedAt,
  FormListStruct? formData,
  String? creatorSelfie,
  bool? isCreatorRequestStatus,
  String? rejectReason,
  String? rejectMessage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CreatorRequestsStruct(
      creatorRequestId: creatorRequestId,
      requestType: requestType,
      submissionDate: submissionDate,
      status: status,
      updatedAt: updatedAt,
      formData: formData ?? (clearUnsetFields ? FormListStruct() : null),
      creatorSelfie: creatorSelfie,
      isCreatorRequestStatus: isCreatorRequestStatus,
      rejectReason: rejectReason,
      rejectMessage: rejectMessage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CreatorRequestsStruct? updateCreatorRequestsStruct(
  CreatorRequestsStruct? creatorRequests, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    creatorRequests
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCreatorRequestsStructData(
  Map<String, dynamic> firestoreData,
  CreatorRequestsStruct? creatorRequests,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (creatorRequests == null) {
    return;
  }
  if (creatorRequests.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && creatorRequests.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final creatorRequestsData =
      getCreatorRequestsFirestoreData(creatorRequests, forFieldValue);
  final nestedData =
      creatorRequestsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = creatorRequests.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCreatorRequestsFirestoreData(
  CreatorRequestsStruct? creatorRequests, [
  bool forFieldValue = false,
]) {
  if (creatorRequests == null) {
    return {};
  }
  final firestoreData = mapToFirestore(creatorRequests.toMap());

  // Handle nested data for "form_data" field.
  addFormListStructData(
    firestoreData,
    creatorRequests.hasFormData() ? creatorRequests.formData : null,
    'form_data',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(creatorRequests.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCreatorRequestsListFirestoreData(
  List<CreatorRequestsStruct>? creatorRequestss,
) =>
    creatorRequestss
        ?.map((e) => getCreatorRequestsFirestoreData(e, true))
        .toList() ??
    [];
