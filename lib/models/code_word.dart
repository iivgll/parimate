import 'package:freezed_annotation/freezed_annotation.dart';

part 'code_word.freezed.dart';
part 'code_word.g.dart';

@freezed
class CodeWordSchema with _$CodeWordSchema {
  const factory CodeWordSchema({
    required int id,
    required String word,
  }) = _CodeWordSchema;

  factory CodeWordSchema.fromJson(Map<String, dynamic> json) =>
      _$CodeWordSchemaFromJson(json);
}
