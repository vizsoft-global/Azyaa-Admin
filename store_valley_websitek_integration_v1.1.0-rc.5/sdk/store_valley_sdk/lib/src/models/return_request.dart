import 'package:freezed_annotation/freezed_annotation.dart';
import 'address.dart';
import 'logistics_item.dart';
import '../enums/return_type.dart';
import '../enums/inventory_source.dart';

part 'return_request.freezed.dart';
part 'return_request.g.dart';

@freezed
abstract class ReturnRequest with _$ReturnRequest {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory ReturnRequest({
    @JsonKey(name: 'external_request_id') required String externalRequestId,

    /// Store Valley `order_id` for Warehouse Delivery, or `delivery_order_id`
    /// from the original Designer/Custom Pickup response.
    @JsonKey(name: 'source_order_id') required String sourceOrderId,
    @JsonKey(name: 'designer_id') required String designerId,
    @JsonKey(name: 'original_source_location_id')
    required String originalSourceLocationId,
    @JsonKey(name: 'return_type')
    @Default(ReturnType.returnRequest)
    ReturnType returnType,
    @JsonKey(name: 'original_inventory_source')
    InventorySource? originalInventorySource,
    @JsonKey(name: 'warehouse_id') String? warehouseId,
    @JsonKey(name: 'designer_return_address') Address? designerReturnAddress,
    @JsonKey(name: 'customer_pickup_address')
    required Address customerPickupAddress,
    required List<LogisticsItem> items,
    String? reason,
    @JsonKey(name: 'requested_pickup_at') DateTime? requestedPickupAt,
    @JsonKey(name: 'special_instructions') String? specialInstructions,
    Map<String, dynamic>? metadata,
  }) = _ReturnRequest;

  factory ReturnRequest.fromJson(Map<String, dynamic> json) =>
      _$ReturnRequestFromJson(json);
}
