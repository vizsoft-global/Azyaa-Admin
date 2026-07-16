// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserBodyStruct extends FFFirebaseStruct {
  UserBodyStruct({
    int? relationId,
    String? userName,
    String? relationName,
    UserBodyInfoStruct? bodyInfo,
    bool? isDefault,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _relationId = relationId,
        _userName = userName,
        _relationName = relationName,
        _bodyInfo = bodyInfo,
        _isDefault = isDefault,
        super(firestoreUtilData);

  // "relation_id" field.
  int? _relationId;
  int get relationId => _relationId ?? 0;
  set relationId(int? val) => _relationId = val;

  void incrementRelationId(int amount) => relationId = relationId + amount;

  bool hasRelationId() => _relationId != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "relation_name" field.
  String? _relationName;
  String get relationName => _relationName ?? '';
  set relationName(String? val) => _relationName = val;

  bool hasRelationName() => _relationName != null;

  // "body_info" field.
  UserBodyInfoStruct? _bodyInfo;
  UserBodyInfoStruct get bodyInfo => _bodyInfo ?? UserBodyInfoStruct();
  set bodyInfo(UserBodyInfoStruct? val) => _bodyInfo = val;

  void updateBodyInfo(Function(UserBodyInfoStruct) updateFn) {
    updateFn(_bodyInfo ??= UserBodyInfoStruct());
  }

  bool hasBodyInfo() => _bodyInfo != null;

  // "is_default" field.
  bool? _isDefault;
  bool get isDefault => _isDefault ?? false;
  set isDefault(bool? val) => _isDefault = val;

  bool hasIsDefault() => _isDefault != null;

  static UserBodyStruct fromMap(Map<String, dynamic> data) => UserBodyStruct(
        relationId: castToType<int>(data['relation_id']),
        userName: data['user_name'] as String?,
        relationName: data['relation_name'] as String?,
        bodyInfo: data['body_info'] is UserBodyInfoStruct
            ? data['body_info']
            : UserBodyInfoStruct.maybeFromMap(data['body_info']),
        isDefault: data['is_default'] as bool?,
      );

  static UserBodyStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserBodyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'relation_id': _relationId,
        'user_name': _userName,
        'relation_name': _relationName,
        'body_info': _bodyInfo?.toMap(),
        'is_default': _isDefault,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'relation_id': serializeParam(
          _relationId,
          ParamType.int,
        ),
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'relation_name': serializeParam(
          _relationName,
          ParamType.String,
        ),
        'body_info': serializeParam(
          _bodyInfo,
          ParamType.DataStruct,
        ),
        'is_default': serializeParam(
          _isDefault,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserBodyStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserBodyStruct(
        relationId: deserializeParam(
          data['relation_id'],
          ParamType.int,
          false,
        ),
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        relationName: deserializeParam(
          data['relation_name'],
          ParamType.String,
          false,
        ),
        bodyInfo: deserializeStructParam(
          data['body_info'],
          ParamType.DataStruct,
          false,
          structBuilder: UserBodyInfoStruct.fromSerializableMap,
        ),
        isDefault: deserializeParam(
          data['is_default'],
          ParamType.bool,
          false,
        ),
      );

  static UserBodyStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserBodyStruct(
        relationId: convertAlgoliaParam(
          data['relation_id'],
          ParamType.int,
          false,
        ),
        userName: convertAlgoliaParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        relationName: convertAlgoliaParam(
          data['relation_name'],
          ParamType.String,
          false,
        ),
        bodyInfo: convertAlgoliaParam(
          data['body_info'],
          ParamType.DataStruct,
          false,
          structBuilder: UserBodyInfoStruct.fromAlgoliaData,
        ),
        isDefault: convertAlgoliaParam(
          data['is_default'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserBodyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserBodyStruct &&
        relationId == other.relationId &&
        userName == other.userName &&
        relationName == other.relationName &&
        bodyInfo == other.bodyInfo &&
        isDefault == other.isDefault;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([relationId, userName, relationName, bodyInfo, isDefault]);
}

UserBodyStruct createUserBodyStruct({
  int? relationId,
  String? userName,
  String? relationName,
  UserBodyInfoStruct? bodyInfo,
  bool? isDefault,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserBodyStruct(
      relationId: relationId,
      userName: userName,
      relationName: relationName,
      bodyInfo: bodyInfo ?? (clearUnsetFields ? UserBodyInfoStruct() : null),
      isDefault: isDefault,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserBodyStruct? updateUserBodyStruct(
  UserBodyStruct? userBody, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userBody
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserBodyStructData(
  Map<String, dynamic> firestoreData,
  UserBodyStruct? userBody,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userBody == null) {
    return;
  }
  if (userBody.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userBody.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userBodyData = getUserBodyFirestoreData(userBody, forFieldValue);
  final nestedData = userBodyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userBody.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserBodyFirestoreData(
  UserBodyStruct? userBody, [
  bool forFieldValue = false,
]) {
  if (userBody == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userBody.toMap());

  // Handle nested data for "body_info" field.
  addUserBodyInfoStructData(
    firestoreData,
    userBody.hasBodyInfo() ? userBody.bodyInfo : null,
    'body_info',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(userBody.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserBodyListFirestoreData(
  List<UserBodyStruct>? userBodys,
) =>
    userBodys?.map((e) => getUserBodyFirestoreData(e, true)).toList() ?? [];
