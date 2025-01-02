// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      tgId: json['tg_id'] as String,
      name: json['name'] as String,
      coins: (json['coins'] as num?)?.toInt() ?? 0,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'tg_id': instance.tgId,
      'name': instance.name,
      'coins': instance.coins,
      'photo': instance.photo,
    };
