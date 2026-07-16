import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeliveryLoginCredsRecord extends FirestoreRecord {
  DeliveryLoginCredsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "delivery_status" field.
  bool? _deliveryStatus;
  bool get deliveryStatus => _deliveryStatus ?? false;
  bool hasDeliveryStatus() => _deliveryStatus != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _password = snapshotData['password'] as String?;
    _deliveryStatus = snapshotData['delivery_status'] as bool?;
    _displayName = snapshotData['display_name'] as String?;
    _id = snapshotData['id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('delivery_login_creds');

  static Stream<DeliveryLoginCredsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeliveryLoginCredsRecord.fromSnapshot(s));

  static Future<DeliveryLoginCredsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DeliveryLoginCredsRecord.fromSnapshot(s));

  static DeliveryLoginCredsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DeliveryLoginCredsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeliveryLoginCredsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeliveryLoginCredsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeliveryLoginCredsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeliveryLoginCredsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeliveryLoginCredsRecordData({
  String? status,
  DateTime? createdAt,
  String? email,
  String? password,
  bool? deliveryStatus,
  String? displayName,
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'created_at': createdAt,
      'email': email,
      'password': password,
      'delivery_status': deliveryStatus,
      'display_name': displayName,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeliveryLoginCredsRecordDocumentEquality
    implements Equality<DeliveryLoginCredsRecord> {
  const DeliveryLoginCredsRecordDocumentEquality();

  @override
  bool equals(DeliveryLoginCredsRecord? e1, DeliveryLoginCredsRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.email == e2?.email &&
        e1?.password == e2?.password &&
        e1?.deliveryStatus == e2?.deliveryStatus &&
        e1?.displayName == e2?.displayName &&
        e1?.id == e2?.id;
  }

  @override
  int hash(DeliveryLoginCredsRecord? e) => const ListEquality().hash([
        e?.status,
        e?.createdAt,
        e?.email,
        e?.password,
        e?.deliveryStatus,
        e?.displayName,
        e?.id
      ]);

  @override
  bool isValidKey(Object? o) => o is DeliveryLoginCredsRecord;
}
