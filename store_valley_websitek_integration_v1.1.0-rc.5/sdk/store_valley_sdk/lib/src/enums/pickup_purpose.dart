import 'package:freezed_annotation/freezed_annotation.dart';

enum PickupPurpose {
  @JsonValue('designer_order_fulfillment')
  designerOrderFulfillment,
  @JsonValue('custom_made_fulfillment')
  customMadeFulfillment,
  @JsonValue('warehouse_intake')
  warehouseIntake,
}
