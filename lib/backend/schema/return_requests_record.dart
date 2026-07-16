import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReturnRequestsRecord extends FirestoreRecord {
  ReturnRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "return_request_id" field.
  String? _returnRequestId;
  String get returnRequestId => _returnRequestId ?? '';
  bool hasReturnRequestId() => _returnRequestId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "orderRef" field.
  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  bool hasOrderRef() => _orderRef != null;

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "total_return_quantity" field.
  int? _totalReturnQuantity;
  int get totalReturnQuantity => _totalReturnQuantity ?? 0;
  bool hasTotalReturnQuantity() => _totalReturnQuantity != null;

  // "total_return_amount" field.
  double? _totalReturnAmount;
  double get totalReturnAmount => _totalReturnAmount ?? 0.0;
  bool hasTotalReturnAmount() => _totalReturnAmount != null;

  // "return_reason" field.
  String? _returnReason;
  String get returnReason => _returnReason ?? '';
  bool hasReturnReason() => _returnReason != null;

  // "approver_info" field.
  ApproverInfoStruct? _approverInfo;
  ApproverInfoStruct get approverInfo => _approverInfo ?? ApproverInfoStruct();
  bool hasApproverInfo() => _approverInfo != null;

  // "return_additional_info" field.
  String? _returnAdditionalInfo;
  String get returnAdditionalInfo => _returnAdditionalInfo ?? '';
  bool hasReturnAdditionalInfo() => _returnAdditionalInfo != null;

  // "reject_reason" field.
  String? _rejectReason;
  String get rejectReason => _rejectReason ?? '';
  bool hasRejectReason() => _rejectReason != null;

  // "reject_message" field.
  String? _rejectMessage;
  String get rejectMessage => _rejectMessage ?? '';
  bool hasRejectMessage() => _rejectMessage != null;

  // "return_product_list" field.
  List<UserCartItemsStruct>? _returnProductList;
  List<UserCartItemsStruct> get returnProductList =>
      _returnProductList ?? const [];
  bool hasReturnProductList() => _returnProductList != null;

  void _initializeFields() {
    _returnRequestId = snapshotData['return_request_id'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _orderRef = snapshotData['orderRef'] as DocumentReference?;
    _orderId = snapshotData['order_id'] as String?;
    _totalReturnQuantity =
        castToType<int>(snapshotData['total_return_quantity']);
    _totalReturnAmount =
        castToType<double>(snapshotData['total_return_amount']);
    _returnReason = snapshotData['return_reason'] as String?;
    _approverInfo = snapshotData['approver_info'] is ApproverInfoStruct
        ? snapshotData['approver_info']
        : ApproverInfoStruct.maybeFromMap(snapshotData['approver_info']);
    _returnAdditionalInfo = snapshotData['return_additional_info'] as String?;
    _rejectReason = snapshotData['reject_reason'] as String?;
    _rejectMessage = snapshotData['reject_message'] as String?;
    _returnProductList = getStructList(
      snapshotData['return_product_list'],
      UserCartItemsStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('return_requests');

  static Stream<ReturnRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReturnRequestsRecord.fromSnapshot(s));

  static Future<ReturnRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReturnRequestsRecord.fromSnapshot(s));

  static ReturnRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReturnRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReturnRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReturnRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReturnRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReturnRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReturnRequestsRecordData({
  String? returnRequestId,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? status,
  DocumentReference? userRef,
  DocumentReference? orderRef,
  String? orderId,
  int? totalReturnQuantity,
  double? totalReturnAmount,
  String? returnReason,
  ApproverInfoStruct? approverInfo,
  String? returnAdditionalInfo,
  String? rejectReason,
  String? rejectMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'return_request_id': returnRequestId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'userRef': userRef,
      'orderRef': orderRef,
      'order_id': orderId,
      'total_return_quantity': totalReturnQuantity,
      'total_return_amount': totalReturnAmount,
      'return_reason': returnReason,
      'approver_info': ApproverInfoStruct().toMap(),
      'return_additional_info': returnAdditionalInfo,
      'reject_reason': rejectReason,
      'reject_message': rejectMessage,
    }.withoutNulls,
  );

  // Handle nested data for "approver_info" field.
  addApproverInfoStructData(firestoreData, approverInfo, 'approver_info');

  return firestoreData;
}

class ReturnRequestsRecordDocumentEquality
    implements Equality<ReturnRequestsRecord> {
  const ReturnRequestsRecordDocumentEquality();

  @override
  bool equals(ReturnRequestsRecord? e1, ReturnRequestsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.returnRequestId == e2?.returnRequestId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.status == e2?.status &&
        e1?.userRef == e2?.userRef &&
        e1?.orderRef == e2?.orderRef &&
        e1?.orderId == e2?.orderId &&
        e1?.totalReturnQuantity == e2?.totalReturnQuantity &&
        e1?.totalReturnAmount == e2?.totalReturnAmount &&
        e1?.returnReason == e2?.returnReason &&
        e1?.approverInfo == e2?.approverInfo &&
        e1?.returnAdditionalInfo == e2?.returnAdditionalInfo &&
        e1?.rejectReason == e2?.rejectReason &&
        e1?.rejectMessage == e2?.rejectMessage &&
        listEquality.equals(e1?.returnProductList, e2?.returnProductList);
  }

  @override
  int hash(ReturnRequestsRecord? e) => const ListEquality().hash([
        e?.returnRequestId,
        e?.createdAt,
        e?.updatedAt,
        e?.status,
        e?.userRef,
        e?.orderRef,
        e?.orderId,
        e?.totalReturnQuantity,
        e?.totalReturnAmount,
        e?.returnReason,
        e?.approverInfo,
        e?.returnAdditionalInfo,
        e?.rejectReason,
        e?.rejectMessage,
        e?.returnProductList
      ]);

  @override
  bool isValidKey(Object? o) => o is ReturnRequestsRecord;
}
