// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationSchemaImpl _$$NotificationSchemaImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSchemaImpl(
      id: (json['id'] as num).toInt(),
      hours: (json['hours'] as num).toInt(),
      minutes: (json['minutes'] as num).toInt(),
      archived: json['archived'] as bool,
    );

Map<String, dynamic> _$$NotificationSchemaImplToJson(
        _$NotificationSchemaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hours': instance.hours,
      'minutes': instance.minutes,
      'archived': instance.archived,
    };
