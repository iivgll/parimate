import 'package:parimate/app/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/chats_state.dart';

part 'chats_notifier.g.dart';

@riverpod
class ChatsNotifier extends _$ChatsNotifier {
  @override
  ChatsState build() => const ChatsState();

  Future<void> loadChats(String userTgId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final chats = await ref.read(chatRepositoryProvider).getUserChats();
      state = state.copyWith(chats: chats, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }
}
