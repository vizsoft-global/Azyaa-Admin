import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/store_valley/restock_pickup_batch.dart';
import '/backend/store_valley/store_valley_intake_tracking.dart';
import '/backend/store_valley/store_valley_restock_intake.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RestockIntakeResult {
  const RestockIntakeResult({
    required this.succeeded,
    this.message = '',
    this.trackingId,
    this.pickupOtp,
  });

  final bool succeeded;
  final String message;
  final String? trackingId;
  final String? pickupOtp;
}

Future<RestockIntakeResult> markReadyAndCreateRestockIntake(
  InventorymovementlogRecord log, {
  DocumentReference? assignedBy,
}) async {
  await log.reference.update(createInventorymovementlogRecordData(
    updateAt: getCurrentTimestamp,
    requestInfo: createInventoryRequestInfoStruct(
      fulfillStatus: 'Ready to pickup',
      clearUnsetFields: false,
    ),
  ));
  return const RestockIntakeResult(succeeded: true);
}

Future<void> markRestockIntakeCompleted(InventorymovementlogRecord log) async {
  if (StoreValleyIntakeTracking.isFulfillComplete(
    log.requestInfo.fulfillStatus,
  )) {
    return;
  }
  await log.reference.update(createInventorymovementlogRecordData(
    updateAt: getCurrentTimestamp,
    requestInfo: createInventoryRequestInfoStruct(
      fulfillStatus: 'Completed',
      clearUnsetFields: false,
    ),
  ));
}

Future<RestockIntakeResult> createRestockWarehouseIntake(
  InventorymovementlogRecord log, {
  DocumentReference? assignedBy,
}) {
  return createRestockWarehouseIntakeForLogs(
    [log],
    assignedBy: assignedBy,
  );
}

Future<RestockIntakeResult> createRestockWarehouseIntakeForLogs(
  List<InventorymovementlogRecord> logs, {
  DocumentReference? assignedBy,
}) async {
  if (logs.isEmpty) {
    return const RestockIntakeResult(
      succeeded: false,
      message: 'Select at least one ready restock',
    );
  }
  final designerUids = logs.map((log) => log.designerUid).toSet();
  if (designerUids.length != 1 || logs.first.designerUid.isEmpty) {
    return const RestockIntakeResult(
      succeeded: false,
      message: 'Designer is missing on this restock request',
    );
  }
  if (logs.any((log) => log.productRef == null)) {
    return const RestockIntakeResult(
      succeeded: false,
      message: 'Product is missing on this restock request',
    );
  }
  if (logs.any(
    (log) => !RestockPickupBatch.isReadyRestock(
      requestType: log.requestInfo.requestType,
      fulfillStatus: log.requestInfo.fulfillStatus,
    ),
  )) {
    return const RestockIntakeResult(
      succeeded: false,
      message: 'Only ready restock products can be added to this pickup',
    );
  }

  final log = logs.first;

  final designerSnap =
      await UsersRecord.collection.doc(log.designerUid).get();
  if (!designerSnap.exists) {
    return const RestockIntakeResult(
      succeeded: false,
      message: 'Designer record was not found',
    );
  }
  final designer = UsersRecord.fromSnapshot(designerSnap);
  final company = await querySettingsRecordOnce(
    queryBuilder: (settingsRecord) => settingsRecord.where(
      'type',
      isEqualTo: 'Company',
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  final idMap = await queryIdMapRecordOnce(
    queryBuilder: (idMapRecord) => idMapRecord.where(
      'type',
      isEqualTo: 'Main',
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);

  if (company == null) {
    return const RestockIntakeResult(
      succeeded: false,
      message: 'Company warehouse settings are missing',
    );
  }

  final pickup = designer.designerMainInfo.designerPickupAddress;
  final warehouse = company.settingsCompanyInfo.wearhouseAddress;
  final pickupLatLng = pickup.latLong;
  final warehouseLatLng = warehouse.latLong;
  final items = <Map<String, dynamic>>[];
  for (final movement in logs) {
    final productSnap = await movement.productRef!.get();
    if (!productSnap.exists) {
      return const RestockIntakeResult(
        succeeded: false,
        message: 'Product record was not found',
      );
    }
    final product = ProductsRecord.fromSnapshot(productSnap);
    InventoryRecord? inventory;
    if (movement.inventoryRef != null) {
      final inventorySnap = await movement.inventoryRef!.get();
      if (inventorySnap.exists) {
        inventory = InventoryRecord.fromSnapshot(inventorySnap);
      }
    }
    final productId = product.productId.isNotEmpty
        ? product.productId
        : movement.productId;
    final trimmedSku = (inventory?.productSku ?? '').trim();
    items.add({
      'quantity': movement.productQuantity > 0 ? movement.productQuantity : 1,
      'skuNumber': productId,
      'sku': trimmedSku.isEmpty ? productId : trimmedSku,
      'name': product.productInfo.name.isNotEmpty
          ? product.productInfo.name
          : movement.productName,
    });
  }
  final deliveryId = idMap?.deliveryId.toString() ?? '';
  final payload = buildRestockIntakePayloadFromItems(
    inventoryRequestId: RestockPickupBatch.batchExternalRequestId(deliveryId),
    items: items,
    designerId: designer.designerMainInfo.designerId,
    fromName: pickup.shippingName,
    fromPhone: pickup.shippingPhone,
    fromAddress: pickup.addressLine1,
    fromCity: pickup.city,
    fromCountry: pickup.country,
    fromLatitude: pickupLatLng?.latitude,
    fromLongitude: pickupLatLng?.longitude,
    customerUserId: designer.uid,
    toName: warehouse.shippingName,
    toPhone: warehouse.shippingPhone,
    toAddress: warehouse.addressLine1,
    toCity: warehouse.city,
    toCountry: warehouse.country,
    toEmail: warehouse.shippingEmail,
    toLatitude: warehouseLatLng?.latitude,
    toLongitude: warehouseLatLng?.longitude,
  );

  late final ApiCallResponse response;
  try {
    response = await PrimeExpressDeliveryGroup.createDeliveryCall.call(
    orderID: idMap?.deliveryId.toString() ?? '',
    invtrackID: payload.invtrackId,
    fromName: payload.fromName,
    fromPhone: payload.fromPhone,
    fromAddress: payload.fromAddress,
    fromCity: payload.fromCity,
    fromCountry: payload.fromCountry,
    fromlatitude: payload.fromLatitude,
    fromlongitude: payload.fromLongitude,
    toName: payload.toName,
    toPhone: payload.toPhone,
    toAddress: payload.toAddress,
    toCity: payload.toCity,
    toCountry: payload.toCountry,
    tolatitude: payload.toLatitude,
    tolongitude: payload.toLongitude,
    toEmail: payload.toEmail,
    toCountryCode: 'KW',
    fromCountryCode: 'KW',
    amount: 0.00,
    otpOnDelivery: false,
    b2bHandling: payload.b2bHandling,
    oversized: false,
    returnStatus: false,
    itemsListJson: payload.itemsListJson,
    designerId: payload.designerId,
    warehouseId: payload.warehouseId,
    customerUserId: payload.customerUserId,
    packageCount: logs.length,
    fromBuilding: pickup.building,
    fromBlock: pickup.block,
    fromGovernorate: pickup.state,
    toBuilding: warehouse.building,
    toBlock: warehouse.block,
    toGovernorate: warehouse.state,
    );
  } catch (error) {
    return RestockIntakeResult(
      succeeded: false,
      message: error.toString(),
    );
  }

  if (!response.succeeded) {
    final body = response.jsonBody;
    final message = body is Map && body['message'] != null
        ? body['message'].toString()
        : 'Failed to create Store Valley warehouse intake';
    return RestockIntakeResult(succeeded: false, message: message);
  }

  final trackingId = PrimeExpressDeliveryGroup.createDeliveryCall.swftboxID(
        response.jsonBody,
      ) ??
      '';
  String pickupOtp = '';
  final responseBody = response.jsonBody;
  if (responseBody is Map) {
    pickupOtp = responseBody['pickup_otp']?.toString() ?? '';
    if (pickupOtp.isEmpty) {
      final data = responseBody['data'];
      if (data is List && data.isNotEmpty && data.first is Map) {
        pickupOtp = data.first['pickup_otp']?.toString() ?? '';
      }
    }
  }
  final deliveryRef = DeliveryRecord.collection.doc();
  await deliveryRef.set({
    ...createDeliveryRecordData(
      createdAt: getCurrentTimestamp,
      updatedAt: getCurrentTimestamp,
      status: 'REQUESTED',
      type: 'inventory',
      inventoryMovementRef: log.reference,
      assignedBy: assignedBy ?? currentUserReference,
      deliveryId: deliveryId,
      deliveryTrackingId: trackingId,
    ),
    'inventory_movement_refs':
        logs.map((movement) => movement.reference).toList(),
  });

  final movementPatch = createInventorymovementlogRecordData(
    updateAt: getCurrentTimestamp,
    requestInfo: createInventoryRequestInfoStruct(
      fulfillStatus: 'DeliveryPartnerAssigned',
      clearUnsetFields: false,
    ),
    requestDeliveryInfo: createDeliveryInfoStruct(
      deliveryRef: deliveryRef,
      deliveryId: deliveryId,
      deliveryTrackingId: trackingId,
      pickupOtp: pickupOtp,
      updatedAt: getCurrentTimestamp,
      pickupAddress: createUserShippingaddressInfoStruct(
        shippingEmail: pickup.shippingEmail,
        shippingPhone: pickup.shippingPhone,
        shippingName: pickup.shippingName,
        addressLine1: pickup.addressLine1,
        city: pickup.city,
        country: pickup.country,
        clearUnsetFields: false,
      ),
      deliveryAddress: createUserShippingaddressInfoStruct(
        shippingEmail: warehouse.shippingEmail,
        shippingPhone: warehouse.shippingPhone,
        shippingName: warehouse.shippingName,
        addressLine1: warehouse.addressLine1,
        city: warehouse.city,
        country: warehouse.country,
        clearUnsetFields: false,
      ),
      notes: 'Store Valley warehouse intake',
      packageCount: logs.length,
      clearUnsetFields: false,
    ),
  );
  await Future.wait(
    logs.map((movement) => movement.reference.update(movementPatch)),
  );

  if (idMap != null) {
    await idMap.reference.update({
      'delivery_id': FieldValue.increment(1),
    });
  }

  return RestockIntakeResult(
    succeeded: true,
    trackingId: trackingId,
    pickupOtp: pickupOtp,
  );
}
