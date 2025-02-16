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
    final startDate = formatter.format(DateTime.parse(challenge.startDate));
    final endDate = formatter.format(DateTime.parse(challenge.endDate));
    final type = challenge.participationType == 'PERSONAL'
        ? 'персональный'
        : 'групповой';
    final status = isArchived
        ? (challenge.status == 'WIN' ? ' (выигран)' : ' (проигран)')
        : '';

    return '$startDate - $endDate ($type)$status';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: isArchived
            ? AppColors.black.withValues(alpha: 0.5)
            : AppColors.blackMin,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          _buildIcon(),
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

  Widget _buildIcon() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.blackMin,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: challenge.icon.isEmpty
            ? const Icon(
                Icons.extension,
                color: AppColors.white,
                size: 32,
              )
            : SvgPicture.asset(
                'assets/icons/${challenge.icon}.svg',
                width: 32,
                height: 32,
                colorFilter:
                    const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                placeholderBuilder: (context) => const Icon(
                  Icons.extension,
                  color: AppColors.white,
                  size: 32,
                ),
              ),
      ),
    );
  }
}
