// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeImpl _$$ChallengeImplFromJson(Map<String, dynamic> json) =>
    _$ChallengeImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      participationType: json['participation_type'] as String,
      icon: json['icon'] as String,
      category: json['category'] as String,
      confirmationType: json['confirmation_type'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      regularityType: json['regularity_type'] as String,
      timesPerDay: (json['times_per_day'] as num?)?.toInt(),
      timesPerWeek: (json['times_per_week'] as num?)?.toInt(),
      confirmationDays: (json['confirmation_days'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      author: _userFromJson(json['author'] as Map<String, dynamic>),
      price: (json['price'] as num).toInt(),
      currency: json['currency'] as String,
      confirmationDescription: json['confirmation_description'] as String,
      status: json['status'] as String,
      maxParticipants: (json['max_participants'] as num?)?.toInt(),
      confirmUntil: json['confirm_until'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      chat: _chatFromJson(json['chat'] as Map<String, dynamic>),
      link: json['link'] as String,
      adminChat:
          _chatFromJsonNullable(json['admin_chat'] as Map<String, dynamic>?),
      paymentLink: json['payment_link'] as String?,
    );

Map<String, dynamic> _$$ChallengeImplToJson(_$ChallengeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'participation_type': instance.participationType,
      'icon': instance.icon,
      'category': instance.category,
      'confirmation_type': instance.confirmationType,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'regularity_type': instance.regularityType,
      'times_per_day': instance.timesPerDay,
      'times_per_week': instance.timesPerWeek,
      'confirmation_days': instance.confirmationDays,
      'author': _userToJson(instance.author),
      'price': instance.price,
      'currency': instance.currency,
      'confirmation_description': instance.confirmationDescription,
      'status': instance.status,
      'max_participants': instance.maxParticipants,
      'confirm_until': instance.confirmUntil,
      'created_at': instance.createdAt.toIso8601String(),
      'chat': _chatToJson(instance.chat),
      'link': instance.link,
      'admin_chat': _chatToJsonNullable(instance.adminChat),
      'payment_link': instance.paymentLink,
    };
