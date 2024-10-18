// lib/common/widgets/custom_bottom_navigation_bar.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      selectedItemColor: AppColors.orange,
      unselectedItemColor: AppColors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Активность',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flag),
          label: 'Челленджи',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Чаты',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.monetization_on),
          label: 'Монеты',
        ),
      ],
    );
  }
}
