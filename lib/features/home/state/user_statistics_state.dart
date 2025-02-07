import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:parimate/models/user_statistics.dart';

part 'user_statistics_state.freezed.dart';

@freezed
class UserStatisticsState with _$UserStatisticsState {
  const factory UserStatisticsState({
    @Default([]) List<UserStatisticsItem> challenges,
    @Default(0.0) double completionPercentage,
    @Default(true) bool isLoading,
  }) = _UserStatisticsState;
}
