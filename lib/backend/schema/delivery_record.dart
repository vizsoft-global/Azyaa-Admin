import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliveryRecord extends FirestoreRecord {
  DeliveryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "partner_id" field.
  String? _partnerId;
  String get partnerId => _partnerId ?? '';
  bool hasPartnerId() => _partnerId != null;

  // "order_ref" field.
  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  bool hasOrderRef() => _orderRef != null;

  // "inventory_movement_ref" field.
  DocumentReference? _inventoryMovementRef;
  DocumentReference? get inventoryMovementRef => _inventoryMovementRef;
  bool hasInventoryMovementRef() => _inventoryMovementRef != null;

  // "assigned_by" field.
  DocumentReference? _assignedBy;
  DocumentReference? get assignedBy => _assignedBy;
  bool hasAssignedBy() => _assignedBy != null;

  // "delivery_id" field.
  String? _deliveryId;
  String get deliveryId => _deliveryId ?? '';
  bool hasDeliveryId() => _deliveryId != null;

  // "delivery_tracking_id" field.
  String? _deliveryTrackingId;
  String get deliveryTrackingId => _deliveryTrackingId ?? '';
  bool hasDeliveryTrackingId() => _deliveryTrackingId != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _type = snapshotData['type'] as String?;
    _partnerId = snapshotData['partner_id'] as String?;
    _orderRef = snapshotData['order_ref'] as DocumentReference?;
    _inventoryMovementRef =
        snapshotData['inventory_movement_ref'] as DocumentReference?;
    _assignedBy = snapshotData['assigned_by'] as DocumentReference?;
    _deliveryId = snapshotData['delivery_id'] as String?;
    _deliveryTrackingId = snapshotData['delivery_tracking_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('delivery');

  static Stream<DeliveryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeliveryRecord.fromSnapshot(s));

  static Future<DeliveryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeliveryRecord.fromSnapshot(s));

  static DeliveryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DeliveryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeliveryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeliveryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeliveryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeliveryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeliveryRecordData({
  DateTime? createdAt,
  DateTime? updatedAt,
  String? status,
  String? type,
  String? partnerId,
  DocumentReference? orderRef,
  DocumentReference? inventoryMovementRef,
  DocumentReference? assignedBy,
  String? deliveryId,
  String? deliveryTrackingId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'type': type,
      'partner_id': partnerId,
      'order_ref': orderRef,
      'inventory_movement_ref': inventoryMovementRef,
      'assigned_by': assignedBy,
      'delivery_id': deliveryId,
      'delivery_tracking_id': deliveryTrackingId,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeliveryRecordDocumentEquality implements Equality<DeliveryRecord> {
  const DeliveryRecordDocumentEquality();

  @override
  bool equals(DeliveryRecord? e1, DeliveryRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.status == e2?.status &&
        e1?.type == e2?.type &&
        e1?.partnerId == e2?.partnerId &&
        e1?.orderRef == e2?.orderRef &&
        e1?.inventoryMovementRef == e2?.inventoryMovementRef &&
        e1?.assignedBy == e2?.assignedBy &&
        e1?.deliveryId == e2?.deliveryId &&
        e1?.deliveryTrackingId == e2?.deliveryTrackingId;
  }

  @override
  int hash(DeliveryRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.updatedAt,
        e?.status,
        e?.type,
        e?.partnerId,
        e?.orderRef,
        e?.inventoryMovementRef,
        e?.assignedBy,
        e?.deliveryId,
        e?.deliveryTrackingId
      ]);

  @override
  bool isValidKey(Object? o) => o is DeliveryRecord;
}
