import 'package:store_valley_sdk/store_valley_sdk.dart';

import '/backend/api_requests/api_manager.dart';
import 'store_valley_address.dart';
import 'store_valley_config.dart';
import 'store_valley_service.dart';

class StoreValleyLegacyMapper {
  StoreValleyLegacyMapper._();

  static List<LogisticsItem> itemsFromJson(dynamic itemsListJson) {
    final raw = itemsListJson is List
        ? itemsListJson
        : itemsListJson is Map
            ? [itemsListJson]
            : const [];
    return raw.map((entry) {
      final map = Map<String, dynamic>.from(entry as Map);
      final quantity = int.tryParse('${map['quantity'] ?? 1}') ?? 1;
      final productId = (map['skuNumber'] ?? map['product_id'] ?? '')
          .toString()
          .trim();
      var sku = (map['sku'] ?? '').toString().trim();
      if (sku.isEmpty || sku == '-') {
        sku = '';
      }
      final name = (map['name'] ?? map['product_name'])?.toString();
      return LogisticsItem(
        quantity: quantity > 0 ? quantity : 1,
        productId: productId.isEmpty ? null : productId,
        sku: sku.isEmpty ? (productId.isEmpty ? name : null) : sku,
        productName: name,
      );
    }).toList();
  }

  static Address address({
    required String street,
    required String city,
    required String contactName,
    required String contactPhone,
    String? country,
    double? latitude,
    double? longitude,
    String? building,
    String? block,
    String? governorate,
  }) {
    return StoreValleyAddress.fromParts(
      street: street,
      city: city,
      contactName: contactName,
      contactPhone: contactPhone,
      country: country,
      latitude: latitude,
      longitude: longitude,
      building: building,
      block: block,
      governorate: governorate,
    );
  }

  static Map<String, dynamic> warehouseIntakeBody(
    WarehouseIntakeRequest request, {
    bool generatePickupOtp = true,
  }) {
    return StoreValleyAddress.prepareWarehouseIntakeBody(
      Map<String, dynamic>.from(request.toJson()),
      generatePickupOtp: generatePickupOtp,
    );
  }

  static Future<ApiCallResponse> create({
    required String orderID,
    required String invtrackID,
    required String fromName,
    required String fromPhone,
    required String fromAddress,
    required String fromCity,
    required String fromCountry,
    double? fromlatitude,
    double? fromlongitude,
    required String toName,
    required String toPhone,
    required String toAddress,
    required String toCity,
    required String toCountry,
    double? tolatitude,
    double? tolongitude,
    dynamic itemsListJson,
    bool otpOnDelivery = true,
    bool b2bHandling = false,
    bool returnStatus = false,
    String? deliveryInstructions,
    String? toEmail,
    String? designerId,
    String? warehouseId,
    String? pickupLocationId,
    String? packagingProfile,
    String? originalSourceLocationId,
    String? pickupPurpose,
    String? customerUserId,
    String? orderKind,
    String? fromBuilding,
    String? fromBlock,
    String? fromGovernorate,
    String? toBuilding,
    String? toBlock,
    String? toGovernorate,
  }) async {
    final service = StoreValleyService.instance;
    final resolvedDesignerId = (designerId == null || designerId.isEmpty)
        ? StoreValleyConfig.fallbackDesignerId
        : designerId;
    final resolvedWarehouse =
        (warehouseId == null || warehouseId.isEmpty)
            ? StoreValleyConfig.warehouseId
            : warehouseId;
    final resolvedPickup = (pickupLocationId == null || pickupLocationId.isEmpty)
        ? StoreValleyConfig.pickupLocationId
        : pickupLocationId;
    final resolvedPackaging =
        (packagingProfile == null || packagingProfile.isEmpty)
            ? StoreValleyConfig.packagingProfile
            : packagingProfile;
    final items = itemsFromJson(itemsListJson);
    final clientId = invtrackID.isNotEmpty ? invtrackID : orderID;
    final from = address(
      street: fromAddress,
      city: fromCity,
      contactName: fromName,
      contactPhone: fromPhone,
      country: fromCountry,
      latitude: fromlatitude,
      longitude: fromlongitude,
      building: fromBuilding,
      block: fromBlock,
      governorate: fromGovernorate,
    );
    final to = address(
      street: toAddress,
      city: toCity,
      contactName: toName,
      contactPhone: toPhone,
      country: toCountry,
      latitude: tolatitude,
      longitude: tolongitude,
      building: toBuilding,
      block: toBlock,
      governorate: toGovernorate,
    );
    final notifyPickupParty = {
      if (customerUserId != null && customerUserId.isNotEmpty)
        'userId': customerUserId,
      'phone': fromPhone,
    };
    final notifyCustomer = {
      if (customerUserId != null && customerUserId.isNotEmpty)
        'userId': customerUserId,
      'phone': toPhone,
      if (toEmail != null && toEmail.isNotEmpty) 'email': toEmail,
    };

    try {
      if (returnStatus) {
        if (originalSourceLocationId == null ||
            originalSourceLocationId.isEmpty) {
          throw StoreValleyException(
            'original_source_location_id is required for returns',
            statusCode: 400,
          );
        }
        final response = await service.createReturn(
          ReturnRequest(
            externalRequestId: 'RET-$clientId',
            sourceOrderId: orderID.isNotEmpty ? orderID : clientId,
            designerId: resolvedDesignerId,
            originalSourceLocationId: originalSourceLocationId,
            customerPickupAddress: from,
            items: items,
            reason: deliveryInstructions,
            specialInstructions: deliveryInstructions,
          ),
          notifyCustomer: {
            ...notifyPickupParty,
            'otpType': 'return_pickup',
          },
          generatePickupOtp: true,
        );
        return service.toApiCallResponse(response.toJson());
      }

      if (b2bHandling || pickupPurpose == 'warehouse_intake') {
        final json = await service.createIntakeMap(
          WarehouseIntakeRequest(
            externalRequestId: 'INT-$clientId',
            warehouseId: resolvedWarehouse,
            designer: Designer(
              designerId: resolvedDesignerId,
              name: fromName,
              pickupAddress: from,
            ),
            items: items,
            specialInstructions: deliveryInstructions,
          ),
          notifyCustomer: {
            ...notifyPickupParty,
            'otpType': 'designer_pickup',
          },
          generatePickupOtp: true,
        );
        return service.toApiCallResponse(json);
      }

      if (pickupPurpose == 'designer_order_fulfillment' ||
          pickupPurpose == 'custom_made_fulfillment') {
        final response = await service.createPickup(
          PickupRequest(
            externalRequestId: 'PKP-$clientId',
            sourceOrderId: clientId,
            pickupPurpose: pickupPurpose == 'custom_made_fulfillment'
                ? PickupPurpose.customMadeFulfillment
                : PickupPurpose.designerOrderFulfillment,
            orderKind: orderKind == 'custom_made'
                ? OrderKind.customMade
                : OrderKind.readyMade,
            designer: Designer(
              designerId: resolvedDesignerId,
              name: fromName,
              pickupAddress: from,
            ),
            deliveryAddress: to,
            items: items,
            packagingProfile: resolvedPackaging,
            requiresOtpProof: false,
            requiresPhotoProof: true,
            specialInstructions: deliveryInstructions,
          ),
          notifyCustomer: notifyCustomer,
          generateDeliveryOtp: true,
        );
        return service.toApiCallResponse(response.toJson());
      }

      final response = await service.createDelivery(
        DeliveryRequest(
          clientOrderId: clientId,
          designerId: resolvedDesignerId,
          pickupLocationId: resolvedPickup,
          deliveryAddress: to,
          items: items,
          specialInstructions: deliveryInstructions,
          orderKind: orderKind == 'custom_made'
              ? OrderKind.customMade
              : OrderKind.readyMade,
          inventorySource: InventorySource.warehouse,
          packagingProfile: resolvedPackaging,
          requiresOtpProof: false,
          requiresPhotoProof: true,
        ),
        notifyCustomer: otpOnDelivery ? notifyCustomer : null,
        generateDeliveryOtp: otpOnDelivery,
      );
      return service.toApiCallResponse(response.toJson());
    } on StoreValleyException catch (error) {
      return service.errorResponse(error);
    }
  }
}
