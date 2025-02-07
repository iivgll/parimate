// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeStatistics _$ChallengeStatisticsFromJson(Map<String, dynamic> json) {
  return _ChallengeStatistics.fromJson(json);
}

/// @nodoc
mixin _$ChallengeStatistics {
  @JsonKey(name: 'user_statistics')
  List<UserStatistics> get participants => throw _privateConstructorUsedError;
  int get expected => throw _privateConstructorUsedError;

  /// Serializes this ChallengeStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChallengeStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengeStatisticsCopyWith<ChallengeStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeStatisticsCopyWith<$Res> {
  factory $ChallengeStatisticsCopyWith(
          ChallengeStatistics value, $Res Function(ChallengeStatistics) then) =
      _$ChallengeStatisticsCopyWithImpl<$Res, ChallengeStatistics>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_statistics') List<UserStatistics> participants,
      int expected});
}

/// @nodoc
class _$ChallengeStatisticsCopyWithImpl<$Res, $Val extends ChallengeStatistics>
    implements $ChallengeStatisticsCopyWith<$Res> {
  _$ChallengeStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengeStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participants = null,
    Object? expected = null,
  }) {
    return _then(_value.copyWith(
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<UserStatistics>,
      expected: null == expected
          ? _value.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeStatisticsImplCopyWith<$Res>
    implements $ChallengeStatisticsCopyWith<$Res> {
  factory _$$ChallengeStatisticsImplCopyWith(_$ChallengeStatisticsImpl value,
          $Res Function(_$ChallengeStatisticsImpl) then) =
      __$$ChallengeStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_statistics') List<UserStatistics> participants,
      int expected});
}

/// @nodoc
class __$$ChallengeStatisticsImplCopyWithImpl<$Res>
    extends _$ChallengeStatisticsCopyWithImpl<$Res, _$ChallengeStatisticsImpl>
    implements _$$ChallengeStatisticsImplCopyWith<$Res> {
  __$$ChallengeStatisticsImplCopyWithImpl(_$ChallengeStatisticsImpl _value,
      $Res Function(_$ChallengeStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participants = null,
    Object? expected = null,
  }) {
    return _then(_$ChallengeStatisticsImpl(
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<UserStatistics>,
      expected: null == expected
          ? _value.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeStatisticsImpl implements _ChallengeStatistics {
  const _$ChallengeStatisticsImpl(
      {@JsonKey(name: 'user_statistics')
      final List<UserStatistics> participants = const [],
      required this.expected})
      : _participants = participants;

  factory _$ChallengeStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeStatisticsImplFromJson(json);

  final List<UserStatistics> _participants;
  @override
  @JsonKey(name: 'user_statistics')
  List<UserStatistics> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  final int expected;

  @override
  String toString() {
    return 'ChallengeStatistics(participants: $participants, expected: $expected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeStatisticsImpl &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants) &&
            (identical(other.expected, expected) ||
                other.expected == expected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_participants), expected);

  /// Create a copy of ChallengeStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeStatisticsImplCopyWith<_$ChallengeStatisticsImpl> get copyWith =>
      __$$ChallengeStatisticsImplCopyWithImpl<_$ChallengeStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeStatisticsImplToJson(
      this,
    );
  }
}

abstract class _ChallengeStatistics implements ChallengeStatistics {
  const factory _ChallengeStatistics(
      {@JsonKey(name: 'user_statistics')
      final List<UserStatistics> participants,
      required final int expected}) = _$ChallengeStatisticsImpl;

  factory _ChallengeStatistics.fromJson(Map<String, dynamic> json) =
      _$ChallengeStatisticsImpl.fromJson;

  @override
  @JsonKey(name: 'user_statistics')
  List<UserStatistics> get participants;
  @override
  int get expected;

  /// Create a copy of ChallengeStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeStatisticsImplCopyWith<_$ChallengeStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserStatistics _$UserStatisticsFromJson(Map<String, dynamic> json) {
  return _UserStatistics.fromJson(json);
}

/// @nodoc
mixin _$UserStatistics {
  String get name => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  int get approved => throw _privateConstructorUsedError;

  /// Serializes this UserStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatisticsCopyWith<UserStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatisticsCopyWith<$Res> {
  factory $UserStatisticsCopyWith(
          UserStatistics value, $Res Function(UserStatistics) then) =
      _$UserStatisticsCopyWithImpl<$Res, UserStatistics>;
  @useResult
  $Res call({String name, bool active, int approved});
}

/// @nodoc
class _$UserStatisticsCopyWithImpl<$Res, $Val extends UserStatistics>
    implements $UserStatisticsCopyWith<$Res> {
  _$UserStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? active = null,
    Object? approved = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      approved: null == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatisticsImplCopyWith<$Res>
    implements $UserStatisticsCopyWith<$Res> {
  factory _$$UserStatisticsImplCopyWith(_$UserStatisticsImpl value,
          $Res Function(_$UserStatisticsImpl) then) =
      __$$UserStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool active, int approved});
}

/// @nodoc
class __$$UserStatisticsImplCopyWithImpl<$Res>
    extends _$UserStatisticsCopyWithImpl<$Res, _$UserStatisticsImpl>
    implements _$$UserStatisticsImplCopyWith<$Res> {
  __$$UserStatisticsImplCopyWithImpl(
      _$UserStatisticsImpl _value, $Res Function(_$UserStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? active = null,
    Object? approved = null,
  }) {
    return _then(_$UserStatisticsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      approved: null == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatisticsImpl implements _UserStatistics {
  const _$UserStatisticsImpl(
      {required this.name, required this.active, required this.approved});

  factory _$UserStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatisticsImplFromJson(json);

  @override
  final String name;
  @override
  final bool active;
  @override
  final int approved;

  @override
  String toString() {
    return 'UserStatistics(name: $name, active: $active, approved: $approved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatisticsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.approved, approved) ||
                other.approved == approved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, active, approved);

  /// Create a copy of UserStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatisticsImplCopyWith<_$UserStatisticsImpl> get copyWith =>
      __$$UserStatisticsImplCopyWithImpl<_$UserStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatisticsImplToJson(
      this,
    );
  }
}

abstract class _UserStatistics implements UserStatistics {
  const factory _UserStatistics(
      {required final String name,
      required final bool active,
      required final int approved}) = _$UserStatisticsImpl;

  factory _UserStatistics.fromJson(Map<String, dynamic> json) =
      _$UserStatisticsImpl.fromJson;

  @override
  String get name;
  @override
  bool get active;
  @override
  int get approved;

  /// Create a copy of UserStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatisticsImplCopyWith<_$UserStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
