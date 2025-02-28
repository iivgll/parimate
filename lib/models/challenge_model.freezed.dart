// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChallengeModel _$ChallengeModelFromJson(Map<String, dynamic> json) {
  return _ChallengeModel.fromJson(json);
}

/// @nodoc
mixin _$ChallengeModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'participation_type')
  String get participationType => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmation_type')
  String get confirmationType => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'regularity_type')
  String get regularityType => throw _privateConstructorUsedError;
  @JsonKey(name: 'times_per_day')
  int? get timesPerDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'times_per_week')
  int? get timesPerWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmation_days')
  List<int>? get confirmationDays => throw _privateConstructorUsedError;
  Author get author => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmation_description')
  String get confirmationDescription => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_participants')
  int get maxParticipants => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_until')
  String get confirmUntil => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  Chat get chat => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  @JsonKey(name: 'admin_chat')
  Chat? get adminChat => throw _privateConstructorUsedError;

  /// Serializes this ChallengeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChallengeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengeModelCopyWith<ChallengeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeModelCopyWith<$Res> {
  factory $ChallengeModelCopyWith(
          ChallengeModel value, $Res Function(ChallengeModel) then) =
      _$ChallengeModelCopyWithImpl<$Res, ChallengeModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'participation_type') String participationType,
      String icon,
      String category,
      @JsonKey(name: 'confirmation_type') String confirmationType,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      @JsonKey(name: 'regularity_type') String regularityType,
      @JsonKey(name: 'times_per_day') int? timesPerDay,
      @JsonKey(name: 'times_per_week') int? timesPerWeek,
      @JsonKey(name: 'confirmation_days') List<int>? confirmationDays,
      Author author,
      int price,
      String currency,
      @JsonKey(name: 'confirmation_description') String confirmationDescription,
      String status,
      @JsonKey(name: 'max_participants') int maxParticipants,
      @JsonKey(name: 'confirm_until') String confirmUntil,
      @JsonKey(name: 'created_at') String createdAt,
      Chat chat,
      String link,
      @JsonKey(name: 'admin_chat') Chat? adminChat});

  $AuthorCopyWith<$Res> get author;
  $ChatCopyWith<$Res> get chat;
  $ChatCopyWith<$Res>? get adminChat;
}

/// @nodoc
class _$ChallengeModelCopyWithImpl<$Res, $Val extends ChallengeModel>
    implements $ChallengeModelCopyWith<$Res> {
  _$ChallengeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChallengeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
    Object? author = null,
    Object? price = null,
    Object? currency = null,
    Object? confirmationDescription = null,
    Object? status = null,
    Object? maxParticipants = null,
    Object? confirmUntil = null,
    Object? createdAt = null,
    Object? chat = null,
    Object? link = null,
    Object? adminChat = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      participationType: null == participationType
          ? _value.participationType
          : participationType // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      confirmationType: null == confirmationType
          ? _value.confirmationType
          : confirmationType // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      regularityType: null == regularityType
          ? _value.regularityType
          : regularityType // ignore: cast_nullable_to_non_nullable
              as String,
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
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      confirmationDescription: null == confirmationDescription
          ? _value.confirmationDescription
          : confirmationDescription // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      maxParticipants: null == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int,
      confirmUntil: null == confirmUntil
          ? _value.confirmUntil
          : confirmUntil // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      chat: null == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as Chat,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      adminChat: freezed == adminChat
          ? _value.adminChat
          : adminChat // ignore: cast_nullable_to_non_nullable
              as Chat?,
    ) as $Val);
  }

  /// Create a copy of ChallengeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthorCopyWith<$Res> get author {
    return $AuthorCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }

  /// Create a copy of ChallengeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatCopyWith<$Res> get chat {
    return $ChatCopyWith<$Res>(_value.chat, (value) {
      return _then(_value.copyWith(chat: value) as $Val);
    });
  }

  /// Create a copy of ChallengeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatCopyWith<$Res>? get adminChat {
    if (_value.adminChat == null) {
      return null;
    }

    return $ChatCopyWith<$Res>(_value.adminChat!, (value) {
      return _then(_value.copyWith(adminChat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChallengeModelImplCopyWith<$Res>
    implements $ChallengeModelCopyWith<$Res> {
  factory _$$ChallengeModelImplCopyWith(_$ChallengeModelImpl value,
          $Res Function(_$ChallengeModelImpl) then) =
      __$$ChallengeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'participation_type') String participationType,
      String icon,
      String category,
      @JsonKey(name: 'confirmation_type') String confirmationType,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      @JsonKey(name: 'regularity_type') String regularityType,
      @JsonKey(name: 'times_per_day') int? timesPerDay,
      @JsonKey(name: 'times_per_week') int? timesPerWeek,
      @JsonKey(name: 'confirmation_days') List<int>? confirmationDays,
      Author author,
      int price,
      String currency,
      @JsonKey(name: 'confirmation_description') String confirmationDescription,
      String status,
      @JsonKey(name: 'max_participants') int maxParticipants,
      @JsonKey(name: 'confirm_until') String confirmUntil,
      @JsonKey(name: 'created_at') String createdAt,
      Chat chat,
      String link,
      @JsonKey(name: 'admin_chat') Chat? adminChat});

  @override
  $AuthorCopyWith<$Res> get author;
  @override
  $ChatCopyWith<$Res> get chat;
  @override
  $ChatCopyWith<$Res>? get adminChat;
}

/// @nodoc
class __$$ChallengeModelImplCopyWithImpl<$Res>
    extends _$ChallengeModelCopyWithImpl<$Res, _$ChallengeModelImpl>
    implements _$$ChallengeModelImplCopyWith<$Res> {
  __$$ChallengeModelImplCopyWithImpl(
      _$ChallengeModelImpl _value, $Res Function(_$ChallengeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChallengeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
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
    Object? author = null,
    Object? price = null,
    Object? currency = null,
    Object? confirmationDescription = null,
    Object? status = null,
    Object? maxParticipants = null,
    Object? confirmUntil = null,
    Object? createdAt = null,
    Object? chat = null,
    Object? link = null,
    Object? adminChat = freezed,
  }) {
    return _then(_$ChallengeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      participationType: null == participationType
          ? _value.participationType
          : participationType // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      confirmationType: null == confirmationType
          ? _value.confirmationType
          : confirmationType // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      regularityType: null == regularityType
          ? _value.regularityType
          : regularityType // ignore: cast_nullable_to_non_nullable
              as String,
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
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      confirmationDescription: null == confirmationDescription
          ? _value.confirmationDescription
          : confirmationDescription // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      maxParticipants: null == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int,
      confirmUntil: null == confirmUntil
          ? _value.confirmUntil
          : confirmUntil // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      chat: null == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as Chat,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      adminChat: freezed == adminChat
          ? _value.adminChat
          : adminChat // ignore: cast_nullable_to_non_nullable
              as Chat?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChallengeModelImpl extends _ChallengeModel {
  const _$ChallengeModelImpl(
      {required this.id,
      required this.name,
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
      required this.author,
      required this.price,
      required this.currency,
      @JsonKey(name: 'confirmation_description')
      required this.confirmationDescription,
      required this.status,
      @JsonKey(name: 'max_participants') required this.maxParticipants,
      @JsonKey(name: 'confirm_until') required this.confirmUntil,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.chat,
      required this.link,
      @JsonKey(name: 'admin_chat') this.adminChat})
      : _confirmationDays = confirmationDays,
        super._();

  factory _$ChallengeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'participation_type')
  final String participationType;
  @override
  final String icon;
  @override
  final String category;
  @override
  @JsonKey(name: 'confirmation_type')
  final String confirmationType;
  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String endDate;
  @override
  @JsonKey(name: 'regularity_type')
  final String regularityType;
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
  final Author author;
  @override
  final int price;
  @override
  final String currency;
  @override
  @JsonKey(name: 'confirmation_description')
  final String confirmationDescription;
  @override
  final String status;
  @override
  @JsonKey(name: 'max_participants')
  final int maxParticipants;
  @override
  @JsonKey(name: 'confirm_until')
  final String confirmUntil;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  final Chat chat;
  @override
  final String link;
  @override
  @JsonKey(name: 'admin_chat')
  final Chat? adminChat;

  @override
  String toString() {
    return 'ChallengeModel(id: $id, name: $name, participationType: $participationType, icon: $icon, category: $category, confirmationType: $confirmationType, startDate: $startDate, endDate: $endDate, regularityType: $regularityType, timesPerDay: $timesPerDay, timesPerWeek: $timesPerWeek, confirmationDays: $confirmationDays, author: $author, price: $price, currency: $currency, confirmationDescription: $confirmationDescription, status: $status, maxParticipants: $maxParticipants, confirmUntil: $confirmUntil, createdAt: $createdAt, chat: $chat, link: $link, adminChat: $adminChat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(other.author, author) || other.author == author) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(
                    other.confirmationDescription, confirmationDescription) ||
                other.confirmationDescription == confirmationDescription) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.maxParticipants, maxParticipants) ||
                other.maxParticipants == maxParticipants) &&
            (identical(other.confirmUntil, confirmUntil) ||
                other.confirmUntil == confirmUntil) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.chat, chat) || other.chat == chat) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.adminChat, adminChat) ||
                other.adminChat == adminChat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
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
        author,
        price,
        currency,
        confirmationDescription,
        status,
        maxParticipants,
        confirmUntil,
        createdAt,
        chat,
        link,
        adminChat
      ]);

  /// Create a copy of ChallengeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeModelImplCopyWith<_$ChallengeModelImpl> get copyWith =>
      __$$ChallengeModelImplCopyWithImpl<_$ChallengeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeModelImplToJson(
      this,
    );
  }
}

abstract class _ChallengeModel extends ChallengeModel {
  const factory _ChallengeModel(
      {required final int id,
      required final String name,
      @JsonKey(name: 'participation_type')
      required final String participationType,
      required final String icon,
      required final String category,
      @JsonKey(name: 'confirmation_type')
      required final String confirmationType,
      @JsonKey(name: 'start_date') required final String startDate,
      @JsonKey(name: 'end_date') required final String endDate,
      @JsonKey(name: 'regularity_type') required final String regularityType,
      @JsonKey(name: 'times_per_day') final int? timesPerDay,
      @JsonKey(name: 'times_per_week') final int? timesPerWeek,
      @JsonKey(name: 'confirmation_days') final List<int>? confirmationDays,
      required final Author author,
      required final int price,
      required final String currency,
      @JsonKey(name: 'confirmation_description')
      required final String confirmationDescription,
      required final String status,
      @JsonKey(name: 'max_participants') required final int maxParticipants,
      @JsonKey(name: 'confirm_until') required final String confirmUntil,
      @JsonKey(name: 'created_at') required final String createdAt,
      required final Chat chat,
      required final String link,
      @JsonKey(name: 'admin_chat')
      final Chat? adminChat}) = _$ChallengeModelImpl;
  const _ChallengeModel._() : super._();

  factory _ChallengeModel.fromJson(Map<String, dynamic> json) =
      _$ChallengeModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'participation_type')
  String get participationType;
  @override
  String get icon;
  @override
  String get category;
  @override
  @JsonKey(name: 'confirmation_type')
  String get confirmationType;
  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String get endDate;
  @override
  @JsonKey(name: 'regularity_type')
  String get regularityType;
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
  Author get author;
  @override
  int get price;
  @override
  String get currency;
  @override
  @JsonKey(name: 'confirmation_description')
  String get confirmationDescription;
  @override
  String get status;
  @override
  @JsonKey(name: 'max_participants')
  int get maxParticipants;
  @override
  @JsonKey(name: 'confirm_until')
  String get confirmUntil;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  Chat get chat;
  @override
  String get link;
  @override
  @JsonKey(name: 'admin_chat')
  Chat? get adminChat;

  /// Create a copy of ChallengeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeModelImplCopyWith<_$ChallengeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return _Author.fromJson(json);
}

/// @nodoc
mixin _$Author {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get tgId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get coins => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;

  /// Serializes this Author to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthorCopyWith<Author> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) then) =
      _$AuthorCopyWithImpl<$Res, Author>;
  @useResult
  $Res call(
      {int id,
      String username,
      String tgId,
      String name,
      int coins,
      String? photo});
}

/// @nodoc
class _$AuthorCopyWithImpl<$Res, $Val extends Author>
    implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? tgId = null,
    Object? name = null,
    Object? coins = null,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      tgId: null == tgId
          ? _value.tgId
          : tgId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      coins: null == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorImplCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$$AuthorImplCopyWith(
          _$AuthorImpl value, $Res Function(_$AuthorImpl) then) =
      __$$AuthorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String username,
      String tgId,
      String name,
      int coins,
      String? photo});
}

/// @nodoc
class __$$AuthorImplCopyWithImpl<$Res>
    extends _$AuthorCopyWithImpl<$Res, _$AuthorImpl>
    implements _$$AuthorImplCopyWith<$Res> {
  __$$AuthorImplCopyWithImpl(
      _$AuthorImpl _value, $Res Function(_$AuthorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? tgId = null,
    Object? name = null,
    Object? coins = null,
    Object? photo = freezed,
  }) {
    return _then(_$AuthorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      tgId: null == tgId
          ? _value.tgId
          : tgId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      coins: null == coins
          ? _value.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorImpl implements _Author {
  const _$AuthorImpl(
      {required this.id,
      required this.username,
      required this.tgId,
      required this.name,
      required this.coins,
      this.photo});

  factory _$AuthorImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorImplFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String tgId;
  @override
  final String name;
  @override
  final int coins;
  @override
  final String? photo;

  @override
  String toString() {
    return 'Author(id: $id, username: $username, tgId: $tgId, name: $name, coins: $coins, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.tgId, tgId) || other.tgId == tgId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.coins, coins) || other.coins == coins) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, tgId, name, coins, photo);

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorImplCopyWith<_$AuthorImpl> get copyWith =>
      __$$AuthorImplCopyWithImpl<_$AuthorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorImplToJson(
      this,
    );
  }
}

abstract class _Author implements Author {
  const factory _Author(
      {required final int id,
      required final String username,
      required final String tgId,
      required final String name,
      required final int coins,
      final String? photo}) = _$AuthorImpl;

  factory _Author.fromJson(Map<String, dynamic> json) = _$AuthorImpl.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String get tgId;
  @override
  String get name;
  @override
  int get coins;
  @override
  String? get photo;

  /// Create a copy of Author
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorImplCopyWith<_$AuthorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

/// @nodoc
mixin _$Chat {
  String get id => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;

  /// Serializes this Chat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res, Chat>;
  @useResult
  $Res call({String id, String link, String? photo});
}

/// @nodoc
class _$ChatCopyWithImpl<$Res, $Val extends Chat>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? link = null,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatImplCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$$ChatImplCopyWith(
          _$ChatImpl value, $Res Function(_$ChatImpl) then) =
      __$$ChatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String link, String? photo});
}

/// @nodoc
class __$$ChatImplCopyWithImpl<$Res>
    extends _$ChatCopyWithImpl<$Res, _$ChatImpl>
    implements _$$ChatImplCopyWith<$Res> {
  __$$ChatImplCopyWithImpl(_$ChatImpl _value, $Res Function(_$ChatImpl) _then)
      : super(_value, _then);

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? link = null,
    Object? photo = freezed,
  }) {
    return _then(_$ChatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatImpl implements _Chat {
  const _$ChatImpl({required this.id, required this.link, this.photo});

  factory _$ChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatImplFromJson(json);

  @override
  final String id;
  @override
  final String link;
  @override
  final String? photo;

  @override
  String toString() {
    return 'Chat(id: $id, link: $link, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, link, photo);

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      __$$ChatImplCopyWithImpl<_$ChatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatImplToJson(
      this,
    );
  }
}

abstract class _Chat implements Chat {
  const factory _Chat(
      {required final String id,
      required final String link,
      final String? photo}) = _$ChatImpl;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$ChatImpl.fromJson;

  @override
  String get id;
  @override
  String get link;
  @override
  String? get photo;

  /// Create a copy of Chat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
