// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeStatisticsSchemaImpl _$$ChallengeStatisticsSchemaImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengeStatisticsSchemaImpl(
      userStatistics: (json['userStatistics'] as List<dynamic>)
          .map((e) => UserResponsesSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
      expected: (json['expected'] as num).toInt(),
    );

Map<String, dynamic> _$$ChallengeStatisticsSchemaImplToJson(
        _$ChallengeStatisticsSchemaImpl instance) =>
    <String, dynamic>{
      'userStatistics': instance.userStatistics.map((e) => e.toJson()).toList(),
      'expected': instance.expected,
    };

_$UserResponsesSchemaImpl _$$UserResponsesSchemaImplFromJson(
        Map<String, dynamic> json) =>
    _$UserResponsesSchemaImpl(
      name: json['name'] as String,
      active: json['active'] as bool,
      approved: (json['approved'] as num).toInt(),
    );

Map<String, dynamic> _$$UserResponsesSchemaImplToJson(
        _$UserResponsesSchemaImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'active': instance.active,
      'approved': instance.approved,
    };
