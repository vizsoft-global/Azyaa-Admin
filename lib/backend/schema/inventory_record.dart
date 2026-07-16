import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InventoryRecord extends FirestoreRecord {
  InventoryRecord._(
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

  // "last_counted_at" field.
  DateTime? _lastCountedAt;
  DateTime? get lastCountedAt => _lastCountedAt;
  bool hasLastCountedAt() => _lastCountedAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "stock_status" field.
  String? _stockStatus;
  String get stockStatus => _stockStatus ?? '';
  bool hasStockStatus() => _stockStatus != null;

  // "stock_reserved" field.
  int? _stockReserved;
  int get stockReserved => _stockReserved ?? 0;
  bool hasStockReserved() => _stockReserved != null;

  // "stock_on_hand" field.
  int? _stockOnHand;
  int get stockOnHand => _stockOnHand ?? 0;
  bool hasStockOnHand() => _stockOnHand != null;

  // "threshold_stock" field.
  int? _thresholdStock;
  int get thresholdStock => _thresholdStock ?? 0;
  bool hasThresholdStock() => _thresholdStock != null;

  // "is_preferred_vendor" field.
  bool? _isPreferredVendor;
  bool get isPreferredVendor => _isPreferredVendor ?? false;
  bool hasIsPreferredVendor() => _isPreferredVendor != null;

  // "shipped_number_days" field.
  int? _shippedNumberDays;
  int get shippedNumberDays => _shippedNumberDays ?? 0;
  bool hasShippedNumberDays() => _shippedNumberDays != null;

  // "designer_uid" field.
  String? _designerUid;
  String get designerUid => _designerUid ?? '';
  bool hasDesignerUid() => _designerUid != null;

  // "stock_unavailable" field.
  int? _stockUnavailable;
  int get stockUnavailable => _stockUnavailable ?? 0;
  bool hasStockUnavailable() => _stockUnavailable != null;

  // "stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  bool hasStock() => _stock != null;

  // "inventory_id" field.
  String? _inventoryId;
  String get inventoryId => _inventoryId ?? '';
  bool hasInventoryId() => _inventoryId != null;

  // "stock_source" field.
  String? _stockSource;
  String get stockSource => _stockSource ?? '';
  bool hasStockSource() => _stockSource != null;

  // "restock_request_raised_ref" field.
  DocumentReference? _restockRequestRaisedRef;
  DocumentReference? get restockRequestRaisedRef => _restockRequestRaisedRef;
  bool hasRestockRequestRaisedRef() => _restockRequestRaisedRef != null;

  // "enquiry_raised_ref" field.
  DocumentReference? _enquiryRaisedRef;
  DocumentReference? get enquiryRaisedRef => _enquiryRaisedRef;
  bool hasEnquiryRaisedRef() => _enquiryRaisedRef != null;

  // "product_sku" field.
  String? _productSku;
  String get productSku => _productSku ?? '';
  bool hasProductSku() => _productSku != null;

  // "product_type" field.
  String? _productType;
  String get productType => _productType ?? '';
  bool hasProductType() => _productType != null;

  // "notify_designer" field.
  bool? _notifyDesigner;
  bool get notifyDesigner => _notifyDesigner ?? false;
  bool hasNotifyDesigner() => _notifyDesigner != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _lastCountedAt = snapshotData['last_counted_at'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _productId = snapshotData['product_id'] as String?;
    _productRef = snapshotData['product_ref'] as DocumentReference?;
    _stockStatus = snapshotData['stock_status'] as String?;
    _stockReserved = castToType<int>(snapshotData['stock_reserved']);
    _stockOnHand = castToType<int>(snapshotData['stock_on_hand']);
    _thresholdStock = castToType<int>(snapshotData['threshold_stock']);
    _isPreferredVendor = snapshotData['is_preferred_vendor'] as bool?;
    _shippedNumberDays = castToType<int>(snapshotData['shipped_number_days']);
    _designerUid = snapshotData['designer_uid'] as String?;
    _stockUnavailable = castToType<int>(snapshotData['stock_unavailable']);
    _stock = castToType<int>(snapshotData['stock']);
    _inventoryId = snapshotData['inventory_id'] as String?;
    _stockSource = snapshotData['stock_source'] as String?;
    _restockRequestRaisedRef =
        snapshotData['restock_request_raised_ref'] as DocumentReference?;
    _enquiryRaisedRef =
        snapshotData['enquiry_raised_ref'] as DocumentReference?;
    _productSku = snapshotData['product_sku'] as String?;
    _productType = snapshotData['product_type'] as String?;
    _notifyDesigner = snapshotData['notify_designer'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inventory');

  static Stream<InventoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InventoryRecord.fromSnapshot(s));

  static Future<InventoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InventoryRecord.fromSnapshot(s));

  static InventoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InventoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InventoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InventoryRecord._(reference, mapFromFirestore(data));

  static InventoryRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      InventoryRecord.getDocumentFromData(
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
          'last_counted_at': convertAlgoliaParam(
            snapshot.data['last_counted_at'],
            ParamType.DateTime,
            false,
          ),
          'status': snapshot.data['status'],
          'product_id': snapshot.data['product_id'],
          'product_ref': convertAlgoliaParam(
            snapshot.data['product_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'stock_status': snapshot.data['stock_status'],
          'stock_reserved': convertAlgoliaParam(
            snapshot.data['stock_reserved'],
            ParamType.int,
            false,
          ),
          'stock_on_hand': convertAlgoliaParam(
            snapshot.data['stock_on_hand'],
            ParamType.int,
            false,
          ),
          'threshold_stock': convertAlgoliaParam(
            snapshot.data['threshold_stock'],
            ParamType.int,
            false,
          ),
          'is_preferred_vendor': snapshot.data['is_preferred_vendor'],
          'shipped_number_days': convertAlgoliaParam(
            snapshot.data['shipped_number_days'],
            ParamType.int,
            false,
          ),
          'designer_uid': snapshot.data['designer_uid'],
          'stock_unavailable': convertAlgoliaParam(
            snapshot.data['stock_unavailable'],
            ParamType.int,
            false,
          ),
          'stock': convertAlgoliaParam(
            snapshot.data['stock'],
            ParamType.int,
            false,
          ),
          'inventory_id': snapshot.data['inventory_id'],
          'stock_source': snapshot.data['stock_source'],
          'restock_request_raised_ref': convertAlgoliaParam(
            snapshot.data['restock_request_raised_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'enquiry_raised_ref': convertAlgoliaParam(
            snapshot.data['enquiry_raised_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'product_sku': snapshot.data['product_sku'],
          'product_type': snapshot.data['product_type'],
          'notify_designer': snapshot.data['notify_designer'],
        },
        InventoryRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<InventoryRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'inventory',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'InventoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InventoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInventoryRecordData({
  DateTime? createdAt,
  DateTime? updatedAt,
  DateTime? lastCountedAt,
  String? status,
  String? productId,
  DocumentReference? productRef,
  String? stockStatus,
  int? stockReserved,
  int? stockOnHand,
  int? thresholdStock,
  bool? isPreferredVendor,
  int? shippedNumberDays,
  String? designerUid,
  int? stockUnavailable,
  int? stock,
  String? inventoryId,
  String? stockSource,
  DocumentReference? restockRequestRaisedRef,
  DocumentReference? enquiryRaisedRef,
  String? productSku,
  String? productType,
  bool? notifyDesigner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'updated_at': updatedAt,
      'last_counted_at': lastCountedAt,
      'status': status,
      'product_id': productId,
      'product_ref': productRef,
      'stock_status': stockStatus,
      'stock_reserved': stockReserved,
      'stock_on_hand': stockOnHand,
      'threshold_stock': thresholdStock,
      'is_preferred_vendor': isPreferredVendor,
      'shipped_number_days': shippedNumberDays,
      'designer_uid': designerUid,
      'stock_unavailable': stockUnavailable,
      'stock': stock,
      'inventory_id': inventoryId,
      'stock_source': stockSource,
      'restock_request_raised_ref': restockRequestRaisedRef,
      'enquiry_raised_ref': enquiryRaisedRef,
      'product_sku': productSku,
      'product_type': productType,
      'notify_designer': notifyDesigner,
    }.withoutNulls,
  );

  return firestoreData;
}

class InventoryRecordDocumentEquality implements Equality<InventoryRecord> {
  const InventoryRecordDocumentEquality();

  @override
  bool equals(InventoryRecord? e1, InventoryRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.lastCountedAt == e2?.lastCountedAt &&
        e1?.status == e2?.status &&
        e1?.productId == e2?.productId &&
        e1?.productRef == e2?.productRef &&
        e1?.stockStatus == e2?.stockStatus &&
        e1?.stockReserved == e2?.stockReserved &&
        e1?.stockOnHand == e2?.stockOnHand &&
        e1?.thresholdStock == e2?.thresholdStock &&
        e1?.isPreferredVendor == e2?.isPreferredVendor &&
        e1?.shippedNumberDays == e2?.shippedNumberDays &&
        e1?.designerUid == e2?.designerUid &&
        e1?.stockUnavailable == e2?.stockUnavailable &&
        e1?.stock == e2?.stock &&
        e1?.inventoryId == e2?.inventoryId &&
        e1?.stockSource == e2?.stockSource &&
        e1?.restockRequestRaisedRef == e2?.restockRequestRaisedRef &&
        e1?.enquiryRaisedRef == e2?.enquiryRaisedRef &&
        e1?.productSku == e2?.productSku &&
        e1?.productType == e2?.productType &&
        e1?.notifyDesigner == e2?.notifyDesigner;
  }

  @override
  int hash(InventoryRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.updatedAt,
        e?.lastCountedAt,
        e?.status,
        e?.productId,
        e?.productRef,
        e?.stockStatus,
        e?.stockReserved,
        e?.stockOnHand,
        e?.thresholdStock,
        e?.isPreferredVendor,
        e?.shippedNumberDays,
        e?.designerUid,
        e?.stockUnavailable,
        e?.stock,
        e?.inventoryId,
        e?.stockSource,
        e?.restockRequestRaisedRef,
        e?.enquiryRaisedRef,
        e?.productSku,
        e?.productType,
        e?.notifyDesigner
      ]);

  @override
  bool isValidKey(Object? o) => o is InventoryRecord;
}
