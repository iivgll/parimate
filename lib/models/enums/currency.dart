import 'package:freezed_annotation/freezed_annotation.dart';

enum Currency {
  @JsonValue('RUB')
  rub,
  @JsonValue('COINS')
  coins,
}
