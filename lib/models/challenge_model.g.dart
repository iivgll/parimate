// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeModelImpl _$$ChallengeModelImplFromJson(Map<String, dynamic> json) =>
    _$ChallengeModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      participation_type: json['participation_type'] as String,
      icon: json['icon'] as String,
      category: json['category'] as String,
      confirmation_type: json['confirmation_type'] as String,
      start_date: json['start_date'] as String,
      end_date: json['end_date'] as String,
      regularity_type: json['regularity_type'] as String,
      times_per_day: (json['times_per_day'] as num?)?.toInt(),
      times_per_week: (json['times_per_week'] as num?)?.toInt(),
      confirmation_days: (json['confirmation_days'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      price: (json['price'] as num).toInt(),
      currency: json['currency'] as String,
      confirmation_description: json['confirmation_description'] as String,
      status: json['status'] as String,
      max_participants: (json['max_participants'] as num).toInt(),
      confirm_until: json['confirm_until'] as String,
      created_at: json['created_at'] as String,
      chat: Chat.fromJson(json['chat'] as Map<String, dynamic>),
      link: json['link'] as String,
      admin_chat: json['admin_chat'] == null
          ? null
          : Chat.fromJson(json['admin_chat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChallengeModelImplToJson(
        _$ChallengeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'participation_type': instance.participation_type,
      'icon': instance.icon,
      'category': instance.category,
      'confirmation_type': instance.confirmation_type,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'regularity_type': instance.regularity_type,
      'times_per_day': instance.times_per_day,
      'times_per_week': instance.times_per_week,
      'confirmation_days': instance.confirmation_days,
      'author': instance.author.toJson(),
      'price': instance.price,
      'currency': instance.currency,
      'confirmation_description': instance.confirmation_description,
      'status': instance.status,
      'max_participants': instance.max_participants,
      'confirm_until': instance.confirm_until,
      'created_at': instance.created_at,
      'chat': instance.chat.toJson(),
      'link': instance.link,
      'admin_chat': instance.admin_chat?.toJson(),
    };

_$AuthorImpl _$$AuthorImplFromJson(Map<String, dynamic> json) => _$AuthorImpl(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      tg_id: json['tg_id'] as String,
      name: json['name'] as String,
      coins: (json['coins'] as num).toInt(),
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$$AuthorImplToJson(_$AuthorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'tg_id': instance.tg_id,
      'name': instance.name,
      'coins': instance.coins,
      'photo': instance.photo,
    };

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      id: json['id'] as String,
      link: json['link'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'photo': instance.photo,
    };
