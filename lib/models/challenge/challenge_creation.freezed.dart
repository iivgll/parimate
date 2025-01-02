// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_creation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeCreationSchema _$ChallengeCreationSchemaFromJson(
    Map<String, dynamic> json) {
  return _ChallengeCreationSchema.fromJson(json);
}

/// @nodoc
mixin _$ChallengeCreationSchema {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'participation_type')
  ParticipationType get participationType => throw _privateConstructorUsedError;
  Icon get icon => throw _privateConstructorUsedError;
  CategoryType get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmation_type')
  ConfirmationType get confirmationType => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  DateTime get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'regularity_type')
  RegularityType get regularityType => throw _privateConstructorUsedError;
  @JsonKey(name: 'times_per_day')
  int? get timesPerDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'times_per_week')
  int? get timesPerWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmation_days')
  List<int>? get confirmationDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_tg_id')
  String get authorTgId => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmation_description')
  String get confirmationDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_participants')
  int? get maxParticipants => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_until')
  String get confirmUntil => throw _privateConstructorUsedError;

  /// Serializes this ChallengeCreationSchema to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChallengeCreationSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengeCreationSchemaCopyWith<ChallengeCreationSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeCreationSchemaCopyWith<$Res> {
  factory $ChallengeCreationSchemaCopyWith(ChallengeCreationSchema value,
          $Res Function(ChallengeCreationSchema) then) =
      _$ChallengeCreationSchemaCopyWithImpl<$Res, ChallengeCreationSchema>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'participation_type') ParticipationType participationType,
      Icon icon,
      CategoryType category,
      @JsonKey(name: 'confirmation_type') ConfirmationType confirmationType,
      @JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'end_date') DateTime endDate,
      @JsonKey(name: 'regularity_type') RegularityType regularityType,
      @JsonKey(name: 'times_per_day') int? timesPerDay,
      @JsonKey(name: 'times_per_week') int? timesPerWeek,
      @JsonKey(name: 'confirmation_days') List<int>? confirmationDays,
      @JsonKey(name: 'author_tg_id') String authorTgId,
      int price,
      Currency currency,
      @JsonKey(name: 'confirmation_description') String confirmationDescription,
      @JsonKey(name: 'max_participants') int? maxParticipants,
      @JsonKey(name: 'confirm_until') String confirmUntil});
}

/// @nodoc
class _$ChallengeCreationSchemaCopyWithImpl<$Res,
        $Val extends ChallengeCreationSchema>
    implements $ChallengeCreationSchemaCopyWith<$Res> {
  _$ChallengeCreationSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengeCreationSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? participationType = null,
    Object? icon = null,
    Object? category = null,
    Object? confirmationType = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? regularityType = null,
    Object? timesPerDay = freezed,
    Object? timesPerWeek = freezed,
    Object? confirmationDays = freezed,
    Object? authorTgId = null,
    Object? price = null,
    Object? currency = null,
    Object? confirmationDescription = null,
    Object? maxParticipants = freezed,
    Object? confirmUntil = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      participationType: null == participationType
          ? _value.participationType
          : participationType // ignore: cast_nullable_to_non_nullable
              as ParticipationType,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      confirmationType: null == confirmationType
          ? _value.confirmationType
          : confirmationType // ignore: cast_nullable_to_non_nullable
              as ConfirmationType,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      regularityType: null == regularityType
          ? _value.regularityType
          : regularityType // ignore: cast_nullable_to_non_nullable
              as RegularityType,
      timesPerDay: freezed == timesPerDay
          ? _value.timesPerDay
          : timesPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      timesPerWeek: freezed == timesPerWeek
          ? _value.timesPerWeek
          : timesPerWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmationDays: freezed == confirmationDays
          ? _value.confirmationDays
          : confirmationDays // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      authorTgId: null == authorTgId
          ? _value.authorTgId
          : authorTgId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      confirmationDescription: null == confirmationDescription
          ? _value.confirmationDescription
          : confirmationDescription // ignore: cast_nullable_to_non_nullable
              as String,
      maxParticipants: freezed == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmUntil: null == confirmUntil
          ? _value.confirmUntil
          : confirmUntil // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChallengeCreationSchemaImplCopyWith<$Res>
    implements $ChallengeCreationSchemaCopyWith<$Res> {
  factory _$$ChallengeCreationSchemaImplCopyWith(
          _$ChallengeCreationSchemaImpl value,
          $Res Function(_$ChallengeCreationSchemaImpl) then) =
      __$$ChallengeCreationSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'participation_type') ParticipationType participationType,
      Icon icon,
      CategoryType category,
      @JsonKey(name: 'confirmation_type') ConfirmationType confirmationType,
      @JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'end_date') DateTime endDate,
      @JsonKey(name: 'regularity_type') RegularityType regularityType,
      @JsonKey(name: 'times_per_day') int? timesPerDay,
      @JsonKey(name: 'times_per_week') int? timesPerWeek,
      @JsonKey(name: 'confirmation_days') List<int>? confirmationDays,
      @JsonKey(name: 'author_tg_id') String authorTgId,
      int price,
      Currency currency,
      @JsonKey(name: 'confirmation_description') String confirmationDescription,
      @JsonKey(name: 'max_participants') int? maxParticipants,
      @JsonKey(name: 'confirm_until') String confirmUntil});
}

/// @nodoc
class __$$ChallengeCreationSchemaImplCopyWithImpl<$Res>
    extends _$ChallengeCreationSchemaCopyWithImpl<$Res,
        _$ChallengeCreationSchemaImpl>
    implements _$$ChallengeCreationSchemaImplCopyWith<$Res> {
  __$$ChallengeCreationSchemaImplCopyWithImpl(
      _$ChallengeCreationSchemaImpl _value,
      $Res Function(_$ChallengeCreationSchemaImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeCreationSchema
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? participationType = null,
    Object? icon = null,
    Object? category = null,
    Object? confirmationType = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? regularityType = null,
    Object? timesPerDay = freezed,
    Object? timesPerWeek = freezed,
    Object? confirmationDays = freezed,
    Object? authorTgId = null,
    Object? price = null,
    Object? currency = null,
    Object? confirmationDescription = null,
    Object? maxParticipants = freezed,
    Object? confirmUntil = null,
  }) {
    return _then(_$ChallengeCreationSchemaImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      participationType: null == participationType
          ? _value.participationType
          : participationType // ignore: cast_nullable_to_non_nullable
              as ParticipationType,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      confirmationType: null == confirmationType
          ? _value.confirmationType
          : confirmationType // ignore: cast_nullable_to_non_nullable
              as ConfirmationType,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      regularityType: null == regularityType
          ? _value.regularityType
          : regularityType // ignore: cast_nullable_to_non_nullable
              as RegularityType,
      timesPerDay: freezed == timesPerDay
          ? _value.timesPerDay
          : timesPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      timesPerWeek: freezed == timesPerWeek
          ? _value.timesPerWeek
          : timesPerWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmationDays: freezed == confirmationDays
          ? _value._confirmationDays
          : confirmationDays // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      authorTgId: null == authorTgId
          ? _value.authorTgId
          : authorTgId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      confirmationDescription: null == confirmationDescription
          ? _value.confirmationDescription
          : confirmationDescription // ignore: cast_nullable_to_non_nullable
              as String,
      maxParticipants: freezed == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmUntil: null == confirmUntil
          ? _value.confirmUntil
          : confirmUntil // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeCreationSchemaImpl implements _ChallengeCreationSchema {
  const _$ChallengeCreationSchemaImpl(
      {required this.name,
      @JsonKey(name: 'participation_type') required this.participationType,
      required this.icon,
      required this.category,
      @JsonKey(name: 'confirmation_type') required this.confirmationType,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      @JsonKey(name: 'regularity_type') required this.regularityType,
      @JsonKey(name: 'times_per_day') this.timesPerDay,
      @JsonKey(name: 'times_per_week') this.timesPerWeek,
      @JsonKey(name: 'confirmation_days') final List<int>? confirmationDays,
      @JsonKey(name: 'author_tg_id') required this.authorTgId,
      required this.price,
      required this.currency,
      @JsonKey(name: 'confirmation_description')
      required this.confirmationDescription,
      @JsonKey(name: 'max_participants') this.maxParticipants,
      @JsonKey(name: 'confirm_until') required this.confirmUntil})
      : _confirmationDays = confirmationDays;

  factory _$ChallengeCreationSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeCreationSchemaImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'participation_type')
  final ParticipationType participationType;
  @override
  final Icon icon;
  @override
  final CategoryType category;
  @override
  @JsonKey(name: 'confirmation_type')
  final ConfirmationType confirmationType;
  @override
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @override
  @JsonKey(name: 'end_date')
  final DateTime endDate;
  @override
  @JsonKey(name: 'regularity_type')
  final RegularityType regularityType;
  @override
  @JsonKey(name: 'times_per_day')
  final int? timesPerDay;
  @override
  @JsonKey(name: 'times_per_week')
  final int? timesPerWeek;
  final List<int>? _confirmationDays;
  @override
  @JsonKey(name: 'confirmation_days')
  List<int>? get confirmationDays {
    final value = _confirmationDays;
    if (value == null) return null;
    if (_confirmationDays is EqualUnmodifiableListView)
      return _confirmationDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'author_tg_id')
  final String authorTgId;
  @override
  final int price;
  @override
  final Currency currency;
  @override
  @JsonKey(name: 'confirmation_description')
  final String confirmationDescription;
  @override
  @JsonKey(name: 'max_participants')
  final int? maxParticipants;
  @override
  @JsonKey(name: 'confirm_until')
  final String confirmUntil;

  @override
  String toString() {
    return 'ChallengeCreationSchema(name: $name, participationType: $participationType, icon: $icon, category: $category, confirmationType: $confirmationType, startDate: $startDate, endDate: $endDate, regularityType: $regularityType, timesPerDay: $timesPerDay, timesPerWeek: $timesPerWeek, confirmationDays: $confirmationDays, authorTgId: $authorTgId, price: $price, currency: $currency, confirmationDescription: $confirmationDescription, maxParticipants: $maxParticipants, confirmUntil: $confirmUntil)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeCreationSchemaImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.participationType, participationType) ||
                other.participationType == participationType) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.confirmationType, confirmationType) ||
                other.confirmationType == confirmationType) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.regularityType, regularityType) ||
                other.regularityType == regularityType) &&
            (identical(other.timesPerDay, timesPerDay) ||
                other.timesPerDay == timesPerDay) &&
            (identical(other.timesPerWeek, timesPerWeek) ||
                other.timesPerWeek == timesPerWeek) &&
            const DeepCollectionEquality()
                .equals(other._confirmationDays, _confirmationDays) &&
            (identical(other.authorTgId, authorTgId) ||
                other.authorTgId == authorTgId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(
                    other.confirmationDescription, confirmationDescription) ||
                other.confirmationDescription == confirmationDescription) &&
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants) &&
            (identical(other.confirmUntil, confirmUntil) ||
                other.confirmUntil == confirmUntil));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      participationType,
      icon,
      category,
      confirmationType,
      startDate,
      endDate,
      regularityType,
      timesPerDay,
      timesPerWeek,
      const DeepCollectionEquality().hash(_confirmationDays),
      authorTgId,
      price,
      currency,
      confirmationDescription,
      maxParticipants,
      confirmUntil);

  /// Create a copy of ChallengeCreationSchema
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeCreationSchemaImplCopyWith<_$ChallengeCreationSchemaImpl>
      get copyWith => __$$ChallengeCreationSchemaImplCopyWithImpl<
          _$ChallengeCreationSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeCreationSchemaImplToJson(
      this,
    );
  }
}

abstract class _ChallengeCreationSchema implements ChallengeCreationSchema {
  const factory _ChallengeCreationSchema(
          {required final String name,
          @JsonKey(name: 'participation_type')
          required final ParticipationType participationType,
          required final Icon icon,
          required final CategoryType category,
          @JsonKey(name: 'confirmation_type')
          required final ConfirmationType confirmationType,
          @JsonKey(name: 'start_date') required final DateTime startDate,
          @JsonKey(name: 'end_date') required final DateTime endDate,
          @JsonKey(name: 'regularity_type')
          required final RegularityType regularityType,
          @JsonKey(name: 'times_per_day') final int? timesPerDay,
          @JsonKey(name: 'times_per_week') final int? timesPerWeek,
          @JsonKey(name: 'confirmation_days') final List<int>? confirmationDays,
          @JsonKey(name: 'author_tg_id') required final String authorTgId,
          required final int price,
          required final Currency currency,
          @JsonKey(name: 'confirmation_description')
          required final String confirmationDescription,
          @JsonKey(name: 'max_participants') final int? maxParticipants,
          @JsonKey(name: 'confirm_until') required final String confirmUntil}) =
      _$ChallengeCreationSchemaImpl;

  factory _ChallengeCreationSchema.fromJson(Map<String, dynamic> json) =
      _$ChallengeCreationSchemaImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'participation_type')
  ParticipationType get participationType;
  @override
  Icon get icon;
  @override
  CategoryType get category;
  @override
  @JsonKey(name: 'confirmation_type')
  ConfirmationType get confirmationType;
  @override
  @JsonKey(name: 'start_date')
  DateTime get startDate;
  @override
  @JsonKey(name: 'end_date')
  DateTime get endDate;
  @override
  @JsonKey(name: 'regularity_type')
  RegularityType get regularityType;
  @override
  @JsonKey(name: 'times_per_day')
  int? get timesPerDay;
  @override
  @JsonKey(name: 'times_per_week')
  int? get timesPerWeek;
  @override
  @JsonKey(name: 'confirmation_days')
  List<int>? get confirmationDays;
  @override
  @JsonKey(name: 'author_tg_id')
  String get authorTgId;
  @override
  int get price;
  @override
  Currency get currency;
  @override
  @JsonKey(name: 'confirmation_description')
  String get confirmationDescription;
  @override
  @JsonKey(name: 'max_participants')
  int? get maxParticipants;
  @override
  @JsonKey(name: 'confirm_until')
  String get confirmUntil;

  /// Create a copy of ChallengeCreationSchema
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeCreationSchemaImplCopyWith<_$ChallengeCreationSchemaImpl>
      get copyWith => throw _privateConstructorUsedError;
}
