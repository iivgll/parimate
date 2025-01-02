// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_challenge_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserChallengeStatisticsSchemaImpl
    _$$UserChallengeStatisticsSchemaImplFromJson(Map<String, dynamic> json) =>
        _$UserChallengeStatisticsSchemaImpl(
          userStatistics: (json['userStatistics'] as List<dynamic>)
              .map((e) =>
                  WeekResponsesSchema.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$UserChallengeStatisticsSchemaImplToJson(
        _$UserChallengeStatisticsSchemaImpl instance) =>
    <String, dynamic>{
      'userStatistics': instance.userStatistics.map((e) => e.toJson()).toList(),
    };

_$WeekResponsesSchemaImpl _$$WeekResponsesSchemaImplFromJson(
        Map<String, dynamic> json) =>
    _$WeekResponsesSchemaImpl(
      weekNum: (json['weekNum'] as num).toInt(),
      expected: (json['expected'] as num).toInt(),
      approved: (json['approved'] as num).toInt(),
    );

Map<String, dynamic> _$$WeekResponsesSchemaImplToJson(
        _$WeekResponsesSchemaImpl instance) =>
    <String, dynamic>{
      'weekNum': instance.weekNum,
      'expected': instance.expected,
      'approved': instance.approved,
    };
