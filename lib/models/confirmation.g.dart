// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirmation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfirmationDataImpl _$$ConfirmationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfirmationDataImpl(
      type: json['type'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$ConfirmationDataImplToJson(
        _$ConfirmationDataImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };

_$ConfirmationSchemaInputImpl _$$ConfirmationSchemaInputImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfirmationSchemaInputImpl(
      id: (json['id'] as num).toInt(),
      approved: json['approved'] as bool?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      approvedAt: json['approvedAt'] == null
          ? null
          : DateTime.parse(json['approvedAt'] as String),
      data: ConfirmationData.fromJson(json['data'] as Map<String, dynamic>),
      rejectReason: json['rejectReason'] as String?,
      share: json['share'] as bool,
      userTgId: json['userTgId'] as String,
      challengeId: (json['challengeId'] as num).toInt(),
    );

Map<String, dynamic> _$$ConfirmationSchemaInputImplToJson(
        _$ConfirmationSchemaInputImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'approved': instance.approved,
      'createdAt': instance.createdAt.toIso8601String(),
      'approvedAt': instance.approvedAt?.toIso8601String(),
      'data': instance.data.toJson(),
      'rejectReason': instance.rejectReason,
      'share': instance.share,
      'userTgId': instance.userTgId,
      'challengeId': instance.challengeId,
    };

_$ConfirmationListResponseImpl _$$ConfirmationListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ConfirmationListResponseImpl(
      confirmations: (json['confirmations'] as List<dynamic>)
          .map((e) =>
              ConfirmationSchemaInput.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastReadId: (json['lastReadId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ConfirmationListResponseImplToJson(
        _$ConfirmationListResponseImpl instance) =>
    <String, dynamic>{
      'confirmations': instance.confirmations.map((e) => e.toJson()).toList(),
      'lastReadId': instance.lastReadId,
    };
