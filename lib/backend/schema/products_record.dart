import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
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

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "product_info" field.
  InfoStruct? _productInfo;
  InfoStruct get productInfo => _productInfo ?? InfoStruct();
  bool hasProductInfo() => _productInfo != null;

  // "product" field.
  ProductStockStruct? _product;
  ProductStockStruct get product => _product ?? ProductStockStruct();
  bool hasProduct() => _product != null;

  // "product_authorizer" field.
  ProductAuthorizeInfoStruct? _productAuthorizer;
  ProductAuthorizeInfoStruct get productAuthorizer =>
      _productAuthorizer ?? ProductAuthorizeInfoStruct();
  bool hasProductAuthorizer() => _productAuthorizer != null;

  // "product_review" field.
  List<ProductReviewsStruct>? _productReview;
  List<ProductReviewsStruct> get productReview => _productReview ?? const [];
  bool hasProductReview() => _productReview != null;

  // "product_type" field.
  String? _productType;
  String get productType => _productType ?? '';
  bool hasProductType() => _productType != null;

  // "product_attribute" field.
  List<ProductAttributesStruct>? _productAttribute;
  List<ProductAttributesStruct> get productAttribute =>
      _productAttribute ?? const [];
  bool hasProductAttribute() => _productAttribute != null;

  // "product_variation" field.
  List<ProductVariationStruct>? _productVariation;
  List<ProductVariationStruct> get productVariation =>
      _productVariation ?? const [];
  bool hasProductVariation() => _productVariation != null;

  // "product_marketing" field.
  MarketingStruct? _productMarketing;
  MarketingStruct get productMarketing =>
      _productMarketing ?? MarketingStruct();
  bool hasProductMarketing() => _productMarketing != null;

  // "creator_id" field.
  String? _creatorId;
  String get creatorId => _creatorId ?? '';
  bool hasCreatorId() => _creatorId != null;

  // "product_info_translate" field.
  TranslateInfoStruct? _productInfoTranslate;
  TranslateInfoStruct get productInfoTranslate =>
      _productInfoTranslate ?? TranslateInfoStruct();
  bool hasProductInfoTranslate() => _productInfoTranslate != null;

  // "product_info_custom_translate" field.
  TranslateInfoStruct? _productInfoCustomTranslate;
  TranslateInfoStruct get productInfoCustomTranslate =>
      _productInfoCustomTranslate ?? TranslateInfoStruct();
  bool hasProductInfoCustomTranslate() => _productInfoCustomTranslate != null;

  // "product_vendor_info" field.
  ProductVendorInfoStruct? _productVendorInfo;
  ProductVendorInfoStruct get productVendorInfo =>
      _productVendorInfo ?? ProductVendorInfoStruct();
  bool hasProductVendorInfo() => _productVendorInfo != null;

  // "product_notify_list" field.
  List<String>? _productNotifyList;
  List<String> get productNotifyList => _productNotifyList ?? const [];
  bool hasProductNotifyList() => _productNotifyList != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _productId = snapshotData['product_id'] as String?;
    _productInfo = snapshotData['product_info'] is InfoStruct
        ? snapshotData['product_info']
        : InfoStruct.maybeFromMap(snapshotData['product_info']);
    _product = snapshotData['product'] is ProductStockStruct
        ? snapshotData['product']
        : ProductStockStruct.maybeFromMap(snapshotData['product']);
    _productAuthorizer =
        snapshotData['product_authorizer'] is ProductAuthorizeInfoStruct
            ? snapshotData['product_authorizer']
            : ProductAuthorizeInfoStruct.maybeFromMap(
                snapshotData['product_authorizer']);
    _productReview = getStructList(
      snapshotData['product_review'],
      ProductReviewsStruct.fromMap,
    );
    _productType = snapshotData['product_type'] as String?;
    _productAttribute = getStructList(
      snapshotData['product_attribute'],
      ProductAttributesStruct.fromMap,
    );
    _productVariation = getStructList(
      snapshotData['product_variation'],
      ProductVariationStruct.fromMap,
    );
    _productMarketing = snapshotData['product_marketing'] is MarketingStruct
        ? snapshotData['product_marketing']
        : MarketingStruct.maybeFromMap(snapshotData['product_marketing']);
    _creatorId = snapshotData['creator_id'] as String?;
    _productInfoTranslate =
        snapshotData['product_info_translate'] is TranslateInfoStruct
            ? snapshotData['product_info_translate']
            : TranslateInfoStruct.maybeFromMap(
                snapshotData['product_info_translate']);
    _productInfoCustomTranslate =
        snapshotData['product_info_custom_translate'] is TranslateInfoStruct
            ? snapshotData['product_info_custom_translate']
            : TranslateInfoStruct.maybeFromMap(
                snapshotData['product_info_custom_translate']);
    _productVendorInfo =
        snapshotData['product_vendor_info'] is ProductVendorInfoStruct
            ? snapshotData['product_vendor_info']
            : ProductVendorInfoStruct.maybeFromMap(
                snapshotData['product_vendor_info']);
    _productNotifyList = getDataList(snapshotData['product_notify_list']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  static ProductsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProductsRecord.getDocumentFromData(
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
          'product_id': snapshot.data['product_id'],
          'product_info':
              InfoStruct.fromAlgoliaData(snapshot.data['product_info'] ?? {})
                  .toMap(),
          'product':
              ProductStockStruct.fromAlgoliaData(snapshot.data['product'] ?? {})
                  .toMap(),
          'product_authorizer': ProductAuthorizeInfoStruct.fromAlgoliaData(
                  snapshot.data['product_authorizer'] ?? {})
              .toMap(),
          'product_review': safeGet(
            () => (snapshot.data['product_review'] as Iterable)
                .map((d) => ProductReviewsStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'product_type': snapshot.data['product_type'],
          'product_attribute': safeGet(
            () => (snapshot.data['product_attribute'] as Iterable)
                .map((d) => ProductAttributesStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'product_variation': safeGet(
            () => (snapshot.data['product_variation'] as Iterable)
                .map((d) => ProductVariationStruct.fromAlgoliaData(d).toMap())
                .toList(),
          ),
          'product_marketing': MarketingStruct.fromAlgoliaData(
                  snapshot.data['product_marketing'] ?? {})
              .toMap(),
          'creator_id': snapshot.data['creator_id'],
          'product_info_translate': TranslateInfoStruct.fromAlgoliaData(
                  snapshot.data['product_info_translate'] ?? {})
              .toMap(),
          'product_info_custom_translate': TranslateInfoStruct.fromAlgoliaData(
                  snapshot.data['product_info_custom_translate'] ?? {})
              .toMap(),
          'product_vendor_info': ProductVendorInfoStruct.fromAlgoliaData(
                  snapshot.data['product_vendor_info'] ?? {})
              .toMap(),
          'product_notify_list': safeGet(
            () => snapshot.data['product_notify_list'].toList(),
          ),
        },
        ProductsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProductsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'products',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  DateTime? createdAt,
  DateTime? updatedAt,
  String? status,
  String? productId,
  InfoStruct? productInfo,
  ProductStockStruct? product,
  ProductAuthorizeInfoStruct? productAuthorizer,
  String? productType,
  MarketingStruct? productMarketing,
  String? creatorId,
  TranslateInfoStruct? productInfoTranslate,
  TranslateInfoStruct? productInfoCustomTranslate,
  ProductVendorInfoStruct? productVendorInfo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'product_id': productId,
      'product_info': InfoStruct().toMap(),
      'product': ProductStockStruct().toMap(),
      'product_authorizer': ProductAuthorizeInfoStruct().toMap(),
      'product_type': productType,
      'product_marketing': MarketingStruct().toMap(),
      'creator_id': creatorId,
      'product_info_translate': TranslateInfoStruct().toMap(),
      'product_info_custom_translate': TranslateInfoStruct().toMap(),
      'product_vendor_info': ProductVendorInfoStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "product_info" field.
  addInfoStructData(firestoreData, productInfo, 'product_info');

  // Handle nested data for "product" field.
  addProductStockStructData(firestoreData, product, 'product');

  // Handle nested data for "product_authorizer" field.
  addProductAuthorizeInfoStructData(
      firestoreData, productAuthorizer, 'product_authorizer');

  // Handle nested data for "product_marketing" field.
  addMarketingStructData(firestoreData, productMarketing, 'product_marketing');

  // Handle nested data for "product_info_translate" field.
  addTranslateInfoStructData(
      firestoreData, productInfoTranslate, 'product_info_translate');

  // Handle nested data for "product_info_custom_translate" field.
  addTranslateInfoStructData(firestoreData, productInfoCustomTranslate,
      'product_info_custom_translate');

  // Handle nested data for "product_vendor_info" field.
  addProductVendorInfoStructData(
      firestoreData, productVendorInfo, 'product_vendor_info');

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.status == e2?.status &&
        e1?.productId == e2?.productId &&
        e1?.productInfo == e2?.productInfo &&
        e1?.product == e2?.product &&
        e1?.productAuthorizer == e2?.productAuthorizer &&
        listEquality.equals(e1?.productReview, e2?.productReview) &&
        e1?.productType == e2?.productType &&
        listEquality.equals(e1?.productAttribute, e2?.productAttribute) &&
        listEquality.equals(e1?.productVariation, e2?.productVariation) &&
        e1?.productMarketing == e2?.productMarketing &&
        e1?.creatorId == e2?.creatorId &&
        e1?.productInfoTranslate == e2?.productInfoTranslate &&
        e1?.productInfoCustomTranslate == e2?.productInfoCustomTranslate &&
        e1?.productVendorInfo == e2?.productVendorInfo &&
        listEquality.equals(e1?.productNotifyList, e2?.productNotifyList);
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.updatedAt,
        e?.status,
        e?.productId,
        e?.productInfo,
        e?.product,
        e?.productAuthorizer,
        e?.productReview,
        e?.productType,
        e?.productAttribute,
        e?.productVariation,
        e?.productMarketing,
        e?.creatorId,
        e?.productInfoTranslate,
        e?.productInfoCustomTranslate,
        e?.productVendorInfo,
        e?.productNotifyList
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
