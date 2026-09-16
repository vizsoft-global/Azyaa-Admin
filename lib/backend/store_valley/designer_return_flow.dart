import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/store_valley/designer_return_payload.dart';
import '/backend/store_valley/inventory_request_type.dart';
import '/backend/store_valley/store_valley_inventory_record.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DesignerReturnResult {
  const DesignerReturnResult({
    required this.succeeded,
    this.message = '',
    this.trackingId,
  });

  final bool succeeded;
  final String message;
  final String? trackingId;
}

Future<DesignerReturnResult> createDesignerReturnDelivery(
  InventorymovementlogRecord log, {
  DocumentReference? assignedBy,
}) async {
  if (!InventoryRequestType.isReturnToDesigner(log.requestInfo.requestType)) {
    return const DesignerReturnResult(
      succeeded: false,
      message: 'This request is not a return to designer',
    );
  }
  if (log.requestInfo.requestStatus != 'Pending') {
    return const DesignerReturnResult(
      succeeded: false,
      message: 'Only pending return requests can be approved',
    );
  }
  if (log.designerUid.isEmpty) {
    return const DesignerReturnResult(
      succeeded: false,
      message: 'Designer is missing on this request',
    );
  }
  if (log.productRef == null) {
    return const DesignerReturnResult(
      succeeded: false,
      message: 'Product is missing on this request',
    );
  }

  final qty = log.productQuantity > 0 ? log.productQuantity : 1;

  InventoryRecord? inventory;
  if (log.inventoryRef != null) {
    final inventorySnap = await log.inventoryRef!.get();
    if (inventorySnap.exists) {
      inventory = InventoryRecord.fromSnapshot(inventorySnap);
    }
  }
  if (inventory == null) {
    return const DesignerReturnResult(
      succeeded: false,
      message: 'Inventory record was not found',
    );
  }

  num stored = 0;
  final productIdForCache = inventory.productId.isNotEmpty
      ? inventory.productId
      : log.productId;
  if (productIdForCache.isNotEmpty) {
    final cacheSnap =
        await StoreValleyInventoryRecord.docRef(productIdForCache).get();
    stored =
        StoreValleyInventoryRecord.fromSnapshot(cacheSnap)?.storedQuantity ?? 0;
  }
  final sellable = StoreValleyInventoryRecord.availableForOrder(
    stored: stored,
    reserved: inventory.stockReserved,
    unavailable: inventory.stockUnavailable,
  );
  if (qty > sellable) {
    return DesignerReturnResult(
      succeeded: false,
      message: 'Only $sellable warehouse units are available to return',
    );
  }

  final designerSnap = await UsersRecord.collection.doc(log.designerUid).get();
  if (!designerSnap.exists) {
    return const DesignerReturnResult(
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
    return const DesignerReturnResult(
      succeeded: false,
      message: 'Company warehouse settings are missing',
    );
  }

  final productSnap = await log.productRef!.get();
  if (!productSnap.exists) {
    return const DesignerReturnResult(
      succeeded: false,
      message: 'Product record was not found',
    );
  }
  final product = ProductsRecord.fromSnapshot(productSnap);
  final productId =
      product.productId.isNotEmpty ? product.productId : log.productId;
  final trimmedSku = (inventory.productSku).trim();
  final designerAddress = designer.designerMainInfo.designerPickupAddress;
  final warehouse = company.settingsCompanyInfo.wearhouseAddress;
  final warehouseLatLng = warehouse.latLong;
  final designerLatLng = designerAddress.latLong;

  final payload = buildDesignerReturnPayload(
    inventoryRequestId: log.requestInfo.inventoryRequestId,
    productId: productId,
    productSku: trimmedSku,
    productName: product.productInfo.name.isNotEmpty
        ? product.productInfo.name
        : log.productName,
    quantity: qty,
    designerId: designer.designerMainInfo.designerId,
    fromName: warehouse.shippingName,
    fromPhone: warehouse.shippingPhone,
    fromAddress: warehouse.addressLine1,
    fromCity: warehouse.city,
    fromCountry: warehouse.country,
    fromLatitude: warehouseLatLng?.latitude,
    fromLongitude: warehouseLatLng?.longitude,
    customerUserId: designer.uid,
    toName: designerAddress.shippingName,
    toPhone: designerAddress.shippingPhone,
    toAddress: designerAddress.addressLine1,
    toCity: designerAddress.city,
    toCountry: designerAddress.country,
    toEmail: designerAddress.shippingEmail,
    toLatitude: designerLatLng?.latitude,
    toLongitude: designerLatLng?.longitude,
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
      otpOnDelivery: true,
      b2bHandling: payload.b2bHandling,
      oversized: false,
      returnStatus: payload.returnStatus,
      itemsListJson: payload.itemsListJson,
      designerId: payload.designerId,
      warehouseId: payload.warehouseId,
      customerUserId: payload.customerUserId,
      deliveryInstructions: payload.deliveryInstructions,
      packageCount: 1,
      fromBuilding: warehouse.building,
      fromBlock: warehouse.block,
      fromGovernorate: warehouse.state,
      toBuilding: designerAddress.building,
      toBlock: designerAddress.block,
      toGovernorate: designerAddress.state,
    );
  } catch (error) {
    return DesignerReturnResult(
      succeeded: false,
      message: error.toString(),
    );
  }

  if (!response.succeeded) {
    final body = response.jsonBody;
    final message = body is Map && body['message'] != null
        ? body['message'].toString()
        : 'Failed to create return to designer delivery';
    return DesignerReturnResult(succeeded: false, message: message);
  }

  final trackingId = PrimeExpressDeliveryGroup.createDeliveryCall.swftboxID(
        response.jsonBody,
      ) ??
      '';
  final deliveryId = idMap?.deliveryId.toString() ?? '';
  final deliveryRef = DeliveryRecord.collection.doc();
  await deliveryRef.set(createDeliveryRecordData(
    createdAt: getCurrentTimestamp,
    updatedAt: getCurrentTimestamp,
    status: 'REQUESTED',
    type: 'inventory',
    inventoryMovementRef: log.reference,
    assignedBy: assignedBy ?? currentUserReference,
    deliveryId: deliveryId,
    deliveryTrackingId: trackingId,
  ));

  await log.reference.update(createInventorymovementlogRecordData(
    updateAt: getCurrentTimestamp,
    status: InventoryRequestType.movementStatus(
      InventoryRequestType.returnToDesigner,
    ),
    requestInfo: createInventoryRequestInfoStruct(
      requestStatus: 'Accepted',
      fulfillStatus: 'DeliveryPartnerAssigned',
      clearUnsetFields: false,
    ),
    requestDeliveryInfo: createDeliveryInfoStruct(
      deliveryRef: deliveryRef,
      deliveryId: deliveryId,
      deliveryTrackingId: trackingId,
      updatedAt: getCurrentTimestamp,
      pickupAddress: createUserShippingaddressInfoStruct(
        shippingEmail: warehouse.shippingEmail,
        shippingPhone: warehouse.shippingPhone,
        shippingName: warehouse.shippingName,
        addressLine1: warehouse.addressLine1,
        city: warehouse.city,
        country: warehouse.country,
        clearUnsetFields: false,
      ),
      deliveryAddress: createUserShippingaddressInfoStruct(
        shippingEmail: designerAddress.shippingEmail,
        shippingPhone: designerAddress.shippingPhone,
        shippingName: designerAddress.shippingName,
        addressLine1: designerAddress.addressLine1,
        city: designerAddress.city,
        country: designerAddress.country,
        clearUnsetFields: false,
      ),
      notes: InventoryRequestType.deliveryNote,
      packageCount: 1,
      clearUnsetFields: false,
    ),
  ));

  final nextUnavailable = inventory.stockUnavailable + qty;
  await inventory.reference.update({
    'updated_at': getCurrentTimestamp,
    'stock_unavailable': nextUnavailable,
    'available_for_order': StoreValleyInventoryRecord.availableForOrder(
      stored: stored,
      reserved: inventory.stockReserved,
      unavailable: nextUnavailable,
    ),
  });

  if (idMap != null) {
    await idMap.reference.update({
      'delivery_id': FieldValue.increment(1),
    });
  }

  return DesignerReturnResult(
    succeeded: true,
    trackingId: trackingId,
  );
}
