import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideosRecord extends FirestoreRecord {
  VideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "video_id" field.
  String? _videoId;
  String get videoId => _videoId ?? '';
  bool hasVideoId() => _videoId != null;

  // "video_name" field.
  String? _videoName;
  String get videoName => _videoName ?? '';
  bool hasVideoName() => _videoName != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "video_description" field.
  String? _videoDescription;
  String get videoDescription => _videoDescription ?? '';
  bool hasVideoDescription() => _videoDescription != null;

  // "video_duration" field.
  String? _videoDuration;
  String get videoDuration => _videoDuration ?? '';
  bool hasVideoDuration() => _videoDuration != null;

  // "video_size" field.
  double? _videoSize;
  double get videoSize => _videoSize ?? 0.0;
  bool hasVideoSize() => _videoSize != null;

  // "video_image" field.
  String? _videoImage;
  String get videoImage => _videoImage ?? '';
  bool hasVideoImage() => _videoImage != null;

  void _initializeFields() {
    _videoId = snapshotData['video_id'] as String?;
    _videoName = snapshotData['video_name'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _videoDescription = snapshotData['video_description'] as String?;
    _videoDuration = snapshotData['video_duration'] as String?;
    _videoSize = castToType<double>(snapshotData['video_size']);
    _videoImage = snapshotData['video_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videos');

  static Stream<VideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosRecord.fromSnapshot(s));

  static Future<VideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosRecord.fromSnapshot(s));

  static VideosRecord fromSnapshot(DocumentSnapshot snapshot) => VideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideosRecordData({
  String? videoId,
  String? videoName,
  DateTime? createdAt,
  String? videoDescription,
  String? videoDuration,
  double? videoSize,
  String? videoImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'video_id': videoId,
      'video_name': videoName,
      'created_at': createdAt,
      'video_description': videoDescription,
      'video_duration': videoDuration,
      'video_size': videoSize,
      'video_image': videoImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideosRecordDocumentEquality implements Equality<VideosRecord> {
  const VideosRecordDocumentEquality();

  @override
  bool equals(VideosRecord? e1, VideosRecord? e2) {
    return e1?.videoId == e2?.videoId &&
        e1?.videoName == e2?.videoName &&
        e1?.createdAt == e2?.createdAt &&
        e1?.videoDescription == e2?.videoDescription &&
        e1?.videoDuration == e2?.videoDuration &&
        e1?.videoSize == e2?.videoSize &&
        e1?.videoImage == e2?.videoImage;
  }

  @override
  int hash(VideosRecord? e) => const ListEquality().hash([
        e?.videoId,
        e?.videoName,
        e?.createdAt,
        e?.videoDescription,
        e?.videoDuration,
        e?.videoSize,
        e?.videoImage
      ]);

  @override
  bool isValidKey(Object? o) => o is VideosRecord;
}
