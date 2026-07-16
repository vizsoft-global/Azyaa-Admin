import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserVtoPlansRecord extends FirestoreRecord {
  UserVtoPlansRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

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

  // "vto_plan_id" field.
  int? _vtoPlanId;
  int get vtoPlanId => _vtoPlanId ?? 0;
  bool hasVtoPlanId() => _vtoPlanId != null;

  // "vto_info" field.
  InfoStruct? _vtoInfo;
  InfoStruct get vtoInfo => _vtoInfo ?? InfoStruct();
  bool hasVtoInfo() => _vtoInfo != null;

  // "vto_point" field.
  int? _vtoPoint;
  int get vtoPoint => _vtoPoint ?? 0;
  bool hasVtoPoint() => _vtoPoint != null;

  void _initializeFields() {
    _price = castToType<double>(snapshotData['price']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _vtoPlanId = castToType<int>(snapshotData['vto_plan_id']);
    _vtoInfo = snapshotData['vto_info'] is InfoStruct
        ? snapshotData['vto_info']
        : InfoStruct.maybeFromMap(snapshotData['vto_info']);
    _vtoPoint = castToType<int>(snapshotData['vto_point']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_vto_plans');

  static Stream<UserVtoPlansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserVtoPlansRecord.fromSnapshot(s));

  static Future<UserVtoPlansRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserVtoPlansRecord.fromSnapshot(s));

  static UserVtoPlansRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserVtoPlansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserVtoPlansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserVtoPlansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserVtoPlansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserVtoPlansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserVtoPlansRecordData({
  double? price,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? status,
  int? vtoPlanId,
  InfoStruct? vtoInfo,
  int? vtoPoint,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'price': price,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'vto_plan_id': vtoPlanId,
      'vto_info': InfoStruct().toMap(),
      'vto_point': vtoPoint,
    }.withoutNulls,
  );

  // Handle nested data for "vto_info" field.
  addInfoStructData(firestoreData, vtoInfo, 'vto_info');

  return firestoreData;
}

class UserVtoPlansRecordDocumentEquality
    implements Equality<UserVtoPlansRecord> {
  const UserVtoPlansRecordDocumentEquality();

  @override
  bool equals(UserVtoPlansRecord? e1, UserVtoPlansRecord? e2) {
    return e1?.price == e2?.price &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.status == e2?.status &&
        e1?.vtoPlanId == e2?.vtoPlanId &&
        e1?.vtoInfo == e2?.vtoInfo &&
        e1?.vtoPoint == e2?.vtoPoint;
  }

  @override
  int hash(UserVtoPlansRecord? e) => const ListEquality().hash([
        e?.price,
        e?.createdAt,
        e?.updatedAt,
        e?.status,
        e?.vtoPlanId,
        e?.vtoInfo,
        e?.vtoPoint
      ]);

  @override
  bool isValidKey(Object? o) => o is UserVtoPlansRecord;
}
