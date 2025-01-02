import 'package:freezed_annotation/freezed_annotation.dart';

enum ConfirmationType {
  @JsonValue('PHOTO')
  photo,
  @JsonValue('VIDEO')
  video,
  @JsonValue('GEO')
  geo,
  @JsonValue('TEXT')
  text,
}
