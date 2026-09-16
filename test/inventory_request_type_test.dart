import 'package:flutter_test/flutter_test.dart';

import 'package:azyaa_admin_panel/backend/store_valley/inventory_request_type.dart';

void main() {
  test('return to designer is outbound warehouse to designer', () {
    expect(
      InventoryRequestType.isReturnToDesigner('Return to Designer'),
      isTrue,
    );
    expect(InventoryRequestType.isRestock('Return to Designer'), isFalse);
    expect(
      InventoryRequestType.movementStatus('Return to Designer'),
      'outbound',
    );
    expect(InventoryRequestType.deliveryNote, 'return to designer');
  });

  test('restock stays inbound warehouse intake', () {
    expect(InventoryRequestType.isRestock('Restock'), isTrue);
    expect(InventoryRequestType.movementStatus('Restock'), 'inbound');
    expect(InventoryRequestType.needsSuperadminApprove('Restock'), isTrue);
  });

  test('legacy shipping buttons do not match return to designer', () {
    expect(
      InventoryRequestType.showLegacyNonRestockShipping('Return to Designer'),
      isFalse,
    );
    expect(
      InventoryRequestType.showLegacyNonRestockShipping('Restock'),
      isFalse,
    );
  });

  test('return qty cannot exceed warehouse sellable', () {
    expect(
      InventoryRequestType.canReturnQty(qty: 3, availableForOrder: 5),
      isTrue,
    );
    expect(
      InventoryRequestType.canReturnQty(qty: 6, availableForOrder: 5),
      isFalse,
    );
    expect(
      InventoryRequestType.canReturnQty(qty: 0, availableForOrder: 5),
      isFalse,
    );
  });
}
