import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/common/utils/extensions.dart';
import 'package:parimate/common/utils/icons.dart';
import 'package:parimate/state/app_state.dart';

import '../../../../common/utils/colors.dart';
import '../../../../common/utils/font_family.dart';

class MainAppbarWidget extends ConsumerWidget implements PreferredSizeWidget {
  const MainAppbarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    if (user == null) {
      return AppBar(
        backgroundColor: AppColors.black,
      );
    }

    return AppBar(
      backgroundColor: AppColors.black,
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.orange,
            radius: 20,
            backgroundImage:
                user.photo != null ? NetworkImage(user.photo!) : null,
            child: user.photo == null
                ? Text(
                    user.name[0].toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
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
