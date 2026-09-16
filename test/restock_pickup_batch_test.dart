import 'package:flutter_test/flutter_test.dart';

import 'package:azyaa_admin_panel/backend/store_valley/restock_pickup_batch.dart';

void main() {
  test('ready restock is restock plus ready to pickup', () {
    expect(
      RestockPickupBatch.isReadyRestock(
        requestType: 'Restock',
        fulfillStatus: 'Ready to pickup',
      ),
      isTrue,
    );
    expect(
      RestockPickupBatch.isReadyRestock(
        requestType: 'Restock',
        fulfillStatus: 'Processing',
      ),
      isFalse,
    );
    expect(
      RestockPickupBatch.isReadyRestock(
        requestType: 'Return to Designer',
        fulfillStatus: 'Ready to pickup',
      ),
      isFalse,
    );
  });

  test('batch intake id prefixes delivery id', () {
    expect(RestockPickupBatch.batchExternalRequestId('12'), 'BCH12');
    expect(RestockPickupBatch.batchExternalRequestId(''), 'BCH');
  });

  test('row pickup keeps the clicked ready restock even if it was filtered out', () {
    expect(
      RestockPickupBatch.mergeSelectedReady(
        readyIds: const <String>[],
        selectedId: 'INVNSQ1039',
        selectedIsReady: true,
      ),
      ['INVNSQ1039'],
    );
    expect(
      RestockPickupBatch.mergeSelectedReady(
        readyIds: const ['INVNSQ1039', 'INVNSQ1040'],
        selectedId: 'INVNSQ1039',
        selectedIsReady: true,
      ),
      ['INVNSQ1039', 'INVNSQ1040'],
    );
    expect(
      RestockPickupBatch.mergeSelectedReady(
        readyIds: const ['INVNSQ1040'],
        selectedId: 'INVNSQ1039',
        selectedIsReady: false,
      ),
      ['INVNSQ1040'],
    );
  });
}
