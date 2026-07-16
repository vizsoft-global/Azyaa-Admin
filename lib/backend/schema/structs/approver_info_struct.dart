// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ApproverInfoStruct extends FFFirebaseStruct {
  ApproverInfoStruct({
    String? userEmail,
    DocumentReference? userRef,
    String? uid,
    String? userName,
    String? userRole,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userEmail = userEmail,
        _userRef = userRef,
        _uid = uid,
        _userName = userName,
        _userRole = userRole,
        super(firestoreUtilData);

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  set userEmail(String? val) => _userEmail = val;

  bool hasUserEmail() => _userEmail != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;

  bool hasUserRef() => _userRef != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "user_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  set userRole(String? val) => _userRole = val;

  bool hasUserRole() => _userRole != null;

  static ApproverInfoStruct fromMap(Map<String, dynamic> data) =>
      ApproverInfoStruct(
        userEmail: data['user_email'] as String?,
        userRef: data['user_ref'] as DocumentReference?,
        uid: data['uid'] as String?,
        userName: data['user_name'] as String?,
        userRole: data['user_role'] as String?,
      );

  static ApproverInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? ApproverInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_email': _userEmail,
        'user_ref': _userRef,
        'uid': _uid,
        'user_name': _userName,
        'user_role': _userRole,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_email': serializeParam(
          _userEmail,
          ParamType.String,
        ),
        'user_ref': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'user_role': serializeParam(
          _userRole,
          ParamType.String,
        ),
      }.withoutNulls;

  static ApproverInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ApproverInfoStruct(
        userEmail: deserializeParam(
          data['user_email'],
          ParamType.String,
          false,
        ),
        userRef: deserializeParam(
          data['user_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        userRole: deserializeParam(
          data['user_role'],
          ParamType.String,
          false,
        ),
      );

  static ApproverInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ApproverInfoStruct(
        userEmail: convertAlgoliaParam(
          data['user_email'],
          ParamType.String,
          false,
        ),
        userRef: convertAlgoliaParam(
          data['user_ref'],
          ParamType.DocumentReference,
          false,
        ),
        uid: convertAlgoliaParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        userName: convertAlgoliaParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        userRole: convertAlgoliaParam(
          data['user_role'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ApproverInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ApproverInfoStruct &&
        userEmail == other.userEmail &&
        userRef == other.userRef &&
        uid == other.uid &&
        userName == other.userName &&
        userRole == other.userRole;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([userEmail, userRef, uid, userName, userRole]);
}

ApproverInfoStruct createApproverInfoStruct({
  String? userEmail,
  DocumentReference? userRef,
  String? uid,
  String? userName,
  String? userRole,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ApproverInfoStruct(
      userEmail: userEmail,
      userRef: userRef,
      uid: uid,
      userName: userName,
      userRole: userRole,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ApproverInfoStruct? updateApproverInfoStruct(
  ApproverInfoStruct? approverInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    approverInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addApproverInfoStructData(
  Map<String, dynamic> firestoreData,
  ApproverInfoStruct? approverInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (approverInfo == null) {
    return;
  }
  if (approverInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && approverInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final approverInfoData =
      getApproverInfoFirestoreData(approverInfo, forFieldValue);
  final nestedData =
      approverInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = approverInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getApproverInfoFirestoreData(
  ApproverInfoStruct? approverInfo, [
  bool forFieldValue = false,
]) {
  if (approverInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(approverInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(approverInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getApproverInfoListFirestoreData(
  List<ApproverInfoStruct>? approverInfos,
) =>
    approverInfos?.map((e) => getApproverInfoFirestoreData(e, true)).toList() ??
    [];
