import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionsRecord extends FirestoreRecord {
  SubscriptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "subscription_status" field.
  String? _subscriptionStatus;
  String get subscriptionStatus => _subscriptionStatus ?? '';
  bool hasSubscriptionStatus() => _subscriptionStatus != null;

  // "subscription_createdAt" field.
  DateTime? _subscriptionCreatedAt;
  DateTime? get subscriptionCreatedAt => _subscriptionCreatedAt;
  bool hasSubscriptionCreatedAt() => _subscriptionCreatedAt != null;

  // "subscription_userRef" field.
  DocumentReference? _subscriptionUserRef;
  DocumentReference? get subscriptionUserRef => _subscriptionUserRef;
  bool hasSubscriptionUserRef() => _subscriptionUserRef != null;

  // "subscription_type" field.
  String? _subscriptionType;
  String get subscriptionType => _subscriptionType ?? '';
  bool hasSubscriptionType() => _subscriptionType != null;

  // "subscription_id" field.
  String? _subscriptionId;
  String get subscriptionId => _subscriptionId ?? '';
  bool hasSubscriptionId() => _subscriptionId != null;

  // "subscription_order_info_list" field.
  List<ConsultOrderInfoStruct>? _subscriptionOrderInfoList;
  List<ConsultOrderInfoStruct> get subscriptionOrderInfoList =>
      _subscriptionOrderInfoList ?? const [];
  bool hasSubscriptionOrderInfoList() => _subscriptionOrderInfoList != null;

  void _initializeFields() {
    _subscriptionStatus = snapshotData['subscription_status'] as String?;
    _subscriptionCreatedAt =
        snapshotData['subscription_createdAt'] as DateTime?;
    _subscriptionUserRef =
        snapshotData['subscription_userRef'] as DocumentReference?;
    _subscriptionType = snapshotData['subscription_type'] as String?;
    _subscriptionId = snapshotData['subscription_id'] as String?;
    _subscriptionOrderInfoList = getStructList(
      snapshotData['subscription_order_info_list'],
      ConsultOrderInfoStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscriptions');

  static Stream<SubscriptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionsRecord.fromSnapshot(s));

  static Future<SubscriptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubscriptionsRecord.fromSnapshot(s));

  static SubscriptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionsRecordData({
  String? subscriptionStatus,
  DateTime? subscriptionCreatedAt,
  DocumentReference? subscriptionUserRef,
  String? subscriptionType,
  String? subscriptionId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subscription_status': subscriptionStatus,
      'subscription_createdAt': subscriptionCreatedAt,
      'subscription_userRef': subscriptionUserRef,
      'subscription_type': subscriptionType,
      'subscription_id': subscriptionId,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionsRecordDocumentEquality
    implements Equality<SubscriptionsRecord> {
  const SubscriptionsRecordDocumentEquality();

  @override
  bool equals(SubscriptionsRecord? e1, SubscriptionsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.subscriptionStatus == e2?.subscriptionStatus &&
        e1?.subscriptionCreatedAt == e2?.subscriptionCreatedAt &&
        e1?.subscriptionUserRef == e2?.subscriptionUserRef &&
        e1?.subscriptionType == e2?.subscriptionType &&
        e1?.subscriptionId == e2?.subscriptionId &&
        listEquality.equals(
            e1?.subscriptionOrderInfoList, e2?.subscriptionOrderInfoList);
  }

  @override
  int hash(SubscriptionsRecord? e) => const ListEquality().hash([
        e?.subscriptionStatus,
        e?.subscriptionCreatedAt,
        e?.subscriptionUserRef,
        e?.subscriptionType,
        e?.subscriptionId,
        e?.subscriptionOrderInfoList
      ]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionsRecord;
}
