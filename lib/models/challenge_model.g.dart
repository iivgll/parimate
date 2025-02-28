// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeModelImpl _$$ChallengeModelImplFromJson(Map<String, dynamic> json) =>
    _$ChallengeModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      participationType: json['participation_type'] as String,
      icon: json['icon'] as String,
      category: json['category'] as String,
      confirmationType: json['confirmation_type'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      regularityType: json['regularity_type'] as String,
      timesPerDay: (json['times_per_day'] as num?)?.toInt(),
      timesPerWeek: (json['times_per_week'] as num?)?.toInt(),
      confirmationDays: (json['confirmation_days'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      price: (json['price'] as num).toInt(),
      currency: json['currency'] as String,
      confirmationDescription: json['confirmation_description'] as String,
      status: json['status'] as String,
      maxParticipants: (json['max_participants'] as num).toInt(),
      confirmUntil: json['confirm_until'] as String,
      createdAt: json['created_at'] as String,
      chat: Chat.fromJson(json['chat'] as Map<String, dynamic>),
      link: json['link'] as String,
      adminChat: json['admin_chat'] == null
          ? null
          : Chat.fromJson(json['admin_chat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChallengeModelImplToJson(
        _$ChallengeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'participation_type': instance.participationType,
      'icon': instance.icon,
      'category': instance.category,
      'confirmation_type': instance.confirmationType,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'regularity_type': instance.regularityType,
      'times_per_day': instance.timesPerDay,
      'times_per_week': instance.timesPerWeek,
      'confirmation_days': instance.confirmationDays,
      'author': instance.author.toJson(),
      'price': instance.price,
      'currency': instance.currency,
      'confirmation_description': instance.confirmationDescription,
      'status': instance.status,
      'max_participants': instance.maxParticipants,
      'confirm_until': instance.confirmUntil,
      'created_at': instance.createdAt,
      'chat': instance.chat.toJson(),
      'link': instance.link,
      'admin_chat': instance.adminChat?.toJson(),
    };

_$AuthorImpl _$$AuthorImplFromJson(Map<String, dynamic> json) => _$AuthorImpl(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      tgId: json['tg_id'] as String,
      name: json['name'] as String,
      coins: (json['coins'] as num).toInt(),
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$$AuthorImplToJson(_$AuthorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'tg_id': instance.tgId,
      'name': instance.name,
      'coins': instance.coins,
      'photo': instance.photo,
    };

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      id: json['id'] as String,
      link: json['link'] as String,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'photo': instance.photo,
    };
