import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/utils/icons.dart';
import '../../../freezed_models/challenge_model.dart';
import '../state/challenges_state.dart';

part 'challenges_notifier.g.dart';

@riverpod
class ChallengesNotifier extends _$ChallengesNotifier {
  @override
  ChallengesState build() {
    return ChallengesState(
      challenges: [
        ChallengeModel(
          name: 'Челлендж 1',
          date: DateTime.now(),
          imageUrl: AppIcons.apple,
        ),
        ChallengeModel(
          name: 'Челлендж 2',
          date: DateTime.now().add(Duration(days: 1)),
          imageUrl: AppIcons.apple,
        ),
      ],
      archivedChallenges: [
        ChallengeModel(
          name: 'Архивный челлендж',
          date: DateTime.now(),
          imageUrl: AppIcons.ballBaseball,
        ),
      ],
    );
  }

  void setView(ChallengesView view) {
    state = state.copyWith(view: view);
  }

  void addChallenge(ChallengeModel challenge) {
    state = state.copyWith(challenges: [...state.challenges, challenge]);
  }

  void archiveChallenge(int index) {
    final updatedChallenges = [...state.challenges];
    final archivedChallenge = updatedChallenges.removeAt(index);
    final updatedArchivedChallenges = [
      ...state.archivedChallenges,
      archivedChallenge
    ];

    state = state.copyWith(
      challenges: updatedChallenges,
      archivedChallenges: updatedArchivedChallenges,
    );
  }

  void unarchiveChallenge(int index) {
    final updatedArchivedChallenges = [...state.archivedChallenges];
    final unarchivedChallenge = updatedArchivedChallenges.removeAt(index);
    final updatedChallenges = [...state.challenges, unarchivedChallenge];

    state = state.copyWith(
      challenges: updatedChallenges,
      archivedChallenges: updatedArchivedChallenges,
    );
  }
}
