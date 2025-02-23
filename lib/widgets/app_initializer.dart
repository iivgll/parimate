import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app/metadata_notifier.dart';
import '../common/utils/colors.dart';
import '../state/app_state.dart';

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
      print('Metadata state changed: $next');
    });

    // Принудительно инициализируем провайдер метаданных
    ref.watch(metadataProvider);

    final appState = ref.watch(appStateProvider);
    final metadataState = ref.watch(metadataProvider);

    // Инициализируем приложение при первой загрузке
    ref.listen<AppState>(appStateProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    // Инициализируем приложение при первой загрузке
    if (!appState.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (appState.user == null) {
          ref.read(appStateProvider.notifier).initializeApp(userTgId);
          ref.read(metadataProvider.notifier).refresh();
        }
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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Произошла ошибка при загрузке данных'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.read(appStateProvider.notifier).initializeApp(userTgId);
                    ref.read(metadataProvider.notifier).refresh();
                  },
                  child: const Text('Повторить'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return child;
  }
}
