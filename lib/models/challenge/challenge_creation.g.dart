// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_creation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeCreationSchemaImpl _$$ChallengeCreationSchemaImplFromJson(
        Map<String, dynamic> json) =>
    _$ChallengeCreationSchemaImpl(
      name: json['name'] as String,
      participationType:
          $enumDecode(_$ParticipationTypeEnumMap, json['participation_type']),
      icon: $enumDecode(_$IconEnumMap, json['icon']),
      category: $enumDecode(_$CategoryTypeEnumMap, json['category']),
      confirmationType:
          $enumDecode(_$ConfirmationTypeEnumMap, json['confirmation_type']),
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      regularityType:
          $enumDecode(_$RegularityTypeEnumMap, json['regularity_type']),
      timesPerDay: (json['times_per_day'] as num?)?.toInt(),
      timesPerWeek: (json['times_per_week'] as num?)?.toInt(),
      confirmationDays: (json['confirmation_days'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      authorTgId: json['author_tg_id'] as String,
      price: (json['price'] as num).toInt(),
      currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
      confirmationDescription: json['confirmation_description'] as String,
      maxParticipants: (json['max_participants'] as num?)?.toInt(),
      confirmUntil: json['confirm_until'] as String,
    );

Map<String, dynamic> _$$ChallengeCreationSchemaImplToJson(
        _$ChallengeCreationSchemaImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'participation_type':
          _$ParticipationTypeEnumMap[instance.participationType]!,
      'icon': _$IconEnumMap[instance.icon]!,
      'category': _$CategoryTypeEnumMap[instance.category]!,
      'confirmation_type':
          _$ConfirmationTypeEnumMap[instance.confirmationType]!,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'regularity_type': _$RegularityTypeEnumMap[instance.regularityType]!,
      'times_per_day': instance.timesPerDay,
      'times_per_week': instance.timesPerWeek,
      'confirmation_days': instance.confirmationDays,
      'author_tg_id': instance.authorTgId,
      'price': instance.price,
      'currency': _$CurrencyEnumMap[instance.currency]!,
      'confirmation_description': instance.confirmationDescription,
      'max_participants': instance.maxParticipants,
      'confirm_until': instance.confirmUntil,
    };

const _$ParticipationTypeEnumMap = {
  ParticipationType.personal: 'PERSONAL',
  ParticipationType.group: 'GROUP',
  ParticipationType.privateGroup: 'PRIVATE_GROUP',
};

const _$IconEnumMap = {
  Icon.flash: 'flash',
  Icon.conus: 'conus',
};

const _$CategoryTypeEnumMap = {
  CategoryType.sport: 'Спорт',
  CategoryType.food: 'Еда',
  CategoryType.time: 'Время',
  CategoryType.hobby: 'Хобби',
};

const _$ConfirmationTypeEnumMap = {
  ConfirmationType.photo: 'PHOTO',
  ConfirmationType.video: 'VIDEO',
  ConfirmationType.geo: 'GEO',
  ConfirmationType.text: 'TEXT',
};

const _$RegularityTypeEnumMap = {
  RegularityType.timesPerWeek: 'TIMES_PER_WEEK',
  RegularityType.timesPerDay: 'TIMES_PER_DAY',
  RegularityType.once: 'ONCE',
  RegularityType.concreteDays: 'CONCRETE_DAYS',
};

const _$CurrencyEnumMap = {
  Currency.rub: 'RUB',
  Currency.coins: 'COINS',
};
