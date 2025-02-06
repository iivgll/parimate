import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:parimate/common/utils/font_family.dart';
import 'package:parimate/providers/settings_provider.dart';

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
                  final settings = ref.watch(settingsProvider);
                  final selectedMinutes =
                      settings.reminderTimes[reminderNumber];

                  return ListView.builder(
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      final minutes = (index + 1) * 5;
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
                            '$minutes мин',
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                            ),
                          ),
                          trailing: selectedMinutes == minutes
                              ? const Icon(
                                  Icons.check,
                                  color: AppColors.orange,
                                  size: 20,
                                )
                              : null,
                          onTap: () {
                            ref
                                .read(settingsProvider.notifier)
                                .setReminderTime(reminderNumber, minutes);
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
    final settings = ref.watch(settingsProvider);

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
                              .read(settingsProvider.notifier)
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
        ],
      ),
    );
  }

  Widget _buildReminderItem(
      BuildContext context, WidgetRef ref, int reminderNumber, String title) {
    final value =
        ref.watch(settingsProvider.notifier).getReminderTime(reminderNumber);

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
