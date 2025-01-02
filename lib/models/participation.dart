import 'package:freezed_annotation/freezed_annotation.dart';

part 'participation.freezed.dart';
part 'participation.g.dart';

@freezed
class ParticipationSchema with _$ParticipationSchema {
  const factory ParticipationSchema({
    required bool payed,
    required bool win,
    required bool archived,
    String? rejectReason,
    required bool accepted,
    required String userTgId,
    required int challengeId,
  }) = _ParticipationSchema;

  factory ParticipationSchema.fromJson(Map<String, dynamic> json) =>
      _$ParticipationSchemaFromJson(json);
}
