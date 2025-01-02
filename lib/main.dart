import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/providers/repository_providers.dart';

import 'app/routes.dart';
import 'common/utils/colors.dart';
import 'core/api/api_client.dart';
import 'repositories/user_repository.dart';
import 'repositories/chat_repository.dart';
import 'repositories/challenge_repository.dart';
import 'repositories/participation_repository.dart';
import 'repositories/confirmation_repository.dart';
import 'repositories/notification_repository.dart';
import 'repositories/file_repository.dart';
import 'repositories/code_word_repository.dart';
import 'repositories/coins_repository.dart';

void main() {
  final apiClient = ApiClient(baseUrl: 'https://your-api-base-url.com');

  final userRepository = UserRepository(apiClient.dio);
  final chatRepository = ChatRepository(apiClient.dio);
  final challengeRepository = ChallengeRepository(apiClient.dio);
  final participationRepository = ParticipationRepository(apiClient.dio);
  final confirmationRepository = ConfirmationRepository(apiClient.dio);
  final notificationRepository = NotificationRepository(apiClient.dio);
  final fileRepository = FileRepository(apiClient.dio);
  final codeWordRepository = CodeWordRepository(apiClient.dio);
  final coinsRepository = CoinsRepository(apiClient.dio);

  runApp(
    ProviderScope(
      overrides: [
        userRepositoryProvider.overrideWithValue(userRepository),
        chatRepositoryProvider.overrideWithValue(chatRepository),
        challengeRepositoryProvider.overrideWithValue(challengeRepository),
        participationRepositoryProvider
            .overrideWithValue(participationRepository),
        confirmationRepositoryProvider
            .overrideWithValue(confirmationRepository),
        notificationRepositoryProvider
            .overrideWithValue(notificationRepository),
        fileRepositoryProvider.overrideWithValue(fileRepository),
        codeWordRepositoryProvider.overrideWithValue(codeWordRepository),
        coinsRepositoryProvider.overrideWithValue(coinsRepository),
      ],
      child: const MyApp(),
    ),
  );
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
