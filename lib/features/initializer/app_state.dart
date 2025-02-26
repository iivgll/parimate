import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/user/user.dart';
import '../../models/challenge/challenge.dart';
import 'logic/app_state.dart';

// Провайдеры для удобного доступа к данным
final userProvider = Provider<User?>((ref) {
  return ref.watch(appInitialazerProvider).user;
});

final challengesProvider = Provider<List<Challenge>>((ref) {
  return ref.watch(appInitialazerProvider).challenges;
});

final isLoadingProvider = Provider<bool>((ref) {
  return ref.watch(appInitialazerProvider).isLoading;
});

final errorProvider = Provider<String?>((ref) {
  return ref.watch(appInitialazerProvider).error;
});
