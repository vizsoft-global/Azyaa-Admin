// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserInfoStruct extends FFFirebaseStruct {
  UserInfoStruct({
    String? name,
    String? email,
    String? phoneNumber,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _email = email,
        _phoneNumber = phoneNumber,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  static UserInfoStruct fromMap(Map<String, dynamic> data) => UserInfoStruct(
        name: data['name'] as String?,
        email: data['email'] as String?,
        phoneNumber: data['phone_number'] as String?,
      );

  static UserInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'email': _email,
        'phone_number': _phoneNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserInfoStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
      );

  static UserInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserInfoStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: convertAlgoliaParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phoneNumber: convertAlgoliaParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserInfoStruct &&
        name == other.name &&
        email == other.email &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode => const ListEquality().hash([name, email, phoneNumber]);
}

UserInfoStruct createUserInfoStruct({
  String? name,
  String? email,
  String? phoneNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserInfoStruct(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserInfoStruct? updateUserInfoStruct(
  UserInfoStruct? userInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserInfoStructData(
  Map<String, dynamic> firestoreData,
  UserInfoStruct? userInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userInfo == null) {
    return;
  }
  if (userInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userInfoData = getUserInfoFirestoreData(userInfo, forFieldValue);
  final nestedData = userInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserInfoFirestoreData(
  UserInfoStruct? userInfo, [
  bool forFieldValue = false,
]) {
  if (userInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userInfo.toMap());

  // Add any Firestore field values
  mapToFirestore(userInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserInfoListFirestoreData(
  List<UserInfoStruct>? userInfos,
) =>
    userInfos?.map((e) => getUserInfoFirestoreData(e, true)).toList() ?? [];
