import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:parimate/features/chellenges/logic/challenges_notifier.dart';
import 'package:parimate/models/user_challenge_statistics.dart';
import '../../../common/utils/colors.dart';
import '../../../models/challenge_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/challenge_statistics.dart';

class ChallengeDetailsPage extends ConsumerWidget {
  final ChallengeModel challenge;

  const ChallengeDetailsPage({super.key, required this.challenge});

  String _formatDateRange() {
    final DateFormat formatter = DateFormat('dd.MM.yy');
    final startDate = formatter.format(DateTime.parse(challenge.start_date));
    final endDate = formatter.format(DateTime.parse(challenge.end_date));
    return '$startDate - $endDate';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              challenge.name,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _formatDateRange(),
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 16,
          bottom: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPrizeBlock(context),
            const SizedBox(height: 24),
            _buildRulesBlock(),
            const SizedBox(height: 24),
            _buildConfirmationBlock(context, ref),
            const SizedBox(height: 24),
            _buildParticipantsBlock(context, ref),
            const SizedBox(height: 32),
            _buildExitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPrizeBlock(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.blackMin,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${challenge.price} ₽',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Сумма возврата',
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding:
                const EdgeInsets.only(right: 24, left: 24, top: 16, bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.blackMin,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: IconButton(
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.link, color: AppColors.white),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: challenge.link));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ссылка скопирована')),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRulesBlock() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.blackMin,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Правила участия:',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            challenge.confirmation_description,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmationBlock(BuildContext context, WidgetRef ref) {
    final challengesNotifier = ref.read(challengesNotifierProvider.notifier);
    final statisticsFuture =
        challengesNotifier.getUserChallengeStatistics(challenge.id);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'ПОДТВЕРЖДЕНИЯ',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {
                // TODO: Реализовать загрузку подтверждения
              },
              icon: const Icon(Icons.arrow_circle_right_outlined,
                  color: AppColors.white, size: 32),
            ),
          ],
        ),
        FutureBuilder<UserChallengeStatisticsSchema>(
          future: statisticsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              print('Error details: ${snapshot.error}'); // Для отладки
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.blackMin,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Ошибка загрузки статистики: ${snapshot.error}',
                  style: const TextStyle(color: AppColors.grey),
                ),
              );
            }
            if (!snapshot.hasData || snapshot.data!.weeklyStats.isEmpty) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.blackMin,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Нет подтверждений',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            }

            final statistics = snapshot.data!;
            final totalExpected = statistics.weeklyStats.fold(
              0,
              (sum, curr) => sum + curr.expected,
            );
            final totalApproved = statistics.weeklyStats.fold(
              0,
              (sum, curr) => sum + curr.approved,
            );

            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.blackMin,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProgressRow(
                        'Всего',
                        totalApproved,
                        totalExpected,
                      ),
                      if (statistics.weeklyStats.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        ...statistics.weeklyStats.map(
                          (week) => _buildProgressRow(
                            'Неделя ${week.weekNumber}',
                            week.approved,
                            week.expected,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Реализовать загрузку подтверждения
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blackMin,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      '+ Загрузить подтверждение',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildProgressRow(String title, int current, int total) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
            ),
          ),
          Text(
            '$current/$total',
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParticipantsBlock(BuildContext context, WidgetRef ref) {
    final challengesNotifier = ref.read(challengesNotifierProvider.notifier);
    final statisticsFuture =
        challengesNotifier.getChallengeStatistics(challenge.id);

    return FutureBuilder<ChallengeStatistics>(
      future: statisticsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          print('Error details: ${snapshot.error}'); // Для отладки
          return Text(
            'Ошибка загрузки статистики: ${snapshot.error}',
            style: const TextStyle(color: AppColors.grey),
          );
        }
        if (!snapshot.hasData) return const SizedBox();

        final statistics = snapshot.data!;
        final activeParticipants =
            statistics.participants.where((p) => p.active).length;
        final totalParticipants = statistics.participants.length;

        // Сортируем по количеству подтверждений
        final activeUsers = statistics.participants
            .where((p) => p.active)
            .toList()
          ..sort((a, b) => b.approved.compareTo(a.approved));

        final inactiveUsers = statistics.participants
            .where((p) => !p.active)
            .toList()
          ..sort((a, b) => b.approved.compareTo(a.approved));

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'УЧАСТНИКИ $activeParticipants/$totalParticipants',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: AppColors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.blackMin,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Топ по активности',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...activeUsers.asMap().entries.map((entry) {
                    final index = entry.key;
                    final user = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        '${index + 1}. ${user.name} ${user.approved}/${statistics.expected}',
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }),
                  if (inactiveUsers.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    const Text(
                      'Проиграли',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...inactiveUsers.asMap().entries.map((entry) {
                      final index = entry.key;
                      final user = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          '${index + 1}. ${user.name} ${user.approved}/${statistics.expected}',
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                          ),
                        ),
                      );
                    }),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildExitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Реализовать выход из челленджа
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: AppColors.blackMin,
              title: const Text(
                'Выход из челленджа',
                style: TextStyle(color: AppColors.white),
              ),
              content: const Text(
                'Вы уверены, что хотите выйти из челленджа? Ваша ставка не будет возвращена.',
                style: TextStyle(color: AppColors.white),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Отмена',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Реализовать выход
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Выйти',
                    style: TextStyle(color: AppColors.orange),
                  ),
                ),
              ],
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Выйти из челленджа',
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
