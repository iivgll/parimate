import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_state.freezed.dart';

@freezed
class CoinState with _$CoinState {
  const factory CoinState({
    @Default(0) int balance,
    @Default(false) bool isLoading,
    String? error,
  }) = _CoinState;
}
