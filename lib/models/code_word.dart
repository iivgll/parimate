import 'package:freezed_annotation/freezed_annotation.dart';

part 'code_word.freezed.dart';
part 'code_word.g.dart';

@freezed
class CodeWord with _$CodeWord {
  const factory CodeWord({
    required int id,
    required String word,
  }) = _CodeWord;

  factory CodeWord.fromJson(Map<String, dynamic> json) =>
      _$CodeWordFromJson(json);
}
