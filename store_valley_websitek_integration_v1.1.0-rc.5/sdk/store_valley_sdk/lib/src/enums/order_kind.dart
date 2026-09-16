import 'package:freezed_annotation/freezed_annotation.dart';

enum OrderKind {
  @JsonValue('custom_made')
  customMade,
  @JsonValue('ready_made')
  readyMade,
}
