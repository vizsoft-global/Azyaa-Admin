import 'package:freezed_annotation/freezed_annotation.dart';

enum InventorySource {
  @JsonValue('warehouse')
  warehouse,
  @JsonValue('designer')
  designer,
}
