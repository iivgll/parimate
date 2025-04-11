import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:parimate/common/utils/extensions.dart';
import 'package:parimate/features/chellenges/logic/challenges_notifier.dart';
import 'package:parimate/features/chellenges/presentation/widgets/return_challenge_dialog.dart';
import 'package:parimate/models/enums/confirmation_type.dart';
import 'package:parimate/models/user_challenge_statistics.dart';
import '../../../app/app_logger.dart';
import '../../../common/utils/colors.dart';
import '../../../common/utils/font_family.dart';
import '../../../common/utils/icons.dart';
import '../../../models/challenge_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/challenge_statistics.dart';
import '../../../features/chellenges/presentation/confirmation_upload_page.dart';
import 'package:dio/dio.dart';
import '../../../common/widgets/main_appbar_widget.dart';
import '../../../common/widgets/insufficient_coins_dialog.dart';

import '../../../services/telegram_service.dart';
import '../../../features/chellenges/presentation/widgets/exit_challenge_dialog.dart';

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
      // Загружаем данные челленджа и проверяем, активен ли пользователь
      return FutureBuilder<ChallengeStatistics>(
        future: ref
            .read(challengesNotifierProvider.notifier)
            .getChallengeStatistics(widget.challenge.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: AppColors.orange,
              strokeWidth: 2,
            );
          }

          if (snapshot.hasData) {
            final statistics = snapshot.data!;
            final String userName = TelegramService.instance.firstName;

            // Проверяем, находится ли пользователь в списке и активен ли он
            final userEntry = statistics.participants.firstWhere(
              (p) => p.name == userName,
              orElse: () =>
                  const UserStatistics(name: "", active: true, approved: 0),
            );

            // Если пользователь неактивен (проиграл) - показываем красный крестик
            if (!userEntry.active) {
              return const Icon(
                Icons.cancel,
                color: Colors.red,
                size: 30,
              );
            }

            // Если активен (выиграл) - показываем зеленую галочку
            return Icon(
              Icons.verified,
              color: AppColors.green,
              size: 30,
            );
          }

          // По умолчанию показываем зеленую галочку для архивированных челленджей
          return Icon(
            Icons.verified,
            color: AppColors.green,
            size: 30,
          );
        },
      );
    }

    // Для активных (не архивированных) челленджей показываем значок часов
    return const Icon(
      Icons.schedule,
      color: AppColors.grey,
      size: 30,
    );
  }

  Future<(ChallengeStatistics?, UserChallengeStatisticsSchema?)> _loadData(
      WidgetRef ref) async {
    final challengesNotifier = ref.read(challengesNotifierProvider.notifier);

    try {
      final challengeStatistics =
          await challengesNotifier.getChallengeStatistics(widget.challenge.id);

      try {
        final userStatistics = await challengesNotifier
            .getUserChallengeStatistics(widget.challenge.id);
        return (challengeStatistics, userStatistics);
      } catch (e) {
        // Если получение статистики пользователя завершилось с ошибкой (500),
        // возвращаем только статистику челленджа
        AppLogger.error('Ошибка при загрузке статистики пользователя: $e');
        return (challengeStatistics, null);
      }
    } catch (e) {
      AppLogger.error('Ошибка при загрузке статистики челленджа: $e');
      return (null, null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: const MainAppbarWidget(automaticallyImplyLeading: false),
      body:
          FutureBuilder<(ChallengeStatistics?, UserChallengeStatisticsSchema?)>(
        future: _loadData(ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.orange,
              ),
            );
          }

          final (statistics, userStatistics) = snapshot.data ?? (null, null);
          final bool isUserParticipant = userStatistics != null;

          // Проверяем, есть ли пользователь в списке участников
          final bool isUserInStatistics = statistics != null &&
              statistics.participants
                  .any((p) => p.name == TelegramService.instance.firstName);

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
                _buildChallengeHeader(context),
                const SizedBox(height: 24),
                _buildPrizeBlock(context),
                const SizedBox(height: 24),
                _buildRulesBlock(),
                const SizedBox(height: 24),
                if (isUserInStatistics)
                  _buildConfirmationBlockContent(userStatistics!, context)
                else
                  _buildJoinChallengeBlock(context),
                const SizedBox(height: 24),
                if (statistics != null)
                  _buildParticipantsBlockContent(statistics)
                else
                  _buildParticipantsPlaceholder(),
                const SizedBox(height: 32),
                if (isUserParticipant && isUserInStatistics)
                  _buildExitButton(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildChallengeHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      widget.challenge.name,
                      style: TextStyle(
                        fontFamily: AppFontFamily.uncage,
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 10),
                  _buildStatusIcon(),
                ],
              ),
              const SizedBox(height: 4),
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
      ],
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
                  if (widget.challenge.currency == 'COINS') ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.challenge.price}',
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          AppIcons.coin,
                          colorFilter: AppColors.orange.toColorFilter,
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ] else ...[
                    Text(
                      '${widget.challenge.price} ₽',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
    final confirmationType = fromString(widget.challenge.confirmationType);
    String confirmationTypeText;
    IconData confirmationIcon;

    switch (confirmationType) {
      case ConfirmationType.photo:
        confirmationTypeText = 'ФОТО';
        confirmationIcon = Icons.photo_camera;
        break;
      case ConfirmationType.video:
        confirmationTypeText = 'ВИДЕО';
        confirmationIcon = Icons.videocam;
        break;
      case ConfirmationType.text:
        confirmationTypeText = 'ТЕКСТ';
        confirmationIcon = Icons.text_fields;
        break;
      case ConfirmationType.geo:
        confirmationTypeText = 'ГЕО';
        confirmationIcon = Icons.location_on;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'ПОДТВЕРЖДЕНИЯ',
              style: TextStyle(
                fontFamily: AppFontFamily.uncage,
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
                if (widget.challenge.status == 'IN_PROGRESS') ...[
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
                ] else if (widget.challenge.status == 'REGISTERED') ...[
                  const SizedBox(height: 16),
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
                        Text(
                          'Челлендж еще не начался',
                          style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Начало: ${DateFormat('dd.MM.yyyy').format(DateTime.parse(widget.challenge.startDate))}',
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Окончание: ${DateFormat('dd.MM.yyyy').format(DateTime.parse(widget.challenge.endDate))}',
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildProgressRow(String title, int current, int total) {
    final bool isComplete = current >= total;

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
            style: TextStyle(
              color: isComplete ? AppColors.orange : AppColors.white,
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
              style: TextStyle(
                color: AppColors.white,
                fontSize: 24,
                fontFamily: AppFontFamily.uncage,
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

  Widget _buildJoinChallengeBlock(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ПРИСОЕДИНИТЬСЯ',
          style: TextStyle(
            fontFamily: AppFontFamily.uncage,
            color: AppColors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
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
              const Center(
                child: Text(
                  'Вы еще не участвуете в этом челлендже',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
              Center(child: _buildConfirmationTypeInfo()),
              const SizedBox(height: 12),
              Text(
                'Начало: ${DateFormat('dd.MM.yyyy').format(DateTime.parse(widget.challenge.startDate))}',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Окончание: ${DateFormat('dd.MM.yyyy').format(DateTime.parse(widget.challenge.endDate))}',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await ref
                          .read(challengesNotifierProvider.notifier)
                          .joinChallenge(widget.challenge.id, context);

                      if (mounted) {
                        // Обновляем страницу после успешного присоединения
                        setState(() {});
                      }
                    } catch (e) {
                      if (context.mounted) {
                        if (e is DioException &&
                            e.response?.statusCode == 418) {
                          // Получаем сообщение об ошибке из ответа сервера
                          final errorMessage = e.response?.data['message'] ??
                              'На балансе недостаточно монеток для регистрации на челлендж';

                          showDialog(
                            context: context,
                            builder: (context) => InsufficientCoinsDialog(
                              message: errorMessage,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Ошибка при присоединении к челленджу: $e'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Присоединиться',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildParticipantsPlaceholder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'УЧАСТНИКИ',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 24,
            fontFamily: AppFontFamily.uncage,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.blackMin,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'Информация об участниках недоступна',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
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

        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        final statistics = snapshot.data!;

        // Проверяем, есть ли пользователь в списке участников
        final userInStatistics = statistics.participants
            .any((p) => p.name == TelegramService.instance.firstName);

        // Если пользователя нет в списке, не показываем кнопку
        if (!userInStatistics) {
          return const SizedBox.shrink();
        }

        final currentUser = statistics.participants.firstWhere(
          (p) => p.name == TelegramService.instance.firstName,
          orElse: () =>
              const UserStatistics(name: "", active: true, approved: 0),
        );

        // Используем локальное состояние, если оно установлено, иначе берем из API
        final isUserInactive = _isUserInactive ?? !currentUser.active;

        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              if (isUserInactive) {
                // Используем новый диалог возвращения в челлендж
                final result = await showDialog<bool>(
                  context: context,
                  builder: (context) => ReturnChallengeDialog(
                    challengeId: widget.challenge.id,
                  ),
                );

                // Если пользователь подтвердил возвращение и операция прошла успешно
                if (result == true && mounted) {
                  setState(() {
                    _isUserInactive = false; // Обновляем UI
                  });
                }
              } else {
                // Используем диалог выхода из челленджа
                final result = await showDialog<bool>(
                  context: context,
                  builder: (context) => ExitChallengeDialog(
                    challengeId: widget.challenge.id,
                  ),
                );

                // Если пользователь вышел из челленджа, обновляем UI
                if (result == true && mounted) {
                  setState(() {
                    _isUserInactive = true;
                  });
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isUserInactive
                      ? 'Вернуться в челлендж за 1'
                      : 'Выйти из челленджа',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                isUserInactive
                    ? Row(
                        children: [
                          const SizedBox(width: 5),
                          SvgPicture.asset(
                            AppIcons.coin,
                            colorFilter: AppColors.orange.toColorFilter,
                          ),
                        ],
                      )
                    : const SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildConfirmationTypeInfo() {
    final confirmationType = fromString(widget.challenge.confirmationType);

    IconData icon;
    String typeText;

    switch (confirmationType) {
      case ConfirmationType.photo:
        icon = Icons.photo_camera;
        typeText = 'Фото';
        break;
      case ConfirmationType.video:
        icon = Icons.videocam;
        typeText = 'Видео';
        break;
      case ConfirmationType.text:
        icon = Icons.text_fields;
        typeText = 'Текст';
        break;
      case ConfirmationType.geo:
        icon = Icons.location_on;
        typeText = 'Геолокация';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grey.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.orange, size: 20),
          const SizedBox(width: 8),
          Text(
            'Тип подтверждения: $typeText',
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
}
