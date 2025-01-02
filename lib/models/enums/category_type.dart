import 'package:freezed_annotation/freezed_annotation.dart';

enum CategoryType {
  @JsonValue('Спорт')
  sport,
  @JsonValue('Еда')
  food,
  @JsonValue('Время')
  time,
  @JsonValue('Хобби')
  hobby,
}
