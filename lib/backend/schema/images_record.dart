import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImagesRecord extends FirestoreRecord {
  ImagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image_id" field.
  String? _imageId;
  String get imageId => _imageId ?? '';
  bool hasImageId() => _imageId != null;

  // "image_name" field.
  String? _imageName;
  String get imageName => _imageName ?? '';
  bool hasImageName() => _imageName != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "feature_image" field.
  String? _featureImage;
  String get featureImage => _featureImage ?? '';
  bool hasFeatureImage() => _featureImage != null;

  // "image_alt_text" field.
  String? _imageAltText;
  String get imageAltText => _imageAltText ?? '';
  bool hasImageAltText() => _imageAltText != null;

  // "image_responsive_list" field.
  List<String>? _imageResponsiveList;
  List<String> get imageResponsiveList => _imageResponsiveList ?? const [];
  bool hasImageResponsiveList() => _imageResponsiveList != null;

  // "image_uid" field.
  String? _imageUid;
  String get imageUid => _imageUid ?? '';
  bool hasImageUid() => _imageUid != null;

  void _initializeFields() {
    _imageId = snapshotData['image_id'] as String?;
    _imageName = snapshotData['image_name'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _featureImage = snapshotData['feature_image'] as String?;
    _imageAltText = snapshotData['image_alt_text'] as String?;
    _imageResponsiveList = getDataList(snapshotData['image_responsive_list']);
    _imageUid = snapshotData['image_uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('images');

  static Stream<ImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImagesRecord.fromSnapshot(s));

  static Future<ImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImagesRecord.fromSnapshot(s));

  static ImagesRecord fromSnapshot(DocumentSnapshot snapshot) => ImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImagesRecordData({
  String? imageId,
  String? imageName,
  DateTime? createdAt,
  String? featureImage,
  String? imageAltText,
  String? imageUid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image_id': imageId,
      'image_name': imageName,
      'created_at': createdAt,
      'feature_image': featureImage,
      'image_alt_text': imageAltText,
      'image_uid': imageUid,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImagesRecordDocumentEquality implements Equality<ImagesRecord> {
  const ImagesRecordDocumentEquality();

  @override
  bool equals(ImagesRecord? e1, ImagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.imageId == e2?.imageId &&
        e1?.imageName == e2?.imageName &&
        e1?.createdAt == e2?.createdAt &&
        e1?.featureImage == e2?.featureImage &&
        e1?.imageAltText == e2?.imageAltText &&
        listEquality.equals(e1?.imageResponsiveList, e2?.imageResponsiveList) &&
        e1?.imageUid == e2?.imageUid;
  }

  @override
  int hash(ImagesRecord? e) => const ListEquality().hash([
        e?.imageId,
        e?.imageName,
        e?.createdAt,
        e?.featureImage,
        e?.imageAltText,
        e?.imageResponsiveList,
        e?.imageUid
      ]);

  @override
  bool isValidKey(Object? o) => o is ImagesRecord;
}
