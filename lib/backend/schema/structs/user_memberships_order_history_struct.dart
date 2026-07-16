// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserMembershipsOrderHistoryStruct extends FFFirebaseStruct {
  UserMembershipsOrderHistoryStruct({
    String? orderId,
    int? planId,
    String? planName,
    DateTime? purchaseDate,
    double? amountPaid,
    String? currency,
    String? paymentMethod,
    String? paymentId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _orderId = orderId,
        _planId = planId,
        _planName = planName,
        _purchaseDate = purchaseDate,
        _amountPaid = amountPaid,
        _currency = currency,
        _paymentMethod = paymentMethod,
        _paymentId = paymentId,
        super(firestoreUtilData);

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  set orderId(String? val) => _orderId = val;

  bool hasOrderId() => _orderId != null;

  // "plan_id" field.
  int? _planId;
  int get planId => _planId ?? 0;
  set planId(int? val) => _planId = val;

  void incrementPlanId(int amount) => planId = planId + amount;

  bool hasPlanId() => _planId != null;

  // "plan_name" field.
  String? _planName;
  String get planName => _planName ?? '';
  set planName(String? val) => _planName = val;

  bool hasPlanName() => _planName != null;

  // "purchase_date" field.
  DateTime? _purchaseDate;
  DateTime? get purchaseDate => _purchaseDate;
  set purchaseDate(DateTime? val) => _purchaseDate = val;

  bool hasPurchaseDate() => _purchaseDate != null;

  // "amount_paid" field.
  double? _amountPaid;
  double get amountPaid => _amountPaid ?? 0.0;
  set amountPaid(double? val) => _amountPaid = val;

  void incrementAmountPaid(double amount) => amountPaid = amountPaid + amount;

  bool hasAmountPaid() => _amountPaid != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;

  bool hasCurrency() => _currency != null;

  // "payment_method" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  set paymentMethod(String? val) => _paymentMethod = val;

  bool hasPaymentMethod() => _paymentMethod != null;

  // "payment_id" field.
  String? _paymentId;
  String get paymentId => _paymentId ?? '';
  set paymentId(String? val) => _paymentId = val;

  bool hasPaymentId() => _paymentId != null;

  static UserMembershipsOrderHistoryStruct fromMap(Map<String, dynamic> data) =>
      UserMembershipsOrderHistoryStruct(
        orderId: data['order_id'] as String?,
        planId: castToType<int>(data['plan_id']),
        planName: data['plan_name'] as String?,
        purchaseDate: data['purchase_date'] as DateTime?,
        amountPaid: castToType<double>(data['amount_paid']),
        currency: data['currency'] as String?,
        paymentMethod: data['payment_method'] as String?,
        paymentId: data['payment_id'] as String?,
      );

  static UserMembershipsOrderHistoryStruct? maybeFromMap(dynamic data) => data
          is Map
      ? UserMembershipsOrderHistoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'order_id': _orderId,
        'plan_id': _planId,
        'plan_name': _planName,
        'purchase_date': _purchaseDate,
        'amount_paid': _amountPaid,
        'currency': _currency,
        'payment_method': _paymentMethod,
        'payment_id': _paymentId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'order_id': serializeParam(
          _orderId,
          ParamType.String,
        ),
        'plan_id': serializeParam(
          _planId,
          ParamType.int,
        ),
        'plan_name': serializeParam(
          _planName,
          ParamType.String,
        ),
        'purchase_date': serializeParam(
          _purchaseDate,
          ParamType.DateTime,
        ),
        'amount_paid': serializeParam(
          _amountPaid,
          ParamType.double,
        ),
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
        'payment_method': serializeParam(
          _paymentMethod,
          ParamType.String,
        ),
        'payment_id': serializeParam(
          _paymentId,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserMembershipsOrderHistoryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserMembershipsOrderHistoryStruct(
        orderId: deserializeParam(
          data['order_id'],
          ParamType.String,
          false,
        ),
        planId: deserializeParam(
          data['plan_id'],
          ParamType.int,
          false,
        ),
        planName: deserializeParam(
          data['plan_name'],
          ParamType.String,
          false,
        ),
        purchaseDate: deserializeParam(
          data['purchase_date'],
          ParamType.DateTime,
          false,
        ),
        amountPaid: deserializeParam(
          data['amount_paid'],
          ParamType.double,
          false,
        ),
        currency: deserializeParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        paymentMethod: deserializeParam(
          data['payment_method'],
          ParamType.String,
          false,
        ),
        paymentId: deserializeParam(
          data['payment_id'],
          ParamType.String,
          false,
        ),
      );

  static UserMembershipsOrderHistoryStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      UserMembershipsOrderHistoryStruct(
        orderId: convertAlgoliaParam(
          data['order_id'],
          ParamType.String,
          false,
        ),
        planId: convertAlgoliaParam(
          data['plan_id'],
          ParamType.int,
          false,
        ),
        planName: convertAlgoliaParam(
          data['plan_name'],
          ParamType.String,
          false,
        ),
        purchaseDate: convertAlgoliaParam(
          data['purchase_date'],
          ParamType.DateTime,
          false,
        ),
        amountPaid: convertAlgoliaParam(
          data['amount_paid'],
          ParamType.double,
          false,
        ),
        currency: convertAlgoliaParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        paymentMethod: convertAlgoliaParam(
          data['payment_method'],
          ParamType.String,
          false,
        ),
        paymentId: convertAlgoliaParam(
          data['payment_id'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'UserMembershipsOrderHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserMembershipsOrderHistoryStruct &&
        orderId == other.orderId &&
        planId == other.planId &&
        planName == other.planName &&
        purchaseDate == other.purchaseDate &&
        amountPaid == other.amountPaid &&
        currency == other.currency &&
        paymentMethod == other.paymentMethod &&
        paymentId == other.paymentId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        orderId,
        planId,
        planName,
        purchaseDate,
        amountPaid,
        currency,
        paymentMethod,
        paymentId
      ]);
}

UserMembershipsOrderHistoryStruct createUserMembershipsOrderHistoryStruct({
  String? orderId,
  int? planId,
  String? planName,
  DateTime? purchaseDate,
  double? amountPaid,
  String? currency,
  String? paymentMethod,
  String? paymentId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserMembershipsOrderHistoryStruct(
      orderId: orderId,
      planId: planId,
      planName: planName,
      purchaseDate: purchaseDate,
      amountPaid: amountPaid,
      currency: currency,
      paymentMethod: paymentMethod,
      paymentId: paymentId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserMembershipsOrderHistoryStruct? updateUserMembershipsOrderHistoryStruct(
  UserMembershipsOrderHistoryStruct? userMembershipsOrderHistory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userMembershipsOrderHistory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserMembershipsOrderHistoryStructData(
  Map<String, dynamic> firestoreData,
  UserMembershipsOrderHistoryStruct? userMembershipsOrderHistory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userMembershipsOrderHistory == null) {
    return;
  }
  if (userMembershipsOrderHistory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      userMembershipsOrderHistory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userMembershipsOrderHistoryData =
      getUserMembershipsOrderHistoryFirestoreData(
          userMembershipsOrderHistory, forFieldValue);
  final nestedData = userMembershipsOrderHistoryData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      userMembershipsOrderHistory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserMembershipsOrderHistoryFirestoreData(
  UserMembershipsOrderHistoryStruct? userMembershipsOrderHistory, [
  bool forFieldValue = false,
]) {
  if (userMembershipsOrderHistory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userMembershipsOrderHistory.toMap());

  // Add any Firestore field values
  mapToFirestore(userMembershipsOrderHistory.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserMembershipsOrderHistoryListFirestoreData(
  List<UserMembershipsOrderHistoryStruct>? userMembershipsOrderHistorys,
) =>
    userMembershipsOrderHistorys
        ?.map((e) => getUserMembershipsOrderHistoryFirestoreData(e, true))
        .toList() ??
    [];
