import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_model.g.dart';
part 'challenge_model.freezed.dart';

@freezed
class ChallengeModel with _$ChallengeModel {
  const ChallengeModel._();

  const factory ChallengeModel({
    required int id,
    required String name,
    required String participation_type,
    required String icon,
    required String category,
    required String confirmation_type,
    required String start_date,
    required String end_date,
    required String regularity_type,
    int? times_per_day,
    int? times_per_week,
    List<int>? confirmation_days,
    required Author author,
    required int price,
    required String currency,
    required String confirmation_description,
    required String status,
    required int max_participants,
    required String confirm_until,
    required String created_at,
    required Chat chat,
    required String link,
    Chat? admin_chat,
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
    required String tg_id,
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
