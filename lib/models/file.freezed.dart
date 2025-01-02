// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadFileResponseSchema _$UploadFileResponseSchemaFromJson(
    Map<String, dynamic> json) {
  return _UploadFileResponseSchema.fromJson(json);
}

/// @nodoc
mixin _$UploadFileResponseSchema {
  String get link => throw _privateConstructorUsedError;

  /// Serializes this UploadFileResponseSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadFileResponseSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadFileResponseSchemaCopyWith<UploadFileResponseSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadFileResponseSchemaCopyWith<$Res> {
  factory $UploadFileResponseSchemaCopyWith(UploadFileResponseSchema value,
          $Res Function(UploadFileResponseSchema) then) =
      _$UploadFileResponseSchemaCopyWithImpl<$Res, UploadFileResponseSchema>;
  @useResult
  $Res call({String link});
}

/// @nodoc
class _$UploadFileResponseSchemaCopyWithImpl<$Res,
        $Val extends UploadFileResponseSchema>
    implements $UploadFileResponseSchemaCopyWith<$Res> {
  _$UploadFileResponseSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadFileResponseSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
  }) {
    return _then(_value.copyWith(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadFileResponseSchemaImplCopyWith<$Res>
    implements $UploadFileResponseSchemaCopyWith<$Res> {
  factory _$$UploadFileResponseSchemaImplCopyWith(
          _$UploadFileResponseSchemaImpl value,
          $Res Function(_$UploadFileResponseSchemaImpl) then) =
      __$$UploadFileResponseSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String link});
}

/// @nodoc
class __$$UploadFileResponseSchemaImplCopyWithImpl<$Res>
    extends _$UploadFileResponseSchemaCopyWithImpl<$Res,
        _$UploadFileResponseSchemaImpl>
    implements _$$UploadFileResponseSchemaImplCopyWith<$Res> {
  __$$UploadFileResponseSchemaImplCopyWithImpl(
      _$UploadFileResponseSchemaImpl _value,
      $Res Function(_$UploadFileResponseSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadFileResponseSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
  }) {
    return _then(_$UploadFileResponseSchemaImpl(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadFileResponseSchemaImpl implements _UploadFileResponseSchema {
  const _$UploadFileResponseSchemaImpl({required this.link});

  factory _$UploadFileResponseSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadFileResponseSchemaImplFromJson(json);

  @override
  final String link;

  @override
  String toString() {
    return 'UploadFileResponseSchema(link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadFileResponseSchemaImpl &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, link);

  /// Create a copy of UploadFileResponseSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadFileResponseSchemaImplCopyWith<_$UploadFileResponseSchemaImpl>
      get copyWith => __$$UploadFileResponseSchemaImplCopyWithImpl<
          _$UploadFileResponseSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadFileResponseSchemaImplToJson(
      this,
    );
  }
}

abstract class _UploadFileResponseSchema implements UploadFileResponseSchema {
  const factory _UploadFileResponseSchema({required final String link}) =
      _$UploadFileResponseSchemaImpl;

  factory _UploadFileResponseSchema.fromJson(Map<String, dynamic> json) =
      _$UploadFileResponseSchemaImpl.fromJson;

  @override
  String get link;

  /// Create a copy of UploadFileResponseSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadFileResponseSchemaImplCopyWith<_$UploadFileResponseSchemaImpl>
      get copyWith => throw _privateConstructorUsedError;
}
