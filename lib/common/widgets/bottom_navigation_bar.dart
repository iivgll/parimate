import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:parimate/common/utils/extensions.dart';
import 'package:parimate/common/utils/icons.dart';

import '../../../common/utils/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final String currentLocation;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentLocation,
  });

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    if (currentLocation.startsWith('/challenges')) {
      currentIndex = 1;
    } else if (currentLocation.startsWith('/chats')) {
      currentIndex = 2;
    } else if (currentLocation.startsWith('/coins')) {
      currentIndex = 3;
    }

    // Отладочный вывод
    print('Current location: $currentLocation, currentIndex: $currentIndex');

    return BottomNavigationBar(
      backgroundColor: AppColors.black,
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            if (currentLocation != '/') {
              context.go('/');
            }
            break;
          case 1:
            if (currentLocation != '/challenges') {
              context.go('/challenges');
            }
            break;
          case 2:
            if (currentLocation != '/chats') {
              context.go('/chats');
            }
            break;
          case 3:
            if (currentLocation != '/coins') {
              context.go('/coins');
            }
            break;
        }
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.activity,
            colorFilter: currentIndex == 0
                ? AppColors.orange.toColorFilter
                : AppColors.grey.toColorFilter,
          ),
          label: 'Активность',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.chellenges,
              colorFilter: currentIndex == 1
                  ? AppColors.orange.toColorFilter
                  : AppColors.grey.toColorFilter),
          label: 'Челленджи',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.chat,
            colorFilter: currentIndex == 2
                ? AppColors.orange.toColorFilter
                : AppColors.grey.toColorFilter,
          ),
          label: 'Чаты',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.coin,
            colorFilter: currentIndex == 3
                ? AppColors.orange.toColorFilter
                : AppColors.grey.toColorFilter,
          ),
          label: 'Монеты',
        ),
      ],
    );
  }
}
