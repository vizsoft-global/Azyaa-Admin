// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SettingsAppAccessDataStruct extends FFFirebaseStruct {
  SettingsAppAccessDataStruct({
    DateTime? createdAt,
    DateTime? updatedAt,
    DocumentReference? createdBy,
    String? code,
    String? status,
    DateTime? validity,

    /// optless id
    String? requestId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdAt = createdAt,
        _updatedAt = updatedAt,
        _createdBy = createdBy,
        _code = code,
        _status = status,
        _validity = validity,
        _requestId = requestId,
        super(firestoreUtilData);

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  set createdBy(DocumentReference? val) => _createdBy = val;

  bool hasCreatedBy() => _createdBy != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "validity" field.
  DateTime? _validity;
  DateTime? get validity => _validity;
  set validity(DateTime? val) => _validity = val;

  bool hasValidity() => _validity != null;

  // "requestId" field.
  String? _requestId;
  String get requestId => _requestId ?? '';
  set requestId(String? val) => _requestId = val;

  bool hasRequestId() => _requestId != null;

  static SettingsAppAccessDataStruct fromMap(Map<String, dynamic> data) =>
      SettingsAppAccessDataStruct(
        createdAt: data['created_at'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
        createdBy: data['created_by'] as DocumentReference?,
        code: data['code'] as String?,
        status: data['status'] as String?,
        validity: data['validity'] as DateTime?,
        requestId: data['requestId'] as String?,
      );

  static SettingsAppAccessDataStruct? maybeFromMap(dynamic data) => data is Map
      ? SettingsAppAccessDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'created_by': _createdBy,
        'code': _code,
        'status': _status,
        'validity': _validity,
        'requestId': _requestId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'created_by': serializeParam(
          _createdBy,
          ParamType.DocumentReference,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'validity': serializeParam(
          _validity,
          ParamType.DateTime,
        ),
        'requestId': serializeParam(
          _requestId,
          ParamType.String,
        ),
      }.withoutNulls;

  static SettingsAppAccessDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SettingsAppAccessDataStruct(
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        createdBy: deserializeParam(
          data['created_by'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        validity: deserializeParam(
          data['validity'],
          ParamType.DateTime,
          false,
        ),
        requestId: deserializeParam(
          data['requestId'],
          ParamType.String,
          false,
        ),
      );

  static SettingsAppAccessDataStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      SettingsAppAccessDataStruct(
        createdAt: convertAlgoliaParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: convertAlgoliaParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        createdBy: convertAlgoliaParam(
          data['created_by'],
          ParamType.DocumentReference,
          false,
        ),
        code: convertAlgoliaParam(
          data['code'],
          ParamType.String,
          false,
        ),
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        validity: convertAlgoliaParam(
          data['validity'],
          ParamType.DateTime,
          false,
        ),
        requestId: convertAlgoliaParam(
          data['requestId'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SettingsAppAccessDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingsAppAccessDataStruct &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        createdBy == other.createdBy &&
        code == other.code &&
        status == other.status &&
        validity == other.validity &&
        requestId == other.requestId;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [createdAt, updatedAt, createdBy, code, status, validity, requestId]);
}

SettingsAppAccessDataStruct createSettingsAppAccessDataStruct({
  DateTime? createdAt,
  DateTime? updatedAt,
  DocumentReference? createdBy,
  String? code,
  String? status,
  DateTime? validity,
  String? requestId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsAppAccessDataStruct(
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      code: code,
      status: status,
      validity: validity,
      requestId: requestId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsAppAccessDataStruct? updateSettingsAppAccessDataStruct(
  SettingsAppAccessDataStruct? settingsAppAccessData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settingsAppAccessData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingsAppAccessDataStructData(
  Map<String, dynamic> firestoreData,
  SettingsAppAccessDataStruct? settingsAppAccessData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settingsAppAccessData == null) {
    return;
  }
  if (settingsAppAccessData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      settingsAppAccessData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsAppAccessDataData = getSettingsAppAccessDataFirestoreData(
      settingsAppAccessData, forFieldValue);
  final nestedData =
      settingsAppAccessDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      settingsAppAccessData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsAppAccessDataFirestoreData(
  SettingsAppAccessDataStruct? settingsAppAccessData, [
  bool forFieldValue = false,
]) {
  if (settingsAppAccessData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settingsAppAccessData.toMap());

  // Add any Firestore field values
  mapToFirestore(settingsAppAccessData.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsAppAccessDataListFirestoreData(
  List<SettingsAppAccessDataStruct>? settingsAppAccessDatas,
) =>
    settingsAppAccessDatas
        ?.map((e) => getSettingsAppAccessDataFirestoreData(e, true))
        .toList() ??
    [];
