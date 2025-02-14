import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../common/utils/colors.dart';
import '../../../../app/repository_providers.dart';
import '../../logic/challenges_notifier.dart';

class ChallengePreviewPage extends ConsumerWidget {
  final Map<String, dynamic> challenge;

  const ChallengePreviewPage({
    super.key,
    required this.challenge,
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
                onPressed: () => _createChallenge(context, ref),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Вступить в челлендж',
                  style: TextStyle(
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

  Widget _buildInfoRow(String label, String value) {
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
            value,
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
        Navigator.of(context).pop(); // Закрываем экран предпросмотра
        Navigator.of(context).pop(); // Закрываем экран создания
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Челлендж успешно создан')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        String errorMessage = 'Произошла ошибка';

        if (e.toString().contains('message')) {
          final start = e.toString().indexOf('"message": "') + 11;
          final end = e.toString().indexOf('"', start);
          errorMessage = e.toString().substring(start, end);
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
  }
}
