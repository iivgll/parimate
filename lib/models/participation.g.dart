// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipationSchemaImpl _$$ParticipationSchemaImplFromJson(
        Map<String, dynamic> json) =>
    _$ParticipationSchemaImpl(
      participation:
          Participation.fromJson(json['participation'] as Map<String, dynamic>),
      confirmationUrl: json['confirmation_url'] as String?,
    );

Map<String, dynamic> _$$ParticipationSchemaImplToJson(
        _$ParticipationSchemaImpl instance) =>
    <String, dynamic>{
      'participation': instance.participation.toJson(),
      'confirmation_url': instance.confirmationUrl,
    };

_$ParticipationImpl _$$ParticipationImplFromJson(Map<String, dynamic> json) =>
    _$ParticipationImpl(
      payed: json['payed'] as bool,
      win: json['win'] as bool,
      archived: json['archived'] as bool,
      rejectReason: json['reject_reason'] as String?,
      accepted: json['accepted'] as bool,
      userTgId: (json['user_tg_id'] as num).toInt(),
      challengeId: (json['challenge_id'] as num).toInt(),
    );

Map<String, dynamic> _$$ParticipationImplToJson(_$ParticipationImpl instance) =>
    <String, dynamic>{
      'payed': instance.payed,
      'win': instance.win,
      'archived': instance.archived,
      'reject_reason': instance.rejectReason,
      'accepted': instance.accepted,
      'user_tg_id': instance.userTgId,
      'challenge_id': instance.challengeId,
    };
