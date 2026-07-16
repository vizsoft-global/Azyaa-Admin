import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryRecord extends FirestoreRecord {
  CategoryRecord._(
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

  // "category_id" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  bool hasCategoryId() => _categoryId != null;

  // "category_info" field.
  InfoStruct? _categoryInfo;
  InfoStruct get categoryInfo => _categoryInfo ?? InfoStruct();
  bool hasCategoryInfo() => _categoryInfo != null;

  // "category_product_list" field.
  List<String>? _categoryProductList;
  List<String> get categoryProductList => _categoryProductList ?? const [];
  bool hasCategoryProductList() => _categoryProductList != null;

  // "category_parent_id" field.
  String? _categoryParentId;
  String get categoryParentId => _categoryParentId ?? '';
  bool hasCategoryParentId() => _categoryParentId != null;

  // "category_marketing" field.
  MarketingStruct? _categoryMarketing;
  MarketingStruct get categoryMarketing =>
      _categoryMarketing ?? MarketingStruct();
  bool hasCategoryMarketing() => _categoryMarketing != null;

  // "category_info_translate" field.
  TranslateInfoStruct? _categoryInfoTranslate;
  TranslateInfoStruct get categoryInfoTranslate =>
      _categoryInfoTranslate ?? TranslateInfoStruct();
  bool hasCategoryInfoTranslate() => _categoryInfoTranslate != null;

  // "category_info_custome_translate" field.
  TranslateInfoStruct? _categoryInfoCustomeTranslate;
  TranslateInfoStruct get categoryInfoCustomeTranslate =>
      _categoryInfoCustomeTranslate ?? TranslateInfoStruct();
  bool hasCategoryInfoCustomeTranslate() =>
      _categoryInfoCustomeTranslate != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _categoryId = snapshotData['category_id'] as String?;
    _categoryInfo = snapshotData['category_info'] is InfoStruct
        ? snapshotData['category_info']
        : InfoStruct.maybeFromMap(snapshotData['category_info']);
    _categoryProductList = getDataList(snapshotData['category_product_list']);
    _categoryParentId = snapshotData['category_parent_id'] as String?;
    _categoryMarketing = snapshotData['category_marketing'] is MarketingStruct
        ? snapshotData['category_marketing']
        : MarketingStruct.maybeFromMap(snapshotData['category_marketing']);
    _categoryInfoTranslate =
        snapshotData['category_info_translate'] is TranslateInfoStruct
            ? snapshotData['category_info_translate']
            : TranslateInfoStruct.maybeFromMap(
                snapshotData['category_info_translate']);
    _categoryInfoCustomeTranslate =
        snapshotData['category_info_custome_translate'] is TranslateInfoStruct
            ? snapshotData['category_info_custome_translate']
            : TranslateInfoStruct.maybeFromMap(
                snapshotData['category_info_custome_translate']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('category');

  static Stream<CategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryRecord.fromSnapshot(s));

  static Future<CategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryRecord.fromSnapshot(s));

  static CategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryRecord._(reference, mapFromFirestore(data));

  static CategoryRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CategoryRecord.getDocumentFromData(
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
          'category_id': snapshot.data['category_id'],
          'category_info':
              InfoStruct.fromAlgoliaData(snapshot.data['category_info'] ?? {})
                  .toMap(),
          'category_product_list': safeGet(
            () => snapshot.data['category_product_list'].toList(),
          ),
          'category_parent_id': snapshot.data['category_parent_id'],
          'category_marketing': MarketingStruct.fromAlgoliaData(
                  snapshot.data['category_marketing'] ?? {})
              .toMap(),
          'category_info_translate': TranslateInfoStruct.fromAlgoliaData(
                  snapshot.data['category_info_translate'] ?? {})
              .toMap(),
          'category_info_custome_translate':
              TranslateInfoStruct.fromAlgoliaData(
                      snapshot.data['category_info_custome_translate'] ?? {})
                  .toMap(),
        },
        CategoryRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CategoryRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'category',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'CategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryRecordData({
  DateTime? createdAt,
  DateTime? updatedAt,
  String? status,
  String? categoryId,
  InfoStruct? categoryInfo,
  String? categoryParentId,
  MarketingStruct? categoryMarketing,
  TranslateInfoStruct? categoryInfoTranslate,
  TranslateInfoStruct? categoryInfoCustomeTranslate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'category_id': categoryId,
      'category_info': InfoStruct().toMap(),
      'category_parent_id': categoryParentId,
      'category_marketing': MarketingStruct().toMap(),
      'category_info_translate': TranslateInfoStruct().toMap(),
      'category_info_custome_translate': TranslateInfoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "category_info" field.
  addInfoStructData(firestoreData, categoryInfo, 'category_info');

  // Handle nested data for "category_marketing" field.
  addMarketingStructData(
      firestoreData, categoryMarketing, 'category_marketing');

  // Handle nested data for "category_info_translate" field.
  addTranslateInfoStructData(
      firestoreData, categoryInfoTranslate, 'category_info_translate');

  // Handle nested data for "category_info_custome_translate" field.
  addTranslateInfoStructData(firestoreData, categoryInfoCustomeTranslate,
      'category_info_custome_translate');

  return firestoreData;
}

class CategoryRecordDocumentEquality implements Equality<CategoryRecord> {
  const CategoryRecordDocumentEquality();

  @override
  bool equals(CategoryRecord? e1, CategoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.status == e2?.status &&
        e1?.categoryId == e2?.categoryId &&
        e1?.categoryInfo == e2?.categoryInfo &&
        listEquality.equals(e1?.categoryProductList, e2?.categoryProductList) &&
        e1?.categoryParentId == e2?.categoryParentId &&
        e1?.categoryMarketing == e2?.categoryMarketing &&
        e1?.categoryInfoTranslate == e2?.categoryInfoTranslate &&
        e1?.categoryInfoCustomeTranslate == e2?.categoryInfoCustomeTranslate;
  }

  @override
  int hash(CategoryRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.updatedAt,
        e?.status,
        e?.categoryId,
        e?.categoryInfo,
        e?.categoryProductList,
        e?.categoryParentId,
        e?.categoryMarketing,
        e?.categoryInfoTranslate,
        e?.categoryInfoCustomeTranslate
      ]);

  @override
  bool isValidKey(Object? o) => o is CategoryRecord;
}
