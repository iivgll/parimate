import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:parimate/app/repository_providers.dart';
import 'package:parimate/features/chellenges/logic/challenges_notifier.dart';
import 'package:parimate/features/chellenges/state/challenges_state.dart';
import 'package:parimate/models/user_challenge_statistics.dart';
import '../../../app/app_logger.dart';
import '../../../common/utils/colors.dart';
import '../../../models/challenge_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/challenge_statistics.dart';
import '../../../features/chellenges/presentation/confirmation_upload_page.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';

import '../../../repositories/participation_repository.dart';

final userActiveStateProvider = StateProvider.autoDispose<bool>((ref) => true);

class ChallengeDetailsPage extends ConsumerStatefulWidget {
  final ChallengeModel challenge;

  const ChallengeDetailsPage({super.key, required this.challenge});

  @override
  ConsumerState<ChallengeDetailsPage> createState() =>
      _ChallengeDetailsPageState();
}

class _ChallengeDetailsPageState extends ConsumerState<ChallengeDetailsPage> {
  bool? _isUserInactive;

  String _formatDateRange() {
    final DateFormat formatter = DateFormat('dd.MM.yy');
    final startDate =
        formatter.format(DateTime.parse(widget.challenge.startDate));
    final endDate = formatter.format(DateTime.parse(widget.challenge.endDate));
    return '$startDate - $endDate';
  }

  Widget _buildStatusIcon() {
    if (widget.challenge.isArchived) {
      return Icon(
        Icons.verified,
        color: AppColors.green,
        size: 20,
      );
    }
    return const Icon(
      Icons.schedule,
      color: AppColors.grey,
      size: 20,
    );
  }

  Future<(ChallengeStatistics, UserChallengeStatisticsSchema)> _loadData(
      WidgetRef ref) async {
    final challengesNotifier = ref.read(challengesNotifierProvider.notifier);
    final futures = await Future.wait([
      challengesNotifier.getChallengeStatistics(widget.challenge.id),
      challengesNotifier.getUserChallengeStatistics(widget.challenge.id),
    ]);

    return (
      futures[0] as ChallengeStatistics,
      futures[1] as UserChallengeStatisticsSchema
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                widget.challenge.name,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildStatusIcon(),
                const SizedBox(height: 5),
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(24),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              _formatDateRange(),
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<(ChallengeStatistics, UserChallengeStatisticsSchema)>(
        future: _loadData(ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.orange,
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Ошибка загрузки данных: ${snapshot.error}',
                style: const TextStyle(color: AppColors.grey),
                textAlign: TextAlign.center,
              ),
            );
          }

          final (statistics, userStatistics) = snapshot.data!;

          return SingleChildScrollView(
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
                _buildConfirmationBlockContent(userStatistics, context),
                const SizedBox(height: 24),
                _buildParticipantsBlockContent(statistics),
                const SizedBox(height: 32),
                _buildExitButton(context),
              ],
            ),
          );
        },
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
                    '${widget.challenge.price} ₽',
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
          if (!widget.challenge.isArchived) ...[
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.only(
                  right: 24, left: 24, top: 16, bottom: 16),
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
                    Clipboard.setData(
                        ClipboardData(text: widget.challenge.link));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Ссылка скопирована')),
                    );
                  },
                ),
              ),
            ),
          ],
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
            widget.challenge.confirmationDescription,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmationBlockContent(
      UserChallengeStatisticsSchema statistics, BuildContext context) {
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
            if (!widget.challenge.isArchived) ...[
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ConfirmationUploadPage(challenge: widget.challenge),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_circle_right_outlined,
                    color: AppColors.white, size: 32),
              ),
            ],
          ],
        ),
        FutureBuilder<UserChallengeStatisticsSchema>(
          future: Future.value(statistics),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              AppLogger.error(
                  'Error details: ${snapshot.error}'); // Для отладки
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
                if (!widget.challenge.isArchived &&
                    !(widget.challenge.status == 'REGISTERED')) ...[
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmationUploadPage(
                                challenge: widget.challenge),
                          ),
                        );
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

  Widget _buildParticipantsBlockContent(ChallengeStatistics statistics) {
    final activeParticipants =
        statistics.participants.where((p) => p.active).length;
    final totalParticipants = statistics.participants.length;

    // Сортируем по количеству подтверждений
    final activeUsers = statistics.participants.where((p) => p.active).toList()
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
                'Топ по активности:',
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${index + 1}. ${user.name}',
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '${user.approved}/${statistics.expected}',
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              if (inactiveUsers.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Text(
                  'Проиграли:',
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${index + 1}. ${user.name}',
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${user.approved}/${statistics.expected}',
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExitButton(BuildContext context) {
    if (widget.challenge.isArchived) {
      return const SizedBox.shrink();
    }

    return FutureBuilder<ChallengeStatistics>(
      future: ref
          .read(challengesNotifierProvider.notifier)
          .getChallengeStatistics(widget.challenge.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(color: AppColors.orange));
        }

        final statistics = snapshot.data;
        final currentUser = statistics?.participants.firstWhere(
          (p) => p.name == "Ivan",
          orElse: () =>
              const UserStatistics(name: "", active: true, approved: 0),
        );

        // Используем локальное состояние, если оно установлено, иначе берем из API
        final isUserInactive = _isUserInactive ?? currentUser?.active == false;

        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              if (isUserInactive) {
                try {
                  await ref
                      .read(participationRepositoryProvider)
                      .returnToChallenge(
                        challengeId: widget.challenge.id,
                      );

                  if (mounted) {
                    setState(() {
                      _isUserInactive = false; // Немедленно обновляем UI
                    });
                    await ref
                        .read(challengesNotifierProvider.notifier)
                        .refreshChallenges();
                  }
                } catch (e) {
                  if (context.mounted) {
                    if (e is InsufficientCoinsException) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: AppColors.blackMin,
                          title: const Text(
                            'Недостаточно монет',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: const Text(
                            'У вас недостаточно монет для возврата в челлендж.\n\nПополните баланс, чтобы продолжить.',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
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
                                Navigator.pop(context);
                                context.go('/coins');
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
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Ошибка при возвращении в челлендж: $e'),
                        ),
                      );
                    }
                  }
                }
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
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
                        onPressed: () => Navigator.pop(context),
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
                          Navigator.pop(context); // Закрываем диалог
                          try {
                            await ref
                                .read(participationRepositoryProvider)
                                .leaveChallenge(
                                  challengeId: widget.challenge.id,
                                );

                            if (mounted) {
                              setState(() {
                                _isUserInactive = true;
                              });
                              await ref
                                  .read(challengesNotifierProvider.notifier)
                                  .refreshChallenges();
                              ref
                                  .read(challengesNotifierProvider.notifier)
                                  .setView(ChallengesView.mine);
                            }
                          } catch (e) {
                            if (context.mounted) {
                              String errorMessage =
                                  'Не удалось покинуть челлендж';
                              if (e is DioException &&
                                  e.response?.data != null) {
                                errorMessage =
                                    e.response?.data['message'] ?? errorMessage;
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
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isUserInactive ? AppColors.orange : AppColors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              isUserInactive ? 'Вернуться в челлендж' : 'Выйти из челленджа',
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
