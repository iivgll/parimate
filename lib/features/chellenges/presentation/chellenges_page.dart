import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/features/chellenges/logic/selected_category_provider.dart';
import 'package:parimate/features/chellenges/presentation/widgets/challenge_container_widget.dart';
import 'package:parimate/features/chellenges/state/challenges_state.dart';
import 'package:parimate/models/challenge_model.dart';

import '../../../app/metadata_notifier.dart';
import '../../../app/repository_providers.dart';
import '../../../common/utils/colors.dart';
import '../../../common/utils/font_family.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/main_appbar_widget.dart';
import '../logic/challenges_notifier.dart';
import 'create_challenge_sheet.dart';
import '../../../features/chellenges/presentation/widgets/join_by_link_dialog.dart';
import 'challenge_preview_page.dart';

class ChallengesPage extends ConsumerWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challengesState = ref.watch(challengesNotifierProvider);
    final challengesNotifier = ref.read(challengesNotifierProvider.notifier);

    // Показываем загрузчик на весь экран, пока данные не загрузились
    if (challengesState.isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.black,
        body: Center(
          child: CircularProgressIndicator(
            color: AppColors.orange,
          ),
        ),
      );
    }

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
                _buildNewChallenges(context, challengesState, ref),
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
          text: 'Новые',
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

  Widget _buildNewChallenges(BuildContext context,
      AsyncValue<ChallengesState> challengesState, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () async {
                  final link = await showDialog<String>(
                    context: context,
                    builder: (context) => const JoinByLinkDialog(),
                  );

                  if (link != null && context.mounted) {
                    try {
                      final challenge = await ref
                          .read(challengeRepositoryProvider)
                          .getChallengeByLink(
                            link: link,
                          );

                      if (context.mounted) {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChallengePreviewPage(
                              challenge: challenge.toJson(),
                              isCreating: false,
                              joinLink: link,
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Ошибка при получении челленджа: $e')),
                        );
                      }
                    }
                  }
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
                          selectedColor: AppColors.orange,
                          labelStyle: TextStyle(
                            color: selectedCategory == null
                                ? AppColors.white
                                : AppColors.grey,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
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
                              selectedColor: AppColors.orange,
                              labelStyle: TextStyle(
                                color: selectedCategory == category
                                    ? AppColors.white
                                    : AppColors.grey,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
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
                      return SizedBox(
                        height:
                            300, // Задаем высоту, чтобы текст был ближе к центру
                        child: Center(
                          child: Text(
                            'Здесь будут отображаться доступные челленджи. Создайте новый челлендж или присоединитесь к существующему!',
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
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
          return SizedBox(
            height: 300, // Задаем высоту, чтобы текст был ближе к центру
            child: Center(
              child: Text(
                'Здесь будут отображаться ваши челленджи. Создайте новый челлендж или присоединитесь к существующему!',
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        // Разделяем челленджи на активные и архивные
        final activeChallenges =
            state.challenges.where((c) => !c.isArchived).toList();
        final archivedChallenges =
            state.challenges.where((c) => c.isArchived).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Активные челленджи
            if (activeChallenges.isNotEmpty) ...[
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: activeChallenges.length,
                itemBuilder: (context, index) {
                  final challenge = activeChallenges[index];
                  return ChallengeContainer(
                    challenge: challenge,
                    onArchive: () {
                      // Обработка архивации
                    },
                  );
                },
              ),
            ],

            // Архивные челленджи
            if (archivedChallenges.isNotEmpty) ...[
              const SizedBox(height: 24),
              Text(
                'АРХИВ',
                style: TextStyle(
                  fontFamily: AppFontFamily.uncage,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: archivedChallenges.length,
                itemBuilder: (context, index) {
                  final challenge = archivedChallenges[index];
                  return ChallengeContainer(
                    challenge: challenge,
                    onArchive: () {
                      // Обработка архивации
                    },
                    isArchived: true,
                  );
                },
              ),
            ],
          ],
        );
      },
    );
  }
}
