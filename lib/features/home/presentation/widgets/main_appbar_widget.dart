import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parimate/common/utils/extensions.dart';
import 'package:parimate/common/utils/icons.dart';

import '../../../../common/utils/colors.dart';
import '../../../../common/utils/font_family.dart';

class MainAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbarWidget({super.key});

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // 56.0 пикселей

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      title: Row(
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.orange,
            radius: 20, // Размер аватарки
            // Если у вас есть изображение аватарки, используйте backgroundImage
            // backgroundImage: AssetImage('assets/avatar.png'),
          ),
          const SizedBox(width: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Имя',
                style: TextStyle(
                  fontFamily: AppFontFamily.ubuntu,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Фамилия',
                style: TextStyle(
                  fontFamily: AppFontFamily.ubuntu,
                  fontSize: 14,
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
                // Обработчик нажатия на иконку настроек
                // Например, навигация на страницу настроек
              },
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ],
    );
  }
}
