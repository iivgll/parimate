import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/common/utils/font_family.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:parimate/state/app_state.dart';

import '../../../../common/utils/colors.dart';

class MainCardWidget extends ConsumerWidget {
  const MainCardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challenges = ref.watch(challengesProvider);

    return Card(
      color: AppColors.blackMin,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Сегодня:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 24),
            if (challenges.isEmpty) ...[
              Center(
                child: CircularPercentIndicator(
                  radius: 150.0,
                  lineWidth: 50.0,
                  percent: 0,
                  center: Text(
                    '0%',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontFamily: AppFontFamily.uncage,
                    ),
                  ),
                  progressColor: AppColors.orange,
                  backgroundColor: AppColors.black,
                  circularStrokeCap: CircularStrokeCap.square,
                ),
              ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  'Не участвуешь в челлендже?',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'У тебя два пути — присоединяйся к существующему или создавай свой. Действуй, время расти и побеждать!',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ] else ...[
              Center(
                child: CircularPercentIndicator(
                  radius: 150.0,
                  lineWidth: 50.0,
                  percent: 0.67,
                  center: Text(
                    '67%',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontFamily: AppFontFamily.uncage,
                    ),
                  ),
                  progressColor: AppColors.orange,
                  backgroundColor: AppColors.black,
                  circularStrokeCap: CircularStrokeCap.square,
                ),
              ),
              const SizedBox(height: 20),
              ...challenges.map((challenge) => ListTile(
                    title: Text(
                      challenge.name,
                      style: TextStyle(
                        color: AppColors.white,
                        fontFamily: AppFontFamily.ubuntu,
                        fontSize: 14,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.close,
                      color: AppColors.orange,
                      size: 18,
                    ),
                    onTap: () {},
                  )),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Обработка загрузки подтверждений
                },
                icon: const Icon(Icons.add, color: AppColors.white),
                label: const Text(
                  'Загрузить подтверждение',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blackMin,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
