// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirmation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConfirmationData _$ConfirmationDataFromJson(Map<String, dynamic> json) {
  return _ConfirmationData.fromJson(json);
}

/// @nodoc
mixin _$ConfirmationData {
  String get type => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  /// Serializes this ConfirmationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfirmationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfirmationDataCopyWith<ConfirmationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmationDataCopyWith<$Res> {
  factory $ConfirmationDataCopyWith(
          ConfirmationData value, $Res Function(ConfirmationData) then) =
      _$ConfirmationDataCopyWithImpl<$Res, ConfirmationData>;
  @useResult
  $Res call({String type, String value});
}

/// @nodoc
class _$ConfirmationDataCopyWithImpl<$Res, $Val extends ConfirmationData>
    implements $ConfirmationDataCopyWith<$Res> {
  _$ConfirmationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfirmationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfirmationDataImplCopyWith<$Res>
    implements $ConfirmationDataCopyWith<$Res> {
  factory _$$ConfirmationDataImplCopyWith(_$ConfirmationDataImpl value,
          $Res Function(_$ConfirmationDataImpl) then) =
      __$$ConfirmationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String value});
}

/// @nodoc
class __$$ConfirmationDataImplCopyWithImpl<$Res>
    extends _$ConfirmationDataCopyWithImpl<$Res, _$ConfirmationDataImpl>
    implements _$$ConfirmationDataImplCopyWith<$Res> {
  __$$ConfirmationDataImplCopyWithImpl(_$ConfirmationDataImpl _value,
      $Res Function(_$ConfirmationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConfirmationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? value = null,
  }) {
    return _then(_$ConfirmationDataImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfirmationDataImpl implements _ConfirmationData {
  const _$ConfirmationDataImpl({required this.type, required this.value});

  factory _$ConfirmationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfirmationDataImplFromJson(json);

  @override
  final String type;
  @override
  final String value;

  @override
  String toString() {
    return 'ConfirmationData(type: $type, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmationDataImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, value);

  /// Create a copy of ConfirmationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmationDataImplCopyWith<_$ConfirmationDataImpl> get copyWith =>
      __$$ConfirmationDataImplCopyWithImpl<_$ConfirmationDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfirmationDataImplToJson(
      this,
    );
  }
}

abstract class _ConfirmationData implements ConfirmationData {
  const factory _ConfirmationData(
      {required final String type,
      required final String value}) = _$ConfirmationDataImpl;

  factory _ConfirmationData.fromJson(Map<String, dynamic> json) =
      _$ConfirmationDataImpl.fromJson;

  @override
  String get type;
  @override
  String get value;

  /// Create a copy of ConfirmationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmationDataImplCopyWith<_$ConfirmationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConfirmationSchemaInput _$ConfirmationSchemaInputFromJson(
    Map<String, dynamic> json) {
  return _ConfirmationSchemaInput.fromJson(json);
}

/// @nodoc
mixin _$ConfirmationSchemaInput {
  int get id => throw _privateConstructorUsedError;
  bool? get approved => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get approvedAt => throw _privateConstructorUsedError;
  ConfirmationData get data => throw _privateConstructorUsedError;
  String? get rejectReason => throw _privateConstructorUsedError;
  bool get share => throw _privateConstructorUsedError;
  String get userTgId => throw _privateConstructorUsedError;
  int get challengeId => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  /// Serializes this ConfirmationSchemaInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfirmationSchemaInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfirmationSchemaInputCopyWith<ConfirmationSchemaInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmationSchemaInputCopyWith<$Res> {
  factory $ConfirmationSchemaInputCopyWith(ConfirmationSchemaInput value,
          $Res Function(ConfirmationSchemaInput) then) =
      _$ConfirmationSchemaInputCopyWithImpl<$Res, ConfirmationSchemaInput>;
  @useResult
  $Res call(
      {int id,
      bool? approved,
      String createdAt,
      String? approvedAt,
      ConfirmationData data,
      String? rejectReason,
      bool share,
      String userTgId,
      int challengeId,
      String? url});

  $ConfirmationDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ConfirmationSchemaInputCopyWithImpl<$Res,
        $Val extends ConfirmationSchemaInput>
    implements $ConfirmationSchemaInputCopyWith<$Res> {
  _$ConfirmationSchemaInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfirmationSchemaInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? approved = freezed,
    Object? createdAt = null,
    Object? approvedAt = freezed,
    Object? data = null,
    Object? rejectReason = freezed,
    Object? share = null,
    Object? userTgId = null,
    Object? challengeId = null,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      approved: freezed == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ConfirmationData,
      rejectReason: freezed == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String?,
      share: null == share
          ? _value.share
          : share // ignore: cast_nullable_to_non_nullable
              as bool,
      userTgId: null == userTgId
          ? _value.userTgId
          : userTgId // ignore: cast_nullable_to_non_nullable
              as String,
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ConfirmationSchemaInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConfirmationDataCopyWith<$Res> get data {
    return $ConfirmationDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConfirmationSchemaInputImplCopyWith<$Res>
    implements $ConfirmationSchemaInputCopyWith<$Res> {
  factory _$$ConfirmationSchemaInputImplCopyWith(
          _$ConfirmationSchemaInputImpl value,
          $Res Function(_$ConfirmationSchemaInputImpl) then) =
      __$$ConfirmationSchemaInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      bool? approved,
      String createdAt,
      String? approvedAt,
      ConfirmationData data,
      String? rejectReason,
      bool share,
      String userTgId,
      int challengeId,
      String? url});

  @override
  $ConfirmationDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ConfirmationSchemaInputImplCopyWithImpl<$Res>
    extends _$ConfirmationSchemaInputCopyWithImpl<$Res,
        _$ConfirmationSchemaInputImpl>
    implements _$$ConfirmationSchemaInputImplCopyWith<$Res> {
  __$$ConfirmationSchemaInputImplCopyWithImpl(
      _$ConfirmationSchemaInputImpl _value,
      $Res Function(_$ConfirmationSchemaInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConfirmationSchemaInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? approved = freezed,
    Object? createdAt = null,
    Object? approvedAt = freezed,
    Object? data = null,
    Object? rejectReason = freezed,
    Object? share = null,
    Object? userTgId = null,
    Object? challengeId = null,
    Object? url = freezed,
  }) {
    return _then(_$ConfirmationSchemaInputImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      approved: freezed == approved
          ? _value.approved
          : approved // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      approvedAt: freezed == approvedAt
          ? _value.approvedAt
          : approvedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ConfirmationData,
      rejectReason: freezed == rejectReason
          ? _value.rejectReason
          : rejectReason // ignore: cast_nullable_to_non_nullable
              as String?,
      share: null == share
          ? _value.share
          : share // ignore: cast_nullable_to_non_nullable
              as bool,
      userTgId: null == userTgId
          ? _value.userTgId
          : userTgId // ignore: cast_nullable_to_non_nullable
              as String,
      challengeId: null == challengeId
          ? _value.challengeId
          : challengeId // ignore: cast_nullable_to_non_nullable
              as int,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfirmationSchemaInputImpl implements _ConfirmationSchemaInput {
  const _$ConfirmationSchemaInputImpl(
      {required this.id,
      this.approved,
      required this.createdAt,
      this.approvedAt,
      required this.data,
      this.rejectReason,
      required this.share,
      required this.userTgId,
      required this.challengeId,
      this.url});

  factory _$ConfirmationSchemaInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfirmationSchemaInputImplFromJson(json);

  @override
  final int id;
  @override
  final bool? approved;
  @override
  final String createdAt;
  @override
  final String? approvedAt;
  @override
  final ConfirmationData data;
  @override
  final String? rejectReason;
  @override
  final bool share;
  @override
  final String userTgId;
  @override
  final int challengeId;
  @override
  final String? url;

  @override
  String toString() {
    return 'ConfirmationSchemaInput(id: $id, approved: $approved, createdAt: $createdAt, approvedAt: $approvedAt, data: $data, rejectReason: $rejectReason, share: $share, userTgId: $userTgId, challengeId: $challengeId, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmationSchemaInputImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.approved, approved) ||
                other.approved == approved) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.approvedAt, approvedAt) ||
                other.approvedAt == approvedAt) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.rejectReason, rejectReason) ||
                other.rejectReason == rejectReason) &&
            (identical(other.share, share) || other.share == share) &&
            (identical(other.userTgId, userTgId) ||
                other.userTgId == userTgId) &&
            (identical(other.challengeId, challengeId) ||
                other.challengeId == challengeId) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, approved, createdAt,
      approvedAt, data, rejectReason, share, userTgId, challengeId, url);

  /// Create a copy of ConfirmationSchemaInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmationSchemaInputImplCopyWith<_$ConfirmationSchemaInputImpl>
      get copyWith => __$$ConfirmationSchemaInputImplCopyWithImpl<
          _$ConfirmationSchemaInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfirmationSchemaInputImplToJson(
      this,
    );
  }
}

abstract class _ConfirmationSchemaInput implements ConfirmationSchemaInput {
  const factory _ConfirmationSchemaInput(
      {required final int id,
      final bool? approved,
      required final String createdAt,
      final String? approvedAt,
      required final ConfirmationData data,
      final String? rejectReason,
      required final bool share,
      required final String userTgId,
      required final int challengeId,
      final String? url}) = _$ConfirmationSchemaInputImpl;

  factory _ConfirmationSchemaInput.fromJson(Map<String, dynamic> json) =
      _$ConfirmationSchemaInputImpl.fromJson;

  @override
  int get id;
  @override
  bool? get approved;
  @override
  String get createdAt;
  @override
  String? get approvedAt;
  @override
  ConfirmationData get data;
  @override
  String? get rejectReason;
  @override
  bool get share;
  @override
  String get userTgId;
  @override
  int get challengeId;
  @override
  String? get url;

  /// Create a copy of ConfirmationSchemaInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmationSchemaInputImplCopyWith<_$ConfirmationSchemaInputImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ConfirmationListResponse _$ConfirmationListResponseFromJson(
    Map<String, dynamic> json) {
  return _ConfirmationListResponse.fromJson(json);
}

/// @nodoc
mixin _$ConfirmationListResponse {
  List<ConfirmationSchemaInput> get confirmations =>
      throw _privateConstructorUsedError;
  int? get lastReadId => throw _privateConstructorUsedError;

  /// Serializes this ConfirmationListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfirmationListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfirmationListResponseCopyWith<ConfirmationListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmationListResponseCopyWith<$Res> {
  factory $ConfirmationListResponseCopyWith(ConfirmationListResponse value,
          $Res Function(ConfirmationListResponse) then) =
      _$ConfirmationListResponseCopyWithImpl<$Res, ConfirmationListResponse>;
  @useResult
  $Res call({List<ConfirmationSchemaInput> confirmations, int? lastReadId});
}

/// @nodoc
class _$ConfirmationListResponseCopyWithImpl<$Res,
        $Val extends ConfirmationListResponse>
    implements $ConfirmationListResponseCopyWith<$Res> {
  _$ConfirmationListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfirmationListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmations = null,
    Object? lastReadId = freezed,
  }) {
    return _then(_value.copyWith(
      confirmations: null == confirmations
          ? _value.confirmations
          : confirmations // ignore: cast_nullable_to_non_nullable
              as List<ConfirmationSchemaInput>,
      lastReadId: freezed == lastReadId
          ? _value.lastReadId
          : lastReadId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfirmationListResponseImplCopyWith<$Res>
    implements $ConfirmationListResponseCopyWith<$Res> {
  factory _$$ConfirmationListResponseImplCopyWith(
          _$ConfirmationListResponseImpl value,
          $Res Function(_$ConfirmationListResponseImpl) then) =
      __$$ConfirmationListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ConfirmationSchemaInput> confirmations, int? lastReadId});
}

/// @nodoc
class __$$ConfirmationListResponseImplCopyWithImpl<$Res>
    extends _$ConfirmationListResponseCopyWithImpl<$Res,
        _$ConfirmationListResponseImpl>
    implements _$$ConfirmationListResponseImplCopyWith<$Res> {
  __$$ConfirmationListResponseImplCopyWithImpl(
      _$ConfirmationListResponseImpl _value,
      $Res Function(_$ConfirmationListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConfirmationListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmations = null,
    Object? lastReadId = freezed,
  }) {
    return _then(_$ConfirmationListResponseImpl(
      confirmations: null == confirmations
          ? _value._confirmations
          : confirmations // ignore: cast_nullable_to_non_nullable
              as List<ConfirmationSchemaInput>,
      lastReadId: freezed == lastReadId
          ? _value.lastReadId
          : lastReadId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfirmationListResponseImpl implements _ConfirmationListResponse {
  const _$ConfirmationListResponseImpl(
      {required final List<ConfirmationSchemaInput> confirmations,
      this.lastReadId})
      : _confirmations = confirmations;

  factory _$ConfirmationListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConfirmationListResponseImplFromJson(json);

  final List<ConfirmationSchemaInput> _confirmations;
  @override
  List<ConfirmationSchemaInput> get confirmations {
    if (_confirmations is EqualUnmodifiableListView) return _confirmations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_confirmations);
  }

  @override
  final int? lastReadId;

  @override
  String toString() {
    return 'ConfirmationListResponse(confirmations: $confirmations, lastReadId: $lastReadId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmationListResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._confirmations, _confirmations) &&
            (identical(other.lastReadId, lastReadId) ||
                other.lastReadId == lastReadId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_confirmations), lastReadId);

  /// Create a copy of ConfirmationListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmationListResponseImplCopyWith<_$ConfirmationListResponseImpl>
      get copyWith => __$$ConfirmationListResponseImplCopyWithImpl<
          _$ConfirmationListResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfirmationListResponseImplToJson(
      this,
    );
  }
}

abstract class _ConfirmationListResponse implements ConfirmationListResponse {
  const factory _ConfirmationListResponse(
      {required final List<ConfirmationSchemaInput> confirmations,
      final int? lastReadId}) = _$ConfirmationListResponseImpl;

  factory _ConfirmationListResponse.fromJson(Map<String, dynamic> json) =
      _$ConfirmationListResponseImpl.fromJson;

  @override
  List<ConfirmationSchemaInput> get confirmations;
  @override
  int? get lastReadId;

  /// Create a copy of ConfirmationListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmationListResponseImplCopyWith<_$ConfirmationListResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
