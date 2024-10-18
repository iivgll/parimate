import 'package:flutter/cupertino.dart';

import '../../../common/utils/colors.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Чаты',
        style: TextStyle(color: AppColors.white),
      ),
    );
  }
}
