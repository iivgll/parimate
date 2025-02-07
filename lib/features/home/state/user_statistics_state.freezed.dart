// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_statistics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserStatisticsState {
  List<UserStatisticsItem> get challenges => throw _privateConstructorUsedError;
  double get completionPercentage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of UserStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatisticsStateCopyWith<UserStatisticsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatisticsStateCopyWith<$Res> {
  factory $UserStatisticsStateCopyWith(
          UserStatisticsState value, $Res Function(UserStatisticsState) then) =
      _$UserStatisticsStateCopyWithImpl<$Res, UserStatisticsState>;
  @useResult
  $Res call(
      {List<UserStatisticsItem> challenges,
      double completionPercentage,
      bool isLoading});
}

/// @nodoc
class _$UserStatisticsStateCopyWithImpl<$Res, $Val extends UserStatisticsState>
    implements $UserStatisticsStateCopyWith<$Res> {
  _$UserStatisticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challenges = null,
    Object? completionPercentage = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      challenges: null == challenges
          ? _value.challenges
          : challenges // ignore: cast_nullable_to_non_nullable
              as List<UserStatisticsItem>,
      completionPercentage: null == completionPercentage
          ? _value.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatisticsStateImplCopyWith<$Res>
    implements $UserStatisticsStateCopyWith<$Res> {
  factory _$$UserStatisticsStateImplCopyWith(_$UserStatisticsStateImpl value,
          $Res Function(_$UserStatisticsStateImpl) then) =
      __$$UserStatisticsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UserStatisticsItem> challenges,
      double completionPercentage,
      bool isLoading});
}

/// @nodoc
class __$$UserStatisticsStateImplCopyWithImpl<$Res>
    extends _$UserStatisticsStateCopyWithImpl<$Res, _$UserStatisticsStateImpl>
    implements _$$UserStatisticsStateImplCopyWith<$Res> {
  __$$UserStatisticsStateImplCopyWithImpl(_$UserStatisticsStateImpl _value,
      $Res Function(_$UserStatisticsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challenges = null,
    Object? completionPercentage = null,
    Object? isLoading = null,
  }) {
    return _then(_$UserStatisticsStateImpl(
      challenges: null == challenges
          ? _value._challenges
          : challenges // ignore: cast_nullable_to_non_nullable
              as List<UserStatisticsItem>,
      completionPercentage: null == completionPercentage
          ? _value.completionPercentage
          : completionPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserStatisticsStateImpl implements _UserStatisticsState {
  const _$UserStatisticsStateImpl(
      {final List<UserStatisticsItem> challenges = const [],
      this.completionPercentage = 0.0,
      this.isLoading = true})
      : _challenges = challenges;

  final List<UserStatisticsItem> _challenges;
  @override
  @JsonKey()
  List<UserStatisticsItem> get challenges {
    if (_challenges is EqualUnmodifiableListView) return _challenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_challenges);
  }

  @override
  @JsonKey()
  final double completionPercentage;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'UserStatisticsState(challenges: $challenges, completionPercentage: $completionPercentage, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatisticsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._challenges, _challenges) &&
            (identical(other.completionPercentage, completionPercentage) ||
                other.completionPercentage == completionPercentage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_challenges),
      completionPercentage,
      isLoading);

  /// Create a copy of UserStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatisticsStateImplCopyWith<_$UserStatisticsStateImpl> get copyWith =>
      __$$UserStatisticsStateImplCopyWithImpl<_$UserStatisticsStateImpl>(
          this, _$identity);
}

abstract class _UserStatisticsState implements UserStatisticsState {
  const factory _UserStatisticsState(
      {final List<UserStatisticsItem> challenges,
      final double completionPercentage,
      final bool isLoading}) = _$UserStatisticsStateImpl;

  @override
  List<UserStatisticsItem> get challenges;
  @override
  double get completionPercentage;
  @override
  bool get isLoading;

  /// Create a copy of UserStatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatisticsStateImplCopyWith<_$UserStatisticsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
