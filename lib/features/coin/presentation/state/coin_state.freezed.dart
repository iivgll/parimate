// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoinState {
  int get balance => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of CoinState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinStateCopyWith<CoinState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinStateCopyWith<$Res> {
  factory $CoinStateCopyWith(CoinState value, $Res Function(CoinState) then) =
      _$CoinStateCopyWithImpl<$Res, CoinState>;
  @useResult
  $Res call({int balance, bool isLoading, String? error});
}

/// @nodoc
class _$CoinStateCopyWithImpl<$Res, $Val extends CoinState>
    implements $CoinStateCopyWith<$Res> {
  _$CoinStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinStateImplCopyWith<$Res>
    implements $CoinStateCopyWith<$Res> {
  factory _$$CoinStateImplCopyWith(
          _$CoinStateImpl value, $Res Function(_$CoinStateImpl) then) =
      __$$CoinStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int balance, bool isLoading, String? error});
}

/// @nodoc
class __$$CoinStateImplCopyWithImpl<$Res>
    extends _$CoinStateCopyWithImpl<$Res, _$CoinStateImpl>
    implements _$$CoinStateImplCopyWith<$Res> {
  __$$CoinStateImplCopyWithImpl(
      _$CoinStateImpl _value, $Res Function(_$CoinStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoinState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$CoinStateImpl(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CoinStateImpl implements _CoinState {
  const _$CoinStateImpl({this.balance = 0, this.isLoading = false, this.error});

  @override
  @JsonKey()
  final int balance;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'CoinState(balance: $balance, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinStateImpl &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, balance, isLoading, error);

  /// Create a copy of CoinState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinStateImplCopyWith<_$CoinStateImpl> get copyWith =>
      __$$CoinStateImplCopyWithImpl<_$CoinStateImpl>(this, _$identity);
}

abstract class _CoinState implements CoinState {
  const factory _CoinState(
      {final int balance,
      final bool isLoading,
      final String? error}) = _$CoinStateImpl;

  @override
  int get balance;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of CoinState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinStateImplCopyWith<_$CoinStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
