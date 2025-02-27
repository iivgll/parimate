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

ConfirmationType fromString(String value) {
  switch (value) {
    case 'TEXT':
      return ConfirmationType.text;
    case 'PHOTO':
      return ConfirmationType.photo;
    case 'VIDEO':
      return ConfirmationType.video;
    default:
      return ConfirmationType.photo;
  }
}
