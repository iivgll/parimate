// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserStatisticsSchema _$UserStatisticsSchemaFromJson(Map<String, dynamic> json) {
  return _UserStatisticsSchema.fromJson(json);
}

/// @nodoc
mixin _$UserStatisticsSchema {
  List<ChallengeResponseSchema> get userStatistics =>
      throw _privateConstructorUsedError;

  /// Serializes this UserStatisticsSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStatisticsSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatisticsSchemaCopyWith<UserStatisticsSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatisticsSchemaCopyWith<$Res> {
  factory $UserStatisticsSchemaCopyWith(UserStatisticsSchema value,
          $Res Function(UserStatisticsSchema) then) =
      _$UserStatisticsSchemaCopyWithImpl<$Res, UserStatisticsSchema>;
  @useResult
  $Res call({List<ChallengeResponseSchema> userStatistics});
}

/// @nodoc
class _$UserStatisticsSchemaCopyWithImpl<$Res,
        $Val extends UserStatisticsSchema>
    implements $UserStatisticsSchemaCopyWith<$Res> {
  _$UserStatisticsSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStatisticsSchema
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
              as List<ChallengeResponseSchema>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatisticsSchemaImplCopyWith<$Res>
    implements $UserStatisticsSchemaCopyWith<$Res> {
  factory _$$UserStatisticsSchemaImplCopyWith(_$UserStatisticsSchemaImpl value,
          $Res Function(_$UserStatisticsSchemaImpl) then) =
      __$$UserStatisticsSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChallengeResponseSchema> userStatistics});
}

/// @nodoc
class __$$UserStatisticsSchemaImplCopyWithImpl<$Res>
    extends _$UserStatisticsSchemaCopyWithImpl<$Res, _$UserStatisticsSchemaImpl>
    implements _$$UserStatisticsSchemaImplCopyWith<$Res> {
  __$$UserStatisticsSchemaImplCopyWithImpl(_$UserStatisticsSchemaImpl _value,
      $Res Function(_$UserStatisticsSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStatisticsSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userStatistics = null,
  }) {
    return _then(_$UserStatisticsSchemaImpl(
      userStatistics: null == userStatistics
          ? _value._userStatistics
          : userStatistics // ignore: cast_nullable_to_non_nullable
              as List<ChallengeResponseSchema>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatisticsSchemaImpl implements _UserStatisticsSchema {
  const _$UserStatisticsSchemaImpl(
      {required final List<ChallengeResponseSchema> userStatistics})
      : _userStatistics = userStatistics;

  factory _$UserStatisticsSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatisticsSchemaImplFromJson(json);

  final List<ChallengeResponseSchema> _userStatistics;
  @override
  List<ChallengeResponseSchema> get userStatistics {
    if (_userStatistics is EqualUnmodifiableListView) return _userStatistics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userStatistics);
  }

  @override
  String toString() {
    return 'UserStatisticsSchema(userStatistics: $userStatistics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatisticsSchemaImpl &&
            const DeepCollectionEquality()
                .equals(other._userStatistics, _userStatistics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userStatistics));

  /// Create a copy of UserStatisticsSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatisticsSchemaImplCopyWith<_$UserStatisticsSchemaImpl>
      get copyWith =>
          __$$UserStatisticsSchemaImplCopyWithImpl<_$UserStatisticsSchemaImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatisticsSchemaImplToJson(
      this,
    );
  }
}

abstract class _UserStatisticsSchema implements UserStatisticsSchema {
  const factory _UserStatisticsSchema(
          {required final List<ChallengeResponseSchema> userStatistics}) =
      _$UserStatisticsSchemaImpl;

  factory _UserStatisticsSchema.fromJson(Map<String, dynamic> json) =
      _$UserStatisticsSchemaImpl.fromJson;

  @override
  List<ChallengeResponseSchema> get userStatistics;

  /// Create a copy of UserStatisticsSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatisticsSchemaImplCopyWith<_$UserStatisticsSchemaImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChallengeResponseSchema _$ChallengeResponseSchemaFromJson(
    Map<String, dynamic> json) {
  return _ChallengeResponseSchema.fromJson(json);
}

/// @nodoc
mixin _$ChallengeResponseSchema {
  String get challengeName => throw _privateConstructorUsedError;
  bool get confirmed => throw _privateConstructorUsedError;

  /// Serializes this ChallengeResponseSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChallengeResponseSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengeResponseSchemaCopyWith<ChallengeResponseSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeResponseSchemaCopyWith<$Res> {
  factory $ChallengeResponseSchemaCopyWith(ChallengeResponseSchema value,
          $Res Function(ChallengeResponseSchema) then) =
      _$ChallengeResponseSchemaCopyWithImpl<$Res, ChallengeResponseSchema>;
  @useResult
  $Res call({String challengeName, bool confirmed});
}

/// @nodoc
class _$ChallengeResponseSchemaCopyWithImpl<$Res,
        $Val extends ChallengeResponseSchema>
    implements $ChallengeResponseSchemaCopyWith<$Res> {
  _$ChallengeResponseSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengeResponseSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeName = null,
    Object? confirmed = null,
  }) {
    return _then(_value.copyWith(
      challengeName: null == challengeName
          ? _value.challengeName
          : challengeName // ignore: cast_nullable_to_non_nullable
              as String,
      confirmed: null == confirmed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeResponseSchemaImplCopyWith<$Res>
    implements $ChallengeResponseSchemaCopyWith<$Res> {
  factory _$$ChallengeResponseSchemaImplCopyWith(
          _$ChallengeResponseSchemaImpl value,
          $Res Function(_$ChallengeResponseSchemaImpl) then) =
      __$$ChallengeResponseSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String challengeName, bool confirmed});
}

/// @nodoc
class __$$ChallengeResponseSchemaImplCopyWithImpl<$Res>
    extends _$ChallengeResponseSchemaCopyWithImpl<$Res,
        _$ChallengeResponseSchemaImpl>
    implements _$$ChallengeResponseSchemaImplCopyWith<$Res> {
  __$$ChallengeResponseSchemaImplCopyWithImpl(
      _$ChallengeResponseSchemaImpl _value,
      $Res Function(_$ChallengeResponseSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeResponseSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeName = null,
    Object? confirmed = null,
  }) {
    return _then(_$ChallengeResponseSchemaImpl(
      challengeName: null == challengeName
          ? _value.challengeName
          : challengeName // ignore: cast_nullable_to_non_nullable
              as String,
      confirmed: null == confirmed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeResponseSchemaImpl implements _ChallengeResponseSchema {
  const _$ChallengeResponseSchemaImpl(
      {required this.challengeName, required this.confirmed});

  factory _$ChallengeResponseSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeResponseSchemaImplFromJson(json);

  @override
  final String challengeName;
  @override
  final bool confirmed;

  @override
  String toString() {
    return 'ChallengeResponseSchema(challengeName: $challengeName, confirmed: $confirmed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeResponseSchemaImpl &&
            (identical(other.challengeName, challengeName) ||
                other.challengeName == challengeName) &&
            (identical(other.confirmed, confirmed) ||
                other.confirmed == confirmed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, challengeName, confirmed);

  /// Create a copy of ChallengeResponseSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeResponseSchemaImplCopyWith<_$ChallengeResponseSchemaImpl>
      get copyWith => __$$ChallengeResponseSchemaImplCopyWithImpl<
          _$ChallengeResponseSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeResponseSchemaImplToJson(
      this,
    );
  }
}

abstract class _ChallengeResponseSchema implements ChallengeResponseSchema {
  const factory _ChallengeResponseSchema(
      {required final String challengeName,
      required final bool confirmed}) = _$ChallengeResponseSchemaImpl;

  factory _ChallengeResponseSchema.fromJson(Map<String, dynamic> json) =
      _$ChallengeResponseSchemaImpl.fromJson;

  @override
  String get challengeName;
  @override
  bool get confirmed;

  /// Create a copy of ChallengeResponseSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeResponseSchemaImplCopyWith<_$ChallengeResponseSchemaImpl>
      get copyWith => throw _privateConstructorUsedError;
}
