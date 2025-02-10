import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../../../common/utils/colors.dart';
import '../../../../app/repository_providers.dart';

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
      // Создаем челлендж
      final createdChallenge = await ref
          .read(challengeRepositoryProvider)
          .createChallenge(challenge);

      // Регистрируем пользователя в челлендже
      await ref.read(participationRepositoryProvider).registerToChallenge(
            userTgId: '44',
            challengeId: createdChallenge.id,
            accepted: true,
            payed: true,
          );

      if (context.mounted) {
        Navigator.of(context).pop(); // Закрываем экран предпросмотра
        Navigator.of(context).pop(); // Закрываем экран создания
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Челлендж успешно создан')),
        );
      }
    } catch (e) {
      TalkerLogger().error('Ошибка при создании челленджа: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка при создании челленджа: $e')),
        );
      }
    }
  }
}
