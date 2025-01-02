import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/participation_type.dart';
import '../enums/icon.dart';
import '../enums/category_type.dart';
import '../enums/confirmation_type.dart';
import '../enums/regularity_type.dart';
import '../enums/currency.dart';

part 'challenge_creation.freezed.dart';
part 'challenge_creation.g.dart';

@freezed
class ChallengeCreationSchema with _$ChallengeCreationSchema {
  const factory ChallengeCreationSchema({
    required String name,
    @JsonKey(name: 'participation_type')
    required ParticipationType participationType,
    required Icon icon,
    required CategoryType category,
    @JsonKey(name: 'confirmation_type')
    required ConfirmationType confirmationType,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') required DateTime endDate,
    @JsonKey(name: 'regularity_type') required RegularityType regularityType,
    @JsonKey(name: 'times_per_day') int? timesPerDay,
    @JsonKey(name: 'times_per_week') int? timesPerWeek,
    @JsonKey(name: 'confirmation_days') List<int>? confirmationDays,
    @JsonKey(name: 'author_tg_id') required String authorTgId,
    required int price,
    required Currency currency,
    @JsonKey(name: 'confirmation_description')
    required String confirmationDescription,
    @JsonKey(name: 'max_participants') int? maxParticipants,
    @JsonKey(name: 'confirm_until') required String confirmUntil,
  }) = _ChallengeCreationSchema;

  factory ChallengeCreationSchema.fromJson(Map<String, dynamic> json) =>
      _$ChallengeCreationSchemaFromJson(json);
}
