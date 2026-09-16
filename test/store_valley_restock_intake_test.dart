import 'package:flutter_test/flutter_test.dart';

import 'package:azyaa_admin_panel/backend/store_valley/store_valley_config.dart';
import 'package:azyaa_admin_panel/backend/store_valley/store_valley_restock_intake.dart';

void main() {
  test('restock intake payload uses product id, sku, qty, designer, warehouse',
      () {
    final payload = buildRestockIntakePayload(
      inventoryRequestId: 'INVRSQ1001',
      productId: 'AZYPRD1122',
      productSku: 'AZY-DSN0001-DRESS-RED-M',
      productName: 'Red Dress',
      quantity: 5,
      designerId: 'DSN-KWT-0001',
      fromName: 'Designer One',
      fromPhone: '+96550000001',
      fromAddress: 'Street 10',
      fromCity: 'Kuwait City',
      fromCountry: 'KW',
    );

    expect(payload.invtrackId, 'INVRSQ1001');
    expect(payload.warehouseId, StoreValleyConfig.warehouseId);
    expect(payload.designerId, 'DSN-KWT-0001');
    expect(payload.b2bHandling, isTrue);
    expect(payload.itemsListJson, hasLength(1));
    expect(payload.itemsListJson.first['skuNumber'], 'AZYPRD1122');
    expect(payload.itemsListJson.first['sku'], 'AZY-DSN0001-DRESS-RED-M');
    expect(payload.itemsListJson.first['quantity'], 5);
    expect(payload.itemsListJson.first['name'], 'Red Dress');
  });

  test('empty designer id falls back to Store Valley fixture', () {
    final payload = buildRestockIntakePayload(
      inventoryRequestId: 'INVRSQ1002',
      productId: 'AZYPRD1122',
      productSku: '',
      productName: 'Red Dress',
      quantity: 1,
      designerId: '',
      fromName: 'Designer One',
      fromPhone: '+96550000001',
      fromAddress: 'Street 10',
      fromCity: 'Kuwait City',
      fromCountry: 'KW',
    );

    expect(payload.designerId, StoreValleyConfig.fallbackDesignerId);
    expect(payload.itemsListJson.first['sku'], 'AZYPRD1122');
  });

  test('batch payload keeps every selected product as its own item', () {
    final payload = buildRestockIntakePayloadFromItems(
      inventoryRequestId: 'BCH12',
      designerId: 'DSN-KWT-0001',
      fromName: 'Designer One',
      fromPhone: '+96550000001',
      fromAddress: 'Street 10',
      fromCity: 'Kuwait City',
      fromCountry: 'KW',
      items: [
        {
          'quantity': 2,
          'skuNumber': 'PRD-1',
          'sku': 'SKU-1',
          'name': 'Dress A',
        },
        {
          'quantity': 5,
          'skuNumber': 'PRD-2',
          'sku': 'SKU-2',
          'name': 'Dress B',
        },
      ],
    );

    expect(payload.invtrackId, 'BCH12');
    expect(payload.itemsListJson, hasLength(2));
    expect(payload.itemsListJson[0]['skuNumber'], 'PRD-1');
    expect(payload.itemsListJson[1]['quantity'], 5);
  });
}
