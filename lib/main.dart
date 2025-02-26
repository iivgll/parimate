import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/widgets/app_initializer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      // Заменяем основное приложение на страницу с информацией о запуске
      child: LaunchInfoApp(),
    ),
  );
}

class LaunchInfoApp extends StatelessWidget {
  const LaunchInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parimate Debug',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.orange,
        scaffoldBackgroundColor: AppColors.black,
        fontFamily: 'UbuntuSans',
      ),
      home: LaunchInfoScreen(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', 'RU'),
      ],
      locale: const Locale('ru', 'RU'),
    );
  }
}

class LaunchInfoScreen extends StatelessWidget {
  const LaunchInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем информацию о запуске из TelegramService
    final launchInfo = TelegramService.instance.getLaunchInfo();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация о запуске'),
        backgroundColor: AppColors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Информация о запуске приложения',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.orange,
              ),
            ),
            const SizedBox(height: 24),
            _buildInfoSection(
                'URL запуска', launchInfo['url'] ?? 'Не определен'),
            _buildInfoSection(
                'Параметры запуска',
                launchInfo['params'] != null
                    ? _formatParams(launchInfo['params'])
                    : 'Параметры отсутствуют'),

            // Секция с данными пользователя
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Данные пользователя Telegram',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: AppColors.orange.withOpacity(0.5)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        'ID: ${TelegramService.instance.id}\n'
                        'Имя: ${TelegramService.instance.firstName}\n'
                        'Фамилия: ${TelegramService.instance.lastName}\n'
                        'Имя пользователя: ${TelegramService.instance.username}\n'
                        'Язык: ${TelegramService.instance.languageCode}\n'
                        'URL фото: ${TelegramService.instance.photoUrl}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'monospace',
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Отображаем фото пользователя
                      if (TelegramService.instance.photoUrl.isNotEmpty)
                        Center(
                          child: Column(
                            children: [
                              const Text(
                                'Фото пользователя:',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  TelegramService.instance.photoUrl,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 100,
                                      height: 100,
                                      color: Colors.grey[800],
                                      child: const Center(
                                        child: Text(
                                          'Ошибка загрузки',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),

            _buildInfoSection('Информация о платформе',
                'User Agent: ${launchInfo['userAgent'] ?? 'Не определен'}'),

            // Добавляем вывод дополнительной информации от Telegram
            if (launchInfo['telegramPlatform'] != null)
              _buildInfoSection(
                  'Платформа Telegram', '${launchInfo['telegramPlatform']}'),

            if (launchInfo['telegramInitData'] != null)
              _buildInfoSection('Данные инициализации Telegram',
                  '${launchInfo['telegramInitData']}'),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Обновляем страницу
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LaunchInfoScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
              ),
              child: const Text('Обновить информацию'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.orange.withOpacity(0.5)),
          ),
          child: SelectableText(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontFamily: 'monospace',
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  String _formatParams(Map<String, dynamic> params) {
    if (params.isEmpty) return 'Параметры отсутствуют';

    return params.entries.map((e) => '${e.key}: ${e.value}').join('\n');
  }
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
