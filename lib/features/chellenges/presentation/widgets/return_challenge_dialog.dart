import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parimate/app/repository_providers.dart';
import 'package:parimate/common/utils/colors.dart';
import 'package:parimate/common/utils/extensions.dart';
import 'package:parimate/common/utils/icons.dart';
import 'package:parimate/common/widgets/insufficient_coins_dialog.dart';
import 'package:parimate/features/chellenges/logic/challenges_notifier.dart';
import 'package:parimate/repositories/participation_repository.dart';
import 'package:go_router/go_router.dart';

class ReturnChallengeDialog extends ConsumerStatefulWidget {
  final int challengeId;

  const ReturnChallengeDialog({
    super.key,
    required this.challengeId,
  });

  @override
  ConsumerState<ReturnChallengeDialog> createState() =>
      _ReturnChallengeDialogState();
}

class _ReturnChallengeDialogState extends ConsumerState<ReturnChallengeDialog> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
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
          onPressed: _isLoading ? null : () => Navigator.pop(context, false),
          child: const Text(
            'Нет',
            style: TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: _isLoading ? null : _handleReturnChallenge,
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.orange),
                  ),
                )
              : const Text(
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

  Future<void> _handleReturnChallenge() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await ref.read(participationRepositoryProvider).returnToChallenge(
            challengeId: widget.challengeId,
          );

      final challengesNotifier = ref.read(challengesNotifierProvider.notifier);
      await challengesNotifier.refreshChallenges();

      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        if (e is ChallengeReturnException) {
          if (e.message.startsWith("Вернуться в челлендж можно")) {
            showDialog(
              context: context,
              builder: (dialogContext) => AlertDialog(
                backgroundColor: AppColors.blackMin,
                title: const Text(
                  'Ошибка',
                  style: TextStyle(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                ),
                content: Text(
                  e.message,
                  style: const TextStyle(color: AppColors.white),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      if (mounted) {
                        Navigator.pop(context, false);
                      }
                    },
                    child: const Text(
                      'ОК',
                      style: TextStyle(
                          color: AppColors.orange, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // Показываем диалог о нехватке монет (или другой ошибке 418)
            // и ждем результат (true, если нажали "Пополнить")
            final bool? shouldGoToCoins = await showDialog<bool>(
              context: context,
              builder: (dialogContext) => InsufficientCoinsDialog(
                message: e.message,
              ),
            );

            // Если нажали "Пополнить баланс" (результат true)
            if (shouldGoToCoins == true) {
              // Закрываем основной диалог ReturnChallengeDialog
              if (mounted) {
                Navigator.pop(
                    context, false); // Закрываем ReturnChallengeDialog
                // Затем переходим на страницу монет
                GoRouter.of(context).go('/coins');
              }
            }
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ошибка при возвращении в челлендж: $e'),
            ),
          );
        }
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
