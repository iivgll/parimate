import 'package:freezed_annotation/freezed_annotation.dart';

part 'participation.freezed.dart';
part 'participation.g.dart';

@freezed
class ParticipationSchema with _$ParticipationSchema {
  const factory ParticipationSchema({
    required Participation participation,
    @JsonKey(name: 'confirmation_url') String? confirmationUrl,
  }) = _ParticipationSchema;

  factory ParticipationSchema.fromJson(Map<String, dynamic> json) =>
      _$ParticipationSchemaFromJson(json);
}

@freezed
class Participation with _$Participation {
  const factory Participation({
    required bool payed,
    required bool win,
    required bool archived,
    @JsonKey(name: 'reject_reason') String? rejectReason,
    required bool accepted,
    @JsonKey(name: 'user_tg_id') required String userTgId,
    @JsonKey(name: 'challenge_id') required int challengeId,
  }) = _Participation;

  factory Participation.fromJson(Map<String, dynamic> json) =>
      _$ParticipationFromJson(json);
}
