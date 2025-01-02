import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  explicitToJson: true,
  createToJson: true,
)
abstract class BaseModel {}
