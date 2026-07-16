import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BrandsRecord extends FirestoreRecord {
  BrandsRecord._(
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

  // "brand_id" field.
  String? _brandId;
  String get brandId => _brandId ?? '';
  bool hasBrandId() => _brandId != null;

  // "brand_info" field.
  InfoStruct? _brandInfo;
  InfoStruct get brandInfo => _brandInfo ?? InfoStruct();
  bool hasBrandInfo() => _brandInfo != null;

  // "brand_product_id" field.
  List<String>? _brandProductId;
  List<String> get brandProductId => _brandProductId ?? const [];
  bool hasBrandProductId() => _brandProductId != null;

  // "brand_info_translate" field.
  TranslateInfoStruct? _brandInfoTranslate;
  TranslateInfoStruct get brandInfoTranslate =>
      _brandInfoTranslate ?? TranslateInfoStruct();
  bool hasBrandInfoTranslate() => _brandInfoTranslate != null;

  // "brand_info_custom_translate" field.
  TranslateInfoStruct? _brandInfoCustomTranslate;
  TranslateInfoStruct get brandInfoCustomTranslate =>
      _brandInfoCustomTranslate ?? TranslateInfoStruct();
  bool hasBrandInfoCustomTranslate() => _brandInfoCustomTranslate != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _brandId = snapshotData['brand_id'] as String?;
    _brandInfo = snapshotData['brand_info'] is InfoStruct
        ? snapshotData['brand_info']
        : InfoStruct.maybeFromMap(snapshotData['brand_info']);
    _brandProductId = getDataList(snapshotData['brand_product_id']);
    _brandInfoTranslate =
        snapshotData['brand_info_translate'] is TranslateInfoStruct
            ? snapshotData['brand_info_translate']
            : TranslateInfoStruct.maybeFromMap(
                snapshotData['brand_info_translate']);
    _brandInfoCustomTranslate =
        snapshotData['brand_info_custom_translate'] is TranslateInfoStruct
            ? snapshotData['brand_info_custom_translate']
            : TranslateInfoStruct.maybeFromMap(
                snapshotData['brand_info_custom_translate']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('brands');

  static Stream<BrandsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BrandsRecord.fromSnapshot(s));

  static Future<BrandsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BrandsRecord.fromSnapshot(s));

  static BrandsRecord fromSnapshot(DocumentSnapshot snapshot) => BrandsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BrandsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BrandsRecord._(reference, mapFromFirestore(data));

  static BrandsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      BrandsRecord.getDocumentFromData(
        {
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'updated_at': convertAlgoliaParam(
            snapshot.data['updated_at'],
            ParamType.DateTime,
            false,
          ),
          'status': snapshot.data['status'],
          'brand_id': snapshot.data['brand_id'],
          'brand_info':
              InfoStruct.fromAlgoliaData(snapshot.data['brand_info'] ?? {})
                  .toMap(),
          'brand_product_id': safeGet(
            () => snapshot.data['brand_product_id'].toList(),
          ),
          'brand_info_translate': TranslateInfoStruct.fromAlgoliaData(
                  snapshot.data['brand_info_translate'] ?? {})
              .toMap(),
          'brand_info_custom_translate': TranslateInfoStruct.fromAlgoliaData(
                  snapshot.data['brand_info_custom_translate'] ?? {})
              .toMap(),
        },
        BrandsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<BrandsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'brands',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'BrandsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BrandsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBrandsRecordData({
  DateTime? createdAt,
  DateTime? updatedAt,
  String? status,
  String? brandId,
  InfoStruct? brandInfo,
  TranslateInfoStruct? brandInfoTranslate,
  TranslateInfoStruct? brandInfoCustomTranslate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'brand_id': brandId,
      'brand_info': InfoStruct().toMap(),
      'brand_info_translate': TranslateInfoStruct().toMap(),
      'brand_info_custom_translate': TranslateInfoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "brand_info" field.
  addInfoStructData(firestoreData, brandInfo, 'brand_info');

  // Handle nested data for "brand_info_translate" field.
  addTranslateInfoStructData(
      firestoreData, brandInfoTranslate, 'brand_info_translate');

  // Handle nested data for "brand_info_custom_translate" field.
  addTranslateInfoStructData(
      firestoreData, brandInfoCustomTranslate, 'brand_info_custom_translate');

  return firestoreData;
}

class BrandsRecordDocumentEquality implements Equality<BrandsRecord> {
  const BrandsRecordDocumentEquality();

  @override
  bool equals(BrandsRecord? e1, BrandsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.status == e2?.status &&
        e1?.brandId == e2?.brandId &&
        e1?.brandInfo == e2?.brandInfo &&
        listEquality.equals(e1?.brandProductId, e2?.brandProductId) &&
        e1?.brandInfoTranslate == e2?.brandInfoTranslate &&
        e1?.brandInfoCustomTranslate == e2?.brandInfoCustomTranslate;
  }

  @override
  int hash(BrandsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.updatedAt,
        e?.status,
        e?.brandId,
        e?.brandInfo,
        e?.brandProductId,
        e?.brandInfoTranslate,
        e?.brandInfoCustomTranslate
      ]);

  @override
  bool isValidKey(Object? o) => o is BrandsRecord;
}
