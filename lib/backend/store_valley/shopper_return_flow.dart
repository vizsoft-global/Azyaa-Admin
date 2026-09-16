import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/store_valley/shopper_return_payload.dart';
import '/backend/store_valley/store_valley_config.dart';
import '/backend/store_valley/store_valley_inventory_record.dart';
import '/backend/store_valley/store_valley_service.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShopperReturnResult {
  const ShopperReturnResult({
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

Future<ShopperReturnResult> createShopperReturnPickup(
  ReturnRequestsRecord returnDoc, {
  DocumentReference? assignedBy,
}) async {
  if (returnDoc.status != 'Pending') {
    return const ShopperReturnResult(
      succeeded: false,
      message: 'Only pending return requests can be approved',
    );
  }
  if (returnDoc.orderRef == null) {
    return const ShopperReturnResult(
      succeeded: false,
      message: 'Order is missing on this return request',
    );
  }
  if (returnDoc.returnProductList.isEmpty) {
    return const ShopperReturnResult(
      succeeded: false,
      message: 'Return has no products',
    );
  }

  final order = await OrdersRecord.getDocumentOnce(returnDoc.orderRef!);
  final address = order.shippingAddress;
  if (!isCompleteShopperPickupAddress(
    street: address.addressLine1,
    city: address.city,
    contactName: address.shippingName,
    contactPhone: address.shippingPhone,
  )) {
    return const ShopperReturnResult(
      succeeded: false,
      message: 'Customer shipping address is incomplete for pickup',
    );
  }

  final lines = returnDoc.returnProductList
      .map(
        (item) => ShopperReturnLineInput(
          productId: item.productId,
          quantity: item.quantity,
          productName: item.productInfo.name,
          productSku: item.productStockInfo.productSku,
          productMainType: item.productMainType,
          isPreferredVendor: item.productStockInfo.isPreferredVendor,
          designerUid: item.productDesignerId,
          pickupTrackingId: item.productPickupInfo.deliveryTrackingId,
        ),
      )
      .toList();
  final shipments = await _shipmentsForReturn(order, lines);
  final grouped = groupShopperReturnLines(
    returnRequestId: returnDoc.returnRequestId.isNotEmpty
        ? returnDoc.returnRequestId
        : returnDoc.reference.id,
    lines: lines,
    shipments: shipments,
  );
  if (grouped.unmatchedProductIds.isNotEmpty) {
    return ShopperReturnResult(
      succeeded: false,
      message:
          'No Store Valley shipment found for ${grouped.unmatchedProductIds.join(', ')}',
    );
  }
  if (grouped.groups.isEmpty) {
    return const ShopperReturnResult(
      succeeded: false,
      message: 'No Store Valley shipment found for this return',
    );
  }

  final idMap = await queryIdMapRecordOnce(
    queryBuilder: (idMapRecord) => idMapRecord.where(
      'type',
      isEqualTo: 'Main',
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);

  final trackingIds = <String>[];
  final otps = <String>[];
  final reason = shopperReturnReason(
    reason: returnDoc.returnReason,
    additionalInfo: returnDoc.returnAdditionalInfo,
  );
  final customerUserId = returnDoc.userRef?.id;

  for (final group in grouped.groups) {
    final originalSource = await _resolveOriginalSource(
      group: group,
      azyaaOrderId: order.orderId,
    );
    if (originalSource.isEmpty) {
      return ShopperReturnResult(
        succeeded: false,
        message:
            'original_source_location_id is missing for ${group.sourceOrderId}',
      );
    }
    final designerId = await _designerIdForGroup(group);
    final payload = buildShopperReturnPayload(
      externalRequestId: group.externalRequestId,
      sourceOrderId: group.sourceOrderId,
      originalSourceLocationId: originalSource,
      designerId: designerId,
      fromName: address.shippingName,
      fromPhone: address.shippingPhone,
      fromAddress: address.addressLine1,
      fromCity: address.city,
      fromCountry: address.country,
      fromLatitude: address.latLong?.latitude,
      fromLongitude: address.latLong?.longitude,
      fromBuilding: address.building,
      fromBlock: address.block,
      fromGovernorate: address.state,
      toEmail: address.shippingEmail,
      customerUserId: customerUserId,
      deliveryInstructions: reason,
      items: group.itemsListJson,
    );

    late final ApiCallResponse response;
    final existing = await _existingReturn(group.externalRequestId);
    if (existing != null) {
      response = existing;
    } else {
      try {
        response = await PrimeExpressDeliveryGroup.createDeliveryCall.call(
          orderID: payload.sourceOrderId,
          invtrackID: shopperReturnMapperClientId(payload.invtrackId),
          fromName: payload.fromName,
          fromPhone: payload.fromPhone,
          fromAddress: payload.fromAddress,
          fromCity: payload.fromCity,
          fromCountry: payload.fromCountry,
          fromlatitude: payload.fromLatitude,
          fromlongitude: payload.fromLongitude,
          toName: '',
          toPhone: '',
          toAddress: '',
          toCity: '',
          toCountry: '',
          toEmail: payload.toEmail,
          toCountryCode: 'KW',
          fromCountryCode: 'KW',
          amount: 0.00,
          otpOnDelivery: false,
          b2bHandling: payload.b2bHandling,
          oversized: false,
          returnStatus: payload.returnStatus,
          itemsListJson: payload.itemsListJson,
          designerId: payload.designerId,
          warehouseId: StoreValleyConfig.warehouseId,
          customerUserId: payload.customerUserId,
          deliveryInstructions: payload.deliveryInstructions,
          originalSourceLocationId: payload.originalSourceLocationId,
          packageCount: 1,
          fromBuilding: payload.fromBuilding,
          fromBlock: payload.fromBlock,
          fromGovernorate: payload.fromGovernorate,
        );
      } catch (error) {
        return ShopperReturnResult(
          succeeded: false,
          message: error.toString(),
        );
      }
    }

    if (!response.succeeded) {
      final body = response.jsonBody;
      final message = body is Map && body['message'] != null
          ? body['message'].toString()
          : 'Failed to create return pickup request';
      return ShopperReturnResult(succeeded: false, message: message);
    }

    final trackingId = PrimeExpressDeliveryGroup.createDeliveryCall.swftboxID(
          response.jsonBody,
        ) ??
        '';
    if (trackingId.isEmpty) {
      return const ShopperReturnResult(
        succeeded: false,
        message: 'Store Valley did not return a tracking id',
      );
    }
    trackingIds.add(trackingId);
    final pickupOtp = _pickupOtpFromResponse(response.jsonBody);
    if (pickupOtp.isNotEmpty) {
      otps.add(pickupOtp);
    }

    await _persistReturnDelivery(
      trackingId: trackingId,
      orderRef: order.reference,
      returnRef: returnDoc.reference,
      assignedBy: assignedBy ?? currentUserReference,
      deliveryId: idMap?.deliveryId.toString() ?? trackingId,
    );
    if (idMap != null) {
      await idMap.reference.update({
        'delivery_id': FieldValue.increment(1),
      });
    }
  }

  await returnDoc.reference.update({
    ...createReturnRequestsRecordData(
      updatedAt: getCurrentTimestamp,
      status: 'Accepted',
      approverInfo: createApproverInfoStruct(
        userEmail: currentUserEmail,
        userRef: currentUserReference,
        uid: currentUserUid,
        userName: currentUserDisplayName,
        userRole: valueOrDefault(currentUserDocument?.userRole, ''),
        clearUnsetFields: false,
      ),
    ),
    'store_valley_request_ids': trackingIds,
    if (otps.isNotEmpty) 'pickup_otp': otps.first,
    'logistics_status': 'return_initiated',
  });

  return ShopperReturnResult(
    succeeded: true,
    trackingId: trackingIds.join(', '),
    pickupOtp: otps.isEmpty ? null : otps.join(', '),
  );
}

Future<List<ShopperReturnShipmentInput>> _shipmentsForReturn(
  OrdersRecord order,
  List<ShopperReturnLineInput> lines,
) async {
  final shipments = <ShopperReturnShipmentInput>[];
  for (final info in order.deliveryInfoList) {
    final tracking = info.deliveryTrackingId.trim();
    if (tracking.isEmpty) {
      continue;
    }
    var originalSource = '';
    var deliveryOrderId = '';
    if (info.deliveryRef != null) {
      final snap = await info.deliveryRef!.get();
      final data = snap.data();
      if (data is Map<String, dynamic>) {
        originalSource =
            (data['original_source_location_id'] ?? '').toString().trim();
        deliveryOrderId = (data['delivery_order_id'] ?? '').toString().trim();
      }
    }
    final logistics = await _logisticsByTracking(tracking);
    if (logistics != null) {
      if (originalSource.isEmpty) {
        originalSource = logistics.originalSourceLocationId.trim();
      }
      if (deliveryOrderId.isEmpty) {
        deliveryOrderId = logistics.deliveryOrderId.trim();
      }
    }
    shipments.add(
      ShopperReturnShipmentInput(
        deliveryType: info.deliveryType,
        trackingId: tracking,
        productIds: info.productIds,
        deliveryOrderId: deliveryOrderId,
        originalSourceLocationId: originalSource,
      ),
    );
  }

  final covered = <String>{
    for (final shipment in shipments) ...shipment.productIds.map((id) => id.trim()),
  };
  for (final line in lines) {
    if (covered.contains(line.productId.trim())) {
      continue;
    }
    final tracking = line.pickupTrackingId.trim();
    if (tracking.isEmpty) {
      continue;
    }
    final logistics = await _logisticsByTracking(tracking);
    shipments.add(
      ShopperReturnShipmentInput(
        deliveryType: isWarehouseShopperReturnLine(
          productMainType: line.productMainType,
          isPreferredVendor: line.isPreferredVendor,
        )
            ? 'ready'
            : 'custom',
        trackingId: tracking,
        productIds: [line.productId],
        deliveryOrderId: logistics?.deliveryOrderId.trim() ?? tracking,
        originalSourceLocationId:
            logistics?.originalSourceLocationId.trim() ?? '',
      ),
    );
    covered.add(line.productId.trim());
  }
  return shipments;
}

Future<LogisticsResponseRecord?> _logisticsByTracking(String tracking) async {
  if (tracking.isEmpty) {
    return null;
  }
  final byTrack = await LogisticsResponseRecord.collection
      .where('swftTrackID', isEqualTo: tracking)
      .limit(1)
      .get();
  if (byTrack.docs.isNotEmpty) {
    return LogisticsResponseRecord.fromSnapshot(byTrack.docs.first);
  }
  final byDelivery = await LogisticsResponseRecord.collection
      .where('delivery_order_id', isEqualTo: tracking)
      .limit(1)
      .get();
  if (byDelivery.docs.isEmpty) {
    return null;
  }
  return LogisticsResponseRecord.fromSnapshot(byDelivery.docs.first);
}

Future<String> _resolveOriginalSource({
  required ShopperReturnGroup group,
  required String azyaaOrderId,
}) async {
  if (group.originalSourceLocationId.isNotEmpty) {
    return group.originalSourceLocationId;
  }
  final ids = <String>{
    group.sourceOrderId,
    if (group.deliveryType == 'ready' && azyaaOrderId.trim().isNotEmpty)
      '${azyaaOrderId.trim()}-RM',
    if (group.deliveryType == 'custom' &&
        azyaaOrderId.trim().isNotEmpty &&
        group.designerUid.isNotEmpty)
      'PKP-${azyaaOrderId.trim()}-CM-${group.designerUid}',
  };
  for (final id in ids) {
    try {
      if (group.deliveryType == 'custom') {
        final pickup = await StoreValleyService.instance.getPickup(id);
        final loc = pickup.originalSourceLocationId?.trim() ?? '';
        if (loc.isNotEmpty) {
          return loc;
        }
      } else {
        final delivery = await StoreValleyService.instance.getDelivery(id);
        final loc = delivery.originalSourceLocationId.trim();
        if (loc.isNotEmpty) {
          return loc;
        }
      }
    } on StoreValleyException {
      continue;
    }
  }
  if (group.deliveryType != 'custom') {
    return StoreValleyConfig.pickupLocationId;
  }
  return '';
}

Future<String> _designerIdForGroup(ShopperReturnGroup group) async {
  if (group.designerId.isNotEmpty) {
    return group.designerId;
  }
  final productId = group.itemsListJson.isNotEmpty
      ? (group.itemsListJson.first['skuNumber'] ?? '').toString().trim()
      : '';
  if (productId.isNotEmpty) {
    final cache = StoreValleyInventoryRecord.fromSnapshot(
      await StoreValleyInventoryRecord.docRef(productId).get(),
    );
    if (cache != null && cache.designerId.trim().isNotEmpty) {
      return cache.designerId.trim();
    }
  }
  if (group.designerUid.isNotEmpty) {
    final snap = await UsersRecord.collection.doc(group.designerUid).get();
    if (snap.exists) {
      final designerId =
          UsersRecord.fromSnapshot(snap).designerMainInfo.designerId.trim();
      if (designerId.isNotEmpty) {
        return designerId;
      }
    }
  }
  return StoreValleyConfig.fallbackDesignerId;
}

Future<ApiCallResponse?> _existingReturn(String externalRequestId) async {
  try {
    final existing =
        await StoreValleyService.instance.getReturn(externalRequestId);
    return StoreValleyService.instance.toApiCallResponse(existing.toJson());
  } on StoreValleyException {
    return null;
  }
}

Future<void> _persistReturnDelivery({
  required String trackingId,
  required DocumentReference orderRef,
  required DocumentReference returnRef,
  required DocumentReference? assignedBy,
  required String deliveryId,
}) async {
  final existing = await DeliveryRecord.collection
      .where('delivery_tracking_id', isEqualTo: trackingId)
      .limit(1)
      .get();
  if (existing.docs.isNotEmpty) {
    await existing.docs.first.reference.set(
      {'return_request_ref': returnRef},
      SetOptions(merge: true),
    );
    return;
  }
  final deliveryRef = DeliveryRecord.collection.doc();
  await deliveryRef.set({
    ...createDeliveryRecordData(
      createdAt: getCurrentTimestamp,
      updatedAt: getCurrentTimestamp,
      status: 'REQUESTED',
      type: 'order',
      orderRef: orderRef,
      assignedBy: assignedBy,
      deliveryId: deliveryId,
      deliveryTrackingId: trackingId,
    ),
    'return_request_ref': returnRef,
  });
}

String _pickupOtpFromResponse(dynamic responseBody) {
  if (responseBody is! Map) {
    return '';
  }
  final direct = responseBody['pickup_otp']?.toString() ?? '';
  if (direct.isNotEmpty) {
    return direct;
  }
  final data = responseBody['data'];
  if (data is List && data.isNotEmpty && data.first is Map) {
    return data.first['pickup_otp']?.toString() ?? '';
  }
  return '';
}
