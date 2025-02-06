// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenges_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChallengesState {
  ChallengesView get view => throw _privateConstructorUsedError;
  List<ChallengeModel> get challenges => throw _privateConstructorUsedError;
  List<ChallengeModel> get archivedChallenges =>
      throw _privateConstructorUsedError;
  List<ChallengeModel> get newChallenges => throw _privateConstructorUsedError;

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengesStateCopyWith<ChallengesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengesStateCopyWith<$Res> {
  factory $ChallengesStateCopyWith(
          ChallengesState value, $Res Function(ChallengesState) then) =
      _$ChallengesStateCopyWithImpl<$Res, ChallengesState>;
  @useResult
  $Res call(
      {ChallengesView view,
      List<ChallengeModel> challenges,
      List<ChallengeModel> archivedChallenges,
      List<ChallengeModel> newChallenges});
}

/// @nodoc
class _$ChallengesStateCopyWithImpl<$Res, $Val extends ChallengesState>
    implements $ChallengesStateCopyWith<$Res> {
  _$ChallengesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? view = null,
    Object? challenges = null,
    Object? archivedChallenges = null,
    Object? newChallenges = null,
  }) {
    return _then(_value.copyWith(
      view: null == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as ChallengesView,
      challenges: null == challenges
          ? _value.challenges
          : challenges // ignore: cast_nullable_to_non_nullable
              as List<ChallengeModel>,
      archivedChallenges: null == archivedChallenges
          ? _value.archivedChallenges
          : archivedChallenges // ignore: cast_nullable_to_non_nullable
              as List<ChallengeModel>,
      newChallenges: null == newChallenges
          ? _value.newChallenges
          : newChallenges // ignore: cast_nullable_to_non_nullable
              as List<ChallengeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengesStateImplCopyWith<$Res>
    implements $ChallengesStateCopyWith<$Res> {
  factory _$$ChallengesStateImplCopyWith(_$ChallengesStateImpl value,
          $Res Function(_$ChallengesStateImpl) then) =
      __$$ChallengesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ChallengesView view,
      List<ChallengeModel> challenges,
      List<ChallengeModel> archivedChallenges,
      List<ChallengeModel> newChallenges});
}

/// @nodoc
class __$$ChallengesStateImplCopyWithImpl<$Res>
    extends _$ChallengesStateCopyWithImpl<$Res, _$ChallengesStateImpl>
    implements _$$ChallengesStateImplCopyWith<$Res> {
  __$$ChallengesStateImplCopyWithImpl(
      _$ChallengesStateImpl _value, $Res Function(_$ChallengesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? view = null,
    Object? challenges = null,
    Object? archivedChallenges = null,
    Object? newChallenges = null,
  }) {
    return _then(_$ChallengesStateImpl(
      view: null == view
          ? _value.view
          : view // ignore: cast_nullable_to_non_nullable
              as ChallengesView,
      challenges: null == challenges
          ? _value._challenges
          : challenges // ignore: cast_nullable_to_non_nullable
              as List<ChallengeModel>,
      archivedChallenges: null == archivedChallenges
          ? _value._archivedChallenges
          : archivedChallenges // ignore: cast_nullable_to_non_nullable
              as List<ChallengeModel>,
      newChallenges: null == newChallenges
          ? _value._newChallenges
          : newChallenges // ignore: cast_nullable_to_non_nullable
              as List<ChallengeModel>,
    ));
  }
}

/// @nodoc

class _$ChallengesStateImpl implements _ChallengesState {
  const _$ChallengesStateImpl(
      {this.view = ChallengesView.mine,
      final List<ChallengeModel> challenges = const [],
      final List<ChallengeModel> archivedChallenges = const [],
      final List<ChallengeModel> newChallenges = const []})
      : _challenges = challenges,
        _archivedChallenges = archivedChallenges,
        _newChallenges = newChallenges;

  @override
  @JsonKey()
  final ChallengesView view;
  final List<ChallengeModel> _challenges;
  @override
  @JsonKey()
  List<ChallengeModel> get challenges {
    if (_challenges is EqualUnmodifiableListView) return _challenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_challenges);
  }

  final List<ChallengeModel> _archivedChallenges;
  @override
  @JsonKey()
  List<ChallengeModel> get archivedChallenges {
    if (_archivedChallenges is EqualUnmodifiableListView)
      return _archivedChallenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_archivedChallenges);
  }

  final List<ChallengeModel> _newChallenges;
  @override
  @JsonKey()
  List<ChallengeModel> get newChallenges {
    if (_newChallenges is EqualUnmodifiableListView) return _newChallenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newChallenges);
  }

  @override
  String toString() {
    return 'ChallengesState(view: $view, challenges: $challenges, archivedChallenges: $archivedChallenges, newChallenges: $newChallenges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengesStateImpl &&
            (identical(other.view, view) || other.view == view) &&
            const DeepCollectionEquality()
                .equals(other._challenges, _challenges) &&
            const DeepCollectionEquality()
                .equals(other._archivedChallenges, _archivedChallenges) &&
            const DeepCollectionEquality()
                .equals(other._newChallenges, _newChallenges));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      view,
      const DeepCollectionEquality().hash(_challenges),
      const DeepCollectionEquality().hash(_archivedChallenges),
      const DeepCollectionEquality().hash(_newChallenges));

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengesStateImplCopyWith<_$ChallengesStateImpl> get copyWith =>
      __$$ChallengesStateImplCopyWithImpl<_$ChallengesStateImpl>(
          this, _$identity);
}

abstract class _ChallengesState implements ChallengesState {
  const factory _ChallengesState(
      {final ChallengesView view,
      final List<ChallengeModel> challenges,
      final List<ChallengeModel> archivedChallenges,
      final List<ChallengeModel> newChallenges}) = _$ChallengesStateImpl;

  @override
  ChallengesView get view;
  @override
  List<ChallengeModel> get challenges;
  @override
  List<ChallengeModel> get archivedChallenges;
  @override
  List<ChallengeModel> get newChallenges;

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengesStateImplCopyWith<_$ChallengesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
