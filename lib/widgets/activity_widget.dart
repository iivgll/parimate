import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../state/app_state.dart';
import '../common/utils/colors.dart';

class ActivityWidget extends ConsumerWidget {
  const ActivityWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final challenges = ref.watch(challengesProvider);

    if (user == null) {
      return const SizedBox.shrink();
    }

    if (challenges.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Сегодня:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 10.0,
                percent: 0,
                center: const Text(
                  '0%',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                progressColor: AppColors.orange,
                backgroundColor: AppColors.grey.withOpacity(0.2),
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Не участвуешь в челлендже?',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'У тебя два пути — присоединяйся к существующему или создавай свой. Действуй, время расти и побеждать!',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    // Здесь можно добавить логику подсчета процента выполненных задач
    final completedTasks = 2; // Пример
    final totalTasks = 3; // Пример
    final percentage = completedTasks / totalTasks;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Сегодня:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 10.0,
              percent: percentage,
              center: Text(
                '${(percentage * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              progressColor: AppColors.orange,
              backgroundColor: AppColors.grey.withOpacity(0.2),
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
          const SizedBox(height: 24),
          ...challenges
              .map((challenge) => _buildTaskItem(challenge.name, false))
              .toList(),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Логика загрузки подтверждения
            },
            child: const Text('+ Загрузить подтверждение'),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskItem(String title, bool completed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            completed ? Icons.check : Icons.close,
            color: completed ? AppColors.orange : Colors.red,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              decoration: completed ? TextDecoration.lineThrough : null,
              color: completed ? AppColors.grey : AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
