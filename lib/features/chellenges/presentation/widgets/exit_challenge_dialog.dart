import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/app/repository_providers.dart';
import 'package:parimate/common/utils/colors.dart';
import 'package:parimate/features/chellenges/logic/challenges_notifier.dart';
import 'package:parimate/features/chellenges/state/challenges_state.dart';
import 'package:dio/dio.dart';

class ExitChallengeDialog extends ConsumerWidget {
  final int challengeId;

  const ExitChallengeDialog({
    super.key,
    required this.challengeId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      backgroundColor: AppColors.blackMin,
      title: const Text(
        'Выход из челленджа',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: const Text(
        'Вы точно хотите покинуть челлендж?',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text(
            'Нет',
            style: TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            // Сначала закрываем диалог и возвращаем true
            Navigator.pop(context, true);

            try {
              await ref.read(participationRepositoryProvider).leaveChallenge(
                    challengeId: challengeId,
                  );

              if (context.mounted) {
                // Обновляем список челленджей
                await ref
                    .read(challengesNotifierProvider.notifier)
                    .refreshChallenges();
                ref
                    .read(challengesNotifierProvider.notifier)
                    .setView(ChallengesView.mine);
              }
            } catch (e) {
              if (context.mounted) {
                String errorMessage = 'Не удалось покинуть челлендж';
                if (e is DioException && e.response?.data != null) {
                  errorMessage = e.response?.data['message'] ?? errorMessage;
                }
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: AppColors.blackMin,
                    title: const Text(
                      'Ошибка',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Text(
                      errorMessage,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'OK',
                          style: TextStyle(
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            }
          },
          child: const Text(
            'Да',
            style: TextStyle(
              color: AppColors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
