import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/chellenges/challenges_notifier.dart';
import '../features/chellenges/challenges_state.dart';

final challengesProvider =
    StateNotifierProvider<ChallengesNotifier, ChallengesState>(
  (ref) => ChallengesNotifier(),
);
