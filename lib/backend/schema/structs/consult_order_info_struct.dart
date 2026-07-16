// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConsultOrderInfoStruct extends FFFirebaseStruct {
  ConsultOrderInfoStruct({
    String? orderId,
    DocumentReference? orderRef,
    DateTime? orderCreatedAt,
    String? orderStatus,
    UserCartStruct? orderItems,
    String? orderTotalPrice,
    String? paymentId,
    String? paymentMethod,
    String? paymentType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _orderId = orderId,
        _orderRef = orderRef,
        _orderCreatedAt = orderCreatedAt,
        _orderStatus = orderStatus,
        _orderItems = orderItems,
        _orderTotalPrice = orderTotalPrice,
        _paymentId = paymentId,
        _paymentMethod = paymentMethod,
        _paymentType = paymentType,
        super(firestoreUtilData);

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  set orderId(String? val) => _orderId = val;

  bool hasOrderId() => _orderId != null;

  // "order_ref" field.
  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  set orderRef(DocumentReference? val) => _orderRef = val;

  bool hasOrderRef() => _orderRef != null;

  // "order_createdAt" field.
  DateTime? _orderCreatedAt;
  DateTime? get orderCreatedAt => _orderCreatedAt;
  set orderCreatedAt(DateTime? val) => _orderCreatedAt = val;

  bool hasOrderCreatedAt() => _orderCreatedAt != null;

  // "order_status" field.
  String? _orderStatus;
  String get orderStatus => _orderStatus ?? '';
  set orderStatus(String? val) => _orderStatus = val;

  bool hasOrderStatus() => _orderStatus != null;

  // "order_items" field.
  UserCartStruct? _orderItems;
  UserCartStruct get orderItems => _orderItems ?? UserCartStruct();
  set orderItems(UserCartStruct? val) => _orderItems = val;

  void updateOrderItems(Function(UserCartStruct) updateFn) {
    updateFn(_orderItems ??= UserCartStruct());
  }

  bool hasOrderItems() => _orderItems != null;

  // "order_total_price" field.
  String? _orderTotalPrice;
  String get orderTotalPrice => _orderTotalPrice ?? '';
  set orderTotalPrice(String? val) => _orderTotalPrice = val;

  bool hasOrderTotalPrice() => _orderTotalPrice != null;

  // "payment_id" field.
  String? _paymentId;
  String get paymentId => _paymentId ?? '';
  set paymentId(String? val) => _paymentId = val;

  bool hasPaymentId() => _paymentId != null;

  // "payment_method" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  set paymentMethod(String? val) => _paymentMethod = val;

  bool hasPaymentMethod() => _paymentMethod != null;

  // "payment_type" field.
  String? _paymentType;
  String get paymentType => _paymentType ?? '';
  set paymentType(String? val) => _paymentType = val;

  bool hasPaymentType() => _paymentType != null;

  static ConsultOrderInfoStruct fromMap(Map<String, dynamic> data) =>
      ConsultOrderInfoStruct(
        orderId: data['order_id'] as String?,
        orderRef: data['order_ref'] as DocumentReference?,
        orderCreatedAt: data['order_createdAt'] as DateTime?,
        orderStatus: data['order_status'] as String?,
        orderItems: data['order_items'] is UserCartStruct
            ? data['order_items']
            : UserCartStruct.maybeFromMap(data['order_items']),
        orderTotalPrice: data['order_total_price'] as String?,
        paymentId: data['payment_id'] as String?,
        paymentMethod: data['payment_method'] as String?,
        paymentType: data['payment_type'] as String?,
      );

  static ConsultOrderInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? ConsultOrderInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'order_id': _orderId,
        'order_ref': _orderRef,
        'order_createdAt': _orderCreatedAt,
        'order_status': _orderStatus,
        'order_items': _orderItems?.toMap(),
        'order_total_price': _orderTotalPrice,
        'payment_id': _paymentId,
        'payment_method': _paymentMethod,
        'payment_type': _paymentType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'order_id': serializeParam(
          _orderId,
          ParamType.String,
        ),
        'order_ref': serializeParam(
          _orderRef,
          ParamType.DocumentReference,
        ),
        'order_createdAt': serializeParam(
          _orderCreatedAt,
          ParamType.DateTime,
        ),
        'order_status': serializeParam(
          _orderStatus,
          ParamType.String,
        ),
        'order_items': serializeParam(
          _orderItems,
          ParamType.DataStruct,
        ),
        'order_total_price': serializeParam(
          _orderTotalPrice,
          ParamType.String,
        ),
        'payment_id': serializeParam(
          _paymentId,
          ParamType.String,
        ),
        'payment_method': serializeParam(
          _paymentMethod,
          ParamType.String,
        ),
        'payment_type': serializeParam(
          _paymentType,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConsultOrderInfoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConsultOrderInfoStruct(
        orderId: deserializeParam(
          data['order_id'],
          ParamType.String,
          false,
        ),
        orderRef: deserializeParam(
          data['order_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['orders'],
        ),
        orderCreatedAt: deserializeParam(
          data['order_createdAt'],
          ParamType.DateTime,
          false,
        ),
        orderStatus: deserializeParam(
          data['order_status'],
          ParamType.String,
          false,
        ),
        orderItems: deserializeStructParam(
          data['order_items'],
          ParamType.DataStruct,
          false,
          structBuilder: UserCartStruct.fromSerializableMap,
        ),
        orderTotalPrice: deserializeParam(
          data['order_total_price'],
          ParamType.String,
          false,
        ),
        paymentId: deserializeParam(
          data['payment_id'],
          ParamType.String,
          false,
        ),
        paymentMethod: deserializeParam(
          data['payment_method'],
          ParamType.String,
          false,
        ),
        paymentType: deserializeParam(
          data['payment_type'],
          ParamType.String,
          false,
        ),
      );

  static ConsultOrderInfoStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ConsultOrderInfoStruct(
        orderId: convertAlgoliaParam(
          data['order_id'],
          ParamType.String,
          false,
        ),
        orderRef: convertAlgoliaParam(
          data['order_ref'],
          ParamType.DocumentReference,
          false,
        ),
        orderCreatedAt: convertAlgoliaParam(
          data['order_createdAt'],
          ParamType.DateTime,
          false,
        ),
        orderStatus: convertAlgoliaParam(
          data['order_status'],
          ParamType.String,
          false,
        ),
        orderItems: convertAlgoliaParam(
          data['order_items'],
          ParamType.DataStruct,
          false,
          structBuilder: UserCartStruct.fromAlgoliaData,
        ),
        orderTotalPrice: convertAlgoliaParam(
          data['order_total_price'],
          ParamType.String,
          false,
        ),
        paymentId: convertAlgoliaParam(
          data['payment_id'],
          ParamType.String,
          false,
        ),
        paymentMethod: convertAlgoliaParam(
          data['payment_method'],
          ParamType.String,
          false,
        ),
        paymentType: convertAlgoliaParam(
          data['payment_type'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ConsultOrderInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConsultOrderInfoStruct &&
        orderId == other.orderId &&
        orderRef == other.orderRef &&
        orderCreatedAt == other.orderCreatedAt &&
        orderStatus == other.orderStatus &&
        orderItems == other.orderItems &&
        orderTotalPrice == other.orderTotalPrice &&
        paymentId == other.paymentId &&
        paymentMethod == other.paymentMethod &&
        paymentType == other.paymentType;
  }

  @override
  int get hashCode => const ListEquality().hash([
        orderId,
        orderRef,
        orderCreatedAt,
        orderStatus,
        orderItems,
        orderTotalPrice,
        paymentId,
        paymentMethod,
        paymentType
      ]);
}

ConsultOrderInfoStruct createConsultOrderInfoStruct({
  String? orderId,
  DocumentReference? orderRef,
  DateTime? orderCreatedAt,
  String? orderStatus,
  UserCartStruct? orderItems,
  String? orderTotalPrice,
  String? paymentId,
  String? paymentMethod,
  String? paymentType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConsultOrderInfoStruct(
      orderId: orderId,
      orderRef: orderRef,
      orderCreatedAt: orderCreatedAt,
      orderStatus: orderStatus,
      orderItems: orderItems ?? (clearUnsetFields ? UserCartStruct() : null),
      orderTotalPrice: orderTotalPrice,
      paymentId: paymentId,
      paymentMethod: paymentMethod,
      paymentType: paymentType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConsultOrderInfoStruct? updateConsultOrderInfoStruct(
  ConsultOrderInfoStruct? consultOrderInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    consultOrderInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConsultOrderInfoStructData(
  Map<String, dynamic> firestoreData,
  ConsultOrderInfoStruct? consultOrderInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (consultOrderInfo == null) {
    return;
  }
  if (consultOrderInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && consultOrderInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final consultOrderInfoData =
      getConsultOrderInfoFirestoreData(consultOrderInfo, forFieldValue);
  final nestedData =
      consultOrderInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = consultOrderInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConsultOrderInfoFirestoreData(
  ConsultOrderInfoStruct? consultOrderInfo, [
  bool forFieldValue = false,
]) {
  if (consultOrderInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(consultOrderInfo.toMap());

  // Handle nested data for "order_items" field.
  addUserCartStructData(
    firestoreData,
    consultOrderInfo.hasOrderItems() ? consultOrderInfo.orderItems : null,
    'order_items',
    forFieldValue,
  );

  // Add any Firestore field values
  mapToFirestore(consultOrderInfo.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConsultOrderInfoListFirestoreData(
  List<ConsultOrderInfoStruct>? consultOrderInfos,
) =>
    consultOrderInfos
        ?.map((e) => getConsultOrderInfoFirestoreData(e, true))
        .toList() ??
    [];
