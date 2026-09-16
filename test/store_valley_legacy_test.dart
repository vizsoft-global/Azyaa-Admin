import 'package:flutter_test/flutter_test.dart';
import 'package:store_valley_sdk/store_valley_sdk.dart';

import 'package:azyaa_admin_panel/backend/store_valley/store_valley_legacy.dart';

void main() {
  test('kuwait pickup line maps to PACI fields and E.164 phone', () {
    final address = StoreValleyLegacyMapper.address(
      street: '10, 1st block, 2nd cross, hawaliy',
      city: 'Kuwait city',
      country: 'Kuwait',
      contactName: 'Dress Designer',
      contactPhone: '96532654178',
      latitude: 29.334549371468668,
      longitude: 48.019000482931368,
    );

    expect(address.governorate, 'Hawalli');
    expect(address.district, 'Hawalli');
    expect(address.block, '1');
    expect(address.street, '2nd Cross Street');
    expect(address.building, '10');
    expect(address.city, 'Hawalli');
    expect(address.country, 'Kuwait');
    expect(address.contactName, 'Dress Designer');
    expect(address.contactPhone, '+96532654178');
    expect(address.latitude, 29.334549371468668);
    expect(address.longitude, 48.019000482931368);
  });

  test('dedicated PACI fields skip street blob parsing', () {
    final address = StoreValleyLegacyMapper.address(
      street: 'Gulf Road',
      city: 'Salmiya',
      country: 'Kuwait',
      contactName: 'Websitek Customer',
      contactPhone: '+96550000000',
      building: '12',
      block: '5',
      governorate: 'Hawalli',
      latitude: 29.3375,
      longitude: 48.0758,
    );

    expect(address.street, 'Gulf Road');
    expect(address.city, 'Salmiya');
    expect(address.building, '12');
    expect(address.block, '5');
    expect(address.governorate, 'Hawalli');
    expect(address.contactName, 'Websitek Customer');
    expect(address.contactPhone, '+96550000000');
  });

  test('intake json keeps pickup_address on designer and requires otp proof', () {
    final address = StoreValleyLegacyMapper.address(
      street: '10, 1st block, 2nd cross, hawaliy',
      city: 'Kuwait city',
      country: 'Kuwait',
      contactName: 'Dress Designer',
      contactPhone: '96532654178',
      latitude: 29.334549371468668,
      longitude: 48.019000482931368,
    );
    final body = StoreValleyLegacyMapper.warehouseIntakeBody(
      WarehouseIntakeRequest(
        externalRequestId: 'INT-BCH1194',
        warehouseId: 'WH-KWT-MAIN',
        designer: Designer(
          designerId: 'DSN-KWT-0001',
          name: 'Dress Designer',
          pickupAddress: address,
        ),
        items: [
          LogisticsItem(
            productId: 'PRD-RM-1001',
            sku: 'AZY-DSN0001-DRESS-RED-M',
            productName: 'Store Valley Demo Dress Red M',
            quantity: 15,
          ),
        ],
        specialInstructions: '',
      ),
    );

    expect(body.containsKey('pickup_address'), isFalse);
    expect(body['designer']['pickup_address']['building'], '10');
    expect(body['designer']['pickup_address']['street'], '2nd Cross Street');
    expect(body['designer']['designer_id'], 'DSN-KWT-0001');
    expect(body['designer']['name'], 'Dress Designer');
    expect(body['requires_otp_proof'], isTrue);
    expect(body.containsKey('delivery_otp'), isFalse);
    expect(body.containsKey('special_instructions'), isFalse);
  });

  test('pickup json keeps pickup_address on designer with PACI fields', () {
    final address = StoreValleyLegacyMapper.address(
      street: '10, 1st block, 2nd cross, hawaliy',
      city: 'Kuwait city',
      country: 'Kuwait',
      contactName: 'Dress Designer',
      contactPhone: '96532654178',
    );
    final body = PickupRequest(
      externalRequestId: 'PKP-1',
      designer: Designer(
        designerId: 'DSN-KWT-0001',
        name: 'Dress Designer',
        pickupAddress: address,
      ),
      deliveryAddress: StoreValleyLegacyMapper.address(
        street: '12 st15, Block 5',
        city: 'Kuwait city',
        country: 'Kuwait',
        contactName: 'Azyaa Warehouse',
        contactPhone: '965123456',
      ),
      items: [
        LogisticsItem(productId: 'PRD-RM-1001', quantity: 1),
      ],
      requiresOtpProof: false,
    ).toJson();

    expect(body['designer']['pickup_address']['building'], '10');
    expect(body['designer']['pickup_address']['block'], '1');
    expect(body['delivery_address']['block'], '5');
    expect(body['delivery_address']['building'], '12');
  });
}
