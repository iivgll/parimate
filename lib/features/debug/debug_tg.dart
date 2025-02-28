import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../common/utils/colors.dart';
import '../../services/telegram_service.dart';

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
                    border: Border.all(
                      color: AppColors.orange.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        'ID: ${TelegramService.instance.id}\n'
                        'Имя: ${TelegramService.instance.firstName}\n'
                        'Фамилия: ${TelegramService.instance.lastName}\n'
                        'Имя пользователя: ${TelegramService.instance.username}\n'
                        'Язык: ${TelegramService.instance.languageCode}\n',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: 'monospace',
                        ),
                      ),
                      const SizedBox(height: 16),
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
            border: Border.all(color: AppColors.orange.withValues(alpha: 0.5)),
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
