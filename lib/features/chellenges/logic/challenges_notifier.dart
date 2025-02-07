import 'package:parimate/features/chellenges/state/challenges_state.dart';
import 'package:parimate/models/challenge_statistics.dart';
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

  Future<ChallengeStatistics> getChallengeStatistics(int challengeId) async {
    try {
      final result =
          await ref.read(challengeRepositoryProvider).getChallengeStatistics(
                userTgId: '44',
                challengeId: challengeId,
              );
      print('Challenge Statistics Response: $result'); // Для отладки
      return result;
    } catch (e, stackTrace) {
      print(
          'Error getting challenge statistics: $e\n$stackTrace'); // Для отладки
      throw Exception('Failed to load challenge statistics: $e');
    }
  }

  Future<UserChallengeStatisticsSchema> getUserChallengeStatistics(
      int challengeId) async {
    try {
      final result =
          await ref.read(userRepositoryProvider).getUserChallengeStatistics(
                userTgId: '44',
                challengeId: challengeId,
              );
      print('User Challenge Statistics Response: $result'); // Для отладки
      return result;
    } catch (e, stackTrace) {
      print('Error getting user statistics: $e\n$stackTrace'); // Для отладки
      throw Exception('Failed to load user statistics: $e');
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
