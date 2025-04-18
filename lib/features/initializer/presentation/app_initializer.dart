import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/app_logger.dart';
import '../../../app/metadata_notifier.dart';
import '../../../common/utils/colors.dart';
import '../../../services/telegram_service.dart';
import '../logic/app_state.dart';
import '../model/app_state_model.dart';

class AppInitializer extends ConsumerWidget {
  final String userTgId;
  final Widget child;

  const AppInitializer({
    super.key,
    required this.userTgId,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Добавляем слушатель для метаданных
    ref.listen(metadataProvider, (previous, next) {
      AppLogger.log('Metadata state changed: $next');
    });

    // Принудительно инициализируем провайдер метаданных
    ref.watch(metadataProvider);

    final appState = ref.watch(appInitialazerProvider);
    final metadataState = ref.watch(metadataProvider);

    // Получаем ID пользователя из Telegram
    final String tgId = TelegramService.instance.id.isNotEmpty
        ? TelegramService.instance.id
        : userTgId;

    // Инициализируем приложение при первой загрузке и отслеживаем ошибки
    ref.listen<AppInitialazerModel>(appInitialazerProvider, (previous, next) {
      if (next.error != null) {
        AppLogger.error(next.error);
      }
    });

    // Инициализируем приложение при первой загрузке
    if (!appState.isLoading &&
        appState.user == null &&
        !appState.hasInitialized) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(appInitialazerProvider.notifier).initializeApp(tgId);
        ref.read(metadataProvider.notifier).refresh();
      });
    }

    // Показываем индикатор загрузки, если что-то загружается
    if (appState.isLoading || metadataState.isLoading) {
      return const Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: AppColors.black,
          body: Center(
            child: CircularProgressIndicator(
              color: AppColors.orange,
            ),
          ),
        ),
      );
    }

    // Показываем ошибку, если что-то пошло не так
    if (appState.error != null || metadataState.hasError) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: AppColors.black,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.orange,
                    size: 64,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Упс! Что-то пошло не так',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Не удалось загрузить необходимые данные. Наша команда уже работает над устранением проблемы. Пожалуйста, попробуйте позже.',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(appInitialazerProvider.notifier)
                          .initializeApp(tgId);
                      ref.read(metadataProvider.notifier).refresh();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Попробовать снова',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return child;
  }
}
