import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:parimate/common/utils/font_family.dart';
import 'package:parimate/features/settings/logic/settings_logic.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/utils/colors.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  void _showReminderTimePicker(
      BuildContext context, WidgetRef ref, int reminderNumber, String title) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: AppColors.blackMin,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.black,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontFamily: AppFontFamily.uncage,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  final settings = ref.watch(settingsNotifierProvider);
                  final selectedMinutes =
                      settings.reminderTimes[reminderNumber];

                  // Создаем список опций для выбора времени
                  final List<Map<String, dynamic>> timeOptions = [];

                  // Минуты (от 5 до 60)
                  for (int i = 1; i <= 12; i++) {
                    final minutes = i * 5;
                    timeOptions.add({
                      'value': minutes,
                      'display': '$minutes мин',
                    });
                  }

                  // Часы (от 1 до 24)
                  for (int i = 1; i <= 24; i++) {
                    final minutes = i * 60;
                    timeOptions.add({
                      'value': minutes,
                      'display': '$i ч',
                    });
                  }

                  return ListView.builder(
                    itemCount: timeOptions.length,
                    itemBuilder: (context, index) {
                      final option = timeOptions[index];
                      return Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.black,
                              width: 1,
                            ),
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            option['display'],
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                          ),
                          trailing: selectedMinutes == option['value']
                              ? const Icon(
                                  Icons.check,
                                  color: AppColors.orange,
                                  size: 20,
                                )
                              : null,
                          onTap: () {
                            ref
                                .read(settingsNotifierProvider.notifier)
                                .setReminderTime(
                                    reminderNumber, option['value']);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'НАСТРОЙКИ',
          style: TextStyle(
            fontFamily: AppFontFamily.uncage,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            size: 28,
            color: AppColors.white,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.blackMin,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Напоминания',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      Switch(
                        value: settings.isEnabled,
                        onChanged: (value) {
                          ref
                              .read(settingsNotifierProvider.notifier)
                              .toggleReminders(value);
                        },
                        activeColor: AppColors.orange,
                      ),
                    ],
                  ),
                  if (settings.isEnabled) ...[
                    const SizedBox(height: 16),
                    _buildReminderItem(context, ref, 1, '1-е напоминание'),
                    _buildReminderItem(context, ref, 2, '2-е напоминание'),
                    _buildReminderItem(context, ref, 3, '3-е напоминание'),
                  ],
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: InkWell(
              onTap: () {
                _launchSupportUrl(context);
              },
              child: Text(
                'Поддержка',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.orange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchSupportUrl(BuildContext context) async {
    final Uri url = Uri.parse('https://t.me/NikitaGirman');
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Не удалось открыть ссылку поддержки')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка при открытии ссылки: $e')),
      );
    }
  }

  Widget _buildReminderItem(
      BuildContext context, WidgetRef ref, int reminderNumber, String title) {
    final value = ref
        .watch(settingsNotifierProvider.notifier)
        .getReminderTime(reminderNumber);

    return InkWell(
      onTap: () => _showReminderTimePicker(context, ref, reminderNumber, title),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.black,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppColors.grey,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
