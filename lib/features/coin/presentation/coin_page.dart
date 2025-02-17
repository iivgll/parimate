import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/utils/colors.dart';
import '../../../common/utils/extensions.dart';
import '../../../common/utils/font_family.dart';
import '../../../common/utils/icons.dart';
import '../../../common/widgets/main_appbar_widget.dart';
import 'logic/coin_notifier.dart';
import 'widgets/coin_card.dart';

class CoinsPage extends ConsumerStatefulWidget {
  const CoinsPage({super.key});

  @override
  ConsumerState<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends ConsumerState<CoinsPage> {
  @override
  void initState() {
    super.initState();
    // Загружаем актуальное количество монет при открытии экрана
    Future.microtask(
        () => ref.read(coinNotifierProvider.notifier).loadUserCoins());
  }

  @override
  Widget build(BuildContext context) {
    final coinState = ref.watch(coinNotifierProvider);

    final userBalance = coinState.balance;

    if (coinState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (coinState.error != null) {
      return Center(
          child:
              Text(coinState.error!, style: TextStyle(color: AppColors.white)));
    }

    final coinOptions = [1, 3, 5, 10];

    // Стилевые переменные
    TextStyle titleTextStyle = TextStyle(
      fontFamily: AppFontFamily.uncage,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
    );

    TextStyle balanceTextStyle = TextStyle(
      fontFamily: AppFontFamily.uncage,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
    );

    TextStyle coinOptionTextStyle = TextStyle(
      fontFamily: AppFontFamily.ubuntu,
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    TextStyle buyTextStyle = TextStyle(
      fontFamily: AppFontFamily.ubuntu,
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    // Получаем текущий баланс пользователя из CoinNotifier
    final coinNotifier = ref.watch(coinNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: const MainAppbarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Выравнивание по левому краю
            children: [
              Text(
                'МОНЕТЫ',
                style: titleTextStyle,
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Text(
                    'БАЛАНС: $userBalance ${userBalance.coinWordForm()}',
                    style: balanceTextStyle,
                  ),
                  const SizedBox(width: 5),
                  Column(
                    children: [
                      SvgPicture.asset(
                        AppIcons.coin,
                        colorFilter: AppColors.orange.toColorFilter,
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Используем ListView.separated вместо Column для лучшей производительности
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: coinOptions.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final coinAmount = coinOptions[index];
                  return CoinCard(
                    coinAmount: coinAmount,
                    coinOptionTextStyle: coinOptionTextStyle,
                    buyTextStyle: buyTextStyle,
                    onBuy: () {
                      // Обработка покупки монет через CoinNotifier
                      coinNotifier.buyCoins(coinAmount);
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     // Обработка просмотра рекламы для получения монеты
              //     coinNotifier.watchAdForCoin();
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: AppColors.black,
              //     padding: const EdgeInsets.symmetric(vertical: 12.0),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8.0),
              //     ),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     mainAxisSize: MainAxisSize.min,
              //     children: const [
              //       Text(
              //         'Посмотри рекламу - получи монету',
              //         style: TextStyle(color: AppColors.white),
              //       ),
              //       SizedBox(width: 8),
              //       Icon(
              //         Icons.arrow_forward_outlined,
              //         color: AppColors.white,
              //         size: 18,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
