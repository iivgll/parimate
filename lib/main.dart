import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/features/initializer/presentation/app_initializer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'services/telegram_service.dart';

import 'app/repository_providers.dart';
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
import 'repositories/metadata_repository.dart';

final talker = TalkerFlutter.init();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final apiClient = ApiClient(baseUrl: 'https://test.parimate.ru');

  final userRepository = UserRepository(apiClient.dio);
  final chatRepository = ChatRepository(apiClient.dio);
  final challengeRepository = ChallengeRepository(apiClient.dio);
  final participationRepository = ParticipationRepository(apiClient.dio);
  final confirmationRepository = ConfirmationRepository(apiClient.dio);
  final notificationRepository = NotificationRepository(apiClient.dio);
  final fileRepository = FileRepository(apiClient.dio);
  final codeWordRepository = CodeWordRepository(apiClient.dio);
  final coinsRepository = CoinsRepository(apiClient.dio);
  final metadataRepository = MetadataRepository(apiClient.dio);

  // Сообщаем Telegram что приложение готово
  TelegramService.instance.ready();

  TelegramService.instance.getLaunchInfo();
  talker.log("Сборка от 4 июня 2025 года, V 1.0.3");
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
        metadataRepositoryProvider.overrideWithValue(metadataRepository),
      ],
      child: MyApp(
        userTgId: TelegramService.instance.id,
      ),
    ),
  );
}

// Оставляем оригинальный класс MyApp для возможного использования в будущем
class MyApp extends ConsumerWidget {
  final String userTgId;

  const MyApp({required this.userTgId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppInitializer(
      userTgId: userTgId, // Передаем ID из Telegram
      child: MaterialApp.router(
        title: 'Parimate',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColors.orange,
          canvasColor: AppColors.orange,
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: AppColors.orange,
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.orange,
            selectionColor:
                Color(0x40FF5C00), // Полупрозрачный оранжевый для выделения
            selectionHandleColor: AppColors.orange,
          ),
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
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ru', 'RU'),
        ],
        locale: const Locale('ru', 'RU'),
      ),
    );
  }
}
