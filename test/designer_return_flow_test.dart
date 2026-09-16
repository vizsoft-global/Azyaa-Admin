import 'package:flutter_test/flutter_test.dart';

import 'package:azyaa_admin_panel/backend/store_valley/designer_return_payload.dart';
import 'package:azyaa_admin_panel/backend/store_valley/inventory_request_type.dart';
import 'package:azyaa_admin_panel/backend/store_valley/store_valley_config.dart';

void main() {
  test('designer return payload is warehouse delivery not intake', () {
    final payload = buildDesignerReturnPayload(
      inventoryRequestId: 'INVNSQ1001',
      productId: 'AZYPRD1122',
      productSku: 'AZY-DSN0001-DRESS-RED-M',
      productName: 'Red Dress',
      quantity: 3,
      designerId: 'DSN-KWT-0001',
      fromName: 'Azyaa Warehouse',
      fromPhone: '+96550000000',
      fromAddress: 'WH Street',
      fromCity: 'Kuwait City',
      fromCountry: 'KW',
      toName: 'Designer One',
      toPhone: '+96550000001',
      toAddress: 'Street 10',
      toCity: 'Kuwait City',
      toCountry: 'KW',
    );

    expect(payload.b2bHandling, isFalse);
    expect(payload.returnStatus, isFalse);
    expect(payload.deliveryInstructions, InventoryRequestType.deliveryNote);
    expect(payload.warehouseId, StoreValleyConfig.warehouseId);
    expect(payload.toName, 'Designer One');
    expect(payload.fromName, 'Azyaa Warehouse');
    expect(payload.itemsListJson.first['quantity'], 3);
    expect(payload.itemsListJson.first['skuNumber'], 'AZYPRD1122');
  });
}
