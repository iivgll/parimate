import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'tg_id') required String tgId,
    @JsonKey(name: 'name') required String name,
    @Default(0) @JsonKey(name: 'coins') int coins,
    @JsonKey(name: 'photo') String? photo,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
