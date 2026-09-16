import 'package:freezed_annotation/freezed_annotation.dart';
import 'designer.dart';
import 'logistics_item.dart';

part 'warehouse_intake_request.freezed.dart';
part 'warehouse_intake_request.g.dart';

@freezed
abstract class WarehouseIntakeRequest with _$WarehouseIntakeRequest {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory WarehouseIntakeRequest({
    @JsonKey(name: 'external_request_id') required String externalRequestId,
    @JsonKey(name: 'warehouse_id') required String warehouseId,
    required Designer designer,
    required List<LogisticsItem> items,
    @JsonKey(name: 'requested_pickup_at') DateTime? requestedPickupAt,
    @JsonKey(name: 'special_instructions') String? specialInstructions,
    Map<String, dynamic>? metadata,
  }) = _WarehouseIntakeRequest;

  factory WarehouseIntakeRequest.fromJson(Map<String, dynamic> json) =>
      _$WarehouseIntakeRequestFromJson(json);
}
