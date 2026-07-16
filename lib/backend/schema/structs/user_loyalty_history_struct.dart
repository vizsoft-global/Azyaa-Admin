// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserLoyaltyHistoryStruct extends FFFirebaseStruct {
  UserLoyaltyHistoryStruct({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? status,
    int? loyaltyHistoryId,
    String? transactionStatus,
    double? mainLoyaltyRupee,
    int? mainLoyaltyPoint,
    double? orderCartTotal,
    int? orderLoyalPoint,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdAt = createdAt,
        _updatedAt = updatedAt,
        _status = status,
        _loyaltyHistoryId = loyaltyHistoryId,
        _transactionStatus = transactionStatus,
        _mainLoyaltyRupee = mainLoyaltyRupee,
        _mainLoyaltyPoint = mainLoyaltyPoint,
        _orderCartTotal = orderCartTotal,
        _orderLoyalPoint = orderLoyalPoint,
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

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "loyalty_history_id" field.
  int? _loyaltyHistoryId;
  int get loyaltyHistoryId => _loyaltyHistoryId ?? 0;
  set loyaltyHistoryId(int? val) => _loyaltyHistoryId = val;

  void incrementLoyaltyHistoryId(int amount) =>
      loyaltyHistoryId = loyaltyHistoryId + amount;

  bool hasLoyaltyHistoryId() => _loyaltyHistoryId != null;

  // "transaction_status" field.
  String? _transactionStatus;
  String get transactionStatus => _transactionStatus ?? '';
  set transactionStatus(String? val) => _transactionStatus = val;

  bool hasTransactionStatus() => _transactionStatus != null;

  // "main_loyalty_rupee" field.
  double? _mainLoyaltyRupee;
  double get mainLoyaltyRupee => _mainLoyaltyRupee ?? 0.0;
  set mainLoyaltyRupee(double? val) => _mainLoyaltyRupee = val;

  void incrementMainLoyaltyRupee(double amount) =>
      mainLoyaltyRupee = mainLoyaltyRupee + amount;

  bool hasMainLoyaltyRupee() => _mainLoyaltyRupee != null;

  // "main_loyalty_point" field.
  int? _mainLoyaltyPoint;
  int get mainLoyaltyPoint => _mainLoyaltyPoint ?? 0;
  set mainLoyaltyPoint(int? val) => _mainLoyaltyPoint = val;

  void incrementMainLoyaltyPoint(int amount) =>
      mainLoyaltyPoint = mainLoyaltyPoint + amount;

  bool hasMainLoyaltyPoint() => _mainLoyaltyPoint != null;

  // "order_cart_total" field.
  double? _orderCartTotal;
  double get orderCartTotal => _orderCartTotal ?? 0.0;
  set orderCartTotal(double? val) => _orderCartTotal = val;

  void incrementOrderCartTotal(double amount) =>
      orderCartTotal = orderCartTotal + amount;

  bool hasOrderCartTotal() => _orderCartTotal != null;

  // "order_loyal_point" field.
  int? _orderLoyalPoint;
  int get orderLoyalPoint => _orderLoyalPoint ?? 0;
  set orderLoyalPoint(int? val) => _orderLoyalPoint = val;

  void incrementOrderLoyalPoint(int amount) =>
      orderLoyalPoint = orderLoyalPoint + amount;

  bool hasOrderLoyalPoint() => _orderLoyalPoint != null;

  static UserLoyaltyHistoryStruct fromMap(Map<String, dynamic> data) =>
      UserLoyaltyHistoryStruct(
        createdAt: data['created_at'] as DateTime?,
        updatedAt: data['updated_at'] as DateTime?,
        status: data['status'] as String?,
        loyaltyHistoryId: castToType<int>(data['loyalty_history_id']),
        transactionStatus: data['transaction_status'] as String?,
        mainLoyaltyRupee: castToType<double>(data['main_loyalty_rupee']),
        mainLoyaltyPoint: castToType<int>(data['main_loyalty_point']),
        orderCartTotal: castToType<double>(data['order_cart_total']),
        orderLoyalPoint: castToType<int>(data['order_loyal_point']),
      );

  static UserLoyaltyHistoryStruct? maybeFromMap(dynamic data) => data is Map
      ? UserLoyaltyHistoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'status': _status,
        'loyalty_history_id': _loyaltyHistoryId,
        'transaction_status': _transactionStatus,
        'main_loyalty_rupee': _mainLoyaltyRupee,
        'main_loyalty_point': _mainLoyaltyPoint,
        'order_cart_total': _orderCartTotal,
        'order_loyal_point': _orderLoyalPoint,
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
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'loyalty_history_id': serializeParam(
          _loyaltyHistoryId,
          ParamType.int,
        ),
        'transaction_status': serializeParam(
          _transactionStatus,
          ParamType.String,
        ),
        'main_loyalty_rupee': serializeParam(
          _mainLoyaltyRupee,
          ParamType.double,
        ),
        'main_loyalty_point': serializeParam(
          _mainLoyaltyPoint,
          ParamType.int,
        ),
        'order_cart_total': serializeParam(
          _orderCartTotal,
          ParamType.double,
        ),
        'order_loyal_point': serializeParam(
          _orderLoyalPoint,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserLoyaltyHistoryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserLoyaltyHistoryStruct(
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
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        loyaltyHistoryId: deserializeParam(
          data['loyalty_history_id'],
          ParamType.int,
          false,
        ),
        transactionStatus: deserializeParam(
          data['transaction_status'],
          ParamType.String,
          false,
        ),
        mainLoyaltyRupee: deserializeParam(
          data['main_loyalty_rupee'],
          ParamType.double,
          false,
        ),
        mainLoyaltyPoint: deserializeParam(
          data['main_loyalty_point'],
          ParamType.int,
          false,
        ),
        orderCartTotal: deserializeParam(
          data['order_cart_total'],
          ParamType.double,
          false,
        ),
        orderLoyalPoint: deserializeParam(
          data['order_loyal_point'],
          ParamType.int,
          false,
        ),
      );

  static UserLoyaltyHistoryStruct fromAlgoliaData(Map<String, dynamic> data) =>
      UserLoyaltyHistoryStruct(
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
        status: convertAlgoliaParam(
          data['status'],
          ParamType.String,
          false,
        ),
        loyaltyHistoryId: convertAlgoliaParam(
          data['loyalty_history_id'],
          ParamType.int,
          false,
        ),
        transactionStatus: convertAlgoliaParam(
          data['transaction_status'],
          ParamType.String,
          false,
        ),
        mainLoyaltyRupee: convertAlgoliaParam(
          data['main_loyalty_rupee'],
          ParamType.double,
          false,
        ),
        mainLoyaltyPoint: convertAlgoliaParam(
          data['main_loyalty_point'],
          ParamType.int,
          false,
        ),
        orderCartTotal: convertAlgoliaParam(
          data['order_cart_total'],
          ParamType.double,
          false,
        ),
        orderLoyalPoint: convertAlgoliaParam(
          data['order_loyal_point'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserLoyaltyHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserLoyaltyHistoryStruct &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        status == other.status &&
        loyaltyHistoryId == other.loyaltyHistoryId &&
        transactionStatus == other.transactionStatus &&
        mainLoyaltyRupee == other.mainLoyaltyRupee &&
        mainLoyaltyPoint == other.mainLoyaltyPoint &&
        orderCartTotal == other.orderCartTotal &&
        orderLoyalPoint == other.orderLoyalPoint;
  }

  @override
  int get hashCode => const ListEquality().hash([
        createdAt,
        updatedAt,
        status,
        loyaltyHistoryId,
        transactionStatus,
        mainLoyaltyRupee,
        mainLoyaltyPoint,
        orderCartTotal,
        orderLoyalPoint
      ]);
}

UserLoyaltyHistoryStruct createUserLoyaltyHistoryStruct({
  DateTime? createdAt,
  DateTime? updatedAt,
  String? status,
  int? loyaltyHistoryId,
  String? transactionStatus,
  double? mainLoyaltyRupee,
  int? mainLoyaltyPoint,
  double? orderCartTotal,
  int? orderLoyalPoint,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserLoyaltyHistoryStruct(
      createdAt: createdAt,
      updatedAt: updatedAt,
      status: status,
      loyaltyHistoryId: loyaltyHistoryId,
      transactionStatus: transactionStatus,
      mainLoyaltyRupee: mainLoyaltyRupee,
      mainLoyaltyPoint: mainLoyaltyPoint,
      orderCartTotal: orderCartTotal,
      orderLoyalPoint: orderLoyalPoint,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserLoyaltyHistoryStruct? updateUserLoyaltyHistoryStruct(
  UserLoyaltyHistoryStruct? userLoyaltyHistory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userLoyaltyHistory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserLoyaltyHistoryStructData(
  Map<String, dynamic> firestoreData,
  UserLoyaltyHistoryStruct? userLoyaltyHistory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userLoyaltyHistory == null) {
    return;
  }
  if (userLoyaltyHistory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userLoyaltyHistory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userLoyaltyHistoryData =
      getUserLoyaltyHistoryFirestoreData(userLoyaltyHistory, forFieldValue);
  final nestedData =
      userLoyaltyHistoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userLoyaltyHistory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserLoyaltyHistoryFirestoreData(
  UserLoyaltyHistoryStruct? userLoyaltyHistory, [
  bool forFieldValue = false,
]) {
  if (userLoyaltyHistory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userLoyaltyHistory.toMap());

  // Add any Firestore field values
  mapToFirestore(userLoyaltyHistory.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserLoyaltyHistoryListFirestoreData(
  List<UserLoyaltyHistoryStruct>? userLoyaltyHistorys,
) =>
    userLoyaltyHistorys
        ?.map((e) => getUserLoyaltyHistoryFirestoreData(e, true))
        .toList() ??
    [];
