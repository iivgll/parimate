import 'package:parimate/services/telegram_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/app_logger.dart';
import '../../../app/repository_providers.dart';
import '../../../models/challenge/challenge.dart';
import '../../../models/user/user.dart';
import '../model/app_state_model.dart';

part 'app_state.g.dart';

@riverpod
class AppInitialazer extends _$AppInitialazer {
  @override
  AppInitialazerModel build() {
    return const AppInitialazerModel();
  }

  Future<void> initializeApp(String userTgId) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final userRepo = ref.read(userRepositoryProvider);
      final challengeRepo = ref.read(challengeRepositoryProvider);

      // Используем ID из TelegramService, если доступен, иначе используем переданный ID
      final String tgId = TelegramService.instance.id.isNotEmpty
          ? TelegramService.instance.id
          : userTgId;

      // Проверяем, что у нас есть действительный ID пользователя
      if (tgId.isEmpty) {
        throw Exception('Не удалось получить ID пользователя Telegram');
      }

      // Всегда пытаемся создать пользователя
      try {
        await userRepo.createUser(
          username: TelegramService.instance.username,
          tgId: tgId,
          name: TelegramService.instance.firstName,
        );
      } catch (e) {
        // Игнорируем ошибку, если пользователь уже существует
        AppLogger.error(
            'Ошибка при создании пользователя (возможно, уже существует): $e');
      }

      try {
        // Получаем данные пользователя и челленджи
        final user = await userRepo.getUser();
        final challenges = await challengeRepo.getUserChallenges();

        state = state.copyWith(
          user: user,
          challenges: challenges,
          isLoading: false,
          hasInitialized: true,
        );
      } catch (e) {
        // Если не удалось получить пользователя, устанавливаем ошибку
        state = state.copyWith(
          isLoading: false,
          error: 'Ошибка при получении данных: $e',
          hasInitialized: true,
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
        hasInitialized: true,
      );
    }
  }

  void updateUser(User user) {
    state = state.copyWith(user: user);
  }

  void updateChallenges(List<Challenge> challenges) {
    state = state.copyWith(challenges: challenges);
  }
}
