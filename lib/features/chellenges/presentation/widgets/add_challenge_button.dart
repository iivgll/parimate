import 'package:flutter/material.dart';

import '../../../../common/utils/colors.dart';

class AddChallengeButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddChallengeButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.add, color: AppColors.white),
      label: const Text(
        'Добавить новый челлендж',
        style: TextStyle(color: AppColors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black, // Цвет кнопки
        padding: const EdgeInsets.symmetric(vertical: 12.0),
      ),
    );
  }
}
