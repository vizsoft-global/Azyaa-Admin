import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TagsRecord extends FirestoreRecord {
  TagsRecord._(
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

  // "tag_id" field.
  String? _tagId;
  String get tagId => _tagId ?? '';
  bool hasTagId() => _tagId != null;

  // "tag_info" field.
  InfoStruct? _tagInfo;
  InfoStruct get tagInfo => _tagInfo ?? InfoStruct();
  bool hasTagInfo() => _tagInfo != null;

  // "tag_product_id" field.
  List<String>? _tagProductId;
  List<String> get tagProductId => _tagProductId ?? const [];
  bool hasTagProductId() => _tagProductId != null;

  // "tag_info_translate" field.
  TranslateInfoStruct? _tagInfoTranslate;
  TranslateInfoStruct get tagInfoTranslate =>
      _tagInfoTranslate ?? TranslateInfoStruct();
  bool hasTagInfoTranslate() => _tagInfoTranslate != null;

  // "tag_info_custom_translate" field.
  TranslateInfoStruct? _tagInfoCustomTranslate;
  TranslateInfoStruct get tagInfoCustomTranslate =>
      _tagInfoCustomTranslate ?? TranslateInfoStruct();
  bool hasTagInfoCustomTranslate() => _tagInfoCustomTranslate != null;

  // "serial_number" field.
  int? _serialNumber;
  int get serialNumber => _serialNumber ?? 0;
  bool hasSerialNumber() => _serialNumber != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _tagId = snapshotData['tag_id'] as String?;
    _tagInfo = snapshotData['tag_info'] is InfoStruct
        ? snapshotData['tag_info']
        : InfoStruct.maybeFromMap(snapshotData['tag_info']);
    _tagProductId = getDataList(snapshotData['tag_product_id']);
    _tagInfoTranslate = snapshotData['tag_info_translate']
            is TranslateInfoStruct
        ? snapshotData['tag_info_translate']
        : TranslateInfoStruct.maybeFromMap(snapshotData['tag_info_translate']);
    _tagInfoCustomTranslate =
        snapshotData['tag_info_custom_translate'] is TranslateInfoStruct
            ? snapshotData['tag_info_custom_translate']
            : TranslateInfoStruct.maybeFromMap(
                snapshotData['tag_info_custom_translate']);
    _serialNumber = castToType<int>(snapshotData['serial_number']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tags');

  static Stream<TagsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TagsRecord.fromSnapshot(s));

  static Future<TagsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TagsRecord.fromSnapshot(s));

  static TagsRecord fromSnapshot(DocumentSnapshot snapshot) => TagsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TagsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TagsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TagsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TagsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTagsRecordData({
  DateTime? createdAt,
  DateTime? updatedAt,
  String? status,
  String? tagId,
  InfoStruct? tagInfo,
  TranslateInfoStruct? tagInfoTranslate,
  TranslateInfoStruct? tagInfoCustomTranslate,
  int? serialNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'tag_id': tagId,
      'tag_info': InfoStruct().toMap(),
      'tag_info_translate': TranslateInfoStruct().toMap(),
      'tag_info_custom_translate': TranslateInfoStruct().toMap(),
      'serial_number': serialNumber,
    }.withoutNulls,
  );

  // Handle nested data for "tag_info" field.
  addInfoStructData(firestoreData, tagInfo, 'tag_info');

  // Handle nested data for "tag_info_translate" field.
  addTranslateInfoStructData(
      firestoreData, tagInfoTranslate, 'tag_info_translate');

  // Handle nested data for "tag_info_custom_translate" field.
  addTranslateInfoStructData(
      firestoreData, tagInfoCustomTranslate, 'tag_info_custom_translate');

  return firestoreData;
}

class TagsRecordDocumentEquality implements Equality<TagsRecord> {
  const TagsRecordDocumentEquality();

  @override
  bool equals(TagsRecord? e1, TagsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.status == e2?.status &&
        e1?.tagId == e2?.tagId &&
        e1?.tagInfo == e2?.tagInfo &&
        listEquality.equals(e1?.tagProductId, e2?.tagProductId) &&
        e1?.tagInfoTranslate == e2?.tagInfoTranslate &&
        e1?.tagInfoCustomTranslate == e2?.tagInfoCustomTranslate &&
        e1?.serialNumber == e2?.serialNumber;
  }

  @override
  int hash(TagsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.updatedAt,
        e?.status,
        e?.tagId,
        e?.tagInfo,
        e?.tagProductId,
        e?.tagInfoTranslate,
        e?.tagInfoCustomTranslate,
        e?.serialNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is TagsRecord;
}
