import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final appState = ref.watch(appStateProvider);

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

    if (appState.user == null && !appState.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(appStateProvider.notifier).initializeApp(userTgId);
      });
    }

    if (appState.isLoading) {
      return const Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    if (appState.error != null) {
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
