import 'package:store_valley_sdk/store_valley_sdk.dart';
import 'package:test/test.dart';

void main() {
  test('warehouse intake request serializes nested payloads as snake_case', () {
    final request = WarehouseIntakeRequest(
      externalRequestId: 'ext-1',
      warehouseId: 'warehouse-1',
      designer: const Designer(
        designerId: 'designer-1',
        name: 'Designer',
        pickupAddress: Address(
          street: '1 Main St',
          city: 'Kuwait City',
          contactName: 'Aziaa Ops',
          contactPhone: '+96500000000',
        ),
      ),
      items: const [
        LogisticsItem(
          sku: 'SKU-1',
          quantity: 2,
          productId: 'product-1',
          productName: 'Dress',
        ),
      ],
      requestedPickupAt: DateTime.utc(2026, 1, 1, 10),
    );

    final json = request.toJson();
    final designer = json['designer'] as Map<String, dynamic>;
    final pickupAddress = designer['pickup_address'] as Map<String, dynamic>;
    final item = (json['items'] as List).single as Map<String, dynamic>;

    expect(json, containsPair('external_request_id', 'ext-1'));
    expect(json, containsPair('warehouse_id', 'warehouse-1'));
    expect(designer, containsPair('designer_id', 'designer-1'));
    expect(designer, isNot(contains('designerId')));
    expect(designer, contains('pickup_address'));
    expect(designer, isNot(contains('pickupAddress')));
    expect(pickupAddress, containsPair('contact_name', 'Aziaa Ops'));
    expect(pickupAddress, containsPair('contact_phone', '+96500000000'));
    expect(pickupAddress, isNot(contains('contactName')));
    expect(item, containsPair('product_id', 'product-1'));
    expect(item, containsPair('product_name', 'Dress'));
    expect(item, isNot(contains('productId')));
  });

  test('pickup request serializes nested payloads as JSON maps', () {
    const request = PickupRequest(
      externalRequestId: 'pickup-1',
      sourceOrderId: 'order-1',
      pickupPurpose: PickupPurpose.designerOrderFulfillment,
      orderKind: OrderKind.readyMade,
      designer: Designer(
        designerId: 'designer-1',
        name: 'Designer',
        pickupAddress: Address(
          street: '1 Main St',
          city: 'Kuwait City',
          contactName: 'Aziaa Ops',
          contactPhone: '+96500000000',
        ),
      ),
      deliveryAddress: Address(
        street: '2 Gulf Rd',
        city: 'Salmiya',
        contactName: 'Customer',
        contactPhone: '+96511111111',
      ),
      items: const [
        LogisticsItem(sku: 'SKU-2', quantity: 1, productId: 'product-2'),
      ],
      requiresOtpProof: true,
      deliveryOtp: '472913',
      requiresPhotoProof: true,
    );

    final json = request.toJson();
    final designer = json['designer'] as Map<String, dynamic>;
    final deliveryAddress = json['delivery_address'] as Map<String, dynamic>;
    final item = (json['items'] as List).single as Map<String, dynamic>;

    expect(json, containsPair('pickup_purpose', 'designer_order_fulfillment'));
    expect(json, containsPair('order_kind', 'ready_made'));
    expect(designer, containsPair('designer_id', 'designer-1'));
    expect(deliveryAddress, containsPair('contact_name', 'Customer'));
    expect(item, containsPair('product_id', 'product-2'));
    expect(json, containsPair('delivery_otp', '472913'));
  });

  test('return request serializes original inventory source and addresses', () {
    const request = ReturnRequest(
      externalRequestId: 'return-1',
      sourceOrderId: 'order-1',
      designerId: 'DSN-KWT-0001',
      originalSourceLocationId: 'designer-location-1',
      returnType: ReturnType.returnRequest,
      originalInventorySource: InventorySource.designer,
      designerReturnAddress: Address(
        street: '1 Main St',
        city: 'Kuwait City',
        contactName: 'Designer',
        contactPhone: '+96500000000',
      ),
      customerPickupAddress: Address(
        street: '2 Gulf Rd',
        city: 'Salmiya',
        contactName: 'Customer',
        contactPhone: '+96511111111',
      ),
      items: const [
        LogisticsItem(sku: 'SKU-3', quantity: 1, productName: 'Abaya'),
      ],
    );

    final json = request.toJson();
    final designerReturnAddress =
        json['designer_return_address'] as Map<String, dynamic>;
    final customerPickupAddress =
        json['customer_pickup_address'] as Map<String, dynamic>;
    final item = (json['items'] as List).single as Map<String, dynamic>;

    expect(json, containsPair('return_type', 'return'));
    expect(json, containsPair('designer_id', 'DSN-KWT-0001'));
    expect(
      json,
      containsPair('original_source_location_id', 'designer-location-1'),
    );
    expect(json, containsPair('original_inventory_source', 'designer'));
    expect(designerReturnAddress, containsPair('contact_name', 'Designer'));
    expect(
      customerPickupAddress,
      containsPair('contact_phone', '+96511111111'),
    );
    expect(item, containsPair('product_name', 'Abaya'));
  });

  test('warehouse delivery serializes stops and products', () {
    const request = DeliveryRequest(
      clientOrderId: 'warehouse-order-1',
      designerId: 'DSN-KWT-0001',
      pickupLocationId: 'warehouse-location-1',
      inventorySource: InventorySource.warehouse,
      deliveryOtp: '472913',
      stops: [
        DeliveryStop(
          street: '2 Gulf Rd',
          city: 'Salmiya',
          contactName: 'Customer',
          contactPhone: '+96511111111',
          products: [
            LogisticsItem(productId: 'product-4', sku: 'SKU-4', quantity: 2),
          ],
        ),
      ],
    );

    final json = request.toJson();
    final stop = (json['stops'] as List).single as Map<String, dynamic>;
    final product = (stop['products'] as List).single as Map<String, dynamic>;

    expect(json, containsPair('designer_id', 'DSN-KWT-0001'));

    expect(json, containsPair('client_order_id', 'warehouse-order-1'));
    expect(json, containsPair('pickup_location_id', 'warehouse-location-1'));
    expect(json, containsPair('inventory_source', 'warehouse'));
    expect(json, containsPair('delivery_otp', '472913'));
    expect(stop, containsPair('contact_name', 'Customer'));
    expect(product, containsPair('product_id', 'product-4'));
  });

  test('inventory snapshot deserializes scoped stock values', () {
    final response = InventorySnapshotResponse.fromJson({
      'inventory': [
        {
          'designer_id': 'DSN-KWT-0001',
          'product_id': 'PRD-RM-1001',
          'store_valley_product_id': 'internal-product-1',
          'sku': 'AZY-DSN0001-DRESS-RED-M',
          'warehouse_id': 'WH-KWT-MAIN',
          'stored_quantity': 12,
          'available': 12,
          'updated_at': '2026-08-05T10:00:00.000Z',
        },
      ],
      'count': 1,
      'next_cursor': null,
      'has_more': false,
      'as_of': '2026-08-05T10:00:01.000Z',
      'is_test': true,
    });

    expect(response.count, 1);
    expect(response.inventory.single.designerId, 'DSN-KWT-0001');
    expect(response.inventory.single.storedQuantity, 12);
    expect(response.inventory.single.available, 12);
    expect(response.hasMore, false);
  });

  test('logistics response exposes routing and timestamp fields', () {
    final response = LogisticsRequestResponse.fromJson({
      'request_id': 'return-request-1',
      'external_request_id': 'WS-RETURN-001',
      'source_order_id': 'WEBSITEK-ORDER-001',
      'status': 'return_initiated',
      'delivery_order_id': 'delivery-order-1',
      'original_source_location_id': 'warehouse-location-1',
      'warehouse_id': 'WH-KWT-MAIN',
      'inventory_source': 'designer',
      'return_destination_type': 'warehouse',
      'created_at': '2026-08-08T10:00:00.000Z',
      'updated_at': '2026-08-08T10:01:00.000Z',
      'is_test': true,
    });

    expect(response.inventorySource, InventorySource.designer);
    expect(response.returnDestinationType, InventorySource.warehouse);
    expect(response.createdAt, DateTime.utc(2026, 8, 8, 10));
    expect(response.updatedAt, DateTime.utc(2026, 8, 8, 10, 1));
    expect(
      response.toJson(),
      containsPair('return_destination_type', 'warehouse'),
    );
  });
}
