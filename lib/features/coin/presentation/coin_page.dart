import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parimate/features/home/presentation/widgets/main_appbar_widget.dart';
import 'package:parimate/features/home/presentation/widgets/main_card_widget.dart';

import '../../../common/utils/colors.dart';
import '../../../common/utils/font_family.dart';

class CoinsPage extends ConsumerWidget {
  const CoinsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MainAppbarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'МОНЕТЫ',
                  style: TextStyle(
                    fontFamily: AppFontFamily.uncage,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const MainCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
