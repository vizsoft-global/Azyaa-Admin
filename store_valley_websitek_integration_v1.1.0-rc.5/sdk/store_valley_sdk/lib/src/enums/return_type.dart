import 'package:freezed_annotation/freezed_annotation.dart';

enum ReturnType {
  @JsonValue('return')
  returnRequest,
  @JsonValue('exchange')
  exchange,
}
