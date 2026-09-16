import 'store_valley_config.dart';

class ShopperReturnPayload {
  const ShopperReturnPayload({
    required this.invtrackId,
    required this.sourceOrderId,
    required this.originalSourceLocationId,
    required this.designerId,
    required this.b2bHandling,
    required this.returnStatus,
    required this.deliveryInstructions,
    required this.itemsListJson,
    required this.fromName,
    required this.fromPhone,
    required this.fromAddress,
    required this.fromCity,
    required this.fromCountry,
    this.fromLatitude,
    this.fromLongitude,
    this.fromBuilding = '',
    this.fromBlock = '',
    this.fromGovernorate = '',
    this.customerUserId,
    this.toEmail = '',
  });

  final String invtrackId;
  final String sourceOrderId;
  final String originalSourceLocationId;
  final String designerId;
  final bool b2bHandling;
  final bool returnStatus;
  final String deliveryInstructions;
  final List<Map<String, dynamic>> itemsListJson;
  final String fromName;
  final String fromPhone;
  final String fromAddress;
  final String fromCity;
  final String fromCountry;
  final double? fromLatitude;
  final double? fromLongitude;
  final String fromBuilding;
  final String fromBlock;
  final String fromGovernorate;
  final String? customerUserId;
  final String toEmail;
}

class ShopperReturnLineInput {
  const ShopperReturnLineInput({
    required this.productId,
    required this.quantity,
    this.productName = '',
    this.productSku = '',
    this.productMainType = '',
    this.isPreferredVendor = false,
    this.designerUid = '',
    this.pickupTrackingId = '',
  });

  final String productId;
  final int quantity;
  final String productName;
  final String productSku;
  final String productMainType;
  final bool isPreferredVendor;
  final String designerUid;
  final String pickupTrackingId;
}

class ShopperReturnShipmentInput {
  const ShopperReturnShipmentInput({
    required this.deliveryType,
    required this.trackingId,
    required this.productIds,
    this.deliveryOrderId = '',
    this.originalSourceLocationId = '',
    this.designerId = '',
  });

  final String deliveryType;
  final String trackingId;
  final List<String> productIds;
  final String deliveryOrderId;
  final String originalSourceLocationId;
  final String designerId;
}

class ShopperReturnGroup {
  const ShopperReturnGroup({
    required this.shipmentKey,
    required this.externalRequestId,
    required this.sourceOrderId,
    required this.originalSourceLocationId,
    required this.designerId,
    required this.deliveryType,
    required this.itemsListJson,
    this.designerUid = '',
  });

  final String shipmentKey;
  final String externalRequestId;
  final String sourceOrderId;
  final String originalSourceLocationId;
  final String designerId;
  final String deliveryType;
  final List<Map<String, dynamic>> itemsListJson;
  final String designerUid;
}

class ShopperReturnGroupResult {
  const ShopperReturnGroupResult({
    required this.groups,
    required this.unmatchedProductIds,
  });

  final List<ShopperReturnGroup> groups;
  final List<String> unmatchedProductIds;
}

bool isWarehouseShopperReturnLine({
  required String productMainType,
  required bool isPreferredVendor,
}) {
  return productMainType.trim().toLowerCase() == 'ready' && isPreferredVendor;
}

bool isCompleteShopperPickupAddress({
  required String street,
  required String city,
  required String contactName,
  required String contactPhone,
}) {
  return street.trim().isNotEmpty &&
      city.trim().isNotEmpty &&
      contactName.trim().isNotEmpty &&
      contactPhone.trim().isNotEmpty;
}

String shopperReturnReason({
  required String reason,
  String additionalInfo = '',
}) {
  final trimmedReason = reason.trim();
  final extra = additionalInfo.trim();
  if (trimmedReason.isEmpty) {
    return extra;
  }
  if (extra.isEmpty) {
    return trimmedReason;
  }
  return '$trimmedReason. $extra';
}

String shopperReturnApproveMessage({
  required bool succeeded,
  String message = '',
  String? pickupOtp,
}) {
  if (!succeeded) {
    return message;
  }
  final otp = pickupOtp?.trim() ?? '';
  if (otp.isEmpty) {
    return 'Return pickup request created.';
  }
  return 'Return pickup request created. Tell the driver this OTP: $otp';
}

String shopperReturnShipmentKey({
  required String deliveryType,
  required String trackingId,
}) {
  final type = deliveryType.trim().isEmpty ? 'ready' : deliveryType.trim();
  return '$type-${trackingId.trim()}';
}

String shopperReturnExternalRequestId({
  required String returnRequestId,
  required String shipmentKey,
}) {
  return 'RET-$returnRequestId-$shipmentKey';
}

String shopperReturnMapperClientId(String externalRequestId) {
  const prefix = 'RET-';
  if (externalRequestId.startsWith(prefix)) {
    return externalRequestId.substring(prefix.length);
  }
  return externalRequestId;
}

String shopperReturnSourceOrderId(ShopperReturnShipmentInput shipment) {
  final deliveryOrderId = shipment.deliveryOrderId.trim();
  if (shipment.deliveryType.trim() == 'custom' && deliveryOrderId.isNotEmpty) {
    return deliveryOrderId;
  }
  return shipment.trackingId.trim();
}

ShopperReturnPayload buildShopperReturnPayload({
  required String externalRequestId,
  required String sourceOrderId,
  required String originalSourceLocationId,
  required String designerId,
  required String fromName,
  required String fromPhone,
  required String fromAddress,
  required String fromCity,
  required String fromCountry,
  required List<Map<String, dynamic>> items,
  String deliveryInstructions = '',
  String? customerUserId,
  double? fromLatitude,
  double? fromLongitude,
  String fromBuilding = '',
  String fromBlock = '',
  String fromGovernorate = '',
  String toEmail = '',
}) {
  final trimmedDesigner = designerId.trim();
  return ShopperReturnPayload(
    invtrackId: externalRequestId.trim(),
    sourceOrderId: sourceOrderId.trim(),
    originalSourceLocationId: originalSourceLocationId.trim(),
    designerId: trimmedDesigner.isEmpty
        ? StoreValleyConfig.fallbackDesignerId
        : trimmedDesigner,
    b2bHandling: false,
    returnStatus: true,
    deliveryInstructions: deliveryInstructions,
    itemsListJson: items
        .map((item) => Map<String, dynamic>.from(item))
        .toList(growable: false),
    fromName: fromName,
    fromPhone: fromPhone,
    fromAddress: fromAddress,
    fromCity: fromCity,
    fromCountry: fromCountry,
    fromLatitude: fromLatitude,
    fromLongitude: fromLongitude,
    fromBuilding: fromBuilding,
    fromBlock: fromBlock,
    fromGovernorate: fromGovernorate,
    customerUserId: customerUserId,
    toEmail: toEmail,
  );
}

ShopperReturnGroupResult groupShopperReturnLines({
  required String returnRequestId,
  required List<ShopperReturnLineInput> lines,
  required List<ShopperReturnShipmentInput> shipments,
}) {
  final unmatched = <String>[];
  final groupedItems = <String, List<Map<String, dynamic>>>{};
  final groupedShipments = <String, ShopperReturnShipmentInput>{};
  final groupedDesignerUids = <String, String>{};

  for (final line in lines) {
    final shipment = _matchShipment(line, shipments);
    if (shipment == null) {
      unmatched.add(line.productId);
      continue;
    }
    final sourceOrderId = shopperReturnSourceOrderId(shipment);
    final key = shopperReturnShipmentKey(
      deliveryType: shipment.deliveryType,
      trackingId: sourceOrderId,
    );
    groupedShipments.putIfAbsent(key, () => shipment);
    if (line.designerUid.trim().isNotEmpty) {
      groupedDesignerUids.putIfAbsent(key, () => line.designerUid.trim());
    }
    groupedItems.putIfAbsent(key, () => <Map<String, dynamic>>[]).add({
      'quantity': line.quantity > 0 ? line.quantity : 1,
      'skuNumber': line.productId,
      'sku': line.productSku.trim().isEmpty ? line.productId : line.productSku,
      'name': line.productName,
    });
  }

  final groups = groupedShipments.entries.map((entry) {
    final shipment = entry.value;
    final sourceOrderId = shopperReturnSourceOrderId(shipment);
    return ShopperReturnGroup(
      shipmentKey: entry.key,
      externalRequestId: shopperReturnExternalRequestId(
        returnRequestId: returnRequestId,
        shipmentKey: entry.key,
      ),
      sourceOrderId: sourceOrderId,
      originalSourceLocationId: shipment.originalSourceLocationId.trim(),
      designerId: shipment.designerId.trim(),
      deliveryType: shipment.deliveryType.trim().isEmpty
          ? 'ready'
          : shipment.deliveryType.trim(),
      itemsListJson: groupedItems[entry.key] ?? const [],
      designerUid: groupedDesignerUids[entry.key] ?? '',
    );
  }).toList(growable: false);

  return ShopperReturnGroupResult(
    groups: groups,
    unmatchedProductIds: unmatched,
  );
}

ShopperReturnShipmentInput? _matchShipment(
  ShopperReturnLineInput line,
  List<ShopperReturnShipmentInput> shipments,
) {
  final productId = line.productId.trim();
  if (productId.isEmpty) {
    return null;
  }
  final pickupTracking = line.pickupTrackingId.trim();
  for (final shipment in shipments) {
    final ids = shipment.productIds.map((id) => id.trim()).toList();
    if (!ids.contains(productId)) {
      continue;
    }
    if (pickupTracking.isNotEmpty) {
      final tracking = shipment.trackingId.trim();
      final deliveryOrderId = shipment.deliveryOrderId.trim();
      if (pickupTracking != tracking && pickupTracking != deliveryOrderId) {
        continue;
      }
    }
    return shipment;
  }
  return null;
}
