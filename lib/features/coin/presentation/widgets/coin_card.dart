import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parimate/common/utils/extensions.dart';

import '../../../../common/utils/colors.dart';
import '../../../../common/utils/icons.dart';

class CoinCard extends StatelessWidget {
  final int coinAmount;
  final TextStyle coinOptionTextStyle;
  final TextStyle buyTextStyle;
  final VoidCallback onBuy;

  const CoinCard({
    Key? key,
    required this.coinAmount,
    required this.coinOptionTextStyle,
    required this.buyTextStyle,
    required this.onBuy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBuy,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.blackMin,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Row(
              children: [
                Text(
                  '$coinAmount ${coinAmount.coinWordForm()}',
                  style: coinOptionTextStyle,
                ),
                const Spacer(),
                SvgPicture.asset(
                  AppIcons.coin,
                  colorFilter: AppColors.orange.toColorFilter,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 10),
                Text(
                  "Купить",
                  style: buyTextStyle,
                ),
              ],
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
