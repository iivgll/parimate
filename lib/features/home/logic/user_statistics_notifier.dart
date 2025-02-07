import 'package:parimate/features/home/state/user_statistics_state.dart';
import 'package:parimate/app/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../models/user_statistics.dart';

part 'user_statistics_notifier.g.dart';

@riverpod
class UserStatisticsNotifier extends _$UserStatisticsNotifier {
  @override
  UserStatisticsState build() => const UserStatisticsState();

  Future<void> loadUserStatistics(String userTgId) async {
    try {
      state = state.copyWith(isLoading: true);
      final statistics = await ref
          .read(userRepositoryProvider)
          .getUserStatistics(userTgId: userTgId);

      final challenges = statistics.userStatistics
          .map((stat) => UserStatisticsItem(
                challengeName: stat.challengeName,
                confirmed: stat.confirmed,
              ))
          .toList();

      final confirmedCount =
          challenges.where((challenge) => challenge.confirmed).length;
      final percentage =
          challenges.isEmpty ? 0.0 : (confirmedCount / challenges.length) * 100;

      state = state.copyWith(
        challenges: challenges,
        completionPercentage: percentage,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}
