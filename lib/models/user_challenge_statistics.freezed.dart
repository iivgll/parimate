// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_challenge_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserChallengeStatisticsSchema _$UserChallengeStatisticsSchemaFromJson(
    Map<String, dynamic> json) {
  return _UserChallengeStatisticsSchema.fromJson(json);
}

/// @nodoc
mixin _$UserChallengeStatisticsSchema {
  /// Статистика по неделям
  @JsonKey(name: 'user_statistics')
  List<WeekStatistics> get weeklyStats => throw _privateConstructorUsedError;

  /// Serializes this UserChallengeStatisticsSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserChallengeStatisticsSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserChallengeStatisticsSchemaCopyWith<UserChallengeStatisticsSchema>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserChallengeStatisticsSchemaCopyWith<$Res> {
  factory $UserChallengeStatisticsSchemaCopyWith(
          UserChallengeStatisticsSchema value,
          $Res Function(UserChallengeStatisticsSchema) then) =
      _$UserChallengeStatisticsSchemaCopyWithImpl<$Res,
          UserChallengeStatisticsSchema>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_statistics') List<WeekStatistics> weeklyStats});
}

/// @nodoc
class _$UserChallengeStatisticsSchemaCopyWithImpl<$Res,
        $Val extends UserChallengeStatisticsSchema>
    implements $UserChallengeStatisticsSchemaCopyWith<$Res> {
  _$UserChallengeStatisticsSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserChallengeStatisticsSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weeklyStats = null,
  }) {
    return _then(_value.copyWith(
      weeklyStats: null == weeklyStats
          ? _value.weeklyStats
          : weeklyStats // ignore: cast_nullable_to_non_nullable
              as List<WeekStatistics>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserChallengeStatisticsSchemaImplCopyWith<$Res>
    implements $UserChallengeStatisticsSchemaCopyWith<$Res> {
  factory _$$UserChallengeStatisticsSchemaImplCopyWith(
          _$UserChallengeStatisticsSchemaImpl value,
          $Res Function(_$UserChallengeStatisticsSchemaImpl) then) =
      __$$UserChallengeStatisticsSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_statistics') List<WeekStatistics> weeklyStats});
}

/// @nodoc
class __$$UserChallengeStatisticsSchemaImplCopyWithImpl<$Res>
    extends _$UserChallengeStatisticsSchemaCopyWithImpl<$Res,
        _$UserChallengeStatisticsSchemaImpl>
    implements _$$UserChallengeStatisticsSchemaImplCopyWith<$Res> {
  __$$UserChallengeStatisticsSchemaImplCopyWithImpl(
      _$UserChallengeStatisticsSchemaImpl _value,
      $Res Function(_$UserChallengeStatisticsSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserChallengeStatisticsSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weeklyStats = null,
  }) {
    return _then(_$UserChallengeStatisticsSchemaImpl(
      weeklyStats: null == weeklyStats
          ? _value._weeklyStats
          : weeklyStats // ignore: cast_nullable_to_non_nullable
              as List<WeekStatistics>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserChallengeStatisticsSchemaImpl
    implements _UserChallengeStatisticsSchema {
  const _$UserChallengeStatisticsSchemaImpl(
      {@JsonKey(name: 'user_statistics')
      final List<WeekStatistics> weeklyStats = const []})
      : _weeklyStats = weeklyStats;

  factory _$UserChallengeStatisticsSchemaImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserChallengeStatisticsSchemaImplFromJson(json);

  /// Статистика по неделям
  final List<WeekStatistics> _weeklyStats;

  /// Статистика по неделям
  @override
  @JsonKey(name: 'user_statistics')
  List<WeekStatistics> get weeklyStats {
    if (_weeklyStats is EqualUnmodifiableListView) return _weeklyStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyStats);
  }

  @override
  String toString() {
    return 'UserChallengeStatisticsSchema(weeklyStats: $weeklyStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserChallengeStatisticsSchemaImpl &&
            const DeepCollectionEquality()
                .equals(other._weeklyStats, _weeklyStats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_weeklyStats));

  /// Create a copy of UserChallengeStatisticsSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserChallengeStatisticsSchemaImplCopyWith<
          _$UserChallengeStatisticsSchemaImpl>
      get copyWith => __$$UserChallengeStatisticsSchemaImplCopyWithImpl<
          _$UserChallengeStatisticsSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserChallengeStatisticsSchemaImplToJson(
      this,
    );
  }
}

abstract class _UserChallengeStatisticsSchema
    implements UserChallengeStatisticsSchema {
  const factory _UserChallengeStatisticsSchema(
          {@JsonKey(name: 'user_statistics')
          final List<WeekStatistics> weeklyStats}) =
      _$UserChallengeStatisticsSchemaImpl;

  factory _UserChallengeStatisticsSchema.fromJson(Map<String, dynamic> json) =
      _$UserChallengeStatisticsSchemaImpl.fromJson;

  /// Статистика по неделям
  @override
  @JsonKey(name: 'user_statistics')
  List<WeekStatistics> get weeklyStats;

  /// Create a copy of UserChallengeStatisticsSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserChallengeStatisticsSchemaImplCopyWith<
          _$UserChallengeStatisticsSchemaImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WeekStatistics _$WeekStatisticsFromJson(Map<String, dynamic> json) {
  return _WeekStatistics.fromJson(json);
}

/// @nodoc
mixin _$WeekStatistics {
  /// Номер недели
  @JsonKey(name: 'week_num')
  int get weekNumber => throw _privateConstructorUsedError;

  /// Ожидаемое количество подтверждений
  int get expected => throw _privateConstructorUsedError;

  /// Количество одобренных подтверждений
  int get approved => throw _privateConstructorUsedError;

  /// Serializes this WeekStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeekStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeekStatisticsCopyWith<WeekStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekStatisticsCopyWith<$Res> {
  factory $WeekStatisticsCopyWith(
          WeekStatistics value, $Res Function(WeekStatistics) then) =
      _$WeekStatisticsCopyWithImpl<$Res, WeekStatistics>;
  @useResult
  $Res call(
      {@JsonKey(name: 'week_num') int weekNumber, int expected, int approved});
}

/// @nodoc
class _$WeekStatisticsCopyWithImpl<$Res, $Val extends WeekStatistics>
    implements $WeekStatisticsCopyWith<$Res> {
  _$WeekStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeekStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekNumber = null,
    Object? expected = null,
    Object? approved = null,
  }) {
    return _then(_value.copyWith(
      weekNumber: null == weekNumber
          ? _value.weekNumber
          : weekNumber // ignore: cast_nullable_to_non_nullable
              as int,
      expected: null == expected
          ? _value.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as int,
      approved: null == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeekStatisticsImplCopyWith<$Res>
    implements $WeekStatisticsCopyWith<$Res> {
  factory _$$WeekStatisticsImplCopyWith(_$WeekStatisticsImpl value,
          $Res Function(_$WeekStatisticsImpl) then) =
      __$$WeekStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'week_num') int weekNumber, int expected, int approved});
}

/// @nodoc
class __$$WeekStatisticsImplCopyWithImpl<$Res>
    extends _$WeekStatisticsCopyWithImpl<$Res, _$WeekStatisticsImpl>
    implements _$$WeekStatisticsImplCopyWith<$Res> {
  __$$WeekStatisticsImplCopyWithImpl(
      _$WeekStatisticsImpl _value, $Res Function(_$WeekStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeekStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekNumber = null,
    Object? expected = null,
    Object? approved = null,
  }) {
    return _then(_$WeekStatisticsImpl(
      weekNumber: null == weekNumber
          ? _value.weekNumber
          : weekNumber // ignore: cast_nullable_to_non_nullable
              as int,
      expected: null == expected
          ? _value.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as int,
      approved: null == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeekStatisticsImpl implements _WeekStatistics {
  const _$WeekStatisticsImpl(
      {@JsonKey(name: 'week_num') required this.weekNumber,
      required this.expected,
      required this.approved});

  factory _$WeekStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekStatisticsImplFromJson(json);

  /// Номер недели
  @override
  @JsonKey(name: 'week_num')
  final int weekNumber;

  /// Ожидаемое количество подтверждений
  @override
  final int expected;

  /// Количество одобренных подтверждений
  @override
  final int approved;

  @override
  String toString() {
    return 'WeekStatistics(weekNumber: $weekNumber, expected: $expected, approved: $approved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekStatisticsImpl &&
            (identical(other.weekNumber, weekNumber) ||
                other.weekNumber == weekNumber) &&
            (identical(other.expected, expected) ||
                other.expected == expected) &&
            (identical(other.approved, approved) ||
                other.approved == approved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, weekNumber, expected, approved);

  /// Create a copy of WeekStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekStatisticsImplCopyWith<_$WeekStatisticsImpl> get copyWith =>
      __$$WeekStatisticsImplCopyWithImpl<_$WeekStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeekStatisticsImplToJson(
      this,
    );
  }
}

abstract class _WeekStatistics implements WeekStatistics {
  const factory _WeekStatistics(
      {@JsonKey(name: 'week_num') required final int weekNumber,
      required final int expected,
      required final int approved}) = _$WeekStatisticsImpl;

  factory _WeekStatistics.fromJson(Map<String, dynamic> json) =
      _$WeekStatisticsImpl.fromJson;

  /// Номер недели
  @override
  @JsonKey(name: 'week_num')
  int get weekNumber;

  /// Ожидаемое количество подтверждений
  @override
  int get expected;

  /// Количество одобренных подтверждений
  @override
  int get approved;

  /// Create a copy of WeekStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeekStatisticsImplCopyWith<_$WeekStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
