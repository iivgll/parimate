import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../../common/utils/colors.dart';
import '../../../models/challenge_model.dart';

class ChallengeDetailsPage extends StatelessWidget {
  final ChallengeModel challenge;

  const ChallengeDetailsPage({super.key, required this.challenge});

  String _formatDateRange() {
    final DateFormat formatter = DateFormat('dd.MM.yy');
    final startDate = formatter.format(DateTime.parse(challenge.start_date));
    final endDate = formatter.format(DateTime.parse(challenge.end_date));
    return '$startDate - $endDate';
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
            _buildConfirmationBlock(),
            const SizedBox(height: 24),
            _buildParticipantsBlock(),
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

  Widget _buildConfirmationBlock() {
    // TODO: Получать реальные данные о прогрессе
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
        Column(
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
                  const SizedBox(height: 16),
                  _buildProgressRow('Всего', 20, 30),
                  _buildProgressRow('Неделя 1', 10, 10),
                  _buildProgressRow('Неделя 2', 10, 10),
                  _buildProgressRow('Неделя 3', 0, 10),
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

  Widget _buildParticipantsBlock() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'УЧАСТНИКИ ${challenge.max_participants}/15',
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
              // TODO: Добавить список топ участников
              const SizedBox(height: 16),
              const Text(
                'Проиграли',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // TODO: Добавить список проигравших
            ],
          ),
        ),
      ],
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
