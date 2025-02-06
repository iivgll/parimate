import '../../../freezed_models/challenge_model.dart';

enum ChallengesView {
  mine,
  newChallenges,
}

class ChallengesState {
  final ChallengesView view;
  final List<ChallengeModel> challenges;
  final List<ChallengeModel> archivedChallenges;

  const ChallengesState({
    this.view = ChallengesView.mine,
    this.challenges = const [],
    this.archivedChallenges = const [],
  });

  ChallengesState copyWith({
    ChallengesView? view,
    List<ChallengeModel>? challenges,
    List<ChallengeModel>? archivedChallenges,
  }) {
    return ChallengesState(
      view: view ?? this.view,
      challenges: challenges ?? this.challenges,
      archivedChallenges: archivedChallenges ?? this.archivedChallenges,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChallengesState &&
        other.view == view &&
        _listEquals(other.challenges, challenges) &&
        _listEquals(other.archivedChallenges, archivedChallenges);
  }

  bool _listEquals<T>(List<T> list1, List<T> list2) {
    if (identical(list1, list2)) return true;
    if (list1.length != list2.length) return false;
    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode =>
      view.hashCode ^ challenges.hashCode ^ archivedChallenges.hashCode;

  @override
  String toString() => 'ChallengesState('
      'view: $view, '
      'challenges: $challenges, '
      'archivedChallenges: $archivedChallenges)';
}
