// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserVirtualtryonStruct extends FFFirebaseStruct {
  UserVirtualtryonStruct({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? userVtoCreditPoints,
    List<String>? userVtoHistory,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdAt = createdAt,
        _updatedAt = updatedAt,
        _userVtoCreditPoints = userVtoCreditPoints,
        _userVtoHistory = userVtoHistory,
        super(firestoreUtilData);

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "user_vto_credit_points" field.
  int? _userVtoCreditPoints;
  int get userVtoCreditPoints => _userVtoCreditPoints ?? 0;
  set userVtoCreditPoints(int? val) => _userVtoCreditPoints = val;

  void incrementUserVtoCreditPoints(int amount) =>
      userVtoCreditPoints = userVtoCreditPoints + amount;

  bool hasUserVtoCreditPoints() => _userVtoCreditPoints != null;

  // "user_vto_history" field.
  List<String>? _userVtoHistory;
  List<String> get userVtoHistory => _userVtoHistory ?? const [];
  set userVtoHistory(List<String>? val) => _userVtoHistory = val;

  void updateUserVtoHistory(Function(List<String>) updateFn) {
    updateFn(_userVtoHistory ??= []);
  }

  bool hasUserVtoHistory() => _userVtoHistory != null;

  static UserVirtualtryonStruct fromMap(Map<String, dynamic> data) =>
      UserVirtualtryonStruct(
        createdAt: data['createdAt'] as DateTime?,
        updatedAt: data['updatedAt'] as DateTime?,
        userVtoCreditPoints: castToType<int>(data['user_vto_credit_points']),
        userVtoHistory: getDataList(data['user_vto_history']),
      );

  static UserVirtualtryonStruct? maybeFromMap(dynamic data) => data is Map
      ? UserVirtualtryonStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'createdAt': _createdAt,
        'updatedAt': _updatedAt,
        'user_vto_credit_points': _userVtoCreditPoints,
        'user_vto_history': _userVtoHistory,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updatedAt': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'user_vto_credit_points': serializeParam(
          _userVtoCreditPoints,
          ParamType.int,
        ),
        'user_vto_history': serializeParam(
          _userVtoHistory,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static UserVirtualtryonStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserVirtualtryonStruct(
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: deserializeParam(
          data['updatedAt'],
          ParamType.DateTime,
          false,
        ),
        userVtoCreditPoints: deserializeParam(
          data['user_vto_credit_points'],
          ParamType.int,
          false,
        ),
        userVtoHistory: deserializeParam<String>(
          data['user_vto_history'],
          ParamType.String,
          true,
        ),
      );

  static UserVirtualtryonStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserVirtualtryonStruct(
        createdAt: convertAlgoliaParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        updatedAt: convertAlgoliaParam(
          data['updatedAt'],
          ParamType.DateTime,
          false,
        ),
        userVtoCreditPoints: convertAlgoliaParam(
          data['user_vto_credit_points'],
          ParamType.int,
          false,
        ),
        userVtoHistory: convertAlgoliaParam<String>(
          data['user_vto_history'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserVirtualtryonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserVirtualtryonStruct &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        userVtoCreditPoints == other.userVtoCreditPoints &&
        listEquality.equals(userVtoHistory, other.userVtoHistory);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([createdAt, updatedAt, userVtoCreditPoints, userVtoHistory]);
}

UserVirtualtryonStruct createUserVirtualtryonStruct({
  DateTime? createdAt,
  DateTime? updatedAt,
  int? userVtoCreditPoints,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserVirtualtryonStruct(
      createdAt: createdAt,
      updatedAt: updatedAt,
      userVtoCreditPoints: userVtoCreditPoints,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserVirtualtryonStruct? updateUserVirtualtryonStruct(
  UserVirtualtryonStruct? userVirtualtryon, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userVirtualtryon
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserVirtualtryonStructData(
  Map<String, dynamic> firestoreData,
  UserVirtualtryonStruct? userVirtualtryon,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userVirtualtryon == null) {
    return;
  }
  if (userVirtualtryon.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userVirtualtryon.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userVirtualtryonData =
      getUserVirtualtryonFirestoreData(userVirtualtryon, forFieldValue);
  final nestedData =
      userVirtualtryonData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userVirtualtryon.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserVirtualtryonFirestoreData(
  UserVirtualtryonStruct? userVirtualtryon, [
  bool forFieldValue = false,
]) {
  if (userVirtualtryon == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userVirtualtryon.toMap());

  // Add any Firestore field values
  mapToFirestore(userVirtualtryon.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserVirtualtryonListFirestoreData(
  List<UserVirtualtryonStruct>? userVirtualtryons,
) =>
    userVirtualtryons
        ?.map((e) => getUserVirtualtryonFirestoreData(e, true))
        .toList() ??
    [];
