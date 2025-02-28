import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_model.g.dart';
part 'challenge_model.freezed.dart';

@freezed
class ChallengeModel with _$ChallengeModel {
  const ChallengeModel._();

  const factory ChallengeModel({
    required int id,
    required String name,
    @JsonKey(name: 'participation_type') required String participationType,
    required String icon,
    required String category,
    @JsonKey(name: 'confirmation_type') required String confirmationType,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    @JsonKey(name: 'regularity_type') required String regularityType,
    @JsonKey(name: 'times_per_day') int? timesPerDay,
    @JsonKey(name: 'times_per_week') int? timesPerWeek,
    @JsonKey(name: 'confirmation_days') List<int>? confirmationDays,
    required Author author,
    required int price,
    required String currency,
    @JsonKey(name: 'confirmation_description')
    required String confirmationDescription,
    required String status,
    @JsonKey(name: 'max_participants') required int maxParticipants,
    @JsonKey(name: 'confirm_until') required String confirmUntil,
    @JsonKey(name: 'created_at') required String createdAt,
    required Chat chat,
    required String link,
    @JsonKey(name: 'admin_chat') Chat? adminChat,
  }) = _ChallengeModel;

  factory ChallengeModel.fromJson(Map<String, dynamic> json) =>
      _$ChallengeModelFromJson(json);

  bool get isArchived => status == 'WIN' || status == 'LOSS';
}

@freezed
class Author with _$Author {
  const factory Author({
    required int id,
    required String username,
    required String tgId,
    required String name,
    required int coins,
    String? photo,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}

@freezed
class Chat with _$Chat {
  const factory Chat({
    required String id,
    required String link,
    String? photo,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}

enum ChallengeView { mine, newChallenges }
