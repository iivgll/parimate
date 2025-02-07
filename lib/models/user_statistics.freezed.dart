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

UserStatistics _$UserStatisticsFromJson(Map<String, dynamic> json) {
  return _UserStatistics.fromJson(json);
}

/// @nodoc
mixin _$UserStatistics {
  @JsonKey(name: 'user_statistics')
  List<UserStatisticsItem> get userStatistics =>
      throw _privateConstructorUsedError;

  /// Serializes this UserStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatisticsCopyWith<UserStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatisticsCopyWith<$Res> {
  factory $UserStatisticsCopyWith(
          UserStatistics value, $Res Function(UserStatistics) then) =
      _$UserStatisticsCopyWithImpl<$Res, UserStatistics>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_statistics')
      List<UserStatisticsItem> userStatistics});
}

/// @nodoc
class _$UserStatisticsCopyWithImpl<$Res, $Val extends UserStatistics>
    implements $UserStatisticsCopyWith<$Res> {
  _$UserStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStatistics
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
              as List<UserStatisticsItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatisticsImplCopyWith<$Res>
    implements $UserStatisticsCopyWith<$Res> {
  factory _$$UserStatisticsImplCopyWith(_$UserStatisticsImpl value,
          $Res Function(_$UserStatisticsImpl) then) =
      __$$UserStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_statistics')
      List<UserStatisticsItem> userStatistics});
}

/// @nodoc
class __$$UserStatisticsImplCopyWithImpl<$Res>
    extends _$UserStatisticsCopyWithImpl<$Res, _$UserStatisticsImpl>
    implements _$$UserStatisticsImplCopyWith<$Res> {
  __$$UserStatisticsImplCopyWithImpl(
      _$UserStatisticsImpl _value, $Res Function(_$UserStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userStatistics = null,
  }) {
    return _then(_$UserStatisticsImpl(
      userStatistics: null == userStatistics
          ? _value._userStatistics
          : userStatistics // ignore: cast_nullable_to_non_nullable
              as List<UserStatisticsItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatisticsImpl implements _UserStatistics {
  const _$UserStatisticsImpl(
      {@JsonKey(name: 'user_statistics')
      required final List<UserStatisticsItem> userStatistics})
      : _userStatistics = userStatistics;

  factory _$UserStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatisticsImplFromJson(json);

  final List<UserStatisticsItem> _userStatistics;
  @override
  @JsonKey(name: 'user_statistics')
  List<UserStatisticsItem> get userStatistics {
    if (_userStatistics is EqualUnmodifiableListView) return _userStatistics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userStatistics);
  }

  @override
  String toString() {
    return 'UserStatistics(userStatistics: $userStatistics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatisticsImpl &&
            const DeepCollectionEquality()
                .equals(other._userStatistics, _userStatistics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userStatistics));

  /// Create a copy of UserStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatisticsImplCopyWith<_$UserStatisticsImpl> get copyWith =>
      __$$UserStatisticsImplCopyWithImpl<_$UserStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatisticsImplToJson(
      this,
    );
  }
}

abstract class _UserStatistics implements UserStatistics {
  const factory _UserStatistics(
          {@JsonKey(name: 'user_statistics')
          required final List<UserStatisticsItem> userStatistics}) =
      _$UserStatisticsImpl;

  factory _UserStatistics.fromJson(Map<String, dynamic> json) =
      _$UserStatisticsImpl.fromJson;

  @override
  @JsonKey(name: 'user_statistics')
  List<UserStatisticsItem> get userStatistics;

  /// Create a copy of UserStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatisticsImplCopyWith<_$UserStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserStatisticsItem _$UserStatisticsItemFromJson(Map<String, dynamic> json) {
  return _UserStatisticsItem.fromJson(json);
}

/// @nodoc
mixin _$UserStatisticsItem {
  @JsonKey(name: 'challenge_name')
  String get challengeName => throw _privateConstructorUsedError;
  bool get confirmed => throw _privateConstructorUsedError;

  /// Serializes this UserStatisticsItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStatisticsItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatisticsItemCopyWith<UserStatisticsItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatisticsItemCopyWith<$Res> {
  factory $UserStatisticsItemCopyWith(
          UserStatisticsItem value, $Res Function(UserStatisticsItem) then) =
      _$UserStatisticsItemCopyWithImpl<$Res, UserStatisticsItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'challenge_name') String challengeName, bool confirmed});
}

/// @nodoc
class _$UserStatisticsItemCopyWithImpl<$Res, $Val extends UserStatisticsItem>
    implements $UserStatisticsItemCopyWith<$Res> {
  _$UserStatisticsItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStatisticsItem
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
abstract class _$$UserStatisticsItemImplCopyWith<$Res>
    implements $UserStatisticsItemCopyWith<$Res> {
  factory _$$UserStatisticsItemImplCopyWith(_$UserStatisticsItemImpl value,
          $Res Function(_$UserStatisticsItemImpl) then) =
      __$$UserStatisticsItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'challenge_name') String challengeName, bool confirmed});
}

/// @nodoc
class __$$UserStatisticsItemImplCopyWithImpl<$Res>
    extends _$UserStatisticsItemCopyWithImpl<$Res, _$UserStatisticsItemImpl>
    implements _$$UserStatisticsItemImplCopyWith<$Res> {
  __$$UserStatisticsItemImplCopyWithImpl(_$UserStatisticsItemImpl _value,
      $Res Function(_$UserStatisticsItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStatisticsItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challengeName = null,
    Object? confirmed = null,
  }) {
    return _then(_$UserStatisticsItemImpl(
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
class _$UserStatisticsItemImpl implements _UserStatisticsItem {
  const _$UserStatisticsItemImpl(
      {@JsonKey(name: 'challenge_name') required this.challengeName,
      required this.confirmed});

  factory _$UserStatisticsItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatisticsItemImplFromJson(json);

  @override
  @JsonKey(name: 'challenge_name')
  final String challengeName;
  @override
  final bool confirmed;

  @override
  String toString() {
    return 'UserStatisticsItem(challengeName: $challengeName, confirmed: $confirmed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatisticsItemImpl &&
            (identical(other.challengeName, challengeName) ||
                other.challengeName == challengeName) &&
            (identical(other.confirmed, confirmed) ||
                other.confirmed == confirmed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, challengeName, confirmed);

  /// Create a copy of UserStatisticsItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatisticsItemImplCopyWith<_$UserStatisticsItemImpl> get copyWith =>
      __$$UserStatisticsItemImplCopyWithImpl<_$UserStatisticsItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatisticsItemImplToJson(
      this,
    );
  }
}

abstract class _UserStatisticsItem implements UserStatisticsItem {
  const factory _UserStatisticsItem(
      {@JsonKey(name: 'challenge_name') required final String challengeName,
      required final bool confirmed}) = _$UserStatisticsItemImpl;

  factory _UserStatisticsItem.fromJson(Map<String, dynamic> json) =
      _$UserStatisticsItemImpl.fromJson;

  @override
  @JsonKey(name: 'challenge_name')
  String get challengeName;
  @override
  bool get confirmed;

  /// Create a copy of UserStatisticsItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatisticsItemImplCopyWith<_$UserStatisticsItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
