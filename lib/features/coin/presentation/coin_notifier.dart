// lib/features/coin/notifier/coin_notifier.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';

final coinNotifierProvider = StateNotifierProvider<CoinNotifier, int>((ref) {
  return CoinNotifier();
});

class CoinNotifier extends StateNotifier<int> {
  CoinNotifier() : super(10);

  // Метод для покупки монет
  void buyCoins(int amount) {
    state += amount;
  }

  // Метод для получения монеты за просмотр рекламы
  void watchAdForCoin() {
    state += 1;
  }

  int get balance => state;
}
