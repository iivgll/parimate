import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:parimate/common/utils/font_family.dart';

import '../../../common/utils/colors.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          // Ваш контент настроек...
        ],
      ),
    );
  }
}
