import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../common/utils/colors.dart';
import '../../../../models/challenge_model.dart';

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

  String _formatDateRange(ChallengeModel challenge) {
    final DateFormat formatter = DateFormat('dd.MM.yy');
    final startDate = formatter.format(DateTime.parse(challenge.start_date));
    final endDate = formatter.format(DateTime.parse(challenge.end_date));
    final type = challenge.participation_type == 'PERSONAL'
        ? 'персональный'
        : 'групповой';

    return '$startDate - $endDate ($type)';
  }

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
            child: SvgPicture.asset('assets/icons/${challenge.icon}.svg'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  challenge.name,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatDateRange(challenge),
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: AppColors.white),
            onPressed: () {
              context.push('/challenge-details', extra: challenge);
            },
          ),
        ],
      ),
    );
  }
}
