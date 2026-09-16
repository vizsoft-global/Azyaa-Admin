import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/inventory_source.dart';
import '../enums/order_kind.dart';
import 'address.dart';
import 'logistics_item.dart';

part 'delivery_request.freezed.dart';
part 'delivery_request.g.dart';

@freezed
abstract class DeliveryStop with _$DeliveryStop {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory DeliveryStop({
    required String street,
    required String city,
    String? governorate,
    String? district,
    String? block,
    String? building,
    @JsonKey(name: 'postal_code') String? postalCode,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'contact_name') required String contactName,
    @JsonKey(name: 'contact_phone') required String contactPhone,
    @Default(<LogisticsItem>[]) List<LogisticsItem> products,
  }) = _DeliveryStop;

  factory DeliveryStop.fromJson(Map<String, dynamic> json) =>
      _$DeliveryStopFromJson(json);
}

@freezed
abstract class DeliveryRequest with _$DeliveryRequest {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  @Assert(
    'deliveryAddress != null || stops != null',
    'deliveryAddress or stops is required',
  )
  @Assert(
    'inventorySource == InventorySource.warehouse',
    'DeliveryRequest is for warehouse inventory; use PickupRequest for designer inventory',
  )
  @Assert(
    '!requiresOtpProof || deliveryOtp != null',
    'deliveryOtp is required when requiresOtpProof is true',
  )
  const factory DeliveryRequest({
    @JsonKey(name: 'client_order_id') required String clientOrderId,
    @JsonKey(name: 'designer_id') required String designerId,
    @JsonKey(name: 'pickup_location_id') required String pickupLocationId,
    @JsonKey(name: 'delivery_address') Address? deliveryAddress,
    List<LogisticsItem>? items,
    List<DeliveryStop>? stops,
    @JsonKey(name: 'requires_collection')
    @Default(false)
    bool requiresCollection,
    @JsonKey(name: 'collection_amount') double? collectionAmount,
    @JsonKey(name: 'special_instructions') String? specialInstructions,
    @JsonKey(name: 'order_kind') OrderKind? orderKind,
    @JsonKey(name: 'inventory_source')
    @Default(InventorySource.warehouse)
    InventorySource inventorySource,
    @JsonKey(name: 'packaging_profile') String? packagingProfile,
    @JsonKey(name: 'requires_otp_proof') @Default(true) bool requiresOtpProof,
    @JsonKey(name: 'delivery_otp') String? deliveryOtp,
    @JsonKey(name: 'requires_photo_proof')
    @Default(true)
    bool requiresPhotoProof,
    Map<String, dynamic>? metadata,
  }) = _DeliveryRequest;

  factory DeliveryRequest.fromJson(Map<String, dynamic> json) =>
      _$DeliveryRequestFromJson(json);
}
