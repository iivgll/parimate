// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_challenge_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserChallengeStatisticsSchemaImpl
    _$$UserChallengeStatisticsSchemaImplFromJson(Map<String, dynamic> json) =>
        _$UserChallengeStatisticsSchemaImpl(
          weeklyStats: (json['user_statistics'] as List<dynamic>?)
                  ?.map(
                      (e) => WeekStatistics.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$$UserChallengeStatisticsSchemaImplToJson(
        _$UserChallengeStatisticsSchemaImpl instance) =>
    <String, dynamic>{
      'user_statistics': instance.weeklyStats.map((e) => e.toJson()).toList(),
    };

_$WeekStatisticsImpl _$$WeekStatisticsImplFromJson(Map<String, dynamic> json) =>
    _$WeekStatisticsImpl(
      weekNumber: (json['week_num'] as num).toInt(),
      expected: (json['expected'] as num).toInt(),
      approved: (json['approved'] as num).toInt(),
    );

Map<String, dynamic> _$$WeekStatisticsImplToJson(
        _$WeekStatisticsImpl instance) =>
    <String, dynamic>{
      'week_num': instance.weekNumber,
      'expected': instance.expected,
      'approved': instance.approved,
    };
