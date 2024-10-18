import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/routes.dart';
import 'common/utils/colors.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Flutter Web App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.orange,
        fontFamily:
            'UbuntuSans', // Устанавливаем UbuntuSans как шрифт по умолчанию
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.black,
          iconTheme: IconThemeData(color: AppColors.orange),
          titleTextStyle: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Uncage', // Используем Uncage для AppBar заголовков
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.black,
          selectedItemColor: AppColors.orange,
          unselectedItemColor: AppColors.grey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.orange,
            foregroundColor: AppColors.white,
            minimumSize: const Size(double.infinity, 50),
            textStyle: const TextStyle(
              fontFamily: 'UbuntuSans', // Используем UbuntuSans для кнопок
            ),
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'UbuntuSans',
            fontWeight: FontWeight.normal,
            color: AppColors.white,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'UbuntuSans',
            fontWeight: FontWeight.normal,
            color: AppColors.white,
          ),
          displayLarge: TextStyle(
            fontFamily: 'Uncage', // Используем Uncage для крупных заголовков
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}
