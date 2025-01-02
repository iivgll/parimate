// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationSchema _$NotificationSchemaFromJson(Map<String, dynamic> json) {
  return _NotificationSchema.fromJson(json);
}

/// @nodoc
mixin _$NotificationSchema {
  int get id => throw _privateConstructorUsedError;
  int get hours => throw _privateConstructorUsedError;
  int get minutes => throw _privateConstructorUsedError;
  bool get archived => throw _privateConstructorUsedError;

  /// Serializes this NotificationSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationSchemaCopyWith<NotificationSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSchemaCopyWith<$Res> {
  factory $NotificationSchemaCopyWith(
          NotificationSchema value, $Res Function(NotificationSchema) then) =
      _$NotificationSchemaCopyWithImpl<$Res, NotificationSchema>;
  @useResult
  $Res call({int id, int hours, int minutes, bool archived});
}

/// @nodoc
class _$NotificationSchemaCopyWithImpl<$Res, $Val extends NotificationSchema>
    implements $NotificationSchemaCopyWith<$Res> {
  _$NotificationSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hours = null,
    Object? minutes = null,
    Object? archived = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hours: null == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSchemaImplCopyWith<$Res>
    implements $NotificationSchemaCopyWith<$Res> {
  factory _$$NotificationSchemaImplCopyWith(_$NotificationSchemaImpl value,
          $Res Function(_$NotificationSchemaImpl) then) =
      __$$NotificationSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int hours, int minutes, bool archived});
}

/// @nodoc
class __$$NotificationSchemaImplCopyWithImpl<$Res>
    extends _$NotificationSchemaCopyWithImpl<$Res, _$NotificationSchemaImpl>
    implements _$$NotificationSchemaImplCopyWith<$Res> {
  __$$NotificationSchemaImplCopyWithImpl(_$NotificationSchemaImpl _value,
      $Res Function(_$NotificationSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? hours = null,
    Object? minutes = null,
    Object? archived = null,
  }) {
    return _then(_$NotificationSchemaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      hours: null == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      archived: null == archived
          ? _value.archived
          : archived // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSchemaImpl implements _NotificationSchema {
  const _$NotificationSchemaImpl(
      {required this.id,
      required this.hours,
      required this.minutes,
      required this.archived});

  factory _$NotificationSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSchemaImplFromJson(json);

  @override
  final int id;
  @override
  final int hours;
  @override
  final int minutes;
  @override
  final bool archived;

  @override
  String toString() {
    return 'NotificationSchema(id: $id, hours: $hours, minutes: $minutes, archived: $archived)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSchemaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.hours, hours) || other.hours == hours) &&
            (identical(other.minutes, minutes) || other.minutes == minutes) &&
            (identical(other.archived, archived) ||
                other.archived == archived));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, hours, minutes, archived);

  /// Create a copy of NotificationSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSchemaImplCopyWith<_$NotificationSchemaImpl> get copyWith =>
      __$$NotificationSchemaImplCopyWithImpl<_$NotificationSchemaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSchemaImplToJson(
      this,
    );
  }
}

abstract class _NotificationSchema implements NotificationSchema {
  const factory _NotificationSchema(
      {required final int id,
      required final int hours,
      required final int minutes,
      required final bool archived}) = _$NotificationSchemaImpl;

  factory _NotificationSchema.fromJson(Map<String, dynamic> json) =
      _$NotificationSchemaImpl.fromJson;

  @override
  int get id;
  @override
  int get hours;
  @override
  int get minutes;
  @override
  bool get archived;

  /// Create a copy of NotificationSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSchemaImplCopyWith<_$NotificationSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
