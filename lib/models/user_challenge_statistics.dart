import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_challenge_statistics.freezed.dart';
part 'user_challenge_statistics.g.dart';

@freezed
class UserChallengeStatisticsSchema with _$UserChallengeStatisticsSchema {
  const factory UserChallengeStatisticsSchema({
    required List<WeekResponsesSchema> userStatistics,
  }) = _UserChallengeStatisticsSchema;

  factory UserChallengeStatisticsSchema.fromJson(Map<String, dynamic> json) =>
      _$UserChallengeStatisticsSchemaFromJson(json);
}

@freezed
class WeekResponsesSchema with _$WeekResponsesSchema {
  const factory WeekResponsesSchema({
    required int weekNum,
    required int expected,
    required int approved,
  }) = _WeekResponsesSchema;

  factory WeekResponsesSchema.fromJson(Map<String, dynamic> json) =>
      _$WeekResponsesSchemaFromJson(json);
}
