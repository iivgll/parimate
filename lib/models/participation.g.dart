// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipationSchemaImpl _$$ParticipationSchemaImplFromJson(
        Map<String, dynamic> json) =>
    _$ParticipationSchemaImpl(
      payed: json['payed'] as bool,
      win: json['win'] as bool,
      archived: json['archived'] as bool,
      rejectReason: json['rejectReason'] as String?,
      accepted: json['accepted'] as bool,
      userTgId: json['userTgId'] as String,
      challengeId: (json['challengeId'] as num).toInt(),
    );

Map<String, dynamic> _$$ParticipationSchemaImplToJson(
        _$ParticipationSchemaImpl instance) =>
    <String, dynamic>{
      'payed': instance.payed,
      'win': instance.win,
      'archived': instance.archived,
      'rejectReason': instance.rejectReason,
      'accepted': instance.accepted,
      'userTgId': instance.userTgId,
      'challengeId': instance.challengeId,
    };
