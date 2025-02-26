// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppInitialazerModel {
  User? get user => throw _privateConstructorUsedError;
  List<Challenge> get challenges => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of AppInitialazerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppInitialazerModelCopyWith<AppInitialazerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppInitialazerModelCopyWith<$Res> {
  factory $AppInitialazerModelCopyWith(
          AppInitialazerModel value, $Res Function(AppInitialazerModel) then) =
      _$AppInitialazerModelCopyWithImpl<$Res, AppInitialazerModel>;
  @useResult
  $Res call(
      {User? user, List<Challenge> challenges, bool isLoading, String? error});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AppInitialazerModelCopyWithImpl<$Res, $Val extends AppInitialazerModel>
    implements $AppInitialazerModelCopyWith<$Res> {
  _$AppInitialazerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppInitialazerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? challenges = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      challenges: null == challenges
          ? _value.challenges
          : challenges // ignore: cast_nullable_to_non_nullable
              as List<Challenge>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of AppInitialazerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppInitialazerModelImplCopyWith<$Res>
    implements $AppInitialazerModelCopyWith<$Res> {
  factory _$$AppInitialazerModelImplCopyWith(_$AppInitialazerModelImpl value,
          $Res Function(_$AppInitialazerModelImpl) then) =
      __$$AppInitialazerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User? user, List<Challenge> challenges, bool isLoading, String? error});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AppInitialazerModelImplCopyWithImpl<$Res>
    extends _$AppInitialazerModelCopyWithImpl<$Res, _$AppInitialazerModelImpl>
    implements _$$AppInitialazerModelImplCopyWith<$Res> {
  __$$AppInitialazerModelImplCopyWithImpl(_$AppInitialazerModelImpl _value,
      $Res Function(_$AppInitialazerModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppInitialazerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? challenges = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$AppInitialazerModelImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      challenges: null == challenges
          ? _value._challenges
          : challenges // ignore: cast_nullable_to_non_nullable
              as List<Challenge>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AppInitialazerModelImpl implements _AppInitialazerModel {
  const _$AppInitialazerModelImpl(
      {this.user,
      final List<Challenge> challenges = const [],
      this.isLoading = false,
      this.error})
      : _challenges = challenges;

  @override
  final User? user;
  final List<Challenge> _challenges;
  @override
  @JsonKey()
  List<Challenge> get challenges {
    if (_challenges is EqualUnmodifiableListView) return _challenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_challenges);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'AppInitialazerModel(user: $user, challenges: $challenges, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppInitialazerModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._challenges, _challenges) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user,
      const DeepCollectionEquality().hash(_challenges), isLoading, error);

  /// Create a copy of AppInitialazerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppInitialazerModelImplCopyWith<_$AppInitialazerModelImpl> get copyWith =>
      __$$AppInitialazerModelImplCopyWithImpl<_$AppInitialazerModelImpl>(
          this, _$identity);
}

abstract class _AppInitialazerModel implements AppInitialazerModel {
  const factory _AppInitialazerModel(
      {final User? user,
      final List<Challenge> challenges,
      final bool isLoading,
      final String? error}) = _$AppInitialazerModelImpl;

  @override
  User? get user;
  @override
  List<Challenge> get challenges;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of AppInitialazerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppInitialazerModelImplCopyWith<_$AppInitialazerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
