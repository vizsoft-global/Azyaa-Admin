import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notification_Id" field.
  String? _notificationId;
  String get notificationId => _notificationId ?? '';
  bool hasNotificationId() => _notificationId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "notification_type" field.
  String? _notificationType;
  String get notificationType => _notificationType ?? '';
  bool hasNotificationType() => _notificationType != null;

  // "message_type" field.
  String? _messageType;
  String get messageType => _messageType ?? '';
  bool hasMessageType() => _messageType != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "to_userRef" field.
  DocumentReference? _toUserRef;
  DocumentReference? get toUserRef => _toUserRef;
  bool hasToUserRef() => _toUserRef != null;

  // "sent_from" field.
  String? _sentFrom;
  String get sentFrom => _sentFrom ?? '';
  bool hasSentFrom() => _sentFrom != null;

  // "mark_as_read" field.
  bool? _markAsRead;
  bool get markAsRead => _markAsRead ?? false;
  bool hasMarkAsRead() => _markAsRead != null;

  void _initializeFields() {
    _notificationId = snapshotData['notification_Id'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _notificationType = snapshotData['notification_type'] as String?;
    _messageType = snapshotData['message_type'] as String?;
    _message = snapshotData['message'] as String?;
    _toUserRef = snapshotData['to_userRef'] as DocumentReference?;
    _sentFrom = snapshotData['sent_from'] as String?;
    _markAsRead = snapshotData['mark_as_read'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  String? notificationId,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? notificationType,
  String? messageType,
  String? message,
  DocumentReference? toUserRef,
  String? sentFrom,
  bool? markAsRead,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notification_Id': notificationId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'notification_type': notificationType,
      'message_type': messageType,
      'message': message,
      'to_userRef': toUserRef,
      'sent_from': sentFrom,
      'mark_as_read': markAsRead,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.notificationId == e2?.notificationId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.notificationType == e2?.notificationType &&
        e1?.messageType == e2?.messageType &&
        e1?.message == e2?.message &&
        e1?.toUserRef == e2?.toUserRef &&
        e1?.sentFrom == e2?.sentFrom &&
        e1?.markAsRead == e2?.markAsRead;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.notificationId,
        e?.createdAt,
        e?.updatedAt,
        e?.notificationType,
        e?.messageType,
        e?.message,
        e?.toUserRef,
        e?.sentFrom,
        e?.markAsRead
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
