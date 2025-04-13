import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/common/utils/font_family.dart';
import 'package:parimate/features/home/logic/user_statistics_notifier.dart';
import 'package:parimate/services/telegram_service.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/utils/colors.dart';
import '../../../chellenges/logic/challenges_notifier.dart';

class MainCardWidget extends ConsumerStatefulWidget {
  const MainCardWidget({super.key});

  @override
  ConsumerState<MainCardWidget> createState() => _MainCardWidgetState();
}

class _MainCardWidgetState extends ConsumerState<MainCardWidget> {
  @override
  void initState() {
    super.initState();
    Future(() async {
      await ref
          .read(userStatisticsNotifierProvider.notifier)
          .loadUserStatistics(TelegramService.instance.id);
      await ref.read(challengesNotifierProvider.notifier).refreshChallenges();
    });
  }

  @override
  Widget build(BuildContext context) {
    final statistics = ref.watch(userStatisticsNotifierProvider);
    final challengesState = ref.watch(challengesNotifierProvider);

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
            if (statistics.challenges.isEmpty) ...[
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
                  circularStrokeCap: CircularStrokeCap.round,
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
                  percent: statistics.completionPercentage / 100,
                  center: Text(
                    '${statistics.completionPercentage.toStringAsFixed(0)}%',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontFamily: AppFontFamily.uncage,
                    ),
                  ),
                  progressColor: AppColors.orange,
                  backgroundColor: AppColors.black,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
              ),
              const SizedBox(height: 20),
              ...statistics.challenges.map((challenge) => InkWell(
                    onTap: () {
                      if (challengesState.hasValue) {
                        final fullChallenge = challengesState.value?.challenges
                            .where((c) => c.name == challenge.challengeName)
                            .firstOrNull;

                        if (fullChallenge != null) {
                          context.push('/challenge-details',
                              extra: fullChallenge);
                        }
                      }
                    },
                    child: ListTile(
                      title: Text(
                        challenge.challengeName,
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: AppFontFamily.ubuntu,
                          fontSize: 14,
                        ),
                      ),
                      trailing: Icon(
                        challenge.confirmed ? Icons.check : Icons.close,
                        color: challenge.confirmed
                            ? AppColors.white
                            : AppColors.orange,
                        size: 18,
                      ),
                    ),
                  )),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  context.go('/challenges');
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
