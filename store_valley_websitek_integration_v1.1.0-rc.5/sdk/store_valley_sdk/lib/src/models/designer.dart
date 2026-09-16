import 'package:freezed_annotation/freezed_annotation.dart';
import 'address.dart';

part 'designer.freezed.dart';
part 'designer.g.dart';

@freezed
abstract class Designer with _$Designer {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory Designer({
    @JsonKey(name: 'designer_id') required String designerId,
    String? name,
    @JsonKey(name: 'pickup_address') required Address pickupAddress,
  }) = _Designer;

  factory Designer.fromJson(Map<String, dynamic> json) =>
      _$DesignerFromJson(json);
}
