import 'package:flutter/material.dart';
import 'package:parimate/features/chellenges/state/challenges_state.dart';
import 'package:parimate/models/challenge_statistics.dart';
import 'package:parimate/models/user_challenge_statistics.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../app/app_logger.dart';
import '../../../models/challenge_model.dart';
import '../../../app/repository_providers.dart';
import '../../../common/widgets/payment_iframe_page.dart';

part 'challenges_notifier.g.dart';

@riverpod
class ChallengesNotifier extends _$ChallengesNotifier {
  @override
  Future<ChallengesState> build() async {
    AppLogger.log('ChallengesNotifier.build() вызван');
    return _loadChallenges();
  }

  Future<ChallengesState> _loadChallenges() async {
    try {
      AppLogger.log('Загрузка челленджей...');
      final challenges =
          await ref.read(challengeRepositoryProvider).getMyChallenges();
      final newChallenges =
          await ref.read(challengeRepositoryProvider).getNewChallenges();

      AppLogger.log(
          'Челленджи загружены: ${challenges.length} моих, ${newChallenges.length} новых');

      return const ChallengesState(
        view: ChallengesView.mine,
      ).copyWith(
        challenges: challenges,
        newChallenges: newChallenges,
      );
    } catch (e, stack) {
      AppLogger.error('Ошибка при загрузке челленджей: $e');
      AppLogger.error('Stack trace: $stack');
      return const ChallengesState(
        view: ChallengesView.mine,
      );
    }
  }

  Future<ChallengeStatistics> getChallengeStatistics(int challengeId) async {
    try {
      final result =
          await ref.read(challengeRepositoryProvider).getChallengeStatistics(
                challengeId: challengeId,
              );
      return result;
    } catch (e, stackTrace) {
      AppLogger.error(
          'Error getting challenge statistics: $e\n$stackTrace'); // Для отладки
      throw Exception('Failed to load challenge statistics: $e');
    }
  }

  Future<UserChallengeStatisticsSchema> getUserChallengeStatistics(
      int challengeId) async {
    try {
      final result =
          await ref.read(userRepositoryProvider).getUserChallengeStatistics(
                challengeId: challengeId,
              );
      AppLogger.log(
          'User Challenge Statistics Response: $result'); // Для отладки
      return result;
    } catch (e, stackTrace) {
      AppLogger.error(
          'Error getting user statistics: $e\n$stackTrace'); // Для отладки
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

  Future<void> joinChallenge(int challengeId, BuildContext context) async {
    try {
      // Обновляем списки челленджей перед поиском
      await refreshChallenges();

      // Теперь ищем в обновленном списке
      final challenge = state.value?.newChallenges.firstWhere(
        (c) => c.id == challengeId,
        orElse: () => throw Exception('Challenge not found'),
      );

      if (challenge == null) {
        throw Exception('Challenge not found');
      }

      final result =
          await ref.read(participationRepositoryProvider).registerToChallenge(
                challengeId: challengeId,
                accepted: true,
                payed: false,
                confirmationType: challenge.confirmationType,
              );

      if (result.confirmationUrl != null && context.mounted) {
        final success = await Navigator.of(context).push<bool>(
          MaterialPageRoute(
            builder: (context) => PaymentIframePage(
              paymentUrl: result.confirmationUrl!,
            ),
          ),
        );

        if (success == true) {
          await refreshChallenges();
        }
        return;
      }

      await refreshChallenges();
    } catch (e) {
      AppLogger.error('Error joining challenge: $e');
      rethrow;
    }
  }
}
