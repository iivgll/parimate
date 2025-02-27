import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/challenge/challenge.dart';
import '../../../models/user/user.dart';

part 'app_state_model.freezed.dart';

@freezed
class AppInitialazerModel with _$AppInitialazerModel {
  const factory AppInitialazerModel({
    User? user,
    @Default([]) List<Challenge> challenges,
    @Default(false) bool isLoading,
    String? error,
    @Default(false) bool hasInitialized,
  }) = _AppInitialazerModel;
}
