import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BannersRecord extends FirestoreRecord {
  BannersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "banner_title" field.
  String? _bannerTitle;
  String get bannerTitle => _bannerTitle ?? '';
  bool hasBannerTitle() => _bannerTitle != null;

  // "banner_description" field.
  String? _bannerDescription;
  String get bannerDescription => _bannerDescription ?? '';
  bool hasBannerDescription() => _bannerDescription != null;

  // "banner_image" field.
  String? _bannerImage;
  String get bannerImage => _bannerImage ?? '';
  bool hasBannerImage() => _bannerImage != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _bannerTitle = snapshotData['banner_title'] as String?;
    _bannerDescription = snapshotData['banner_description'] as String?;
    _bannerImage = snapshotData['banner_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('banners');

  static Stream<BannersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BannersRecord.fromSnapshot(s));

  static Future<BannersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BannersRecord.fromSnapshot(s));

  static BannersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BannersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BannersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BannersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BannersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BannersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBannersRecordData({
  DateTime? createdAt,
  String? status,
  String? bannerTitle,
  String? bannerDescription,
  String? bannerImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'status': status,
      'banner_title': bannerTitle,
      'banner_description': bannerDescription,
      'banner_image': bannerImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class BannersRecordDocumentEquality implements Equality<BannersRecord> {
  const BannersRecordDocumentEquality();

  @override
  bool equals(BannersRecord? e1, BannersRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.status == e2?.status &&
        e1?.bannerTitle == e2?.bannerTitle &&
        e1?.bannerDescription == e2?.bannerDescription &&
        e1?.bannerImage == e2?.bannerImage;
  }

  @override
  int hash(BannersRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.status,
        e?.bannerTitle,
        e?.bannerDescription,
        e?.bannerImage
      ]);

  @override
  bool isValidKey(Object? o) => o is BannersRecord;
}
