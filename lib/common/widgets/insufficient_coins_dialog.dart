import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:parimate/common/utils/colors.dart';

class InsufficientCoinsDialog extends StatelessWidget {
  final String message;
  final VoidCallback? onClose;

  const InsufficientCoinsDialog({
    super.key,
    this.message =
        'У вас недостаточно монет для этого действия.\n\nПополните баланс, чтобы продолжить.',
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.blackMin,
      title: const Text(
        'Недостаточно монет',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        message,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 16,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
            if (onClose != null) {
              onClose!();
            }
          },
          child: const Text(
            'Закрыть',
            style: TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text(
            'Пополнить баланс',
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
