import 'package:freezed_annotation/freezed_annotation.dart';

enum ParticipationType {
  @JsonValue('PERSONAL')
  personal,
  @JsonValue('GROUP')
  group,
  @JsonValue('PRIVATE_GROUP')
  privateGroup,
}
