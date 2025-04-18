import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'link') required String link,
    @JsonKey(name: 'icon') String? photo,
    @JsonKey(name: 'challenge_name') String? challengeName,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
