import 'package:freezed_annotation/freezed_annotation.dart';

part 'file.freezed.dart';
part 'file.g.dart';

@freezed
class UploadFileResponseSchema with _$UploadFileResponseSchema {
  const factory UploadFileResponseSchema({
    required String link,
  }) = _UploadFileResponseSchema;

  factory UploadFileResponseSchema.fromJson(Map<String, dynamic> json) =>
      _$UploadFileResponseSchemaFromJson(json);
}
