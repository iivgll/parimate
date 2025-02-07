import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_challenge_statistics.freezed.dart';
part 'user_challenge_statistics.g.dart';

/// Статистика пользователя по челленджу
@freezed
class UserChallengeStatisticsSchema with _$UserChallengeStatisticsSchema {
  const factory UserChallengeStatisticsSchema({
    /// Статистика по неделям
    @JsonKey(name: 'user_statistics')
    @Default([])
    List<WeekStatistics> weeklyStats,
  }) = _UserChallengeStatisticsSchema;

  factory UserChallengeStatisticsSchema.fromJson(Map<String, dynamic> json) =>
      _$UserChallengeStatisticsSchemaFromJson(json);
}

/// Статистика за одну неделю
@freezed
class WeekStatistics with _$WeekStatistics {
  const factory WeekStatistics({
    /// Номер недели
    @JsonKey(name: 'week_num') required int weekNumber,

    /// Ожидаемое количество подтверждений
    required int expected,

    /// Количество одобренных подтверждений
    required int approved,
  }) = _WeekStatistics;

  factory WeekStatistics.fromJson(Map<String, dynamic> json) =>
      _$WeekStatisticsFromJson(json);
}
