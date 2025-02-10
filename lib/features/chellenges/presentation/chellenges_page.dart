import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/features/chellenges/logic/selected_category_provider.dart';
import 'package:parimate/features/chellenges/presentation/widgets/challenge_container_widget.dart';
import 'package:parimate/features/chellenges/state/challenges_state.dart';

import '../../../app/metadata_notifier.dart';
import '../../../common/utils/colors.dart';
import '../../../common/utils/font_family.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/main_appbar_widget.dart';
import '../logic/challenges_notifier.dart';
import '../../../features/chellenges/presentation/widgets/create_challenge_sheet.dart';

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
                _buildNewChallenges(context, challengesState),
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

  Widget _buildNewChallenges(
      BuildContext context, AsyncValue<ChallengesState> challengesState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Consumer(
          builder: (context, ref, child) {
            final metadataState = ref.watch(metadataProvider);
            final selectedCategory = ref.watch(selectedCategoryProvider);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: metadataState.when(
                    loading: () => const CircularProgressIndicator(),
                    error: (error, _) => Text(
                      'Ошибка: $error',
                      style: const TextStyle(color: AppColors.grey),
                    ),
                    data: (metadata) => Row(
                      children: [
                        FilterChip(
                          label: const Text('Все'),
                          selected: selectedCategory == null,
                          onSelected: (_) {
                            ref.read(selectedCategoryProvider.notifier).state =
                                null;
                          },
                          backgroundColor: AppColors.black,
                          selectedColor: AppColors.blackMin,
                          labelStyle: const TextStyle(color: AppColors.white),
                        ),
                        const SizedBox(width: 8),
                        ...metadata.categories.map((category) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: FilterChip(
                              label: Text(category),
                              selected: selectedCategory == category,
                              onSelected: (_) {
                                ref
                                    .read(selectedCategoryProvider.notifier)
                                    .state = category;
                              },
                              backgroundColor: AppColors.black,
                              selectedColor: AppColors.blackMin,
                              labelStyle:
                                  const TextStyle(color: AppColors.white),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                challengesState.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(
                    child: Text(
                      'Ошибка загрузки челленджей: $error',
                      style: const TextStyle(color: AppColors.grey),
                    ),
                  ),
                  data: (state) {
                    final filteredChallenges = selectedCategory == null
                        ? state.newChallenges
                        : state.newChallenges
                            .where((c) => c.category == selectedCategory)
                            .toList();

                    if (filteredChallenges.isEmpty) {
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
                      itemCount: filteredChallenges.length,
                      itemBuilder: (context, index) {
                        final challenge = filteredChallenges[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ChallengeContainer(
                            challenge: challenge,
                            onArchive: () {},
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
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
