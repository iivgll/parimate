import '../../freezed_models/challenge_model.dart';

class ChallengesState {
  final ChallengeView view;
  final List<ChallengeModel> challenges;
  final List<ChallengeModel> archivedChallenges;

  ChallengesState({
    required this.view,
    required this.challenges,
    required this.archivedChallenges,
  });

  ChallengesState copyWith({
    ChallengeView? view,
    List<ChallengeModel>? challenges,
    List<ChallengeModel>? archivedChallenges,
  }) {
    return ChallengesState(
      view: view ?? this.view,
      challenges: challenges ?? this.challenges,
      archivedChallenges: archivedChallenges ?? this.archivedChallenges,
    );
  }
}
