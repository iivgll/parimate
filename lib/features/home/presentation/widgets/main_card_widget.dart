import 'package:flutter/material.dart';
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
                radius: 100.0,
                lineWidth: 20.0,
                percent: 0.5,
                center: const Text(
                  '50%',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                progressColor: AppColors.orange,
                backgroundColor: AppColors.black,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
            const SizedBox(height: 20),
            // Список активностей
            ListTile(
              leading: const Icon(Icons.check, color: AppColors.orange),
              title: const Text(
                'Ранний подьем',
                style: TextStyle(color: AppColors.white), // Белый текст
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: AppColors.orange, size: 16),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.check, color: AppColors.orange),
              title: const Text(
                'Фитнес',
                style: TextStyle(color: AppColors.white), // Белый текст
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: AppColors.orange, size: 16),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.close, color: AppColors.orange),
              title: const Text(
                'Чтение книги',
                style: TextStyle(color: AppColors.white), // Белый текст
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: AppColors.orange, size: 16),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Обработка загрузки подтверждений
              },
              icon: const Icon(Icons.upload, color: AppColors.white),
              label: const Text('Загрузить подтверждение'),
            ),
          ],
        ),
      ),
    );
  }
}
