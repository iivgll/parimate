import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_statistics.freezed.dart';
part 'challenge_statistics.g.dart';

@freezed
class ChallengeStatisticsSchema with _$ChallengeStatisticsSchema {
  const factory ChallengeStatisticsSchema({
    required List<UserResponsesSchema> userStatistics,
    required int expected,
  }) = _ChallengeStatisticsSchema;

  factory ChallengeStatisticsSchema.fromJson(Map<String, dynamic> json) =>
      _$ChallengeStatisticsSchemaFromJson(json);
}

@freezed
class UserResponsesSchema with _$UserResponsesSchema {
  const factory UserResponsesSchema({
    required String name,
    required bool active,
    required int approved,
  }) = _UserResponsesSchema;

  factory UserResponsesSchema.fromJson(Map<String, dynamic> json) =>
      _$UserResponsesSchemaFromJson(json);
}
