// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnquiryInfoStruct extends FFFirebaseStruct {
  EnquiryInfoStruct({
    String? enquiryId,
    String? status,
    String? requestType,
    String? issueType,
    int? affectedQuanity,
    String? fulfillStatus,
    List<String>? images,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _enquiryId = enquiryId,
        _status = status,
        _requestType = requestType,
        _issueType = issueType,
        _affectedQuanity = affectedQuanity,
        _fulfillStatus = fulfillStatus,
        _images = images,
        super(firestoreUtilData);

  // "enquiry_id" field.
  String? _enquiryId;
  String get enquiryId => _enquiryId ?? '';
  set enquiryId(String? val) => _enquiryId = val;

  bool hasEnquiryId() => _enquiryId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "request_type" field.
  String? _requestType;
  String get requestType => _requestType ?? '';
  set requestType(String? val) => _requestType = val;

  bool hasRequestType() => _requestType != null;

  // "issue_type" field.
  String? _issueType;
  String get issueType => _issueType ?? '';
  set issueType(String? val) => _issueType = val;

  bool hasIssueType() => _issueType != null;

  // "affected_quanity" field.
  int? _affectedQuanity;
  int get affectedQuanity => _affectedQuanity ?? 0;
  set affectedQuanity(int? val) => _affectedQuanity = val;

  void incrementAffectedQuanity(int amount) =>
      affectedQuanity = affectedQuanity + amount;

  bool hasAffectedQuanity() => _affectedQuanity != null;

  // "fulfill_status" field.
  String? _fulfillStatus;
  String get fulfillStatus => _fulfillStatus ?? '';
  set fulfillStatus(String? val) => _fulfillStatus = val;

  bool hasFulfillStatus() => _fulfillStatus != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  static EnquiryInfoStruct fromMap(Map<String, dynamic> data) =>
      EnquiryInfoStruct(
        enquiryId: data['enquiry_id'] as String?,
        status: data['status'] as String?,
        requestType: data['request_type'] as String?,
        issueType: data['issue_type'] as String?,
        affectedQuanity: castToType<int>(data['affected_quanity']),
        fulfillStatus: data['fulfill_status'] as String?,
        images: getDataList(data['images']),
      );

  static EnquiryInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? EnquiryInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'enquiry_id': _enquiryId,
        'status': _status,
        'request_type': _requestType,
        'issue_type': _issueType,
        'affected_quanity': _affectedQuanity,
        'fulfill_status': _fulfillStatus,
        'images': _images,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'enquiry_id': serializeParam(
          _enquiryId,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'request_type': serializeParam(
          _requestType,
          ParamType.String,
        ),
        'issue_type': serializeParam(
          _issueType,
          ParamType.String,
        ),
        'affected_quanity': serializeParam(
          _affectedQuanity,
          ParamType.int,
        ),
        'fulfill_status': serializeParam(
          _fulfillStatus,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static EnquiryInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      EnquiryInfoStruct(
        enquiryId: deserializeParam(
          data['enquiry_id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        requestType: deserializeParam(
          data['request_type'],
          ParamType.String,
          false,
        ),
        issueType: deserializeParam(
          data['issue_type'],
          ParamType.String,
          false,
        ),
        affectedQuanity: deserializeParam(
          data['affected_quanity'],
          ParamType.int,
          false,
        ),
        fulfillStatus: deserializeParam(
          data['fulfill_status'],
          ParamType.String,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
      );

  static EnquiryInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      EnquiryInfoStruct(
        enquiryId: convertAlgoliaParam(
          data['enquiry_id'],
          ParamType.String,
          false,
        ),
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        requestType: convertAlgoliaParam(
          data['request_type'],
          ParamType.String,
          false,
        ),
        issueType: convertAlgoliaParam(
          data['issue_type'],
          ParamType.String,
          false,
        ),
        affectedQuanity: convertAlgoliaParam(
          data['affected_quanity'],
          ParamType.int,
          false,
        ),
        fulfillStatus: convertAlgoliaParam(
          data['fulfill_status'],
          ParamType.String,
          false,
        ),
        images: convertAlgoliaParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'EnquiryInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is EnquiryInfoStruct &&
        enquiryId == other.enquiryId &&
        status == other.status &&
        requestType == other.requestType &&
        issueType == other.issueType &&
        affectedQuanity == other.affectedQuanity &&
        fulfillStatus == other.fulfillStatus &&
        listEquality.equals(images, other.images);
  }

  @override
  int get hashCode => const ListEquality().hash([
        enquiryId,
        status,
        requestType,
        issueType,
        affectedQuanity,
        fulfillStatus,
        images
      ]);
}

EnquiryInfoStruct createEnquiryInfoStruct({
  String? enquiryId,
  String? status,
  String? requestType,
  String? issueType,
  int? affectedQuanity,
  String? fulfillStatus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EnquiryInfoStruct(
      enquiryId: enquiryId,
      status: status,
      requestType: requestType,
      issueType: issueType,
      affectedQuanity: affectedQuanity,
      fulfillStatus: fulfillStatus,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EnquiryInfoStruct? updateEnquiryInfoStruct(
  EnquiryInfoStruct? enquiryInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    enquiryInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEnquiryInfoStructData(
  Map<String, dynamic> firestoreData,
  EnquiryInfoStruct? enquiryInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (enquiryInfo == null) {
    return;
  }
  if (enquiryInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && enquiryInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final enquiryInfoData =
      getEnquiryInfoFirestoreData(enquiryInfo, forFieldValue);
  final nestedData =
      enquiryInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = enquiryInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEnquiryInfoFirestoreData(
  EnquiryInfoStruct? enquiryInfo, [
  bool forFieldValue = false,
]) {
  if (enquiryInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(enquiryInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(enquiryInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEnquiryInfoListFirestoreData(
  List<EnquiryInfoStruct>? enquiryInfos,
) =>
    enquiryInfos?.map((e) => getEnquiryInfoFirestoreData(e, true)).toList() ??
    [];
