import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/common/utils/extensions.dart';
import 'package:parimate/common/utils/icons.dart';
import 'package:parimate/services/telegram_service.dart';

import '../../../../common/utils/colors.dart';
import '../../../../common/utils/font_family.dart';

class MainAppbarWidget extends ConsumerWidget implements PreferredSizeWidget {
  final bool automaticallyImplyLeading;

  const MainAppbarWidget({super.key, this.automaticallyImplyLeading = true});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget _buildAvatar(WidgetRef ref) {
    return CircleAvatar(
      backgroundColor: AppColors.orange,
      radius: 20,
      child: Text(
        _getInitials(),
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String _getInitials() {
    final firstName = TelegramService.instance.firstName;
    final lastName = TelegramService.instance.lastName;

    if (firstName.isEmpty && lastName.isEmpty) {
      return '?';
    }

    if (firstName.isEmpty) {
      return lastName[0].toUpperCase();
    }

    if (lastName.isEmpty) {
      return firstName[0].toUpperCase();
    }

    return '${firstName[0]}${lastName[0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: AppColors.black,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Row(
        children: [
          _buildAvatar(ref),
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
