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
  List<WeekResponsesSchema> get userStatistics =>
      throw _privateConstructorUsedError;

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
  $Res call({List<WeekResponsesSchema> userStatistics});
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
    Object? userStatistics = null,
  }) {
    return _then(_value.copyWith(
      userStatistics: null == userStatistics
          ? _value.userStatistics
          : userStatistics // ignore: cast_nullable_to_non_nullable
              as List<WeekResponsesSchema>,
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
  $Res call({List<WeekResponsesSchema> userStatistics});
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
    Object? userStatistics = null,
  }) {
    return _then(_$UserChallengeStatisticsSchemaImpl(
      userStatistics: null == userStatistics
          ? _value._userStatistics
          : userStatistics // ignore: cast_nullable_to_non_nullable
              as List<WeekResponsesSchema>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserChallengeStatisticsSchemaImpl
    implements _UserChallengeStatisticsSchema {
  const _$UserChallengeStatisticsSchemaImpl(
      {required final List<WeekResponsesSchema> userStatistics})
      : _userStatistics = userStatistics;

  factory _$UserChallengeStatisticsSchemaImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserChallengeStatisticsSchemaImplFromJson(json);

  final List<WeekResponsesSchema> _userStatistics;
  @override
  List<WeekResponsesSchema> get userStatistics {
    if (_userStatistics is EqualUnmodifiableListView) return _userStatistics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userStatistics);
  }

  @override
  String toString() {
    return 'UserChallengeStatisticsSchema(userStatistics: $userStatistics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserChallengeStatisticsSchemaImpl &&
            const DeepCollectionEquality()
                .equals(other._userStatistics, _userStatistics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userStatistics));

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
          {required final List<WeekResponsesSchema> userStatistics}) =
      _$UserChallengeStatisticsSchemaImpl;

  factory _UserChallengeStatisticsSchema.fromJson(Map<String, dynamic> json) =
      _$UserChallengeStatisticsSchemaImpl.fromJson;

  @override
  List<WeekResponsesSchema> get userStatistics;

  /// Create a copy of UserChallengeStatisticsSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserChallengeStatisticsSchemaImplCopyWith<
          _$UserChallengeStatisticsSchemaImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WeekResponsesSchema _$WeekResponsesSchemaFromJson(Map<String, dynamic> json) {
  return _WeekResponsesSchema.fromJson(json);
}

/// @nodoc
mixin _$WeekResponsesSchema {
  int get weekNum => throw _privateConstructorUsedError;
  int get expected => throw _privateConstructorUsedError;
  int get approved => throw _privateConstructorUsedError;

  /// Serializes this WeekResponsesSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeekResponsesSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeekResponsesSchemaCopyWith<WeekResponsesSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekResponsesSchemaCopyWith<$Res> {
  factory $WeekResponsesSchemaCopyWith(
          WeekResponsesSchema value, $Res Function(WeekResponsesSchema) then) =
      _$WeekResponsesSchemaCopyWithImpl<$Res, WeekResponsesSchema>;
  @useResult
  $Res call({int weekNum, int expected, int approved});
}

/// @nodoc
class _$WeekResponsesSchemaCopyWithImpl<$Res, $Val extends WeekResponsesSchema>
    implements $WeekResponsesSchemaCopyWith<$Res> {
  _$WeekResponsesSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeekResponsesSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekNum = null,
    Object? expected = null,
    Object? approved = null,
  }) {
    return _then(_value.copyWith(
      weekNum: null == weekNum
          ? _value.weekNum
          : weekNum // ignore: cast_nullable_to_non_nullable
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
abstract class _$$WeekResponsesSchemaImplCopyWith<$Res>
    implements $WeekResponsesSchemaCopyWith<$Res> {
  factory _$$WeekResponsesSchemaImplCopyWith(_$WeekResponsesSchemaImpl value,
          $Res Function(_$WeekResponsesSchemaImpl) then) =
      __$$WeekResponsesSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int weekNum, int expected, int approved});
}

/// @nodoc
class __$$WeekResponsesSchemaImplCopyWithImpl<$Res>
    extends _$WeekResponsesSchemaCopyWithImpl<$Res, _$WeekResponsesSchemaImpl>
    implements _$$WeekResponsesSchemaImplCopyWith<$Res> {
  __$$WeekResponsesSchemaImplCopyWithImpl(_$WeekResponsesSchemaImpl _value,
      $Res Function(_$WeekResponsesSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeekResponsesSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekNum = null,
    Object? expected = null,
    Object? approved = null,
  }) {
    return _then(_$WeekResponsesSchemaImpl(
      weekNum: null == weekNum
          ? _value.weekNum
          : weekNum // ignore: cast_nullable_to_non_nullable
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
class _$WeekResponsesSchemaImpl implements _WeekResponsesSchema {
  const _$WeekResponsesSchemaImpl(
      {required this.weekNum, required this.expected, required this.approved});

  factory _$WeekResponsesSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekResponsesSchemaImplFromJson(json);

  @override
  final int weekNum;
  @override
  final int expected;
  @override
  final int approved;

  @override
  String toString() {
    return 'WeekResponsesSchema(weekNum: $weekNum, expected: $expected, approved: $approved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekResponsesSchemaImpl &&
            (identical(other.weekNum, weekNum) || other.weekNum == weekNum) &&
            (identical(other.expected, expected) ||
                other.expected == expected) &&
            (identical(other.approved, approved) ||
                other.approved == approved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, weekNum, expected, approved);

  /// Create a copy of WeekResponsesSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekResponsesSchemaImplCopyWith<_$WeekResponsesSchemaImpl> get copyWith =>
      __$$WeekResponsesSchemaImplCopyWithImpl<_$WeekResponsesSchemaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeekResponsesSchemaImplToJson(
      this,
    );
  }
}

abstract class _WeekResponsesSchema implements WeekResponsesSchema {
  const factory _WeekResponsesSchema(
      {required final int weekNum,
      required final int expected,
      required final int approved}) = _$WeekResponsesSchemaImpl;

  factory _WeekResponsesSchema.fromJson(Map<String, dynamic> json) =
      _$WeekResponsesSchemaImpl.fromJson;

  @override
  int get weekNum;
  @override
  int get expected;
  @override
  int get approved;

  /// Create a copy of WeekResponsesSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeekResponsesSchemaImplCopyWith<_$WeekResponsesSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
