import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:parimate/common/utils/font_family.dart';

import '../../../common/utils/colors.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Провайдер состояния для переключателя напоминаний
    final reminderSwitchProvider = StateProvider<bool>((ref) => false);

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
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.blackMin,
              ),
              child: Row(
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
                  Consumer(
                    builder: (context, ref, child) {
                      final isReminderOn = ref.watch(reminderSwitchProvider);
                      return Switch(
                        value: isReminderOn,
                        onChanged: (value) {
                          ref.read(reminderSwitchProvider.notifier).state =
                              value;
                        },
                        activeColor: AppColors.orange,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
