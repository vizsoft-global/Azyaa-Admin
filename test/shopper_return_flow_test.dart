import 'package:flutter_test/flutter_test.dart';

import 'package:azyaa_admin_panel/backend/store_valley/shopper_return_payload.dart';
import 'package:azyaa_admin_panel/backend/store_valley/store_valley_config.dart';

void main() {
  test('shopper return payload posts return-requests not warehouse delivery', () {
    final payload = buildShopperReturnPayload(
      externalRequestId: 'RET-RR1-ready-SV-WH-1',
      sourceOrderId: 'SV-WH-1',
      originalSourceLocationId: 'WH-KWT-MAIN',
      designerId: 'DSN-KWT-0001',
      fromName: 'Customer',
      fromPhone: '+96550000000',
      fromAddress: 'Gulf Road',
      fromCity: 'Salmiya',
      fromCountry: 'KW',
      customerUserId: 'cust1',
      deliveryInstructions: 'Too small',
      items: const [
        {
          'quantity': 1,
          'skuNumber': 'AZYPRD1122',
          'sku': 'AZY-DSN0001-DRESS-RED-M',
          'name': 'Red Dress',
        }
      ],
    );

    expect(payload.returnStatus, isTrue);
    expect(payload.b2bHandling, isFalse);
    expect(payload.invtrackId, 'RET-RR1-ready-SV-WH-1');
    expect(payload.sourceOrderId, 'SV-WH-1');
    expect(payload.originalSourceLocationId, 'WH-KWT-MAIN');
    expect(payload.designerId, 'DSN-KWT-0001');
    expect(payload.fromName, 'Customer');
    expect(payload.customerUserId, 'cust1');
    expect(payload.deliveryInstructions, 'Too small');
    expect(payload.itemsListJson.first['skuNumber'], 'AZYPRD1122');
  });

  test('preferred ready-made lines are warehouse returns', () {
    expect(
      isWarehouseShopperReturnLine(
        productMainType: 'ready',
        isPreferredVendor: true,
      ),
      isTrue,
    );
    expect(
      isWarehouseShopperReturnLine(
        productMainType: 'ready',
        isPreferredVendor: false,
      ),
      isFalse,
    );
    expect(
      isWarehouseShopperReturnLine(
        productMainType: 'custom',
        isPreferredVendor: true,
      ),
      isFalse,
    );
  });

  test('groups mixed return lines by original shipment', () {
    final result = groupShopperReturnLines(
      returnRequestId: 'RR1',
      lines: const [
        ShopperReturnLineInput(
          productId: 'AZYPRD1122',
          quantity: 1,
          productName: 'Red Dress',
          productSku: 'AZY-DSN0001-DRESS-RED-M',
          productMainType: 'ready',
          isPreferredVendor: true,
        ),
        ShopperReturnLineInput(
          productId: 'CUSTOM1',
          quantity: 2,
          productName: 'Custom Dress',
          productSku: 'SKU-C1',
          productMainType: 'custom',
          designerUid: 'uidA',
          pickupTrackingId: 'SV-DEL-1',
        ),
      ],
      shipments: const [
        ShopperReturnShipmentInput(
          deliveryType: 'ready',
          trackingId: 'SV-WH-1',
          productIds: ['AZYPRD1122'],
          originalSourceLocationId: 'WH-KWT-MAIN',
          designerId: 'DSN-KWT-0001',
        ),
        ShopperReturnShipmentInput(
          deliveryType: 'custom',
          trackingId: 'SV-PKP-1',
          deliveryOrderId: 'SV-DEL-1',
          productIds: ['CUSTOM1'],
          originalSourceLocationId: 'DSN-KWT-0001',
          designerId: 'DSN-KWT-0001',
        ),
      ],
    );

    expect(result.unmatchedProductIds, isEmpty);
    expect(result.groups, hasLength(2));
    final warehouse = result.groups.firstWhere((g) => g.deliveryType == 'ready');
    expect(warehouse.sourceOrderId, 'SV-WH-1');
    expect(warehouse.originalSourceLocationId, 'WH-KWT-MAIN');
    expect(
      warehouse.externalRequestId,
      'RET-RR1-ready-SV-WH-1',
    );
    expect(warehouse.itemsListJson, hasLength(1));
    final custom = result.groups.firstWhere((g) => g.deliveryType == 'custom');
    expect(custom.sourceOrderId, 'SV-DEL-1');
    expect(custom.externalRequestId, 'RET-RR1-custom-SV-DEL-1');
    expect(custom.itemsListJson.first['quantity'], 2);
  });

  test('unmatched return lines are reported instead of grouped', () {
    final result = groupShopperReturnLines(
      returnRequestId: 'RR2',
      lines: const [
        ShopperReturnLineInput(
          productId: 'MISSING',
          quantity: 1,
          productMainType: 'ready',
          isPreferredVendor: true,
        ),
      ],
      shipments: const [
        ShopperReturnShipmentInput(
          deliveryType: 'ready',
          trackingId: 'SV-WH-1',
          productIds: ['AZYPRD1122'],
        ),
      ],
    );

    expect(result.groups, isEmpty);
    expect(result.unmatchedProductIds, ['MISSING']);
  });

  test('empty designer id falls back to Store Valley fixture', () {
    final payload = buildShopperReturnPayload(
      externalRequestId: 'RET-RR1-ready-SV-WH-1',
      sourceOrderId: 'SV-WH-1',
      originalSourceLocationId: StoreValleyConfig.pickupLocationId,
      designerId: '',
      fromName: 'Customer',
      fromPhone: '+96550000000',
      fromAddress: 'Gulf Road',
      fromCity: 'Salmiya',
      fromCountry: 'KW',
      items: const [
        {
          'quantity': 1,
          'skuNumber': 'AZYPRD1122',
          'sku': 'AZYPRD1122',
          'name': 'Red Dress',
        }
      ],
    );

    expect(payload.designerId, StoreValleyConfig.fallbackDesignerId);
  });

  test('shopper pickup address requires street city name and phone', () {
    expect(
      isCompleteShopperPickupAddress(
        street: 'Gulf Road',
        city: 'Salmiya',
        contactName: 'Customer',
        contactPhone: '+96550000000',
      ),
      isTrue,
    );
    expect(
      isCompleteShopperPickupAddress(
        street: '',
        city: 'Salmiya',
        contactName: 'Customer',
        contactPhone: '+96550000000',
      ),
      isFalse,
    );
  });

  test('return reason includes additional info when present', () {
    expect(shopperReturnReason(reason: 'Too small', additionalInfo: ''), 'Too small');
    expect(
      shopperReturnReason(reason: 'Too small', additionalInfo: 'Size 38'),
      'Too small. Size 38',
    );
  });

  test('mapper client id drops RET prefix so Store Valley does not double it', () {
    expect(
      shopperReturnMapperClientId('RET-RR1-ready-SV-WH-1'),
      'RR1-ready-SV-WH-1',
    );
    expect(shopperReturnMapperClientId('RR1-ready-SV-WH-1'), 'RR1-ready-SV-WH-1');
  });

  test('approve message includes pickup OTP when present', () {
    expect(
      shopperReturnApproveMessage(succeeded: true),
      'Return pickup request created.',
    );
    expect(
      shopperReturnApproveMessage(succeeded: true, pickupOtp: '123456'),
      'Return pickup request created. Tell the driver this OTP: 123456',
    );
    expect(
      shopperReturnApproveMessage(
        succeeded: false,
        message: 'Customer shipping address is incomplete for pickup',
      ),
      'Customer shipping address is incomplete for pickup',
    );
  });
}
