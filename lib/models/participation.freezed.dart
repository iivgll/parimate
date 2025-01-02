// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParticipationSchema _$ParticipationSchemaFromJson(Map<String, dynamic> json) {
  return _ParticipationSchema.fromJson(json);
}

/// @nodoc
mixin _$ParticipationSchema {
  bool get payed => throw _privateConstructorUsedError;
  bool get win => throw _privateConstructorUsedError;
  bool get archived => throw _privateConstructorUsedError;
  String? get rejectReason => throw _privateConstructorUsedError;
  bool get accepted => throw _privateConstructorUsedError;
  String get userTgId => throw _privateConstructorUsedError;
  int get challengeId => throw _privateConstructorUsedError;

  /// Serializes this ParticipationSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParticipationSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParticipationSchemaCopyWith<ParticipationSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipationSchemaCopyWith<$Res> {
  factory $ParticipationSchemaCopyWith(
          ParticipationSchema value, $Res Function(ParticipationSchema) then) =
      _$ParticipationSchemaCopyWithImpl<$Res, ParticipationSchema>;
  @useResult
  $Res call(
      {bool payed,
      bool win,
      bool archived,
      String? rejectReason,
      bool accepted,
      String userTgId,
      int challengeId});
}

/// @nodoc
class _$ParticipationSchemaCopyWithImpl<$Res, $Val extends ParticipationSchema>
    implements $ParticipationSchemaCopyWith<$Res> {
  _$ParticipationSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParticipationSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payed = null,
    Object? win = null,
    Object? archived = null,
    Object? rejectReason = freezed,
    Object? accepted = null,
    Object? userTgId = null,
    Object? challengeId = null,
  }) {
    return _then(_value.copyWith(
      payed: null == payed
          ? _value.payed
          : payed // ignore: cast_nullable_to_non_nullable
              as bool,
      win: null == win
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as bool,
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
      rejectReason: freezed == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String?,
      accepted: null == accepted
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool,
      userTgId: null == userTgId
          ? _value.userTgId
          : userTgId // ignore: cast_nullable_to_non_nullable
              as String,
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParticipationSchemaImplCopyWith<$Res>
    implements $ParticipationSchemaCopyWith<$Res> {
  factory _$$ParticipationSchemaImplCopyWith(_$ParticipationSchemaImpl value,
          $Res Function(_$ParticipationSchemaImpl) then) =
      __$$ParticipationSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool payed,
      bool win,
      bool archived,
      String? rejectReason,
      bool accepted,
      String userTgId,
      int challengeId});
}

/// @nodoc
class __$$ParticipationSchemaImplCopyWithImpl<$Res>
    extends _$ParticipationSchemaCopyWithImpl<$Res, _$ParticipationSchemaImpl>
    implements _$$ParticipationSchemaImplCopyWith<$Res> {
  __$$ParticipationSchemaImplCopyWithImpl(_$ParticipationSchemaImpl _value,
      $Res Function(_$ParticipationSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParticipationSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payed = null,
    Object? win = null,
    Object? archived = null,
    Object? rejectReason = freezed,
    Object? accepted = null,
    Object? userTgId = null,
    Object? challengeId = null,
  }) {
    return _then(_$ParticipationSchemaImpl(
      payed: null == payed
          ? _value.payed
          : payed // ignore: cast_nullable_to_non_nullable
              as bool,
      win: null == win
          ? _value.win
          : win // ignore: cast_nullable_to_non_nullable
              as bool,
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
      rejectReason: freezed == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String?,
      accepted: null == accepted
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool,
      userTgId: null == userTgId
          ? _value.userTgId
          : userTgId // ignore: cast_nullable_to_non_nullable
              as String,
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParticipationSchemaImpl implements _ParticipationSchema {
  const _$ParticipationSchemaImpl(
      {required this.payed,
      required this.win,
      required this.archived,
      this.rejectReason,
      required this.accepted,
      required this.userTgId,
      required this.challengeId});

  factory _$ParticipationSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParticipationSchemaImplFromJson(json);

  @override
  final bool payed;
  @override
  final bool win;
  @override
  final bool archived;
  @override
  final String? rejectReason;
  @override
  final bool accepted;
  @override
  final String userTgId;
  @override
  final int challengeId;

  @override
  String toString() {
    return 'ParticipationSchema(payed: $payed, win: $win, archived: $archived, rejectReason: $rejectReason, accepted: $accepted, userTgId: $userTgId, challengeId: $challengeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipationSchemaImpl &&
            (identical(other.payed, payed) || other.payed == payed) &&
            (identical(other.win, win) || other.win == win) &&
            (identical(other.archived, archived) ||
                other.archived == archived) &&
            (identical(other.rejectReason, rejectReason) ||
                other.rejectReason == rejectReason) &&
            (identical(other.accepted, accepted) ||
                other.accepted == accepted) &&
            (identical(other.userTgId, userTgId) ||
                other.userTgId == userTgId) &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, payed, win, archived,
      rejectReason, accepted, userTgId, challengeId);

  /// Create a copy of ParticipationSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipationSchemaImplCopyWith<_$ParticipationSchemaImpl> get copyWith =>
      __$$ParticipationSchemaImplCopyWithImpl<_$ParticipationSchemaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParticipationSchemaImplToJson(
      this,
    );
  }
}

abstract class _ParticipationSchema implements ParticipationSchema {
  const factory _ParticipationSchema(
      {required final bool payed,
      required final bool win,
      required final bool archived,
      final String? rejectReason,
      required final bool accepted,
      required final String userTgId,
      required final int challengeId}) = _$ParticipationSchemaImpl;

  factory _ParticipationSchema.fromJson(Map<String, dynamic> json) =
      _$ParticipationSchemaImpl.fromJson;

  @override
  bool get payed;
  @override
  bool get win;
  @override
  bool get archived;
  @override
  String? get rejectReason;
  @override
  bool get accepted;
  @override
  String get userTgId;
  @override
  int get challengeId;

  /// Create a copy of ParticipationSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParticipationSchemaImplCopyWith<_$ParticipationSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
