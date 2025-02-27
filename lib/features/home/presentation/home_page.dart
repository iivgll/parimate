import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:parimate/features/home/presentation/widgets/main_card_widget.dart';

import '../../../common/utils/colors.dart';
import '../../../common/utils/font_family.dart';
import '../../../common/widgets/main_appbar_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _tapCount = 0;
  final int _requiredTaps = 11;

  // Метод для показа диалога ввода пароля
  void _showPasswordDialog(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.black,
          title: const Text(
            'Введите пароль',
            style: TextStyle(color: AppColors.white),
          ),
          content: TextField(
            controller: passwordController,
            obscureText: true,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: AppColors.white),
            decoration: const InputDecoration(
              hintText: 'Пароль',
              hintStyle: TextStyle(color: AppColors.grey),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.orange),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Отмена',
                style: TextStyle(color: AppColors.orange),
              ),
            ),
            TextButton(
              onPressed: () {
                if (passwordController.text == '3838') {
                  Navigator.pop(context);
                  context.pushNamed('talker');
                } else {
                  // Показываем сообщение об ошибке
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Неверный пароль'),
                      backgroundColor: AppColors.orange,
                    ),
                  );
                }
              },
              child: const Text(
                'Войти',
                style: TextStyle(color: AppColors.orange),
              ),
            ),
          ],
        );
      },
    );
  }

  void _handleTap() {
    setState(() {
      _tapCount++;
    });

    if (_tapCount == _requiredTaps) {
      _tapCount = 0; // Сбрасываем счетчик
      _showPasswordDialog(context);
    }
    // Не показываем никаких подсказок о прогрессе
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: const MainAppbarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: _handleTap,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'АКТИВНОСТЬ',
                    style: TextStyle(
                      fontFamily: AppFontFamily.uncage,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
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
