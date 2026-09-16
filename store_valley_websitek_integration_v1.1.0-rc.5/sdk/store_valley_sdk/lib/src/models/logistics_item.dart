import 'package:freezed_annotation/freezed_annotation.dart';

part 'logistics_item.freezed.dart';
part 'logistics_item.g.dart';

@freezed
abstract class LogisticsItem with _$LogisticsItem {
  @Assert('sku != null || productId != null', 'sku or productId is required')
  @Assert('quantity > 0', 'quantity must be positive')
  const factory LogisticsItem({
    String? sku,
    required int quantity,
    @JsonKey(name: 'product_id') String? productId,
    @JsonKey(name: 'product_name') String? productName,
    @JsonKey(name: 'condition_notes') String? conditionNotes,
    @JsonKey(name: 'packaging_notes') String? packagingNotes,
  }) = _LogisticsItem;

  factory LogisticsItem.fromJson(Map<String, dynamic> json) =>
      _$LogisticsItemFromJson(json);
}
