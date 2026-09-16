import 'package:flutter_test/flutter_test.dart';

import 'package:azyaa_admin_panel/backend/store_valley/store_valley_inventory_record.dart';

void main() {
  test('cache doc id matches webhook product_warehouse key', () {
    expect(
      StoreValleyInventoryRecord.docId('AZYPRD1122', 'WH-KWT-MAIN'),
      'AZYPRD1122_WH-KWT-MAIN',
    );
  });

  test('available for order subtracts reserved and unavailable', () {
    expect(
      StoreValleyInventoryRecord.availableForOrder(
        stored: 10,
        reserved: 2,
        unavailable: 1,
      ),
      7,
    );
  });

  test('available for order never goes negative', () {
    expect(
      StoreValleyInventoryRecord.availableForOrder(
        stored: 1,
        reserved: 2,
        unavailable: 0,
      ),
      0,
    );
  });

  test('product management looks up warehouse stock by sku first', () {
    final queries = StoreValleyInventoryLookup.queries(
      productId: 'AZYPRD1122',
      sku: 'AZY-DSN0001-DRESS-RED-M',
    );

    expect(queries, hasLength(2));
    expect(queries.first.field, 'sku');
    expect(queries.first.value, 'AZY-DSN0001-DRESS-RED-M');
    expect(queries.last.field, 'product_id');
    expect(queries.last.value, 'AZYPRD1122');
  });

  test('warehouse reservable is ready preferred-vendor only', () {
    expect(
      StoreValleyInventoryRecord.isWarehouseReservable(
        productMainType: 'ready',
        isPreferredVendor: true,
      ),
      isTrue,
    );
    expect(
      StoreValleyInventoryRecord.isWarehouseReservable(
        productMainType: 'custom',
        isPreferredVendor: true,
      ),
      isFalse,
    );
  });
}
