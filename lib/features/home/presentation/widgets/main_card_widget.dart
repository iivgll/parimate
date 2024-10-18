import 'package:flutter/material.dart';
import 'package:parimate/common/utils/font_family.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../common/utils/colors.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.blackMin,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Сегодня:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: CircularPercentIndicator(
                radius: 150.0,
                lineWidth: 50.0,
                percent: 0.67,
                center: Text(
                  '67%',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontFamily: AppFontFamily.uncage),
                ),
                progressColor: AppColors.orange,
                backgroundColor: AppColors.black,
                circularStrokeCap: CircularStrokeCap.square,
              ),
            ),
            const SizedBox(height: 20),
            // Список активностей
            ListTile(
              title: Text(
                'Ранний подьем',
                style: TextStyle(
                    color: AppColors.white, fontFamily: AppFontFamily.ubuntu),
              ),
              trailing: const Icon(Icons.check, color: AppColors.white),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Фитнес',
                style: TextStyle(
                    color: AppColors.white,
                    fontFamily: AppFontFamily.ubuntu), // Белый текст
              ),
              trailing: const Icon(Icons.check, color: AppColors.white),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Чтение книги',
                style: TextStyle(
                    color: AppColors.white,
                    fontFamily: AppFontFamily.ubuntu), // Белый текст
              ),
              trailing: const Icon(Icons.close, color: AppColors.orange),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Обработка загрузки подтверждений
              },
              icon: const Icon(Icons.add, color: AppColors.white),
              label: const Text(
                'Загрузить подтверждение',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blackMin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
