import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parimate/common/utils/extensions.dart';
import 'package:parimate/common/widgets/payment_iframe_page.dart';
import '../../../common/utils/colors.dart';
import '../../../app/repository_providers.dart';
import '../../../common/utils/icons.dart';
import '../../../common/widgets/insufficient_coins_dialog.dart';
import '../logic/challenges_notifier.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';

class ChallengePreviewPage extends ConsumerWidget {
  final Map<String, dynamic> challenge;
  final bool isCreating;
  final String? joinLink;

  const ChallengePreviewPage({
    super.key,
    required this.challenge,
    this.isCreating = false,
    this.joinLink,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          challenge['name'],
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.blackMin,
                borderRadius: BorderRadius.circular(12),
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
                    challenge['confirmation_description'],
                    style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('Периодичность:', _formatRegularity(challenge)),
                  _buildInfoRow('До:', challenge['confirm_until']),
                  _buildInfoRow(
                    'Начало/конец:',
                    '${challenge['start_date']} - ${challenge['end_date']}',
                  ),
                  _buildInfoRow(
                    'Взнос:',
                    _formatPrice(challenge['price'], challenge['currency']),
                    extraWidget: challenge['currency'] == 'COINS'
                        ? SvgPicture.asset(
                            AppIcons.coin,
                            colorFilter: AppColors.orange.toColorFilter,
                            width: 24,
                            height: 24,
                          )
                        : null,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => isCreating
                    ? _createChallenge(context, ref)
                    : _joinChallenge(context, ref),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isCreating ? AppColors.orange : AppColors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  isCreating ? 'Создать челлендж' : 'Вступить в челлендж',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String dateStr) {
    if (dateStr.isEmpty) return '';

    if (!dateStr.contains('T')) {
      // Если это просто время, возвращаем как есть
      return dateStr;
    }

    try {
      final date = DateTime.parse(dateStr);
      return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year.toString().substring(2)}';
    } catch (e) {
      return dateStr; // В случае ошибки парсинга возвращаем исходную строку
    }
  }

  Widget _buildInfoRow(String label, String value, {Widget? extraWidget}) {
    String displayValue = value;
    if (label.contains('Начало/конец')) {
      final dates = value.split(' - ');
      if (dates.length == 2) {
        displayValue = '${_formatDate(dates[0])} - ${_formatDate(dates[1])}';
      }
    } else if (label == 'До:') {
      displayValue = _formatDate(value);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
            ),
          ),
          Row(
            children: [
              Text(
                displayValue,
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
              ),
              if (extraWidget != null) ...[
                const SizedBox(width: 4),
                extraWidget,
              ],
            ],
          ),
        ],
      ),
    );
  }

  String _formatRegularity(Map<String, dynamic> challenge) {
    switch (challenge['regularity_type']) {
      case 'ONCE':
        return 'Единоразово';
      case 'TIMES_PER_DAY':
        return 'Каждый день';
      case 'TIMES_PER_WEEK':
        final times = challenge['times_per_week'];
        return times == 1 ? 'Каждую неделю' : '$times раз(а) в неделю';
      case 'CONCRETE_DAYS':
        final days = (challenge['confirmation_days'] as List)
            .map((day) => _getDayName(day))
            .join(', ');
        return days;
      default:
        return 'Каждый день';
    }
  }

  String _getDayName(int day) {
    const days = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
    return days[day - 1];
  }

  String _formatPrice(dynamic price, String? currency) {
    if (currency == 'COINS') {
      return price.toString();
    } else {
      return '$price ₽';
    }
  }

  Future<void> _createChallenge(BuildContext context, WidgetRef ref) async {
    try {
      final createdChallenge = await ref
          .read(challengeRepositoryProvider)
          .createChallenge(challenge);

      await ref
          .read(challengesNotifierProvider.notifier)
          // ignore: use_build_context_synchronously
          .joinChallenge(createdChallenge.id, context);

      if (context.mounted) {
        context.go('/challenges');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Челлендж успешно создан')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        // Проверяем наличие сообщения об ошибке в тексте исключения
        final errorText = e.toString();
        if (errorText.contains('недостаточно монет') ||
            errorText.contains('недостаточно монеток')) {
          showDialog(
            context: context,
            builder: (context) => InsufficientCoinsDialog(
              message:
                  'У вас недостаточно монет для создания челленджа.\n\nПополните баланс, чтобы продолжить.',
            ),
          );
        } else {
          _showErrorDialog(context, 'Произошла ошибка при создании челленджа');
        }
      }
    }
  }

  Future<void> _joinChallenge(BuildContext context, WidgetRef ref) async {
    try {
      final result = await ref
          .read(participationRepositoryProvider)
          .joinToChallengeViaLink(
            link: joinLink!,
            accepted: true,
            payed: false,
          );

      if (result.confirmationUrl != null && context.mounted) {
        final success = await Navigator.of(context).push<bool>(
          MaterialPageRoute(
            builder: (context) => PaymentIframePage(
              paymentUrl: result.confirmationUrl!,
            ),
          ),
        );

        if (success == true && context.mounted) {
          await ref
              .read(challengesNotifierProvider.notifier)
              .refreshChallenges();
          // ignore: use_build_context_synchronously
          context.go('/challenges');
        }
      }
    } catch (e) {
      if (context.mounted) {
        final errorText = e.toString();
        if (errorText.contains('недостаточно монет') ||
            errorText.contains('недостаточно монеток')) {
          showDialog(
            context: context,
            builder: (context) => const InsufficientCoinsDialog(),
          );
          return;
        }

        if (e is DioException && e.response?.statusCode == 418) {
          final responseData = e.response?.data;
          if (responseData is Map<String, dynamic> &&
              responseData['message'] != null &&
              responseData['message']
                  .toString()
                  .contains('недостаточно монеток')) {
            showDialog(
              context: context,
              builder: (context) => const InsufficientCoinsDialog(),
            );
            return;
          }
        }
        _showErrorDialog(
            context, 'Произошла ошибка при присоединении к челленджу');
      }
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
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
          message,
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
