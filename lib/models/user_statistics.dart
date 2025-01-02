import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_statistics.freezed.dart';
part 'user_statistics.g.dart';

@freezed
class UserStatisticsSchema with _$UserStatisticsSchema {
  const factory UserStatisticsSchema({
    required List<ChallengeResponseSchema> userStatistics,
  }) = _UserStatisticsSchema;

  factory UserStatisticsSchema.fromJson(Map<String, dynamic> json) =>
      _$UserStatisticsSchemaFromJson(json);
}

@freezed
class ChallengeResponseSchema with _$ChallengeResponseSchema {
  const factory ChallengeResponseSchema({
    required String challengeName,
    required bool confirmed,
  }) = _ChallengeResponseSchema;

  factory ChallengeResponseSchema.fromJson(Map<String, dynamic> json) =>
      _$ChallengeResponseSchemaFromJson(json);
}
