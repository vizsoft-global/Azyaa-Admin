import 'package:cloud_functions/cloud_functions.dart';

import 'store_valley_config.dart';

class WarehouseStockReservation {
  static Future<Map<String, dynamic>> release({
    required String orderId,
    required String reason,
    List<String>? productIds,
  }) async {
    final result = await FirebaseFunctions.instance
        .httpsCallable(StoreValleyConfig.releaseWarehouseStockCallableName)
        .call({
      'order_id': orderId,
      'reason': reason,
      if (productIds != null) 'product_ids': productIds,
    });
    return Map<String, dynamic>.from(result.data as Map);
  }

  static Future<Map<String, dynamic>> reserve({
    required String orderId,
  }) async {
    final result = await FirebaseFunctions.instance
        .httpsCallable(StoreValleyConfig.reserveWarehouseStockCallableName)
        .call({'order_id': orderId});
    return Map<String, dynamic>.from(result.data as Map);
  }

  static Future<Map<String, dynamic>> backfill() async {
    final result = await FirebaseFunctions.instance
        .httpsCallable(
          StoreValleyConfig.backfillWarehouseReservationsCallableName,
        )
        .call({});
    return Map<String, dynamic>.from(result.data as Map);
  }
}
