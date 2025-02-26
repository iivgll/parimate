import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:parimate/common/utils/extensions.dart';
import 'package:parimate/common/utils/icons.dart';
import 'package:parimate/services/telegram_service.dart';

import '../../../../common/utils/colors.dart';
import '../../../../common/utils/font_family.dart';

class MainAppbarWidget extends ConsumerWidget implements PreferredSizeWidget {
  const MainAppbarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget _buildAvatar() {
    return CircleAvatar(
      backgroundColor: AppColors.orange,
      radius: 20,
      child: ClipOval(
        child: Image.network(
          TelegramService.instance.photoUrl,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Shimmer.fromColors(
              baseColor: AppColors.orange.withValues(alpha: 0.3),
              highlightColor: AppColors.orange,
              child: Container(
                width: 40,
                height: 40,
                color: AppColors.orange,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Text(
              TelegramService.instance.firstName.toUpperCase(),
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: AppColors.black,
      title: Row(
        children: [
          _buildAvatar(),
          const SizedBox(width: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TelegramService.instance.firstName,
                style: TextStyle(
                  fontFamily: AppFontFamily.ubuntu,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            IconButton(
              icon: SvgPicture.asset(
                AppIcons.settings,
                colorFilter: AppColors.white.toColorFilter,
              ),
              onPressed: () {
                context.push('/settings');
              },
            ),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }
}
