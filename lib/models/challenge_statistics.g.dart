// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeStatisticsImpl _$$ChallengeStatisticsImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengeStatisticsImpl(
      participants: (json['user_statistics'] as List<dynamic>?)
              ?.map((e) => UserStatistics.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      expected: (json['expected'] as num).toInt(),
    );

Map<String, dynamic> _$$ChallengeStatisticsImplToJson(
        _$ChallengeStatisticsImpl instance) =>
    <String, dynamic>{
      'user_statistics': instance.participants.map((e) => e.toJson()).toList(),
      'expected': instance.expected,
    };

_$UserStatisticsImpl _$$UserStatisticsImplFromJson(Map<String, dynamic> json) =>
    _$UserStatisticsImpl(
      name: json['name'] as String,
      active: json['active'] as bool,
      approved: (json['approved'] as num).toInt(),
    );

Map<String, dynamic> _$$UserStatisticsImplToJson(
        _$UserStatisticsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'active': instance.active,
      'approved': instance.approved,
    };
