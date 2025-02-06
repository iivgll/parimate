import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:parimate/models/challenge_model.dart';

part 'challenges_state.freezed.dart';

enum ChallengesView {
  mine,
  newChallenges,
}

@freezed
class ChallengesState with _$ChallengesState {
  const factory ChallengesState({
    @Default(ChallengesView.mine) ChallengesView view,
    @Default([]) List<ChallengeModel> challenges,
    @Default([]) List<ChallengeModel> archivedChallenges,
    @Default([]) List<ChallengeModel> newChallenges,
  }) = _ChallengesState;
}
