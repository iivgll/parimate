import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/common/utils/icons.dart';
import 'package:parimate/features/chellenges/presentation/widgets/add_challenge_button.dart';
import 'package:parimate/features/chellenges/presentation/widgets/challenge_container_widget.dart';

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
              const SizedBox(height: 16),
              if (challengesState.view == ChallengeView.mine)
                _buildChallengesList(challengesState, challengesNotifier)
              else
                _buildNewChallenges(),
              if (challengesState.view == ChallengeView.mine) ...[
                const SizedBox(height: 20),
                _buildTitle('АРХИВ'),
                const SizedBox(height: 20),
                _buildArchiveList(challengesState, challengesNotifier),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Метод для построения заголовка
  Widget _buildTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontFamily: AppFontFamily.uncage,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
      ),
    );
  }

  // Метод для построения кнопок переключения "Мои" и "Новый"
  Widget _buildToggleButtons(
      ChallengesState challengesState, ChallengesNotifier challengesNotifier) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
            horizontalPadding: 10.0,
            verticalPadding: 8.0,
            borderRadius: 8.0,
            textStyle: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
            margin: const EdgeInsets.only(right: 16.0),
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
            horizontalPadding: 10.0,
            verticalPadding: 8.0,
            borderRadius: 8.0,
            textStyle: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Метод для построения списка челленджей
  Widget _buildChallengesList(
      ChallengesState challengesState, ChallengesNotifier challengesNotifier) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: challengesState.challenges.length + 1,
      // +1 для кнопки добавления
      itemBuilder: (context, index) {
        if (index < challengesState.challenges.length) {
          final challenge = challengesState.challenges[index];
          return ChallengeContainer(
            challenge: challenge,
            onArchive: () {
              challengesNotifier.archiveChallenge(index);
            },
          );
        } else {
          // Кнопка "Добавить новый челлендж"
          return AddChallengeButton(
            onPressed: () {
              _showAddChallengeDialog(context, challengesNotifier);
            },
          );
        }
      },
    );
  }

  // Метод для отображения новых челленджей
  Widget _buildNewChallenges() {
    return Column(
      children: [
        ChallengeContainer(
          challenge: ChallengeModel(
            name: 'Новый челлендж',
            date: DateTime.now().add(const Duration(days: 2)),
            imageUrl: AppIcons.balloon,
          ),
          onArchive: () {},
        ),
      ],
    );
  }

  // Метод для построения списка архивных челленджей
  Widget _buildArchiveList(
      ChallengesState challengesState, ChallengesNotifier challengesNotifier) {
    final archivedChallenges = challengesState.archivedChallenges;

    if (archivedChallenges.isEmpty) {
      return Text(
        'Архив пуст',
        style: TextStyle(
          color: AppColors.grey,
          fontSize: 16,
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: archivedChallenges.length,
      itemBuilder: (context, index) {
        final challenge = archivedChallenges[index];
        return ChallengeContainer(
          challenge: challenge,
          onArchive: () {
            // Восстановление челленджа из архива
            challengesNotifier.unarchiveChallenge(index);
          },
        );
      },
    );
  }

  // Диалог добавления нового челленджа
  void _showAddChallengeDialog(
      BuildContext context, ChallengesNotifier notifier) {
    final nameController = TextEditingController();
    final dateController = TextEditingController();
    final imageUrlController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Добавить новый челлендж"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration:
                      const InputDecoration(labelText: 'Название челленджа'),
                ),
                TextField(
                  controller: dateController,
                  decoration: const InputDecoration(
                      labelText: 'Дата проведения (YYYY-MM-DD)'),
                  keyboardType: TextInputType.datetime,
                ),
                TextField(
                  controller: imageUrlController,
                  decoration:
                      const InputDecoration(labelText: 'URL изображения'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Отмена"),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final dateString = dateController.text.trim();
                DateTime? date;

                if (dateString.isNotEmpty) {
                  date = DateTime.tryParse(dateString);
                  if (date == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Некорректная дата')),
                    );
                    return;
                  }
                } else {
                  date = DateTime.now();
                }

                final imageUrl = imageUrlController.text.trim().isNotEmpty
                    ? imageUrlController.text.trim()
                    : 'assets/images/default_challenge.png';

                notifier.addChallenge(
                  ChallengeModel(
                    name: name,
                    date: date,
                    imageUrl: imageUrl,
                  ),
                );
              },
              child: const Text("Добавить"),
            ),
          ],
        );
      },
    );
  }
}
