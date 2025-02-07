import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user/user.dart';
import '../models/challenge/challenge.dart';
import '../app/repository_providers.dart';

class AppState {
  final User? user;
  final List<Challenge> challenges;
  final bool isLoading;
  final String? error;

  const AppState({
    this.user,
    this.challenges = const [],
    this.isLoading = false,
    this.error,
  });

  AppState copyWith({
    User? user,
    List<Challenge>? challenges,
    bool? isLoading,
    String? error,
  }) {
    return AppState(
      user: user ?? this.user,
      challenges: challenges ?? this.challenges,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class AppStateNotifier extends StateNotifier<AppState> {
  final Ref ref;

  AppStateNotifier(this.ref) : super(const AppState());

  Future<void> initializeApp(String userTgId) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final userRepo = ref.read(userRepositoryProvider);
      final challengeRepo = ref.read(challengeRepositoryProvider);

      final user = await userRepo.getUser(userTgId: userTgId);
      final challenges =
          await challengeRepo.getUserChallenges(userTgId: userTgId);

      state = state.copyWith(
        user: user,
        challenges: challenges,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
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

final appStateProvider =
    StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier(ref);
});

// Провайдеры для удобного доступа к данным
final userProvider = Provider<User?>((ref) {
  return ref.watch(appStateProvider).user;
});

final challengesProvider = Provider<List<Challenge>>((ref) {
  return ref.watch(appStateProvider).challenges;
});

final isLoadingProvider = Provider<bool>((ref) {
  return ref.watch(appStateProvider).isLoading;
});

final errorProvider = Provider<String?>((ref) {
  return ref.watch(appStateProvider).error;
});
