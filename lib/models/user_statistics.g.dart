// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStatisticsImpl _$$UserStatisticsImplFromJson(Map<String, dynamic> json) =>
    _$UserStatisticsImpl(
      userStatistics: (json['user_statistics'] as List<dynamic>)
          .map((e) => UserStatisticsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserStatisticsImplToJson(
        _$UserStatisticsImpl instance) =>
    <String, dynamic>{
      'user_statistics':
          instance.userStatistics.map((e) => e.toJson()).toList(),
    };

_$UserStatisticsItemImpl _$$UserStatisticsItemImplFromJson(
        Map<String, dynamic> json) =>
    _$UserStatisticsItemImpl(
      challengeName: json['challenge_name'] as String,
      confirmed: json['confirmed'] as bool,
    );

Map<String, dynamic> _$$UserStatisticsItemImplToJson(
        _$UserStatisticsItemImpl instance) =>
    <String, dynamic>{
      'challenge_name': instance.challengeName,
      'confirmed': instance.confirmed,
    };
