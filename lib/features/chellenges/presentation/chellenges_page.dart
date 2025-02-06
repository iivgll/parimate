import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/features/chellenges/presentation/widgets/challenge_container_widget.dart';
import 'package:parimate/features/chellenges/state/challenges_state.dart';

import '../../../common/utils/colors.dart';
import '../../../common/utils/font_family.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/main_appbar_widget.dart';
import '../logic/challenges_notifier.dart';

class ChallengesPage extends ConsumerWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengesState = ref.watch(challengesNotifierProvider);
    final challengesNotifier = ref.read(challengesNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: const MainAppbarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle('ЧЕЛЛЕНДЖИ'),
              const SizedBox(height: 16),
              _buildToggleButtons(challengesState, challengesNotifier),
              const SizedBox(height: 24),
              if (challengesState.value?.view == ChallengesView.mine)
                _buildChallengesList(challengesState)
              else
                _buildNewChallenges(challengesState),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: AppFontFamily.uncage,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    );
  }

  Widget _buildToggleButtons(AsyncValue<ChallengesState> challengesState,
      ChallengesNotifier challengesNotifier) {
    return Row(
      children: [
        CustomButton(
          onPressed: () {
            challengesNotifier.setView(ChallengesView.mine);
          },
          text: 'Мои',
          backgroundColor: challengesState.value?.view == ChallengesView.mine
              ? AppColors.blackMin
              : AppColors.black,
          textColor: AppColors.white,
          horizontalPadding: 24.0,
          verticalPadding: 8.0,
          borderRadius: 8.0,
          textStyle: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          margin: const EdgeInsets.only(right: 8.0),
        ),
        CustomButton(
          onPressed: () {
            challengesNotifier.setView(ChallengesView.newChallenges);
          },
          text: 'Новый',
          backgroundColor:
              challengesState.value?.view == ChallengesView.newChallenges
                  ? AppColors.blackMin
                  : AppColors.black,
          textColor: AppColors.white,
          horizontalPadding: 24.0,
          verticalPadding: 8.0,
          borderRadius: 8.0,
          textStyle: const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildNewChallenges(AsyncValue<ChallengesState> challengesState) {
    return challengesState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text(
          'Ошибка загрузки челленджей: $error',
          style: const TextStyle(color: AppColors.grey),
        ),
      ),
      data: (state) {
        if (state.newChallenges.isEmpty) {
          return const Center(
            child: Text(
              'Нет доступных челленджей',
              style: TextStyle(color: AppColors.grey),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.newChallenges.length,
          itemBuilder: (context, index) {
            final challenge = state.newChallenges[index];
            return ChallengeContainer(
              challenge: challenge,
              onArchive: () {}, // Для новых челленджей архивация не нужна
            );
          },
        );
      },
    );
  }

  Widget _buildChallengesList(AsyncValue<ChallengesState> challengesState) {
    return challengesState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text(
          'Ошибка загрузки челленджей: $error',
          style: const TextStyle(color: AppColors.grey),
        ),
      ),
      data: (state) {
        if (state.challenges.isEmpty) {
          return const Center(
            child: Text(
              'У вас пока нет челленджей',
              style: TextStyle(color: AppColors.grey),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.challenges.length,
          itemBuilder: (context, index) {
            final challenge = state.challenges[index];
            return ChallengeContainer(
              challenge: challenge,
              onArchive: () {
                // Обработка архивации
              },
            );
          },
        );
      },
    );
  }
}
