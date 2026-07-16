// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserMembershipsStruct extends FFFirebaseStruct {
  UserMembershipsStruct({
    int? membershipId,
    int? planId,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? renewalDate,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<UserMembershipsOrderHistoryStruct>? orderHistory,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _membershipId = membershipId,
        _planId = planId,
        _startDate = startDate,
        _endDate = endDate,
        _renewalDate = renewalDate,
        _status = status,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _orderHistory = orderHistory,
        super(firestoreUtilData);

  // "membership_id" field.
  int? _membershipId;
  int get membershipId => _membershipId ?? 0;
  set membershipId(int? val) => _membershipId = val;

  void incrementMembershipId(int amount) =>
      membershipId = membershipId + amount;

  bool hasMembershipId() => _membershipId != null;

  // "plan_id" field.
  int? _planId;
  int get planId => _planId ?? 0;
  set planId(int? val) => _planId = val;

  void incrementPlanId(int amount) => planId = planId + amount;

  bool hasPlanId() => _planId != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? val) => _endDate = val;

  bool hasEndDate() => _endDate != null;

  // "renewal_date" field.
  DateTime? _renewalDate;
  DateTime? get renewalDate => _renewalDate;
  set renewalDate(DateTime? val) => _renewalDate = val;

  bool hasRenewalDate() => _renewalDate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

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

  // "order_history" field.
  List<UserMembershipsOrderHistoryStruct>? _orderHistory;
  List<UserMembershipsOrderHistoryStruct> get orderHistory =>
      _orderHistory ?? const [];
  set orderHistory(List<UserMembershipsOrderHistoryStruct>? val) =>
      _orderHistory = val;

  void updateOrderHistory(
      Function(List<UserMembershipsOrderHistoryStruct>) updateFn) {
    updateFn(_orderHistory ??= []);
  }

  bool hasOrderHistory() => _orderHistory != null;

  static UserMembershipsStruct fromMap(Map<String, dynamic> data) =>
      UserMembershipsStruct(
        membershipId: castToType<int>(data['membership_id']),
        planId: castToType<int>(data['plan_id']),
        startDate: data['start_date'] as DateTime?,
        endDate: data['end_date'] as DateTime?,
        renewalDate: data['renewal_date'] as DateTime?,
        status: data['status'] as String?,
        createdAt: data['created_at'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
        orderHistory: getStructList(
          data['order_history'],
          UserMembershipsOrderHistoryStruct.fromMap,
        ),
      );

  static UserMembershipsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserMembershipsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'membership_id': _membershipId,
        'plan_id': _planId,
        'start_date': _startDate,
        'end_date': _endDate,
        'renewal_date': _renewalDate,
        'status': _status,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'order_history': _orderHistory?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'membership_id': serializeParam(
          _membershipId,
          ParamType.int,
        ),
        'plan_id': serializeParam(
          _planId,
          ParamType.int,
        ),
        'start_date': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'end_date': serializeParam(
          _endDate,
          ParamType.DateTime,
        ),
        'renewal_date': serializeParam(
          _renewalDate,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'order_history': serializeParam(
          _orderHistory,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static UserMembershipsStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserMembershipsStruct(
        membershipId: deserializeParam(
          data['membership_id'],
          ParamType.int,
          false,
        ),
        planId: deserializeParam(
          data['plan_id'],
          ParamType.int,
          false,
        ),
        startDate: deserializeParam(
          data['start_date'],
          ParamType.DateTime,
          false,
        ),
        endDate: deserializeParam(
          data['end_date'],
          ParamType.DateTime,
          false,
        ),
        renewalDate: deserializeParam(
          data['renewal_date'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
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
        orderHistory: deserializeStructParam<UserMembershipsOrderHistoryStruct>(
          data['order_history'],
          ParamType.DataStruct,
          true,
          structBuilder: UserMembershipsOrderHistoryStruct.fromSerializableMap,
        ),
      );

  static UserMembershipsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserMembershipsStruct(
        membershipId: convertAlgoliaParam(
          data['membership_id'],
          ParamType.int,
          false,
        ),
        planId: convertAlgoliaParam(
          data['plan_id'],
          ParamType.int,
          false,
        ),
        startDate: convertAlgoliaParam(
          data['start_date'],
          ParamType.DateTime,
          false,
        ),
        endDate: convertAlgoliaParam(
          data['end_date'],
          ParamType.DateTime,
          false,
        ),
        renewalDate: convertAlgoliaParam(
          data['renewal_date'],
          ParamType.DateTime,
          false,
        ),
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
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
        orderHistory: convertAlgoliaParam<UserMembershipsOrderHistoryStruct>(
          data['order_history'],
          ParamType.DataStruct,
          true,
          structBuilder: UserMembershipsOrderHistoryStruct.fromAlgoliaData,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserMembershipsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserMembershipsStruct &&
        membershipId == other.membershipId &&
        planId == other.planId &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        renewalDate == other.renewalDate &&
        status == other.status &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        listEquality.equals(orderHistory, other.orderHistory);
  }

  @override
  int get hashCode => const ListEquality().hash([
        membershipId,
        planId,
        startDate,
        endDate,
        renewalDate,
        status,
        createdAt,
        updatedAt,
        orderHistory
      ]);
}

UserMembershipsStruct createUserMembershipsStruct({
  int? membershipId,
  int? planId,
  DateTime? startDate,
  DateTime? endDate,
  DateTime? renewalDate,
  String? status,
  DateTime? createdAt,
  DateTime? updatedAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserMembershipsStruct(
      membershipId: membershipId,
      planId: planId,
      startDate: startDate,
      endDate: endDate,
      renewalDate: renewalDate,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserMembershipsStruct? updateUserMembershipsStruct(
  UserMembershipsStruct? userMemberships, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userMemberships
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserMembershipsStructData(
  Map<String, dynamic> firestoreData,
  UserMembershipsStruct? userMemberships,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userMemberships == null) {
    return;
  }
  if (userMemberships.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userMemberships.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userMembershipsData =
      getUserMembershipsFirestoreData(userMemberships, forFieldValue);
  final nestedData =
      userMembershipsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userMemberships.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserMembershipsFirestoreData(
  UserMembershipsStruct? userMemberships, [
  bool forFieldValue = false,
]) {
  if (userMemberships == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userMemberships.toMap());

  // Add any Firestore field values
  mapToFirestore(userMemberships.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserMembershipsListFirestoreData(
  List<UserMembershipsStruct>? userMembershipss,
) =>
    userMembershipss
        ?.map((e) => getUserMembershipsFirestoreData(e, true))
        .toList() ??
    [];
