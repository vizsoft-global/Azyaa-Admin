import 'package:freezed_annotation/freezed_annotation.dart';
import 'address.dart';
import 'designer.dart';
import 'logistics_item.dart';
import '../enums/pickup_purpose.dart';
import '../enums/order_kind.dart';
import 'customer.dart';

part 'pickup_request.freezed.dart';
part 'pickup_request.g.dart';

@freezed
abstract class PickupRequest with _$PickupRequest {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  @Assert(
    '!requiresOtpProof || deliveryOtp != null',
    'deliveryOtp is required when requiresOtpProof is true',
  )
  const factory PickupRequest({
    @JsonKey(name: 'external_request_id') required String externalRequestId,
    @JsonKey(name: 'source_order_id') String? sourceOrderId,
    @JsonKey(name: 'pickup_purpose')
    @Default(PickupPurpose.designerOrderFulfillment)
    PickupPurpose pickupPurpose,
    @JsonKey(name: 'order_kind') OrderKind? orderKind,
    required Designer designer,
    @JsonKey(name: 'delivery_address') required Address deliveryAddress,
    Customer? customer,
    required List<LogisticsItem> items,
    @JsonKey(name: 'requested_pickup_at') DateTime? requestedPickupAt,
    @JsonKey(name: 'requires_collection')
    @Default(false)
    bool requiresCollection,
    @JsonKey(name: 'collection_amount') double? collectionAmount,
    @JsonKey(name: 'requires_otp_proof') @Default(true) bool requiresOtpProof,
    @JsonKey(name: 'delivery_otp') String? deliveryOtp,
    @JsonKey(name: 'requires_photo_proof')
    @Default(true)
    bool requiresPhotoProof,
    @JsonKey(name: 'packaging_profile') String? packagingProfile,
    @JsonKey(name: 'special_instructions') String? specialInstructions,
    Map<String, dynamic>? metadata,
  }) = _PickupRequest;

  factory PickupRequest.fromJson(Map<String, dynamic> json) =>
      _$PickupRequestFromJson(json);
}
