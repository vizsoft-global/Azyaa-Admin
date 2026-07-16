// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserLoyaltyStruct extends FFFirebaseStruct {
  UserLoyaltyStruct({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? loyaltyTotalPoint,
    int? loyaltyPresentPoint,
    int? loyaltySpentPoint,
    List<UserLoyaltyHistoryStruct>? loyaltyHistory,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdAt = createdAt,
        _updatedAt = updatedAt,
        _loyaltyTotalPoint = loyaltyTotalPoint,
        _loyaltyPresentPoint = loyaltyPresentPoint,
        _loyaltySpentPoint = loyaltySpentPoint,
        _loyaltyHistory = loyaltyHistory,
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

  // "loyalty_total_point" field.
  int? _loyaltyTotalPoint;
  int get loyaltyTotalPoint => _loyaltyTotalPoint ?? 0;
  set loyaltyTotalPoint(int? val) => _loyaltyTotalPoint = val;

  void incrementLoyaltyTotalPoint(int amount) =>
      loyaltyTotalPoint = loyaltyTotalPoint + amount;

  bool hasLoyaltyTotalPoint() => _loyaltyTotalPoint != null;

  // "loyalty_present_point" field.
  int? _loyaltyPresentPoint;
  int get loyaltyPresentPoint => _loyaltyPresentPoint ?? 0;
  set loyaltyPresentPoint(int? val) => _loyaltyPresentPoint = val;

  void incrementLoyaltyPresentPoint(int amount) =>
      loyaltyPresentPoint = loyaltyPresentPoint + amount;

  bool hasLoyaltyPresentPoint() => _loyaltyPresentPoint != null;

  // "loyalty_spent_point" field.
  int? _loyaltySpentPoint;
  int get loyaltySpentPoint => _loyaltySpentPoint ?? 0;
  set loyaltySpentPoint(int? val) => _loyaltySpentPoint = val;

  void incrementLoyaltySpentPoint(int amount) =>
      loyaltySpentPoint = loyaltySpentPoint + amount;

  bool hasLoyaltySpentPoint() => _loyaltySpentPoint != null;

  // "loyalty_history" field.
  List<UserLoyaltyHistoryStruct>? _loyaltyHistory;
  List<UserLoyaltyHistoryStruct> get loyaltyHistory =>
      _loyaltyHistory ?? const [];
  set loyaltyHistory(List<UserLoyaltyHistoryStruct>? val) =>
      _loyaltyHistory = val;

  void updateLoyaltyHistory(Function(List<UserLoyaltyHistoryStruct>) updateFn) {
    updateFn(_loyaltyHistory ??= []);
  }

  bool hasLoyaltyHistory() => _loyaltyHistory != null;

  static UserLoyaltyStruct fromMap(Map<String, dynamic> data) =>
      UserLoyaltyStruct(
        createdAt: data['created_at'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
        loyaltyTotalPoint: castToType<int>(data['loyalty_total_point']),
        loyaltyPresentPoint: castToType<int>(data['loyalty_present_point']),
        loyaltySpentPoint: castToType<int>(data['loyalty_spent_point']),
        loyaltyHistory: getStructList(
          data['loyalty_history'],
          UserLoyaltyHistoryStruct.fromMap,
        ),
      );

  static UserLoyaltyStruct? maybeFromMap(dynamic data) => data is Map
      ? UserLoyaltyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'loyalty_total_point': _loyaltyTotalPoint,
        'loyalty_present_point': _loyaltyPresentPoint,
        'loyalty_spent_point': _loyaltySpentPoint,
        'loyalty_history': _loyaltyHistory?.map((e) => e.toMap()).toList(),
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
        'loyalty_total_point': serializeParam(
          _loyaltyTotalPoint,
          ParamType.int,
        ),
        'loyalty_present_point': serializeParam(
          _loyaltyPresentPoint,
          ParamType.int,
        ),
        'loyalty_spent_point': serializeParam(
          _loyaltySpentPoint,
          ParamType.int,
        ),
        'loyalty_history': serializeParam(
          _loyaltyHistory,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static UserLoyaltyStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserLoyaltyStruct(
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
        loyaltyTotalPoint: deserializeParam(
          data['loyalty_total_point'],
          ParamType.int,
          false,
        ),
        loyaltyPresentPoint: deserializeParam(
          data['loyalty_present_point'],
          ParamType.int,
          false,
        ),
        loyaltySpentPoint: deserializeParam(
          data['loyalty_spent_point'],
          ParamType.int,
          false,
        ),
        loyaltyHistory: deserializeStructParam<UserLoyaltyHistoryStruct>(
          data['loyalty_history'],
          ParamType.DataStruct,
          true,
          structBuilder: UserLoyaltyHistoryStruct.fromSerializableMap,
        ),
      );

  static UserLoyaltyStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserLoyaltyStruct(
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
        loyaltyTotalPoint: convertAlgoliaParam(
          data['loyalty_total_point'],
          ParamType.int,
          false,
        ),
        loyaltyPresentPoint: convertAlgoliaParam(
          data['loyalty_present_point'],
          ParamType.int,
          false,
        ),
        loyaltySpentPoint: convertAlgoliaParam(
          data['loyalty_spent_point'],
          ParamType.int,
          false,
        ),
        loyaltyHistory: convertAlgoliaParam<UserLoyaltyHistoryStruct>(
          data['loyalty_history'],
          ParamType.DataStruct,
          true,
          structBuilder: UserLoyaltyHistoryStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserLoyaltyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserLoyaltyStruct &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        loyaltyTotalPoint == other.loyaltyTotalPoint &&
        loyaltyPresentPoint == other.loyaltyPresentPoint &&
        loyaltySpentPoint == other.loyaltySpentPoint &&
        listEquality.equals(loyaltyHistory, other.loyaltyHistory);
  }

  @override
  int get hashCode => const ListEquality().hash([
        createdAt,
        updatedAt,
        loyaltyTotalPoint,
        loyaltyPresentPoint,
        loyaltySpentPoint,
        loyaltyHistory
      ]);
}

UserLoyaltyStruct createUserLoyaltyStruct({
  DateTime? createdAt,
  DateTime? updatedAt,
  int? loyaltyTotalPoint,
  int? loyaltyPresentPoint,
  int? loyaltySpentPoint,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserLoyaltyStruct(
      createdAt: createdAt,
      updatedAt: updatedAt,
      loyaltyTotalPoint: loyaltyTotalPoint,
      loyaltyPresentPoint: loyaltyPresentPoint,
      loyaltySpentPoint: loyaltySpentPoint,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserLoyaltyStruct? updateUserLoyaltyStruct(
  UserLoyaltyStruct? userLoyalty, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userLoyalty
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserLoyaltyStructData(
  Map<String, dynamic> firestoreData,
  UserLoyaltyStruct? userLoyalty,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userLoyalty == null) {
    return;
  }
  if (userLoyalty.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userLoyalty.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userLoyaltyData =
      getUserLoyaltyFirestoreData(userLoyalty, forFieldValue);
  final nestedData =
      userLoyaltyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userLoyalty.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserLoyaltyFirestoreData(
  UserLoyaltyStruct? userLoyalty, [
  bool forFieldValue = false,
]) {
  if (userLoyalty == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userLoyalty.toMap());

  // Add any Firestore field values
  mapToFirestore(userLoyalty.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserLoyaltyListFirestoreData(
  List<UserLoyaltyStruct>? userLoyaltys,
) =>
    userLoyaltys?.map((e) => getUserLoyaltyFirestoreData(e, true)).toList() ??
    [];
