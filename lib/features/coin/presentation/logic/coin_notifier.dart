import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../app/repository_providers.dart';
import '../../../../state/app_state.dart';
import '../state/coin_state.dart';

part 'coin_notifier.g.dart';

@riverpod
class CoinNotifier extends _$CoinNotifier {
  @override
  CoinState build() => const CoinState();

  Future<void> loadUserCoins() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final userTgId = ref.read(userProvider)?.tgId;
      if (userTgId == null) {
        throw Exception('Пользователь не найден');
      }

      final userRepo = ref.read(userRepositoryProvider);
      final user = await userRepo.getUser(userTgId: userTgId);

      state = state.copyWith(
        balance: user.coins,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<String?> buyCoins(int amount) async {
    try {
      final userTgId = ref.read(userProvider)?.tgId;
      if (userTgId == null) {
        throw Exception('Пользователь не найден');
      }

      final coinsRepo = ref.read(coinsRepositoryProvider);
      final response = await coinsRepo.buyCoins(
        userTgId: userTgId,
        coins: amount,
      );

      return response.confirmationLink;
    } catch (e) {
      state = state.copyWith(error: e.toString());
      return null;
    }
  }

  // Метод для получения монеты за просмотр рекламы
  void watchAdForCoin() {
    state = state.copyWith(balance: state.balance + 1);
  }
}
