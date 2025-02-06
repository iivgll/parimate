import '../../../models/chat/chat.dart';

class ChatsState {
  final List<Chat> chats;
  final bool isLoading;
  final String? error;

  const ChatsState({
    this.chats = const [],
    this.isLoading = false,
    this.error,
  });

  ChatsState copyWith({
    List<Chat>? chats,
    bool? isLoading,
    String? error,
  }) {
    return ChatsState(
      chats: chats ?? this.chats,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChatsState &&
        other.isLoading == isLoading &&
        other.error == error &&
        _listEquals(other.chats, chats);
  }

  bool _listEquals<T>(List<T>? a, List<T>? b) {
    if (a == null) return b == null;
    if (b == null || a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode => Object.hash(
        chats,
        isLoading,
        error,
      );
}
