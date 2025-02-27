import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/code_word.dart';
import '../app/repository_providers.dart';
import 'app_logger.dart';

part 'code_word_notifier.g.dart';

@Riverpod(keepAlive: true)
class CodeWordNotifier extends _$CodeWordNotifier {
  CodeWord? _cachedCodeWord;

  @override
  FutureOr<CodeWord> build() async {
    if (_cachedCodeWord != null) {
      return _cachedCodeWord!;
    }

    try {
      final result = await _loadCodeWord();
      _cachedCodeWord = result;

      // Обновляем каждые 24 часа
      Future.delayed(const Duration(hours: 24), () {
        _cachedCodeWord = null;
        ref.invalidateSelf();
      });

      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<CodeWord> _loadCodeWord() async {
    try {
      final repository = ref.read(codeWordRepositoryProvider);
      final result = await repository.getCodeWord();
      return result;
    } catch (e) {
      AppLogger.error('Error loading code word: $e');
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final codeWord = await _loadCodeWord();
      state = AsyncValue.data(codeWord);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
