import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_statistics.freezed.dart';
part 'user_statistics.g.dart';

@freezed
class UserStatistics with _$UserStatistics {
  const factory UserStatistics({
    @JsonKey(name: 'user_statistics')
    required List<UserStatisticsItem> userStatistics,
  }) = _UserStatistics;

  factory UserStatistics.fromJson(Map<String, dynamic> json) =>
      _$UserStatisticsFromJson(json);
}

@freezed
class UserStatisticsItem with _$UserStatisticsItem {
  const factory UserStatisticsItem({
    @JsonKey(name: 'challenge_name') required String challengeName,
    required bool confirmed,
  }) = _UserStatisticsItem;

  factory UserStatisticsItem.fromJson(Map<String, dynamic> json) =>
      _$UserStatisticsItemFromJson(json);
}
