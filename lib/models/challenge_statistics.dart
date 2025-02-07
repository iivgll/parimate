import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_statistics.freezed.dart';
part 'challenge_statistics.g.dart';

@freezed
class ChallengeStatistics with _$ChallengeStatistics {
  const factory ChallengeStatistics({
    @JsonKey(name: 'user_statistics')
    @Default([])
    List<UserStatistics> participants,
    required int expected,
  }) = _ChallengeStatistics;

  factory ChallengeStatistics.fromJson(Map<String, dynamic> json) =>
      _$ChallengeStatisticsFromJson(json);
}

@freezed
class UserStatistics with _$UserStatistics {
  const factory UserStatistics({
    required String name,
    required bool active,
    required int approved,
  }) = _UserStatistics;

  factory UserStatistics.fromJson(Map<String, dynamic> json) =>
      _$UserStatisticsFromJson(json);
}
