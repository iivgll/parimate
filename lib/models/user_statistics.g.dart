// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStatisticsSchemaImpl _$$UserStatisticsSchemaImplFromJson(
        Map<String, dynamic> json) =>
    _$UserStatisticsSchemaImpl(
      userStatistics: (json['userStatistics'] as List<dynamic>)
          .map((e) =>
              ChallengeResponseSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserStatisticsSchemaImplToJson(
        _$UserStatisticsSchemaImpl instance) =>
    <String, dynamic>{
      'userStatistics': instance.userStatistics.map((e) => e.toJson()).toList(),
    };

_$ChallengeResponseSchemaImpl _$$ChallengeResponseSchemaImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengeResponseSchemaImpl(
      challengeName: json['challengeName'] as String,
      confirmed: json['confirmed'] as bool,
    );

Map<String, dynamic> _$$ChallengeResponseSchemaImplToJson(
        _$ChallengeResponseSchemaImpl instance) =>
    <String, dynamic>{
      'challengeName': instance.challengeName,
      'confirmed': instance.confirmed,
    };
