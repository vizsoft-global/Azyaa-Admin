// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class OrderLoyaltyStruct extends FFFirebaseStruct {
  OrderLoyaltyStruct({
    bool? loyaltyStatus,
    DateTime? updatedAt,
    double? mainLoyaltyRupee,
    int? mainLoyaltyPoint,
    double? orderCartTotal,
    int? orderLoyalPoint,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _loyaltyStatus = loyaltyStatus,
        _updatedAt = updatedAt,
        _mainLoyaltyRupee = mainLoyaltyRupee,
        _mainLoyaltyPoint = mainLoyaltyPoint,
        _orderCartTotal = orderCartTotal,
        _orderLoyalPoint = orderLoyalPoint,
        super(firestoreUtilData);

  // "loyalty_status" field.
  bool? _loyaltyStatus;
  bool get loyaltyStatus => _loyaltyStatus ?? false;
  set loyaltyStatus(bool? val) => _loyaltyStatus = val;

  bool hasLoyaltyStatus() => _loyaltyStatus != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

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

  static OrderLoyaltyStruct fromMap(Map<String, dynamic> data) =>
      OrderLoyaltyStruct(
        loyaltyStatus: data['loyalty_status'] as bool?,
        updatedAt: data['updated_at'] as DateTime?,
        mainLoyaltyRupee: castToType<double>(data['main_loyalty_rupee']),
        mainLoyaltyPoint: castToType<int>(data['main_loyalty_point']),
        orderCartTotal: castToType<double>(data['order_cart_total']),
        orderLoyalPoint: castToType<int>(data['order_loyal_point']),
      );

  static OrderLoyaltyStruct? maybeFromMap(dynamic data) => data is Map
      ? OrderLoyaltyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'loyalty_status': _loyaltyStatus,
        'updated_at': _updatedAt,
        'main_loyalty_rupee': _mainLoyaltyRupee,
        'main_loyalty_point': _mainLoyaltyPoint,
        'order_cart_total': _orderCartTotal,
        'order_loyal_point': _orderLoyalPoint,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'loyalty_status': serializeParam(
          _loyaltyStatus,
          ParamType.bool,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
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

  static OrderLoyaltyStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderLoyaltyStruct(
        loyaltyStatus: deserializeParam(
          data['loyalty_status'],
          ParamType.bool,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
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

  static OrderLoyaltyStruct fromAlgoliaData(Map<String, dynamic> data) =>
      OrderLoyaltyStruct(
        loyaltyStatus: convertAlgoliaParam(
          data['loyalty_status'],
          ParamType.bool,
          false,
        ),
        updatedAt: convertAlgoliaParam(
          data['updated_at'],
          ParamType.DateTime,
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
  String toString() => 'OrderLoyaltyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OrderLoyaltyStruct &&
        loyaltyStatus == other.loyaltyStatus &&
        updatedAt == other.updatedAt &&
        mainLoyaltyRupee == other.mainLoyaltyRupee &&
        mainLoyaltyPoint == other.mainLoyaltyPoint &&
        orderCartTotal == other.orderCartTotal &&
        orderLoyalPoint == other.orderLoyalPoint;
  }

  @override
  int get hashCode => const ListEquality().hash([
        loyaltyStatus,
        updatedAt,
        mainLoyaltyRupee,
        mainLoyaltyPoint,
        orderCartTotal,
        orderLoyalPoint
      ]);
}

OrderLoyaltyStruct createOrderLoyaltyStruct({
  bool? loyaltyStatus,
  DateTime? updatedAt,
  double? mainLoyaltyRupee,
  int? mainLoyaltyPoint,
  double? orderCartTotal,
  int? orderLoyalPoint,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderLoyaltyStruct(
      loyaltyStatus: loyaltyStatus,
      updatedAt: updatedAt,
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

OrderLoyaltyStruct? updateOrderLoyaltyStruct(
  OrderLoyaltyStruct? orderLoyalty, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    orderLoyalty
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrderLoyaltyStructData(
  Map<String, dynamic> firestoreData,
  OrderLoyaltyStruct? orderLoyalty,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (orderLoyalty == null) {
    return;
  }
  if (orderLoyalty.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && orderLoyalty.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderLoyaltyData =
      getOrderLoyaltyFirestoreData(orderLoyalty, forFieldValue);
  final nestedData =
      orderLoyaltyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = orderLoyalty.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderLoyaltyFirestoreData(
  OrderLoyaltyStruct? orderLoyalty, [
  bool forFieldValue = false,
]) {
  if (orderLoyalty == null) {
    return {};
  }
  final firestoreData = mapToFirestore(orderLoyalty.toMap());

  // Add any Firestore field values
  mapToFirestore(orderLoyalty.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderLoyaltyListFirestoreData(
  List<OrderLoyaltyStruct>? orderLoyaltys,
) =>
    orderLoyaltys?.map((e) => getOrderLoyaltyFirestoreData(e, true)).toList() ??
    [];
