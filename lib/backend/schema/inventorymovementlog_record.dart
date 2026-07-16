import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InventorymovementlogRecord extends FirestoreRecord {
  InventorymovementlogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "update_at" field.
  DateTime? _updateAt;
  DateTime? get updateAt => _updateAt;
  bool hasUpdateAt() => _updateAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "movement_log_id" field.
  String? _movementLogId;
  String get movementLogId => _movementLogId ?? '';
  bool hasMovementLogId() => _movementLogId != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "product_quantity" field.
  int? _productQuantity;
  int get productQuantity => _productQuantity ?? 0;
  bool hasProductQuantity() => _productQuantity != null;

  // "movement_info" field.
  List<MovementInfoStruct>? _movementInfo;
  List<MovementInfoStruct> get movementInfo => _movementInfo ?? const [];
  bool hasMovementInfo() => _movementInfo != null;

  // "request_info" field.
  InventoryRequestInfoStruct? _requestInfo;
  InventoryRequestInfoStruct get requestInfo =>
      _requestInfo ?? InventoryRequestInfoStruct();
  bool hasRequestInfo() => _requestInfo != null;

  // "inventory_ref" field.
  DocumentReference? _inventoryRef;
  DocumentReference? get inventoryRef => _inventoryRef;
  bool hasInventoryRef() => _inventoryRef != null;

  // "enquiry_info" field.
  EnquiryInfoStruct? _enquiryInfo;
  EnquiryInfoStruct get enquiryInfo => _enquiryInfo ?? EnquiryInfoStruct();
  bool hasEnquiryInfo() => _enquiryInfo != null;

  // "designer_uid" field.
  String? _designerUid;
  String get designerUid => _designerUid ?? '';
  bool hasDesignerUid() => _designerUid != null;

  // "request_delivery_info" field.
  DeliveryInfoStruct? _requestDeliveryInfo;
  DeliveryInfoStruct get requestDeliveryInfo =>
      _requestDeliveryInfo ?? DeliveryInfoStruct();
  bool hasRequestDeliveryInfo() => _requestDeliveryInfo != null;

  // "enquiry_delivery_info" field.
  DeliveryInfoStruct? _enquiryDeliveryInfo;
  DeliveryInfoStruct get enquiryDeliveryInfo =>
      _enquiryDeliveryInfo ?? DeliveryInfoStruct();
  bool hasEnquiryDeliveryInfo() => _enquiryDeliveryInfo != null;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "delivery_retry" field.
  bool? _deliveryRetry;
  bool get deliveryRetry => _deliveryRetry ?? false;
  bool hasDeliveryRetry() => _deliveryRetry != null;

  // "delivery_retried_at" field.
  DateTime? _deliveryRetriedAt;
  DateTime? get deliveryRetriedAt => _deliveryRetriedAt;
  bool hasDeliveryRetriedAt() => _deliveryRetriedAt != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updateAt = snapshotData['update_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _movementLogId = snapshotData['movement_log_id'] as String?;
    _productId = snapshotData['product_id'] as String?;
    _productRef = snapshotData['product_ref'] as DocumentReference?;
    _productQuantity = castToType<int>(snapshotData['product_quantity']);
    _movementInfo = getStructList(
      snapshotData['movement_info'],
      MovementInfoStruct.fromMap,
    );
    _requestInfo = snapshotData['request_info'] is InventoryRequestInfoStruct
        ? snapshotData['request_info']
        : InventoryRequestInfoStruct.maybeFromMap(snapshotData['request_info']);
    _inventoryRef = snapshotData['inventory_ref'] as DocumentReference?;
    _enquiryInfo = snapshotData['enquiry_info'] is EnquiryInfoStruct
        ? snapshotData['enquiry_info']
        : EnquiryInfoStruct.maybeFromMap(snapshotData['enquiry_info']);
    _designerUid = snapshotData['designer_uid'] as String?;
    _requestDeliveryInfo =
        snapshotData['request_delivery_info'] is DeliveryInfoStruct
            ? snapshotData['request_delivery_info']
            : DeliveryInfoStruct.maybeFromMap(
                snapshotData['request_delivery_info']);
    _enquiryDeliveryInfo =
        snapshotData['enquiry_delivery_info'] is DeliveryInfoStruct
            ? snapshotData['enquiry_delivery_info']
            : DeliveryInfoStruct.maybeFromMap(
                snapshotData['enquiry_delivery_info']);
    _productName = snapshotData['product_name'] as String?;
    _deliveryRetry = snapshotData['delivery_retry'] as bool?;
    _deliveryRetriedAt = snapshotData['delivery_retried_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inventorymovementlog');

  static Stream<InventorymovementlogRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => InventorymovementlogRecord.fromSnapshot(s));

  static Future<InventorymovementlogRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InventorymovementlogRecord.fromSnapshot(s));

  static InventorymovementlogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InventorymovementlogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InventorymovementlogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InventorymovementlogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InventorymovementlogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InventorymovementlogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInventorymovementlogRecordData({
  DateTime? createdAt,
  DateTime? updateAt,
  String? status,
  String? movementLogId,
  String? productId,
  DocumentReference? productRef,
  int? productQuantity,
  InventoryRequestInfoStruct? requestInfo,
  DocumentReference? inventoryRef,
  EnquiryInfoStruct? enquiryInfo,
  String? designerUid,
  DeliveryInfoStruct? requestDeliveryInfo,
  DeliveryInfoStruct? enquiryDeliveryInfo,
  String? productName,
  bool? deliveryRetry,
  DateTime? deliveryRetriedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'update_at': updateAt,
      'status': status,
      'movement_log_id': movementLogId,
      'product_id': productId,
      'product_ref': productRef,
      'product_quantity': productQuantity,
      'request_info': InventoryRequestInfoStruct().toMap(),
      'inventory_ref': inventoryRef,
      'enquiry_info': EnquiryInfoStruct().toMap(),
      'designer_uid': designerUid,
      'request_delivery_info': DeliveryInfoStruct().toMap(),
      'enquiry_delivery_info': DeliveryInfoStruct().toMap(),
      'product_name': productName,
      'delivery_retry': deliveryRetry,
      'delivery_retried_at': deliveryRetriedAt,
    }.withoutNulls,
  );

  // Handle nested data for "request_info" field.
  addInventoryRequestInfoStructData(firestoreData, requestInfo, 'request_info');

  // Handle nested data for "enquiry_info" field.
  addEnquiryInfoStructData(firestoreData, enquiryInfo, 'enquiry_info');

  // Handle nested data for "request_delivery_info" field.
  addDeliveryInfoStructData(
      firestoreData, requestDeliveryInfo, 'request_delivery_info');

  // Handle nested data for "enquiry_delivery_info" field.
  addDeliveryInfoStructData(
      firestoreData, enquiryDeliveryInfo, 'enquiry_delivery_info');

  return firestoreData;
}

class InventorymovementlogRecordDocumentEquality
    implements Equality<InventorymovementlogRecord> {
  const InventorymovementlogRecordDocumentEquality();

  @override
  bool equals(InventorymovementlogRecord? e1, InventorymovementlogRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.updateAt == e2?.updateAt &&
        e1?.status == e2?.status &&
        e1?.movementLogId == e2?.movementLogId &&
        e1?.productId == e2?.productId &&
        e1?.productRef == e2?.productRef &&
        e1?.productQuantity == e2?.productQuantity &&
        listEquality.equals(e1?.movementInfo, e2?.movementInfo) &&
        e1?.requestInfo == e2?.requestInfo &&
        e1?.inventoryRef == e2?.inventoryRef &&
        e1?.enquiryInfo == e2?.enquiryInfo &&
        e1?.designerUid == e2?.designerUid &&
        e1?.requestDeliveryInfo == e2?.requestDeliveryInfo &&
        e1?.enquiryDeliveryInfo == e2?.enquiryDeliveryInfo &&
        e1?.productName == e2?.productName &&
        e1?.deliveryRetry == e2?.deliveryRetry &&
        e1?.deliveryRetriedAt == e2?.deliveryRetriedAt;
  }

  @override
  int hash(InventorymovementlogRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.updateAt,
        e?.status,
        e?.movementLogId,
        e?.productId,
        e?.productRef,
        e?.productQuantity,
        e?.movementInfo,
        e?.requestInfo,
        e?.inventoryRef,
        e?.enquiryInfo,
        e?.designerUid,
        e?.requestDeliveryInfo,
        e?.enquiryDeliveryInfo,
        e?.productName,
        e?.deliveryRetry,
        e?.deliveryRetriedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is InventorymovementlogRecord;
}
