import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/utils/colors.dart';
import '../../../../freezed_models/challenge_model.dart';

class ChallengeContainer extends StatelessWidget {
  final ChallengeModel challenge;
  final VoidCallback onArchive;
  final bool isArchived;

  const ChallengeContainer({
    super.key,
    required this.challenge,
    required this.onArchive,
    this.isArchived = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColors.blackMin,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SvgPicture.asset(challenge.imageUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  challenge.name,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Дата: ${challenge.date.toLocal().toString().split(' ')[0]}',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Кнопка со стрелкой
          IconButton(
            icon: Icon(Icons.arrow_forward, color: AppColors.white),
            onPressed: () {
              context.push('/challenge-details', extra: challenge);
            },
          ),
        ],
      ),
    );
  }
}
