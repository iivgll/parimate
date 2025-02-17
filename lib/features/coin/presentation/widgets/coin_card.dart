import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parimate/common/utils/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/utils/colors.dart';
import '../../../../common/utils/icons.dart';
import '../../../../features/coin/presentation/logic/coin_notifier.dart';
import '../../../../common/widgets/payment_iframe_page.dart';

class CoinCard extends ConsumerWidget {
  final int coinAmount;
  final TextStyle coinOptionTextStyle;
  final TextStyle buyTextStyle;
  final VoidCallback? onBuy;

  const CoinCard({
    super.key,
    required this.coinAmount,
    required this.coinOptionTextStyle,
    required this.buyTextStyle,
    this.onBuy,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        final coinNotifier = ref.read(coinNotifierProvider.notifier);
        final confirmationLink = await coinNotifier.buyCoins(coinAmount);

        if (confirmationLink != null) {
          if (context.mounted) {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentIframePage(
                  paymentUrl: confirmationLink,
                ),
              ),
            );

            if (result == true) {
              // Обновляем баланс после успешной оплаты
              await coinNotifier.loadUserCoins();
            }
          }
        }
      },
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
