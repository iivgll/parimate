// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Challenge _$ChallengeFromJson(Map<String, dynamic> json) {
  return _Challenge.fromJson(json);
}

/// @nodoc
mixin _$Challenge {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'participation_type')
  String get participationType => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon')
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmation_type')
  String get confirmationType => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  DateTime get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'regularity_type')
  String get regularityType => throw _privateConstructorUsedError;
  @JsonKey(name: 'times_per_day')
  int? get timesPerDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'times_per_week')
  int? get timesPerWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmation_days')
  List<int>? get confirmationDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'author', toJson: _userToJson, fromJson: _userFromJson)
  User get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency')
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmation_description')
  String get confirmationDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_participants')
  int? get maxParticipants => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_until')
  String get confirmUntil => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'chat', toJson: _chatToJson, fromJson: _chatFromJson)
  Chat get chat => throw _privateConstructorUsedError;
  @JsonKey(name: 'link')
  String get link => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'admin_chat',
      toJson: _chatToJsonNullable,
      fromJson: _chatFromJsonNullable)
  Chat? get adminChat => throw _privateConstructorUsedError;

  /// Serializes this Challenge to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChallengeCopyWith<Challenge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChallengeCopyWith<$Res> {
  factory $ChallengeCopyWith(Challenge value, $Res Function(Challenge) then) =
      _$ChallengeCopyWithImpl<$Res, Challenge>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'participation_type') String participationType,
      @JsonKey(name: 'icon') String icon,
      @JsonKey(name: 'category') String category,
      @JsonKey(name: 'confirmation_type') String confirmationType,
      @JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'end_date') DateTime endDate,
      @JsonKey(name: 'regularity_type') String regularityType,
      @JsonKey(name: 'times_per_day') int? timesPerDay,
      @JsonKey(name: 'times_per_week') int? timesPerWeek,
      @JsonKey(name: 'confirmation_days') List<int>? confirmationDays,
      @JsonKey(name: 'author', toJson: _userToJson, fromJson: _userFromJson)
      User author,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'currency') String currency,
      @JsonKey(name: 'confirmation_description') String confirmationDescription,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'max_participants') int? maxParticipants,
      @JsonKey(name: 'confirm_until') String confirmUntil,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'chat', toJson: _chatToJson, fromJson: _chatFromJson)
      Chat chat,
      @JsonKey(name: 'link') String link,
      @JsonKey(
          name: 'admin_chat',
          toJson: _chatToJsonNullable,
          fromJson: _chatFromJsonNullable)
      Chat? adminChat});

  $UserCopyWith<$Res> get author;
  $ChatCopyWith<$Res> get chat;
  $ChatCopyWith<$Res>? get adminChat;
}

/// @nodoc
class _$ChallengeCopyWithImpl<$Res, $Val extends Challenge>
    implements $ChallengeCopyWith<$Res> {
  _$ChallengeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Challenge
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
    Object? maxParticipants = freezed,
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
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
              as User,
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
      maxParticipants: freezed == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmUntil: null == confirmUntil
          ? _value.confirmUntil
          : confirmUntil // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get author {
    return $UserCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatCopyWith<$Res> get chat {
    return $ChatCopyWith<$Res>(_value.chat, (value) {
      return _then(_value.copyWith(chat: value) as $Val);
    });
  }

  /// Create a copy of Challenge
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
abstract class _$$ChallengeImplCopyWith<$Res>
    implements $ChallengeCopyWith<$Res> {
  factory _$$ChallengeImplCopyWith(
          _$ChallengeImpl value, $Res Function(_$ChallengeImpl) then) =
      __$$ChallengeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'participation_type') String participationType,
      @JsonKey(name: 'icon') String icon,
      @JsonKey(name: 'category') String category,
      @JsonKey(name: 'confirmation_type') String confirmationType,
      @JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'end_date') DateTime endDate,
      @JsonKey(name: 'regularity_type') String regularityType,
      @JsonKey(name: 'times_per_day') int? timesPerDay,
      @JsonKey(name: 'times_per_week') int? timesPerWeek,
      @JsonKey(name: 'confirmation_days') List<int>? confirmationDays,
      @JsonKey(name: 'author', toJson: _userToJson, fromJson: _userFromJson)
      User author,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'currency') String currency,
      @JsonKey(name: 'confirmation_description') String confirmationDescription,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'max_participants') int? maxParticipants,
      @JsonKey(name: 'confirm_until') String confirmUntil,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'chat', toJson: _chatToJson, fromJson: _chatFromJson)
      Chat chat,
      @JsonKey(name: 'link') String link,
      @JsonKey(
          name: 'admin_chat',
          toJson: _chatToJsonNullable,
          fromJson: _chatFromJsonNullable)
      Chat? adminChat});

  @override
  $UserCopyWith<$Res> get author;
  @override
  $ChatCopyWith<$Res> get chat;
  @override
  $ChatCopyWith<$Res>? get adminChat;
}

/// @nodoc
class __$$ChallengeImplCopyWithImpl<$Res>
    extends _$ChallengeCopyWithImpl<$Res, _$ChallengeImpl>
    implements _$$ChallengeImplCopyWith<$Res> {
  __$$ChallengeImplCopyWithImpl(
      _$ChallengeImpl _value, $Res Function(_$ChallengeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Challenge
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
    Object? maxParticipants = freezed,
    Object? confirmUntil = null,
    Object? createdAt = null,
    Object? chat = null,
    Object? link = null,
    Object? adminChat = freezed,
  }) {
    return _then(_$ChallengeImpl(
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
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
              as User,
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
      maxParticipants: freezed == maxParticipants
          ? _value.maxParticipants
          : maxParticipants // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmUntil: null == confirmUntil
          ? _value.confirmUntil
          : confirmUntil // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
class _$ChallengeImpl implements _Challenge {
  const _$ChallengeImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'participation_type') required this.participationType,
      @JsonKey(name: 'icon') required this.icon,
      @JsonKey(name: 'category') required this.category,
      @JsonKey(name: 'confirmation_type') required this.confirmationType,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      @JsonKey(name: 'regularity_type') required this.regularityType,
      @JsonKey(name: 'times_per_day') this.timesPerDay,
      @JsonKey(name: 'times_per_week') this.timesPerWeek,
      @JsonKey(name: 'confirmation_days') final List<int>? confirmationDays,
      @JsonKey(name: 'author', toJson: _userToJson, fromJson: _userFromJson)
      required this.author,
      @JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'currency') required this.currency,
      @JsonKey(name: 'confirmation_description')
      required this.confirmationDescription,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'max_participants') this.maxParticipants,
      @JsonKey(name: 'confirm_until') required this.confirmUntil,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'chat', toJson: _chatToJson, fromJson: _chatFromJson)
      required this.chat,
      @JsonKey(name: 'link') required this.link,
      @JsonKey(
          name: 'admin_chat',
          toJson: _chatToJsonNullable,
          fromJson: _chatFromJsonNullable)
      this.adminChat})
      : _confirmationDays = confirmationDays;

  factory _$ChallengeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'participation_type')
  final String participationType;
  @override
  @JsonKey(name: 'icon')
  final String icon;
  @override
  @JsonKey(name: 'category')
  final String category;
  @override
  @JsonKey(name: 'confirmation_type')
  final String confirmationType;
  @override
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @override
  @JsonKey(name: 'end_date')
  final DateTime endDate;
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
  @JsonKey(name: 'author', toJson: _userToJson, fromJson: _userFromJson)
  final User author;
  @override
  @JsonKey(name: 'price')
  final int price;
  @override
  @JsonKey(name: 'currency')
  final String currency;
  @override
  @JsonKey(name: 'confirmation_description')
  final String confirmationDescription;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'max_participants')
  final int? maxParticipants;
  @override
  @JsonKey(name: 'confirm_until')
  final String confirmUntil;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'chat', toJson: _chatToJson, fromJson: _chatFromJson)
  final Chat chat;
  @override
  @JsonKey(name: 'link')
  final String link;
  @override
  @JsonKey(
      name: 'admin_chat',
      toJson: _chatToJsonNullable,
      fromJson: _chatFromJsonNullable)
  final Chat? adminChat;

  @override
  String toString() {
    return 'Challenge(id: $id, name: $name, participationType: $participationType, icon: $icon, category: $category, confirmationType: $confirmationType, startDate: $startDate, endDate: $endDate, regularityType: $regularityType, timesPerDay: $timesPerDay, timesPerWeek: $timesPerWeek, confirmationDays: $confirmationDays, author: $author, price: $price, currency: $currency, confirmationDescription: $confirmationDescription, status: $status, maxParticipants: $maxParticipants, confirmUntil: $confirmUntil, createdAt: $createdAt, chat: $chat, link: $link, adminChat: $adminChat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeImpl &&
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

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChallengeImplCopyWith<_$ChallengeImpl> get copyWith =>
      __$$ChallengeImplCopyWithImpl<_$ChallengeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChallengeImplToJson(
      this,
    );
  }
}

abstract class _Challenge implements Challenge {
  const factory _Challenge(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'participation_type')
      required final String participationType,
      @JsonKey(name: 'icon') required final String icon,
      @JsonKey(name: 'category') required final String category,
      @JsonKey(name: 'confirmation_type')
      required final String confirmationType,
      @JsonKey(name: 'start_date') required final DateTime startDate,
      @JsonKey(name: 'end_date') required final DateTime endDate,
      @JsonKey(name: 'regularity_type') required final String regularityType,
      @JsonKey(name: 'times_per_day') final int? timesPerDay,
      @JsonKey(name: 'times_per_week') final int? timesPerWeek,
      @JsonKey(name: 'confirmation_days') final List<int>? confirmationDays,
      @JsonKey(name: 'author', toJson: _userToJson, fromJson: _userFromJson)
      required final User author,
      @JsonKey(name: 'price') required final int price,
      @JsonKey(name: 'currency') required final String currency,
      @JsonKey(name: 'confirmation_description')
      required final String confirmationDescription,
      @JsonKey(name: 'status') required final String status,
      @JsonKey(name: 'max_participants') final int? maxParticipants,
      @JsonKey(name: 'confirm_until') required final String confirmUntil,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'chat', toJson: _chatToJson, fromJson: _chatFromJson)
      required final Chat chat,
      @JsonKey(name: 'link') required final String link,
      @JsonKey(
          name: 'admin_chat',
          toJson: _chatToJsonNullable,
          fromJson: _chatFromJsonNullable)
      final Chat? adminChat}) = _$ChallengeImpl;

  factory _Challenge.fromJson(Map<String, dynamic> json) =
      _$ChallengeImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'participation_type')
  String get participationType;
  @override
  @JsonKey(name: 'icon')
  String get icon;
  @override
  @JsonKey(name: 'category')
  String get category;
  @override
  @JsonKey(name: 'confirmation_type')
  String get confirmationType;
  @override
  @JsonKey(name: 'start_date')
  DateTime get startDate;
  @override
  @JsonKey(name: 'end_date')
  DateTime get endDate;
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
  @JsonKey(name: 'author', toJson: _userToJson, fromJson: _userFromJson)
  User get author;
  @override
  @JsonKey(name: 'price')
  int get price;
  @override
  @JsonKey(name: 'currency')
  String get currency;
  @override
  @JsonKey(name: 'confirmation_description')
  String get confirmationDescription;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'max_participants')
  int? get maxParticipants;
  @override
  @JsonKey(name: 'confirm_until')
  String get confirmUntil;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'chat', toJson: _chatToJson, fromJson: _chatFromJson)
  Chat get chat;
  @override
  @JsonKey(name: 'link')
  String get link;
  @override
  @JsonKey(
      name: 'admin_chat',
      toJson: _chatToJsonNullable,
      fromJson: _chatFromJsonNullable)
  Chat? get adminChat;

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChallengeImplCopyWith<_$ChallengeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
