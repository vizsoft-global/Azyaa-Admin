import 'package:flutter_test/flutter_test.dart';
import 'package:azyaa_admin_panel/backend/store_valley/store_valley_delivery_status.dart';

void main() {
  test('failed and empty are not already open', () {
    expect(storeValleyDeliveryAlreadyOpen(''), isFalse);
    expect(storeValleyDeliveryAlreadyOpen('FAILED'), isFalse);
    expect(storeValleyDeliveryAlreadyOpen('cancelled'), isFalse);
  });

  test('queued and requested skip duplicate POSTs', () {
    expect(storeValleyDeliveryAlreadyOpen('QUEUED'), isTrue);
    expect(storeValleyDeliveryAlreadyOpen('REQUESTED'), isTrue);
    expect(storeValleyDeliveryAlreadyOpen('pending'), isTrue);
  });

  test('warehouse badge labels', () {
    expect(warehouseDeliveryBadgeLabel('QUEUED'), 'Warehouse delivery queued');
    expect(warehouseDeliveryBadgeLabel('REQUESTED'), 'Warehouse delivery requested');
    expect(warehouseDeliveryBadgeLabel('FAILED'), 'Warehouse delivery failed');
    expect(warehouseDeliveryBadgeLabel('delivered'), '');
  });
}
