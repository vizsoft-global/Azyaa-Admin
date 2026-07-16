import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttributesRecord extends FirestoreRecord {
  AttributesRecord._(
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

  // "attribute_id" field.
  String? _attributeId;
  String get attributeId => _attributeId ?? '';
  bool hasAttributeId() => _attributeId != null;

  // "attribute_brand_id" field.
  List<String>? _attributeBrandId;
  List<String> get attributeBrandId => _attributeBrandId ?? const [];
  bool hasAttributeBrandId() => _attributeBrandId != null;

  // "attribute_info" field.
  InfoStruct? _attributeInfo;
  InfoStruct get attributeInfo => _attributeInfo ?? InfoStruct();
  bool hasAttributeInfo() => _attributeInfo != null;

  // "attribute_info_translate" field.
  TranslateInfoStruct? _attributeInfoTranslate;
  TranslateInfoStruct get attributeInfoTranslate =>
      _attributeInfoTranslate ?? TranslateInfoStruct();
  bool hasAttributeInfoTranslate() => _attributeInfoTranslate != null;

  // "attribute_info_custom_translate" field.
  TranslateInfoStruct? _attributeInfoCustomTranslate;
  TranslateInfoStruct get attributeInfoCustomTranslate =>
      _attributeInfoCustomTranslate ?? TranslateInfoStruct();
  bool hasAttributeInfoCustomTranslate() =>
      _attributeInfoCustomTranslate != null;

  // "serial_no" field.
  int? _serialNo;
  int get serialNo => _serialNo ?? 0;
  bool hasSerialNo() => _serialNo != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _attributeId = snapshotData['attribute_id'] as String?;
    _attributeBrandId = getDataList(snapshotData['attribute_brand_id']);
    _attributeInfo = snapshotData['attribute_info'] is InfoStruct
        ? snapshotData['attribute_info']
        : InfoStruct.maybeFromMap(snapshotData['attribute_info']);
    _attributeInfoTranslate =
        snapshotData['attribute_info_translate'] is TranslateInfoStruct
            ? snapshotData['attribute_info_translate']
            : TranslateInfoStruct.maybeFromMap(
                snapshotData['attribute_info_translate']);
    _attributeInfoCustomTranslate =
        snapshotData['attribute_info_custom_translate'] is TranslateInfoStruct
            ? snapshotData['attribute_info_custom_translate']
            : TranslateInfoStruct.maybeFromMap(
                snapshotData['attribute_info_custom_translate']);
    _serialNo = castToType<int>(snapshotData['serial_no']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('attributes');

  static Stream<AttributesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttributesRecord.fromSnapshot(s));

  static Future<AttributesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttributesRecord.fromSnapshot(s));

  static AttributesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttributesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttributesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttributesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttributesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttributesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttributesRecordData({
  DateTime? createdAt,
  DateTime? updatedAt,
  String? status,
  String? attributeId,
  InfoStruct? attributeInfo,
  TranslateInfoStruct? attributeInfoTranslate,
  TranslateInfoStruct? attributeInfoCustomTranslate,
  int? serialNo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'attribute_id': attributeId,
      'attribute_info': InfoStruct().toMap(),
      'attribute_info_translate': TranslateInfoStruct().toMap(),
      'attribute_info_custom_translate': TranslateInfoStruct().toMap(),
      'serial_no': serialNo,
    }.withoutNulls,
  );

  // Handle nested data for "attribute_info" field.
  addInfoStructData(firestoreData, attributeInfo, 'attribute_info');

  // Handle nested data for "attribute_info_translate" field.
  addTranslateInfoStructData(
      firestoreData, attributeInfoTranslate, 'attribute_info_translate');

  // Handle nested data for "attribute_info_custom_translate" field.
  addTranslateInfoStructData(firestoreData, attributeInfoCustomTranslate,
      'attribute_info_custom_translate');

  return firestoreData;
}

class AttributesRecordDocumentEquality implements Equality<AttributesRecord> {
  const AttributesRecordDocumentEquality();

  @override
  bool equals(AttributesRecord? e1, AttributesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.status == e2?.status &&
        e1?.attributeId == e2?.attributeId &&
        listEquality.equals(e1?.attributeBrandId, e2?.attributeBrandId) &&
        e1?.attributeInfo == e2?.attributeInfo &&
        e1?.attributeInfoTranslate == e2?.attributeInfoTranslate &&
        e1?.attributeInfoCustomTranslate == e2?.attributeInfoCustomTranslate &&
        e1?.serialNo == e2?.serialNo;
  }

  @override
  int hash(AttributesRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.updatedAt,
        e?.status,
        e?.attributeId,
        e?.attributeBrandId,
        e?.attributeInfo,
        e?.attributeInfoTranslate,
        e?.attributeInfoCustomTranslate,
        e?.serialNo
      ]);

  @override
  bool isValidKey(Object? o) => o is AttributesRecord;
}
