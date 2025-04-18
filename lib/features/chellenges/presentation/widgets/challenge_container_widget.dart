import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../common/utils/colors.dart';
import '../../../../models/challenge_model.dart';

class ChallengeContainer extends StatefulWidget {
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
  State<ChallengeContainer> createState() => _ChallengeContainerState();
}

class _ChallengeContainerState extends State<ChallengeContainer> {
  bool _isNameExpanded = false;

  String _formatDateRange(ChallengeModel challenge) {
    final DateFormat formatter = DateFormat('dd.MM.yy');
    final startDate = formatter.format(DateTime.parse(challenge.startDate));
    final endDate = formatter.format(DateTime.parse(challenge.endDate));
    final type = challenge.participationType == 'PERSONAL'
        ? 'персональный'
        : 'групповой';

    return '$startDate - $endDate\n($type)';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: widget.isArchived
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isNameExpanded = !_isNameExpanded;
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.challenge.name,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: _isNameExpanded ? null : 1,
                          overflow: _isNameExpanded
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _formatDateRange(widget.challenge),
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                    ),
                    if (widget.isArchived) ...[
                      const SizedBox(width: 8),
                      Icon(
                        widget.challenge.status == 'WIN'
                            ? Icons.verified
                            : Icons.cancel,
                        color: widget.challenge.status == 'WIN'
                            ? AppColors.green
                            : Colors.red,
                        size: 16,
                      ),
                    ]
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_circle_right_outlined,
              color: AppColors.white,
              size: 35,
            ),
            onPressed: () {
              context.push('/challenge-details', extra: widget.challenge);
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
        child: widget.challenge.icon.isEmpty
            ? const Icon(
                Icons.extension,
                color: AppColors.white,
                size: 32,
              )
            : SvgPicture.asset(
                'assets/icons/${widget.challenge.icon}.svg',
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
