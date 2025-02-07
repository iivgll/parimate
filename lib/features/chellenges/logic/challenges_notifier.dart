import 'package:parimate/features/chellenges/state/challenges_state.dart';
import 'package:parimate/models/user_challenge_statistics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/challenge_model.dart';
import '../../../providers/repository_providers.dart';

part 'challenges_notifier.g.dart';

@riverpod
class ChallengesNotifier extends _$ChallengesNotifier {
  @override
  Future<ChallengesState> build() async {
    return _loadChallenges();
  }

  Future<ChallengesState> _loadChallenges() async {
    try {
      final challenges =
          await ref.read(challengeRepositoryProvider).getMyChallenges();
      final newChallenges =
          await ref.read(challengeRepositoryProvider).getNewChallenges();

      return const ChallengesState().copyWith(
        challenges: challenges,
        newChallenges: newChallenges,
      );
    } catch (e) {
      // В реальном приложении здесь должна быть обработка ошибок
      return const ChallengesState();
    }
  }

  Future<UserChallengeStatisticsSchema> getChallengeStatistics(
      int challengeId) async {
    try {
      return await ref.read(userRepositoryProvider).getUserChallengeStatistics(
            userTgId: '44', // TODO: получать реальный ID
            challengeId: challengeId,
          );
    } catch (e) {
      throw Exception('Failed to load statistics: $e');
    }
  }

  Future<void> refreshChallenges() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await _loadChallenges());
  }

  void setView(ChallengesView view) {
    if (!state.hasValue) return;
    state = AsyncValue.data(state.value!.copyWith(view: view));
  }

  void addChallenge(ChallengeModel challenge) {
    if (!state.hasValue) return;
    state = AsyncValue.data(state.value!.copyWith(
      challenges: [...state.value!.challenges, challenge],
    ));
  }

  void archiveChallenge(int index) {
    if (!state.hasValue) return;
    final currentState = state.value!;
    final updatedChallenges = [...currentState.challenges];
    final archivedChallenge = updatedChallenges.removeAt(index);

    state = AsyncValue.data(currentState.copyWith(
      challenges: updatedChallenges,
      archivedChallenges: [
        ...currentState.archivedChallenges,
        archivedChallenge
      ],
    ));
  }

  void unarchiveChallenge(int index) {
    if (!state.hasValue) return;
    final currentState = state.value!;
    final updatedArchivedChallenges = [...currentState.archivedChallenges];
    final unarchivedChallenge = updatedArchivedChallenges.removeAt(index);

    state = AsyncValue.data(currentState.copyWith(
      challenges: [...currentState.challenges, unarchivedChallenge],
      archivedChallenges: updatedArchivedChallenges,
    ));
  }
}
