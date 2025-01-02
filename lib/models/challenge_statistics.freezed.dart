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

ChallengeStatisticsSchema _$ChallengeStatisticsSchemaFromJson(
    Map<String, dynamic> json) {
  return _ChallengeStatisticsSchema.fromJson(json);
}

/// @nodoc
mixin _$ChallengeStatisticsSchema {
  List<UserResponsesSchema> get userStatistics =>
      throw _privateConstructorUsedError;
  int get expected => throw _privateConstructorUsedError;

  /// Serializes this ChallengeStatisticsSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChallengeStatisticsSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengeStatisticsSchemaCopyWith<ChallengeStatisticsSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeStatisticsSchemaCopyWith<$Res> {
  factory $ChallengeStatisticsSchemaCopyWith(ChallengeStatisticsSchema value,
          $Res Function(ChallengeStatisticsSchema) then) =
      _$ChallengeStatisticsSchemaCopyWithImpl<$Res, ChallengeStatisticsSchema>;
  @useResult
  $Res call({List<UserResponsesSchema> userStatistics, int expected});
}

/// @nodoc
class _$ChallengeStatisticsSchemaCopyWithImpl<$Res,
        $Val extends ChallengeStatisticsSchema>
    implements $ChallengeStatisticsSchemaCopyWith<$Res> {
  _$ChallengeStatisticsSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengeStatisticsSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userStatistics = null,
    Object? expected = null,
  }) {
    return _then(_value.copyWith(
      userStatistics: null == userStatistics
          ? _value.userStatistics
          : userStatistics // ignore: cast_nullable_to_non_nullable
              as List<UserResponsesSchema>,
      expected: null == expected
          ? _value.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeStatisticsSchemaImplCopyWith<$Res>
    implements $ChallengeStatisticsSchemaCopyWith<$Res> {
  factory _$$ChallengeStatisticsSchemaImplCopyWith(
          _$ChallengeStatisticsSchemaImpl value,
          $Res Function(_$ChallengeStatisticsSchemaImpl) then) =
      __$$ChallengeStatisticsSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserResponsesSchema> userStatistics, int expected});
}

/// @nodoc
class __$$ChallengeStatisticsSchemaImplCopyWithImpl<$Res>
    extends _$ChallengeStatisticsSchemaCopyWithImpl<$Res,
        _$ChallengeStatisticsSchemaImpl>
    implements _$$ChallengeStatisticsSchemaImplCopyWith<$Res> {
  __$$ChallengeStatisticsSchemaImplCopyWithImpl(
      _$ChallengeStatisticsSchemaImpl _value,
      $Res Function(_$ChallengeStatisticsSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeStatisticsSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userStatistics = null,
    Object? expected = null,
  }) {
    return _then(_$ChallengeStatisticsSchemaImpl(
      userStatistics: null == userStatistics
          ? _value._userStatistics
          : userStatistics // ignore: cast_nullable_to_non_nullable
              as List<UserResponsesSchema>,
      expected: null == expected
          ? _value.expected
          : expected // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeStatisticsSchemaImpl implements _ChallengeStatisticsSchema {
  const _$ChallengeStatisticsSchemaImpl(
      {required final List<UserResponsesSchema> userStatistics,
      required this.expected})
      : _userStatistics = userStatistics;

  factory _$ChallengeStatisticsSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeStatisticsSchemaImplFromJson(json);

  final List<UserResponsesSchema> _userStatistics;
  @override
  List<UserResponsesSchema> get userStatistics {
    if (_userStatistics is EqualUnmodifiableListView) return _userStatistics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userStatistics);
  }

  @override
  final int expected;

  @override
  String toString() {
    return 'ChallengeStatisticsSchema(userStatistics: $userStatistics, expected: $expected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeStatisticsSchemaImpl &&
            const DeepCollectionEquality()
                .equals(other._userStatistics, _userStatistics) &&
            (identical(other.expected, expected) ||
                other.expected == expected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_userStatistics), expected);

  /// Create a copy of ChallengeStatisticsSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeStatisticsSchemaImplCopyWith<_$ChallengeStatisticsSchemaImpl>
      get copyWith => __$$ChallengeStatisticsSchemaImplCopyWithImpl<
          _$ChallengeStatisticsSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeStatisticsSchemaImplToJson(
      this,
    );
  }
}

abstract class _ChallengeStatisticsSchema implements ChallengeStatisticsSchema {
  const factory _ChallengeStatisticsSchema(
      {required final List<UserResponsesSchema> userStatistics,
      required final int expected}) = _$ChallengeStatisticsSchemaImpl;

  factory _ChallengeStatisticsSchema.fromJson(Map<String, dynamic> json) =
      _$ChallengeStatisticsSchemaImpl.fromJson;

  @override
  List<UserResponsesSchema> get userStatistics;
  @override
  int get expected;

  /// Create a copy of ChallengeStatisticsSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeStatisticsSchemaImplCopyWith<_$ChallengeStatisticsSchemaImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserResponsesSchema _$UserResponsesSchemaFromJson(Map<String, dynamic> json) {
  return _UserResponsesSchema.fromJson(json);
}

/// @nodoc
mixin _$UserResponsesSchema {
  String get name => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  int get approved => throw _privateConstructorUsedError;

  /// Serializes this UserResponsesSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserResponsesSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserResponsesSchemaCopyWith<UserResponsesSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponsesSchemaCopyWith<$Res> {
  factory $UserResponsesSchemaCopyWith(
          UserResponsesSchema value, $Res Function(UserResponsesSchema) then) =
      _$UserResponsesSchemaCopyWithImpl<$Res, UserResponsesSchema>;
  @useResult
  $Res call({String name, bool active, int approved});
}

/// @nodoc
class _$UserResponsesSchemaCopyWithImpl<$Res, $Val extends UserResponsesSchema>
    implements $UserResponsesSchemaCopyWith<$Res> {
  _$UserResponsesSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserResponsesSchema
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
abstract class _$$UserResponsesSchemaImplCopyWith<$Res>
    implements $UserResponsesSchemaCopyWith<$Res> {
  factory _$$UserResponsesSchemaImplCopyWith(_$UserResponsesSchemaImpl value,
          $Res Function(_$UserResponsesSchemaImpl) then) =
      __$$UserResponsesSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool active, int approved});
}

/// @nodoc
class __$$UserResponsesSchemaImplCopyWithImpl<$Res>
    extends _$UserResponsesSchemaCopyWithImpl<$Res, _$UserResponsesSchemaImpl>
    implements _$$UserResponsesSchemaImplCopyWith<$Res> {
  __$$UserResponsesSchemaImplCopyWithImpl(_$UserResponsesSchemaImpl _value,
      $Res Function(_$UserResponsesSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserResponsesSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? active = null,
    Object? approved = null,
  }) {
    return _then(_$UserResponsesSchemaImpl(
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
class _$UserResponsesSchemaImpl implements _UserResponsesSchema {
  const _$UserResponsesSchemaImpl(
      {required this.name, required this.active, required this.approved});

  factory _$UserResponsesSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponsesSchemaImplFromJson(json);

  @override
  final String name;
  @override
  final bool active;
  @override
  final int approved;

  @override
  String toString() {
    return 'UserResponsesSchema(name: $name, active: $active, approved: $approved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponsesSchemaImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.approved, approved) ||
                other.approved == approved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, active, approved);

  /// Create a copy of UserResponsesSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResponsesSchemaImplCopyWith<_$UserResponsesSchemaImpl> get copyWith =>
      __$$UserResponsesSchemaImplCopyWithImpl<_$UserResponsesSchemaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponsesSchemaImplToJson(
      this,
    );
  }
}

abstract class _UserResponsesSchema implements UserResponsesSchema {
  const factory _UserResponsesSchema(
      {required final String name,
      required final bool active,
      required final int approved}) = _$UserResponsesSchemaImpl;

  factory _UserResponsesSchema.fromJson(Map<String, dynamic> json) =
      _$UserResponsesSchemaImpl.fromJson;

  @override
  String get name;
  @override
  bool get active;
  @override
  int get approved;

  /// Create a copy of UserResponsesSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserResponsesSchemaImplCopyWith<_$UserResponsesSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
