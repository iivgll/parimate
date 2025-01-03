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
          Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    user.photo != null ? NetworkImage(user.photo!) : null,
                radius: 20,
                child: user.photo == null
                    ? Text(user.name[0].toUpperCase())
                    : null,
              ),
              const SizedBox(width: 12),
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Uncage',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'АКТИВНОСТЬ',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Uncage',
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
                ),
              ),
              progressColor: AppColors.orange,
              backgroundColor: AppColors.grey.withOpacity(0.2),
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Сегодня:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildTaskItem('Ранний подъём', true),
          _buildTaskItem('Фитнес', true),
          _buildTaskItem('Чтение книги', false),
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
