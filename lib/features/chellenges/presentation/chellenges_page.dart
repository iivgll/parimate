import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/common/utils/icons.dart';
import 'package:parimate/features/chellenges/presentation/widgets/challenge_container_widget.dart';
import 'package:parimate/features/chellenges/presentation/widgets/create_challenge_sheet.dart';

import '../../../common/utils/colors.dart';
import '../../../common/utils/font_family.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/main_appbar_widget.dart';
import '../../../freezed_models/challenge_model.dart';
import '../../../providers/challenge_provider.dart';
import '../challenges_notifier.dart';
import '../challenges_state.dart';

class ChallengesPage extends ConsumerWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengesState = ref.watch(challengesProvider);
    final challengesNotifier = ref.read(challengesProvider.notifier);

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
              if (challengesState.view == ChallengeView.mine)
                _buildChallengesList(challengesState, challengesNotifier)
              else
                _buildNewChallenges(context),
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

  Widget _buildToggleButtons(
      ChallengesState challengesState, ChallengesNotifier challengesNotifier) {
    return Row(
      children: [
        CustomButton(
          onPressed: () {
            challengesNotifier.setView(ChallengeView.mine);
          },
          text: 'Мои',
          backgroundColor: challengesState.view == ChallengeView.mine
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
            challengesNotifier.setView(ChallengeView.newChallenges);
          },
          text: 'Новый',
          backgroundColor: challengesState.view == ChallengeView.newChallenges
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

  Widget _buildNewChallenges(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Логика присоединения по ссылке
                },
                icon: const Icon(Icons.link, color: AppColors.white),
                label: const Text(
                  'Присоединиться\nпо ссылке',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blackMin,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const CreateChallengeSheet(),
                  );
                },
                icon: const Icon(Icons.edit, color: AppColors.white),
                label: const Text(
                  'Создать\nчеллендж',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blackMin,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'ДОСТУПНЫЕ',
          style: TextStyle(
            fontFamily: AppFontFamily.uncage,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildCategoryChip('Популярные', true),
              _buildCategoryChip('Спорт', false),
              _buildCategoryChip('Саморазвитие', false),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildAvailableChallenge(
          'Регулярный спорт',
          '5.000',
          Icons.sports_basketball,
          '1',
        ),
        const SizedBox(height: 8),
        _buildAvailableChallenge(
          'Читательский клуб',
          '1.000',
          Icons.book,
          '1',
        ),
        const SizedBox(height: 8),
        _buildAvailableChallenge(
          'Отказ от смартфона',
          '500',
          Icons.phone_android,
          '1',
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.grey,
          ),
        ),
        selected: isSelected,
        onSelected: (bool value) {
          // Логика выбора категории
        },
        backgroundColor: AppColors.black,
        selectedColor: AppColors.blackMin,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildAvailableChallenge(
      String title, String price, IconData icon, String count) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.blackMin,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.white),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Взнос: $price',
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.orange.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  count,
                  style: const TextStyle(
                    color: AppColors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.orange,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChallengesList(
      ChallengesState challengesState, ChallengesNotifier challengesNotifier) {
    if (challengesState.challenges.isEmpty) {
      return const Center(
        child: Text(
          'У вас пока нет челленджей',
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 16,
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: challengesState.challenges.length,
      itemBuilder: (context, index) {
        final challenge = challengesState.challenges[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ChallengeContainer(
            challenge: challenge,
            onArchive: () {
              challengesNotifier.archiveChallenge(index);
            },
          ),
        );
      },
    );
  }
}
