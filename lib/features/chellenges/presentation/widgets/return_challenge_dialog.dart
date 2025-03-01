import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parimate/app/repository_providers.dart';
import 'package:parimate/common/utils/colors.dart';
import 'package:parimate/common/utils/extensions.dart';
import 'package:parimate/common/utils/icons.dart';
import 'package:parimate/common/widgets/insufficient_coins_dialog.dart';
import 'package:parimate/features/chellenges/logic/challenges_notifier.dart';
import 'package:dio/dio.dart';

class ReturnChallengeDialog extends ConsumerWidget {
  final int challengeId;

  const ReturnChallengeDialog({
    super.key,
    required this.challengeId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      backgroundColor: AppColors.blackMin,
      title: Row(
        children: [
          const Text(
            'Возвращение в челлендж за 1',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 5),
              SvgPicture.asset(
                AppIcons.coin,
                colorFilter: AppColors.orange.toColorFilter,
                width: 20,
                height: 20,
              ),
            ],
          ),
        ],
      ),
      content: const Text(
        'Вы точно хотите вернуться в челлендж?',
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
            // Сначала закрываем диалог
            Navigator.pop(context, true);

            try {
              await ref.read(participationRepositoryProvider).returnToChallenge(
                    challengeId: challengeId,
                  );

              if (context.mounted) {
                // Обновляем список челленджей
                await ref
                    .read(challengesNotifierProvider.notifier)
                    .refreshChallenges();
              }
            } catch (e) {
              if (context.mounted) {
                if (e is DioException && e.response?.statusCode == 418) {
                  // Получаем сообщение об ошибке из ответа сервера
                  String errorMessage =
                      'У вас недостаточно монет для возврата в челлендж.';
                  if (e.response?.data != null) {
                    errorMessage = e.response?.data['message'] ?? errorMessage;
                  }

                  showDialog(
                    context: context,
                    builder: (context) => InsufficientCoinsDialog(
                      message: errorMessage,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Ошибка при возвращении в челлендж: $e'),
                    ),
                  );
                }
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
