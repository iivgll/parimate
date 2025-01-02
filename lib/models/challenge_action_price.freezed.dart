// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_action_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeActionPriceSchema _$ChallengeActionPriceSchemaFromJson(
    Map<String, dynamic> json) {
  return _ChallengeActionPriceSchema.fromJson(json);
}

/// @nodoc
mixin _$ChallengeActionPriceSchema {
  int get price => throw _privateConstructorUsedError;

  /// Serializes this ChallengeActionPriceSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChallengeActionPriceSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengeActionPriceSchemaCopyWith<ChallengeActionPriceSchema>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeActionPriceSchemaCopyWith<$Res> {
  factory $ChallengeActionPriceSchemaCopyWith(ChallengeActionPriceSchema value,
          $Res Function(ChallengeActionPriceSchema) then) =
      _$ChallengeActionPriceSchemaCopyWithImpl<$Res,
          ChallengeActionPriceSchema>;
  @useResult
  $Res call({int price});
}

/// @nodoc
class _$ChallengeActionPriceSchemaCopyWithImpl<$Res,
        $Val extends ChallengeActionPriceSchema>
    implements $ChallengeActionPriceSchemaCopyWith<$Res> {
  _$ChallengeActionPriceSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengeActionPriceSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeActionPriceSchemaImplCopyWith<$Res>
    implements $ChallengeActionPriceSchemaCopyWith<$Res> {
  factory _$$ChallengeActionPriceSchemaImplCopyWith(
          _$ChallengeActionPriceSchemaImpl value,
          $Res Function(_$ChallengeActionPriceSchemaImpl) then) =
      __$$ChallengeActionPriceSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int price});
}

/// @nodoc
class __$$ChallengeActionPriceSchemaImplCopyWithImpl<$Res>
    extends _$ChallengeActionPriceSchemaCopyWithImpl<$Res,
        _$ChallengeActionPriceSchemaImpl>
    implements _$$ChallengeActionPriceSchemaImplCopyWith<$Res> {
  __$$ChallengeActionPriceSchemaImplCopyWithImpl(
      _$ChallengeActionPriceSchemaImpl _value,
      $Res Function(_$ChallengeActionPriceSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeActionPriceSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
  }) {
    return _then(_$ChallengeActionPriceSchemaImpl(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeActionPriceSchemaImpl implements _ChallengeActionPriceSchema {
  const _$ChallengeActionPriceSchemaImpl({required this.price});

  factory _$ChallengeActionPriceSchemaImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChallengeActionPriceSchemaImplFromJson(json);

  @override
  final int price;

  @override
  String toString() {
    return 'ChallengeActionPriceSchema(price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeActionPriceSchemaImpl &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, price);

  /// Create a copy of ChallengeActionPriceSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeActionPriceSchemaImplCopyWith<_$ChallengeActionPriceSchemaImpl>
      get copyWith => __$$ChallengeActionPriceSchemaImplCopyWithImpl<
          _$ChallengeActionPriceSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeActionPriceSchemaImplToJson(
      this,
    );
  }
}

abstract class _ChallengeActionPriceSchema
    implements ChallengeActionPriceSchema {
  const factory _ChallengeActionPriceSchema({required final int price}) =
      _$ChallengeActionPriceSchemaImpl;

  factory _ChallengeActionPriceSchema.fromJson(Map<String, dynamic> json) =
      _$ChallengeActionPriceSchemaImpl.fromJson;

  @override
  int get price;

  /// Create a copy of ChallengeActionPriceSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeActionPriceSchemaImplCopyWith<_$ChallengeActionPriceSchemaImpl>
      get copyWith => throw _privateConstructorUsedError;
}
