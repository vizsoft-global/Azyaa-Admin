// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DesignerRequestsStruct extends FFFirebaseStruct {
  DesignerRequestsStruct({
    bool? isDesignerRequestStatus,
    String? designerRequestId,
    String? requestType,
    DateTime? submissionDate,
    String? status,
    DateTime? updatedAt,
    FormListStruct? formData,
    List<DesignerSampleDesignsStruct>? designerSampleDesigns,
    String? designerSelfie,
    String? rejectReason,
    String? rejectMessage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isDesignerRequestStatus = isDesignerRequestStatus,
        _designerRequestId = designerRequestId,
        _requestType = requestType,
        _submissionDate = submissionDate,
        _status = status,
        _updatedAt = updatedAt,
        _formData = formData,
        _designerSampleDesigns = designerSampleDesigns,
        _designerSelfie = designerSelfie,
        _rejectReason = rejectReason,
        _rejectMessage = rejectMessage,
        super(firestoreUtilData);

  // "is_designer_request_status" field.
  bool? _isDesignerRequestStatus;
  bool get isDesignerRequestStatus => _isDesignerRequestStatus ?? false;
  set isDesignerRequestStatus(bool? val) => _isDesignerRequestStatus = val;

  bool hasIsDesignerRequestStatus() => _isDesignerRequestStatus != null;

  // "designer_request_id" field.
  String? _designerRequestId;
  String get designerRequestId => _designerRequestId ?? '';
  set designerRequestId(String? val) => _designerRequestId = val;

  bool hasDesignerRequestId() => _designerRequestId != null;

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

  // "designer_sample_designs" field.
  List<DesignerSampleDesignsStruct>? _designerSampleDesigns;
  List<DesignerSampleDesignsStruct> get designerSampleDesigns =>
      _designerSampleDesigns ?? const [];
  set designerSampleDesigns(List<DesignerSampleDesignsStruct>? val) =>
      _designerSampleDesigns = val;

  void updateDesignerSampleDesigns(
      Function(List<DesignerSampleDesignsStruct>) updateFn) {
    updateFn(_designerSampleDesigns ??= []);
  }

  bool hasDesignerSampleDesigns() => _designerSampleDesigns != null;

  // "designer_selfie" field.
  String? _designerSelfie;
  String get designerSelfie => _designerSelfie ?? '';
  set designerSelfie(String? val) => _designerSelfie = val;

  bool hasDesignerSelfie() => _designerSelfie != null;

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

  static DesignerRequestsStruct fromMap(Map<String, dynamic> data) =>
      DesignerRequestsStruct(
        isDesignerRequestStatus: data['is_designer_request_status'] as bool?,
        designerRequestId: data['designer_request_id'] as String?,
        requestType: data['request_type'] as String?,
        submissionDate: data['submission_date'] as DateTime?,
        status: data['status'] as String?,
        updatedAt: data['updated_at'] as DateTime?,
        formData: data['form_data'] is FormListStruct
            ? data['form_data']
            : FormListStruct.maybeFromMap(data['form_data']),
        designerSampleDesigns: getStructList(
          data['designer_sample_designs'],
          DesignerSampleDesignsStruct.fromMap,
        ),
        designerSelfie: data['designer_selfie'] as String?,
        rejectReason: data['reject_reason'] as String?,
        rejectMessage: data['reject_message'] as String?,
      );

  static DesignerRequestsStruct? maybeFromMap(dynamic data) => data is Map
      ? DesignerRequestsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'is_designer_request_status': _isDesignerRequestStatus,
        'designer_request_id': _designerRequestId,
        'request_type': _requestType,
        'submission_date': _submissionDate,
        'status': _status,
        'updated_at': _updatedAt,
        'form_data': _formData?.toMap(),
        'designer_sample_designs':
            _designerSampleDesigns?.map((e) => e.toMap()).toList(),
        'designer_selfie': _designerSelfie,
        'reject_reason': _rejectReason,
        'reject_message': _rejectMessage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'is_designer_request_status': serializeParam(
          _isDesignerRequestStatus,
          ParamType.bool,
        ),
        'designer_request_id': serializeParam(
          _designerRequestId,
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
        'designer_sample_designs': serializeParam(
          _designerSampleDesigns,
          ParamType.DataStruct,
          isList: true,
        ),
        'designer_selfie': serializeParam(
          _designerSelfie,
          ParamType.String,
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

  static DesignerRequestsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DesignerRequestsStruct(
        isDesignerRequestStatus: deserializeParam(
          data['is_designer_request_status'],
          ParamType.bool,
          false,
        ),
        designerRequestId: deserializeParam(
          data['designer_request_id'],
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
        designerSampleDesigns:
            deserializeStructParam<DesignerSampleDesignsStruct>(
          data['designer_sample_designs'],
          ParamType.DataStruct,
          true,
          structBuilder: DesignerSampleDesignsStruct.fromSerializableMap,
        ),
        designerSelfie: deserializeParam(
          data['designer_selfie'],
          ParamType.String,
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

  static DesignerRequestsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      DesignerRequestsStruct(
        isDesignerRequestStatus: convertAlgoliaParam(
          data['is_designer_request_status'],
          ParamType.bool,
          false,
        ),
        designerRequestId: convertAlgoliaParam(
          data['designer_request_id'],
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
        designerSampleDesigns: convertAlgoliaParam<DesignerSampleDesignsStruct>(
          data['designer_sample_designs'],
          ParamType.DataStruct,
          true,
          structBuilder: DesignerSampleDesignsStruct.fromAlgoliaData,
        ),
        designerSelfie: convertAlgoliaParam(
          data['designer_selfie'],
          ParamType.String,
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
  String toString() => 'DesignerRequestsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DesignerRequestsStruct &&
        isDesignerRequestStatus == other.isDesignerRequestStatus &&
        designerRequestId == other.designerRequestId &&
        requestType == other.requestType &&
        submissionDate == other.submissionDate &&
        status == other.status &&
        updatedAt == other.updatedAt &&
        formData == other.formData &&
        listEquality.equals(
            designerSampleDesigns, other.designerSampleDesigns) &&
        designerSelfie == other.designerSelfie &&
        rejectReason == other.rejectReason &&
        rejectMessage == other.rejectMessage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        isDesignerRequestStatus,
        designerRequestId,
        requestType,
        submissionDate,
        status,
        updatedAt,
        formData,
        designerSampleDesigns,
        designerSelfie,
        rejectReason,
        rejectMessage
      ]);
}

DesignerRequestsStruct createDesignerRequestsStruct({
  bool? isDesignerRequestStatus,
  String? designerRequestId,
  String? requestType,
  DateTime? submissionDate,
  String? status,
  DateTime? updatedAt,
  FormListStruct? formData,
  String? designerSelfie,
  String? rejectReason,
  String? rejectMessage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DesignerRequestsStruct(
      isDesignerRequestStatus: isDesignerRequestStatus,
      designerRequestId: designerRequestId,
      requestType: requestType,
      submissionDate: submissionDate,
      status: status,
      updatedAt: updatedAt,
      formData: formData ?? (clearUnsetFields ? FormListStruct() : null),
      designerSelfie: designerSelfie,
      rejectReason: rejectReason,
      rejectMessage: rejectMessage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DesignerRequestsStruct? updateDesignerRequestsStruct(
  DesignerRequestsStruct? designerRequests, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    designerRequests
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDesignerRequestsStructData(
  Map<String, dynamic> firestoreData,
  DesignerRequestsStruct? designerRequests,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (designerRequests == null) {
    return;
  }
  if (designerRequests.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && designerRequests.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final designerRequestsData =
      getDesignerRequestsFirestoreData(designerRequests, forFieldValue);
  final nestedData =
      designerRequestsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = designerRequests.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDesignerRequestsFirestoreData(
  DesignerRequestsStruct? designerRequests, [
  bool forFieldValue = false,
]) {
  if (designerRequests == null) {
    return {};
  }
  final firestoreData = mapToFirestore(designerRequests.toMap());

  // Handle nested data for "form_data" field.
  addFormListStructData(
    firestoreData,
    designerRequests.hasFormData() ? designerRequests.formData : null,
    'form_data',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(designerRequests.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDesignerRequestsListFirestoreData(
  List<DesignerRequestsStruct>? designerRequestss,
) =>
    designerRequestss
        ?.map((e) => getDesignerRequestsFirestoreData(e, true))
        .toList() ??
    [];
