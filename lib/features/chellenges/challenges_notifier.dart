import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/common/utils/icons.dart';

import '../../freezed_models/challenge_model.dart';
import 'challenges_state.dart';

class ChallengesNotifier extends StateNotifier<ChallengesState> {
  ChallengesNotifier()
      : super(ChallengesState(
          view: ChallengeView.mine,
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
            // Добавьте больше челленджей по необходимости
          ],
          archivedChallenges: [
            ChallengeModel(
              name: 'Архивный челлендж',
              date: DateTime.now(),
              imageUrl: AppIcons.ballBaseball,
            ),
          ], // Инициализируем пустым списком
        ));

  void setView(ChallengeView view) {
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
