import 'package:freezed_annotation/freezed_annotation.dart';
import '../user/user.dart';
import '../chat/chat.dart';

part 'challenge.freezed.dart';
part 'challenge.g.dart';

@freezed
class Challenge with _$Challenge {
  const factory Challenge({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'participation_type') required String participationType,
    @JsonKey(name: 'icon') required String icon,
    @JsonKey(name: 'category') required String category,
    @JsonKey(name: 'confirmation_type') required String confirmationType,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') required DateTime endDate,
    @JsonKey(name: 'regularity_type') required String regularityType,
    @JsonKey(name: 'times_per_day') int? timesPerDay,
    @JsonKey(name: 'times_per_week') int? timesPerWeek,
    @JsonKey(name: 'confirmation_days') List<int>? confirmationDays,
    @JsonKey(
      name: 'author',
      toJson: _userToJson,
      fromJson: _userFromJson,
    )
    required User author,
    @JsonKey(name: 'price') required int price,
    @JsonKey(name: 'currency') required String currency,
    @JsonKey(name: 'confirmation_description')
    required String confirmationDescription,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'max_participants') int? maxParticipants,
    @JsonKey(name: 'confirm_until') required String confirmUntil,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(
      name: 'chat',
      toJson: _chatToJson,
      fromJson: _chatFromJson,
    )
    required Chat chat,
    @JsonKey(name: 'link') required String link,
    @JsonKey(
      name: 'admin_chat',
      toJson: _chatToJsonNullable,
      fromJson: _chatFromJsonNullable,
    )
    Chat? adminChat,
  }) = _Challenge;

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);
}

Map<String, dynamic> _userToJson(User user) => user.toJson();
User _userFromJson(Map<String, dynamic> json) => User.fromJson(json);

Map<String, dynamic> _chatToJson(Chat chat) => chat.toJson();
Chat _chatFromJson(Map<String, dynamic> json) => Chat.fromJson(json);

Map<String, dynamic>? _chatToJsonNullable(Chat? chat) => chat?.toJson();
Chat? _chatFromJsonNullable(Map<String, dynamic>? json) =>
    json == null ? null : Chat.fromJson(json);
