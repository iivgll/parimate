import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_action_price.freezed.dart';
part 'challenge_action_price.g.dart';

@freezed
class ChallengeActionPriceSchema with _$ChallengeActionPriceSchema {
  const factory ChallengeActionPriceSchema({
    required int price,
  }) = _ChallengeActionPriceSchema;

  factory ChallengeActionPriceSchema.fromJson(Map<String, dynamic> json) =>
      _$ChallengeActionPriceSchemaFromJson(json);
}
