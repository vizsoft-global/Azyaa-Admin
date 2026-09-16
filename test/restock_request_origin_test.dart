import 'package:flutter_test/flutter_test.dart';

import 'package:azyaa_admin_panel/backend/store_valley/inventory_request_type.dart';
import 'package:azyaa_admin_panel/backend/store_valley/restock_request_origin.dart';

void main() {
  test('designer-raised restock does not need designer accept', () {
    expect(
      RestockRequestOrigin.designerMustAccept(
        requestType: 'Restock',
        raisedBy: RestockRequestOrigin.designer,
      ),
      isFalse,
    );
  });

  test('admin-raised restock still needs designer accept', () {
    expect(
      RestockRequestOrigin.designerMustAccept(
        requestType: 'Restock',
        raisedBy: RestockRequestOrigin.admin,
      ),
      isTrue,
    );
  });

  test('legacy INVNSQ without date is treated as designer-raised', () {
    expect(
      RestockRequestOrigin.designerMustAccept(
        requestType: 'Restock',
        inventoryRequestId: 'INVNSQ1038',
      ),
      isFalse,
    );
  });

  test('legacy INVRSQ still needs designer accept', () {
    expect(
      RestockRequestOrigin.designerMustAccept(
        requestType: 'Restock',
        inventoryRequestId: 'INVRSQ12',
      ),
      isTrue,
    );
  });

  test('return to designer does not need designer accept', () {
    expect(
      RestockRequestOrigin.designerMustAccept(
        requestType: InventoryRequestType.returnToDesigner,
        raisedBy: RestockRequestOrigin.designer,
      ),
      isFalse,
    );
    expect(
      RestockRequestOrigin.designerMustAccept(
        requestType: InventoryRequestType.returnToDesigner,
        raisedBy: RestockRequestOrigin.admin,
      ),
      isFalse,
    );
  });
}
