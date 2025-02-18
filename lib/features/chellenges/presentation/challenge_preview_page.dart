import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/common/widgets/payment_iframe_page.dart';
import '../../../common/utils/colors.dart';
import '../../../app/repository_providers.dart';
import '../logic/challenges_notifier.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';

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
                  _buildInfoRow('Взнос:', '${challenge['price']} ₽'),
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

  Widget _buildInfoRow(String label, String value) {
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
          Text(
            displayValue,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 14,
            ),
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

  Future<void> _createChallenge(BuildContext context, WidgetRef ref) async {
    try {
      final createdChallenge = await ref
          .read(challengeRepositoryProvider)
          .createChallenge(challenge);

      await ref
          .read(challengesNotifierProvider.notifier)
          .joinChallenge(createdChallenge.id, context);

      if (context.mounted) {
        context.go('/challenges');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Челлендж успешно создан')),
        );
      }
    } catch (e) {
      print('ttest1');
      if (context.mounted) {
        print('ttest2');

        // Проверяем наличие сообщения об ошибке в тексте исключения
        final errorText = e.toString();
        if (errorText.contains(
            'На балансе недостаточно монеток для создания челленджа')) {
          print('ttest4');
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
                'У вас недостаточно монет для создания челленджа.\n\nПополните баланс, чтобы продолжить.',
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
            userTgId: '44',
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
          context.go('/challenges');
        }
      }
    } catch (e) {
      if (context.mounted) {
        String errorMessage = 'Не удалось присоединиться к челленджу';
        if (e is DioException && e.response?.data != null) {
          errorMessage = e.response?.data['message'] ?? errorMessage;
        }
        _showErrorDialog(context, errorMessage);
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
