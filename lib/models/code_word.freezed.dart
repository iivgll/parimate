// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'code_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CodeWord _$CodeWordFromJson(Map<String, dynamic> json) {
  return _CodeWord.fromJson(json);
}

/// @nodoc
mixin _$CodeWord {
  int get id => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;

  /// Serializes this CodeWord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CodeWord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CodeWordCopyWith<CodeWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodeWordCopyWith<$Res> {
  factory $CodeWordCopyWith(CodeWord value, $Res Function(CodeWord) then) =
      _$CodeWordCopyWithImpl<$Res, CodeWord>;
  @useResult
  $Res call({int id, String word});
}

/// @nodoc
class _$CodeWordCopyWithImpl<$Res, $Val extends CodeWord>
    implements $CodeWordCopyWith<$Res> {
  _$CodeWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CodeWord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CodeWordImplCopyWith<$Res>
    implements $CodeWordCopyWith<$Res> {
  factory _$$CodeWordImplCopyWith(
          _$CodeWordImpl value, $Res Function(_$CodeWordImpl) then) =
      __$$CodeWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String word});
}

/// @nodoc
class __$$CodeWordImplCopyWithImpl<$Res>
    extends _$CodeWordCopyWithImpl<$Res, _$CodeWordImpl>
    implements _$$CodeWordImplCopyWith<$Res> {
  __$$CodeWordImplCopyWithImpl(
      _$CodeWordImpl _value, $Res Function(_$CodeWordImpl) _then)
      : super(_value, _then);

  /// Create a copy of CodeWord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? word = null,
  }) {
    return _then(_$CodeWordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CodeWordImpl implements _CodeWord {
  const _$CodeWordImpl({required this.id, required this.word});

  factory _$CodeWordImpl.fromJson(Map<String, dynamic> json) =>
      _$$CodeWordImplFromJson(json);

  @override
  final int id;
  @override
  final String word;

  @override
  String toString() {
    return 'CodeWord(id: $id, word: $word)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CodeWordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, word);

  /// Create a copy of CodeWord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CodeWordImplCopyWith<_$CodeWordImpl> get copyWith =>
      __$$CodeWordImplCopyWithImpl<_$CodeWordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CodeWordImplToJson(
      this,
    );
  }
}

abstract class _CodeWord implements CodeWord {
  const factory _CodeWord({required final int id, required final String word}) =
      _$CodeWordImpl;

  factory _CodeWord.fromJson(Map<String, dynamic> json) =
      _$CodeWordImpl.fromJson;

  @override
  int get id;
  @override
  String get word;

  /// Create a copy of CodeWord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CodeWordImplCopyWith<_$CodeWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
