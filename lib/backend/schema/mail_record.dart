import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MailRecord extends FirestoreRecord {
  MailRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "to" field.
  String? _to;
  String get to => _to ?? '';
  bool hasTo() => _to != null;

  // "message" field.
  MailBodyStruct? _message;
  MailBodyStruct get message => _message ?? MailBodyStruct();
  bool hasMessage() => _message != null;

  // "template" field.
  MailInfoStruct? _template;
  MailInfoStruct get template => _template ?? MailInfoStruct();
  bool hasTemplate() => _template != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _to = snapshotData['to'] as String?;
    _message = snapshotData['message'] is MailBodyStruct
        ? snapshotData['message']
        : MailBodyStruct.maybeFromMap(snapshotData['message']);
    _template = snapshotData['template'] is MailInfoStruct
        ? snapshotData['template']
        : MailInfoStruct.maybeFromMap(snapshotData['template']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mail');

  static Stream<MailRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MailRecord.fromSnapshot(s));

  static Future<MailRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MailRecord.fromSnapshot(s));

  static MailRecord fromSnapshot(DocumentSnapshot snapshot) => MailRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MailRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MailRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MailRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MailRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMailRecordData({
  DateTime? createdAt,
  String? to,
  MailBodyStruct? message,
  MailInfoStruct? template,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'to': to,
      'message': MailBodyStruct().toMap(),
      'template': MailInfoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "message" field.
  addMailBodyStructData(firestoreData, message, 'message');

  // Handle nested data for "template" field.
  addMailInfoStructData(firestoreData, template, 'template');

  return firestoreData;
}

class MailRecordDocumentEquality implements Equality<MailRecord> {
  const MailRecordDocumentEquality();

  @override
  bool equals(MailRecord? e1, MailRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.to == e2?.to &&
        e1?.message == e2?.message &&
        e1?.template == e2?.template;
  }

  @override
  int hash(MailRecord? e) =>
      const ListEquality().hash([e?.createdAt, e?.to, e?.message, e?.template]);

  @override
  bool isValidKey(Object? o) => o is MailRecord;
}
