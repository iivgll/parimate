import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/providers/repository_providers.dart';
import 'package:parimate/widgets/app_initializer.dart';

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
  final apiClient = ApiClient(baseUrl: 'http://185.112.102.11:8000');

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
    return AppInitializer(
      userTgId: '44',
      child: MaterialApp.router(
        title: 'Parimate',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColors.orange,
          fontFamily: 'UbuntuSans',
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.black,
            iconTheme: IconThemeData(color: AppColors.orange),
            titleTextStyle: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Uncage',
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
                fontFamily: 'UbuntuSans',
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
              fontFamily: 'Uncage',
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
