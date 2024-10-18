import 'package:flutter/material.dart';

import '../../../common/utils/colors.dart';

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Челленджи',
        style: TextStyle(color: AppColors.white),
      ),
    );
  }
}
