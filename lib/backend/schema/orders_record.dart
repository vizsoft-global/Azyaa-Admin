import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "customer_id" field.
  String? _customerId;
  String get customerId => _customerId ?? '';
  bool hasCustomerId() => _customerId != null;

  // "customer_ref" field.
  DocumentReference? _customerRef;
  DocumentReference? get customerRef => _customerRef;
  bool hasCustomerRef() => _customerRef != null;

  // "order_items" field.
  UserCartStruct? _orderItems;
  UserCartStruct get orderItems => _orderItems ?? UserCartStruct();
  bool hasOrderItems() => _orderItems != null;

  // "total_price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "order_status" field.
  String? _orderStatus;
  String get orderStatus => _orderStatus ?? '';
  bool hasOrderStatus() => _orderStatus != null;

  // "payment_status" field.
  String? _paymentStatus;
  String get paymentStatus => _paymentStatus ?? '';
  bool hasPaymentStatus() => _paymentStatus != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "payment_id" field.
  String? _paymentId;
  String get paymentId => _paymentId ?? '';
  bool hasPaymentId() => _paymentId != null;

  // "payment_method" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "payment_type" field.
  String? _paymentType;
  String get paymentType => _paymentType ?? '';
  bool hasPaymentType() => _paymentType != null;

  // "product_info" field.
  InfoStruct? _productInfo;
  InfoStruct get productInfo => _productInfo ?? InfoStruct();
  bool hasProductInfo() => _productInfo != null;

  // "shipping_address" field.
  UserShippingaddressInfoStruct? _shippingAddress;
  UserShippingaddressInfoStruct get shippingAddress =>
      _shippingAddress ?? UserShippingaddressInfoStruct();
  bool hasShippingAddress() => _shippingAddress != null;

  // "shipping_info" field.
  UserShippingaddressStruct? _shippingInfo;
  UserShippingaddressStruct get shippingInfo =>
      _shippingInfo ?? UserShippingaddressStruct();
  bool hasShippingInfo() => _shippingInfo != null;

  // "return_request_id" field.
  String? _returnRequestId;
  String get returnRequestId => _returnRequestId ?? '';
  bool hasReturnRequestId() => _returnRequestId != null;

  // "delivery_info" field.
  DeliveryInfoStruct? _deliveryInfo;
  DeliveryInfoStruct get deliveryInfo => _deliveryInfo ?? DeliveryInfoStruct();
  bool hasDeliveryInfo() => _deliveryInfo != null;

  // "order_loyalty" field.
  OrderLoyaltyStruct? _orderLoyalty;
  OrderLoyaltyStruct get orderLoyalty => _orderLoyalty ?? OrderLoyaltyStruct();
  bool hasOrderLoyalty() => _orderLoyalty != null;

  // "shipping_price" field.
  double? _shippingPrice;
  double get shippingPrice => _shippingPrice ?? 0.0;
  bool hasShippingPrice() => _shippingPrice != null;

  // "delivery_info_list" field.
  List<DeliveryInfoStruct>? _deliveryInfoList;
  List<DeliveryInfoStruct> get deliveryInfoList =>
      _deliveryInfoList ?? const [];
  bool hasDeliveryInfoList() => _deliveryInfoList != null;

  // "payment_comment" field.
  String? _paymentComment;
  String get paymentComment => _paymentComment ?? '';
  bool hasPaymentComment() => _paymentComment != null;

  // "ready_shipping_request_status" field.
  String? _readyShippingRequestStatus;
  String get readyShippingRequestStatus => _readyShippingRequestStatus ?? '';
  bool hasReadyShippingRequestStatus() => _readyShippingRequestStatus != null;

  // "custom_shipping_request_status" field.
  String? _customShippingRequestStatus;
  String get customShippingRequestStatus => _customShippingRequestStatus ?? '';
  bool hasCustomShippingRequestStatus() => _customShippingRequestStatus != null;

  void _initializeFields() {
    _orderId = snapshotData['order_id'] as String?;
    _customerId = snapshotData['customer_id'] as String?;
    _customerRef = snapshotData['customer_ref'] as DocumentReference?;
    _orderItems = snapshotData['order_items'] is UserCartStruct
        ? snapshotData['order_items']
        : UserCartStruct.maybeFromMap(snapshotData['order_items']);
    _totalPrice = castToType<double>(snapshotData['total_price']);
    _orderStatus = snapshotData['order_status'] as String?;
    _paymentStatus = snapshotData['payment_status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _paymentId = snapshotData['payment_id'] as String?;
    _paymentMethod = snapshotData['payment_method'] as String?;
    _paymentType = snapshotData['payment_type'] as String?;
    _productInfo = snapshotData['product_info'] is InfoStruct
        ? snapshotData['product_info']
        : InfoStruct.maybeFromMap(snapshotData['product_info']);
    _shippingAddress =
        snapshotData['shipping_address'] is UserShippingaddressInfoStruct
            ? snapshotData['shipping_address']
            : UserShippingaddressInfoStruct.maybeFromMap(
                snapshotData['shipping_address']);
    _shippingInfo = snapshotData['shipping_info'] is UserShippingaddressStruct
        ? snapshotData['shipping_info']
        : UserShippingaddressStruct.maybeFromMap(snapshotData['shipping_info']);
    _returnRequestId = snapshotData['return_request_id'] as String?;
    _deliveryInfo = snapshotData['delivery_info'] is DeliveryInfoStruct
        ? snapshotData['delivery_info']
        : DeliveryInfoStruct.maybeFromMap(snapshotData['delivery_info']);
    _orderLoyalty = snapshotData['order_loyalty'] is OrderLoyaltyStruct
        ? snapshotData['order_loyalty']
        : OrderLoyaltyStruct.maybeFromMap(snapshotData['order_loyalty']);
    _shippingPrice = castToType<double>(snapshotData['shipping_price']);
    _deliveryInfoList = getStructList(
      snapshotData['delivery_info_list'],
      DeliveryInfoStruct.fromMap,
    );
    _paymentComment = snapshotData['payment_comment'] as String?;
    _readyShippingRequestStatus =
        snapshotData['ready_shipping_request_status'] as String?;
    _customShippingRequestStatus =
        snapshotData['custom_shipping_request_status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  static OrdersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      OrdersRecord.getDocumentFromData(
        {
          'order_id': snapshot.data['order_id'],
          'customer_id': snapshot.data['customer_id'],
          'customer_ref': convertAlgoliaParam(
            snapshot.data['customer_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'order_items':
              UserCartStruct.fromAlgoliaData(snapshot.data['order_items'] ?? {})
                  .toMap(),
          'total_price': convertAlgoliaParam(
            snapshot.data['total_price'],
            ParamType.double,
            false,
          ),
          'order_status': snapshot.data['order_status'],
          'payment_status': snapshot.data['payment_status'],
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'updated_at': convertAlgoliaParam(
            snapshot.data['updated_at'],
            ParamType.DateTime,
            false,
          ),
          'payment_id': snapshot.data['payment_id'],
          'payment_method': snapshot.data['payment_method'],
          'payment_type': snapshot.data['payment_type'],
          'product_info':
              InfoStruct.fromAlgoliaData(snapshot.data['product_info'] ?? {})
                  .toMap(),
          'shipping_address': UserShippingaddressInfoStruct.fromAlgoliaData(
                  snapshot.data['shipping_address'] ?? {})
              .toMap(),
          'shipping_info': UserShippingaddressStruct.fromAlgoliaData(
                  snapshot.data['shipping_info'] ?? {})
              .toMap(),
          'return_request_id': snapshot.data['return_request_id'],
          'delivery_info': DeliveryInfoStruct.fromAlgoliaData(
                  snapshot.data['delivery_info'] ?? {})
              .toMap(),
          'order_loyalty': OrderLoyaltyStruct.fromAlgoliaData(
                  snapshot.data['order_loyalty'] ?? {})
              .toMap(),
          'shipping_price': convertAlgoliaParam(
            snapshot.data['shipping_price'],
            ParamType.double,
            false,
          ),
          'delivery_info_list': safeGet(
            () => (snapshot.data['delivery_info_list'] as Iterable)
                .map((d) => DeliveryInfoStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'payment_comment': snapshot.data['payment_comment'],
          'ready_shipping_request_status':
              snapshot.data['ready_shipping_request_status'],
          'custom_shipping_request_status':
              snapshot.data['custom_shipping_request_status'],
        },
        OrdersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<OrdersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'orders',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? orderId,
  String? customerId,
  DocumentReference? customerRef,
  UserCartStruct? orderItems,
  double? totalPrice,
  String? orderStatus,
  String? paymentStatus,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? paymentId,
  String? paymentMethod,
  String? paymentType,
  InfoStruct? productInfo,
  UserShippingaddressInfoStruct? shippingAddress,
  UserShippingaddressStruct? shippingInfo,
  String? returnRequestId,
  DeliveryInfoStruct? deliveryInfo,
  OrderLoyaltyStruct? orderLoyalty,
  double? shippingPrice,
  String? paymentComment,
  String? readyShippingRequestStatus,
  String? customShippingRequestStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order_id': orderId,
      'customer_id': customerId,
      'customer_ref': customerRef,
      'order_items': UserCartStruct().toMap(),
      'total_price': totalPrice,
      'order_status': orderStatus,
      'payment_status': paymentStatus,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'payment_id': paymentId,
      'payment_method': paymentMethod,
      'payment_type': paymentType,
      'product_info': InfoStruct().toMap(),
      'shipping_address': UserShippingaddressInfoStruct().toMap(),
      'shipping_info': UserShippingaddressStruct().toMap(),
      'return_request_id': returnRequestId,
      'delivery_info': DeliveryInfoStruct().toMap(),
      'order_loyalty': OrderLoyaltyStruct().toMap(),
      'shipping_price': shippingPrice,
      'payment_comment': paymentComment,
      'ready_shipping_request_status': readyShippingRequestStatus,
      'custom_shipping_request_status': customShippingRequestStatus,
    }.withoutNulls,
  );

  // Handle nested data for "order_items" field.
  addUserCartStructData(firestoreData, orderItems, 'order_items');

  // Handle nested data for "product_info" field.
  addInfoStructData(firestoreData, productInfo, 'product_info');

  // Handle nested data for "shipping_address" field.
  addUserShippingaddressInfoStructData(
      firestoreData, shippingAddress, 'shipping_address');

  // Handle nested data for "shipping_info" field.
  addUserShippingaddressStructData(
      firestoreData, shippingInfo, 'shipping_info');

  // Handle nested data for "delivery_info" field.
  addDeliveryInfoStructData(firestoreData, deliveryInfo, 'delivery_info');

  // Handle nested data for "order_loyalty" field.
  addOrderLoyaltyStructData(firestoreData, orderLoyalty, 'order_loyalty');

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.orderId == e2?.orderId &&
        e1?.customerId == e2?.customerId &&
        e1?.customerRef == e2?.customerRef &&
        e1?.orderItems == e2?.orderItems &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.orderStatus == e2?.orderStatus &&
        e1?.paymentStatus == e2?.paymentStatus &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.paymentId == e2?.paymentId &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.paymentType == e2?.paymentType &&
        e1?.productInfo == e2?.productInfo &&
        e1?.shippingAddress == e2?.shippingAddress &&
        e1?.shippingInfo == e2?.shippingInfo &&
        e1?.returnRequestId == e2?.returnRequestId &&
        e1?.deliveryInfo == e2?.deliveryInfo &&
        e1?.orderLoyalty == e2?.orderLoyalty &&
        e1?.shippingPrice == e2?.shippingPrice &&
        listEquality.equals(e1?.deliveryInfoList, e2?.deliveryInfoList) &&
        e1?.paymentComment == e2?.paymentComment &&
        e1?.readyShippingRequestStatus == e2?.readyShippingRequestStatus &&
        e1?.customShippingRequestStatus == e2?.customShippingRequestStatus;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.orderId,
        e?.customerId,
        e?.customerRef,
        e?.orderItems,
        e?.totalPrice,
        e?.orderStatus,
        e?.paymentStatus,
        e?.createdAt,
        e?.updatedAt,
        e?.paymentId,
        e?.paymentMethod,
        e?.paymentType,
        e?.productInfo,
        e?.shippingAddress,
        e?.shippingInfo,
        e?.returnRequestId,
        e?.deliveryInfo,
        e?.orderLoyalty,
        e?.shippingPrice,
        e?.deliveryInfoList,
        e?.paymentComment,
        e?.readyShippingRequestStatus,
        e?.customShippingRequestStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
