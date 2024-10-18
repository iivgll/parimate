import 'package:flutter/material.dart';

import '../../../common/utils/colors.dart';

class CoinsPage extends StatelessWidget {
  const CoinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Монеты',
        style: TextStyle(color: AppColors.white),
      ),
    );
  }
}
