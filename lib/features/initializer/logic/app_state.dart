import 'package:riverpod_annotation/riverpod_annotation.dart';

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

      final user = await userRepo.getUser();
      final challenges = await challengeRepo.getUserChallenges();

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
