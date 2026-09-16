import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'store_valley_config.dart';

class StoreValleyInventoryQuery {
  const StoreValleyInventoryQuery({
    required this.field,
    required this.value,
    required this.warehouseId,
  });

  final String field;
  final String value;
  final String warehouseId;
}

class StoreValleyInventoryLookup {
  StoreValleyInventoryLookup._();

  static List<StoreValleyInventoryQuery> queries({
    required String productId,
    String? sku,
    String warehouseId = StoreValleyConfig.warehouseId,
  }) {
    final trimmedSku = sku?.trim() ?? '';
    final trimmedProduct = productId.trim();
    return [
      if (trimmedSku.isNotEmpty)
        StoreValleyInventoryQuery(
          field: 'sku',
          value: trimmedSku,
          warehouseId: warehouseId,
        ),
      if (trimmedProduct.isNotEmpty)
        StoreValleyInventoryQuery(
          field: 'product_id',
          value: trimmedProduct,
          warehouseId: warehouseId,
        ),
    ];
  }
}

class StoreValleyInventoryRecord {
  StoreValleyInventoryRecord({
    required this.reference,
    this.productId = '',
    this.sku = '',
    this.designerId = '',
    this.warehouseId = '',
    this.storedQuantity = 0,
    this.available = 0,
    this.availableDelta,
    this.reasonCode,
    this.updatedAt,
    this.eventId,
    this.asOf,
  });

  static const collectionName = 'store_valley_inventory';

  final DocumentReference reference;
  final String productId;
  final String sku;
  final String designerId;
  final String warehouseId;
  final num storedQuantity;
  final num available;
  final num? availableDelta;
  final String? reasonCode;
  final DateTime? updatedAt;
  final String? eventId;
  final DateTime? asOf;

  static CollectionReference<Map<String, dynamic>> get collection =>
      FirebaseFirestore.instance.collection(collectionName);

  static String docId(String productId, String warehouseId) =>
      '${productId}_$warehouseId';

  static int availableForOrder({
    required num stored,
    int reserved = 0,
    int unavailable = 0,
  }) {
    final value = stored.toInt() - reserved - unavailable;
    return value < 0 ? 0 : value;
  }

  static bool isWarehouseReservable({
    required String productMainType,
    required bool isPreferredVendor,
  }) {
    return productMainType == 'ready' && isPreferredVendor;
  }

  static DocumentReference<Map<String, dynamic>> docRef(
    String productId, {
    String warehouseId = StoreValleyConfig.warehouseId,
  }) =>
      collection.doc(docId(productId, warehouseId));

  static StoreValleyInventoryRecord fromMap(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) {
    return StoreValleyInventoryRecord(
      reference: reference,
      productId: data['product_id']?.toString() ?? '',
      sku: data['sku']?.toString() ?? '',
      designerId: data['designer_id']?.toString() ?? '',
      warehouseId: data['warehouse_id']?.toString() ?? '',
      storedQuantity: data['stored_quantity'] as num? ?? 0,
      available: data['available'] as num? ?? 0,
      availableDelta: data['available_delta'] as num?,
      reasonCode: data['reason_code']?.toString(),
      updatedAt: _readTime(data['updated_at']),
      eventId: data['event_id']?.toString(),
      asOf: _readTime(data['as_of']),
    );
  }

  static StoreValleyInventoryRecord? fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data();
    if (!snapshot.exists || data is! Map<String, dynamic>) {
      return null;
    }
    return fromMap(data, snapshot.reference);
  }

  static DateTime? _readTime(dynamic value) {
    if (value is Timestamp) {
      return value.toDate();
    }
    if (value is DateTime) {
      return value;
    }
    return null;
  }

  static Stream<StoreValleyInventoryRecord?> watch({
    required String productId,
    String? sku,
    String warehouseId = StoreValleyConfig.warehouseId,
  }) {
    final plans = StoreValleyInventoryLookup.queries(
      productId: productId,
      sku: sku,
      warehouseId: warehouseId,
    );
    if (plans.isEmpty) {
      return Stream<StoreValleyInventoryRecord?>.value(null);
    }
    if (plans.length == 1) {
      return _watchQuery(plans.first);
    }
    return Stream<StoreValleyInventoryRecord?>.multi((controller) {
      StoreValleyInventoryRecord? skuMatch;
      StoreValleyInventoryRecord? productMatch;
      void emit() {
        if (!controller.isClosed) {
          controller.add(skuMatch ?? productMatch);
        }
      }

      final subs = <StreamSubscription<StoreValleyInventoryRecord?>>[
        _watchQuery(plans[0]).listen((value) {
          skuMatch = value;
          emit();
        }),
        _watchQuery(plans[1]).listen((value) {
          productMatch = value;
          emit();
        }),
      ];
      controller.onCancel = () async {
        for (final sub in subs) {
          await sub.cancel();
        }
      };
    });
  }

  static Stream<StoreValleyInventoryRecord?> _watchQuery(
    StoreValleyInventoryQuery plan,
  ) {
    return collection
        .where(plan.field, isEqualTo: plan.value)
        .where('warehouse_id', isEqualTo: plan.warehouseId)
        .limit(1)
        .snapshots()
        .map(
          (snap) =>
              snap.docs.isEmpty ? null : fromSnapshot(snap.docs.first),
        );
  }
}
