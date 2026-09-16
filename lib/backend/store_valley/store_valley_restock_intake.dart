import 'store_valley_config.dart';

class RestockIntakePayload {
  const RestockIntakePayload({
    required this.invtrackId,
    required this.warehouseId,
    required this.designerId,
    required this.b2bHandling,
    required this.itemsListJson,
    required this.fromName,
    required this.fromPhone,
    required this.fromAddress,
    required this.fromCity,
    required this.fromCountry,
    this.fromLatitude,
    this.fromLongitude,
    this.customerUserId,
    this.toName = '',
    this.toPhone = '',
    this.toAddress = '',
    this.toCity = '',
    this.toCountry = '',
    this.toEmail = '',
    this.toLatitude,
    this.toLongitude,
  });

  final String invtrackId;
  final String warehouseId;
  final String designerId;
  final bool b2bHandling;
  final List<Map<String, dynamic>> itemsListJson;
  final String fromName;
  final String fromPhone;
  final String fromAddress;
  final String fromCity;
  final String fromCountry;
  final double? fromLatitude;
  final double? fromLongitude;
  final String? customerUserId;
  final String toName;
  final String toPhone;
  final String toAddress;
  final String toCity;
  final String toCountry;
  final String toEmail;
  final double? toLatitude;
  final double? toLongitude;
}

RestockIntakePayload buildRestockIntakePayload({
  required String inventoryRequestId,
  required String productId,
  required String productSku,
  required String productName,
  required int quantity,
  required String designerId,
  required String fromName,
  required String fromPhone,
  required String fromAddress,
  required String fromCity,
  required String fromCountry,
  double? fromLatitude,
  double? fromLongitude,
  String? customerUserId,
  String toName = '',
  String toPhone = '',
  String toAddress = '',
  String toCity = '',
  String toCountry = '',
  String toEmail = '',
  double? toLatitude,
  double? toLongitude,
  String warehouseId = StoreValleyConfig.warehouseId,
}) {
  final trimmedDesigner = designerId.trim();
  final trimmedSku = productSku.trim();
  return buildRestockIntakePayloadFromItems(
    inventoryRequestId: inventoryRequestId,
    items: [
      {
        'quantity': quantity > 0 ? quantity : 1,
        'skuNumber': productId,
        'sku': trimmedSku.isEmpty ? productId : trimmedSku,
        'name': productName,
      }
    ],
    designerId: trimmedDesigner,
    fromName: fromName,
    fromPhone: fromPhone,
    fromAddress: fromAddress,
    fromCity: fromCity,
    fromCountry: fromCountry,
    fromLatitude: fromLatitude,
    fromLongitude: fromLongitude,
    customerUserId: customerUserId,
    toName: toName,
    toPhone: toPhone,
    toAddress: toAddress,
    toCity: toCity,
    toCountry: toCountry,
    toEmail: toEmail,
    toLatitude: toLatitude,
    toLongitude: toLongitude,
    warehouseId: warehouseId,
  );
}

RestockIntakePayload buildRestockIntakePayloadFromItems({
  required String inventoryRequestId,
  required List<Map<String, dynamic>> items,
  required String designerId,
  required String fromName,
  required String fromPhone,
  required String fromAddress,
  required String fromCity,
  required String fromCountry,
  double? fromLatitude,
  double? fromLongitude,
  String? customerUserId,
  String toName = '',
  String toPhone = '',
  String toAddress = '',
  String toCity = '',
  String toCountry = '',
  String toEmail = '',
  double? toLatitude,
  double? toLongitude,
  String warehouseId = StoreValleyConfig.warehouseId,
}) {
  final trimmedDesigner = designerId.trim();
  return RestockIntakePayload(
    invtrackId: inventoryRequestId,
    warehouseId: warehouseId.trim().isEmpty
        ? StoreValleyConfig.warehouseId
        : warehouseId,
    designerId: trimmedDesigner.isEmpty
        ? StoreValleyConfig.fallbackDesignerId
        : trimmedDesigner,
    b2bHandling: true,
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
    customerUserId: customerUserId,
    toName: toName,
    toPhone: toPhone,
    toAddress: toAddress,
    toCity: toCity,
    toCountry: toCountry,
    toEmail: toEmail,
    toLatitude: toLatitude,
    toLongitude: toLongitude,
  );
}
