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
  String get participation_type => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get confirmation_type => throw _privateConstructorUsedError;
  String get start_date => throw _privateConstructorUsedError;
  String get end_date => throw _privateConstructorUsedError;
  String get regularity_type => throw _privateConstructorUsedError;
  int? get times_per_day => throw _privateConstructorUsedError;
  int? get times_per_week => throw _privateConstructorUsedError;
  List<int>? get confirmation_days => throw _privateConstructorUsedError;
  Author get author => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get confirmation_description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get max_participants => throw _privateConstructorUsedError;
  String get confirm_until => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  Chat get chat => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  Chat? get admin_chat => throw _privateConstructorUsedError;

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
      String participation_type,
      String icon,
      String category,
      String confirmation_type,
      String start_date,
      String end_date,
      String regularity_type,
      int? times_per_day,
      int? times_per_week,
      List<int>? confirmation_days,
      Author author,
      int price,
      String currency,
      String confirmation_description,
      String status,
      int max_participants,
      String confirm_until,
      String created_at,
      Chat chat,
      String link,
      Chat? admin_chat});

  $AuthorCopyWith<$Res> get author;
  $ChatCopyWith<$Res> get chat;
  $ChatCopyWith<$Res>? get admin_chat;
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
    Object? participation_type = null,
    Object? icon = null,
    Object? category = null,
    Object? confirmation_type = null,
    Object? start_date = null,
    Object? end_date = null,
    Object? regularity_type = null,
    Object? times_per_day = freezed,
    Object? times_per_week = freezed,
    Object? confirmation_days = freezed,
    Object? author = null,
    Object? price = null,
    Object? currency = null,
    Object? confirmation_description = null,
    Object? status = null,
    Object? max_participants = null,
    Object? confirm_until = null,
    Object? created_at = null,
    Object? chat = null,
    Object? link = null,
    Object? admin_chat = freezed,
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
      participation_type: null == participation_type
          ? _value.participation_type
          : participation_type // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      confirmation_type: null == confirmation_type
          ? _value.confirmation_type
          : confirmation_type // ignore: cast_nullable_to_non_nullable
              as String,
      start_date: null == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String,
      regularity_type: null == regularity_type
          ? _value.regularity_type
          : regularity_type // ignore: cast_nullable_to_non_nullable
              as String,
      times_per_day: freezed == times_per_day
          ? _value.times_per_day
          : times_per_day // ignore: cast_nullable_to_non_nullable
              as int?,
      times_per_week: freezed == times_per_week
          ? _value.times_per_week
          : times_per_week // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmation_days: freezed == confirmation_days
          ? _value.confirmation_days
          : confirmation_days // ignore: cast_nullable_to_non_nullable
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
      confirmation_description: null == confirmation_description
          ? _value.confirmation_description
          : confirmation_description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      max_participants: null == max_participants
          ? _value.max_participants
          : max_participants // ignore: cast_nullable_to_non_nullable
              as int,
      confirm_until: null == confirm_until
          ? _value.confirm_until
          : confirm_until // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      chat: null == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as Chat,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      admin_chat: freezed == admin_chat
          ? _value.admin_chat
          : admin_chat // ignore: cast_nullable_to_non_nullable
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
  $ChatCopyWith<$Res>? get admin_chat {
    if (_value.admin_chat == null) {
      return null;
    }

    return $ChatCopyWith<$Res>(_value.admin_chat!, (value) {
      return _then(_value.copyWith(admin_chat: value) as $Val);
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
      String participation_type,
      String icon,
      String category,
      String confirmation_type,
      String start_date,
      String end_date,
      String regularity_type,
      int? times_per_day,
      int? times_per_week,
      List<int>? confirmation_days,
      Author author,
      int price,
      String currency,
      String confirmation_description,
      String status,
      int max_participants,
      String confirm_until,
      String created_at,
      Chat chat,
      String link,
      Chat? admin_chat});

  @override
  $AuthorCopyWith<$Res> get author;
  @override
  $ChatCopyWith<$Res> get chat;
  @override
  $ChatCopyWith<$Res>? get admin_chat;
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
    Object? participation_type = null,
    Object? icon = null,
    Object? category = null,
    Object? confirmation_type = null,
    Object? start_date = null,
    Object? end_date = null,
    Object? regularity_type = null,
    Object? times_per_day = freezed,
    Object? times_per_week = freezed,
    Object? confirmation_days = freezed,
    Object? author = null,
    Object? price = null,
    Object? currency = null,
    Object? confirmation_description = null,
    Object? status = null,
    Object? max_participants = null,
    Object? confirm_until = null,
    Object? created_at = null,
    Object? chat = null,
    Object? link = null,
    Object? admin_chat = freezed,
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
      participation_type: null == participation_type
          ? _value.participation_type
          : participation_type // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      confirmation_type: null == confirmation_type
          ? _value.confirmation_type
          : confirmation_type // ignore: cast_nullable_to_non_nullable
              as String,
      start_date: null == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String,
      regularity_type: null == regularity_type
          ? _value.regularity_type
          : regularity_type // ignore: cast_nullable_to_non_nullable
              as String,
      times_per_day: freezed == times_per_day
          ? _value.times_per_day
          : times_per_day // ignore: cast_nullable_to_non_nullable
              as int?,
      times_per_week: freezed == times_per_week
          ? _value.times_per_week
          : times_per_week // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmation_days: freezed == confirmation_days
          ? _value._confirmation_days
          : confirmation_days // ignore: cast_nullable_to_non_nullable
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
      confirmation_description: null == confirmation_description
          ? _value.confirmation_description
          : confirmation_description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      max_participants: null == max_participants
          ? _value.max_participants
          : max_participants // ignore: cast_nullable_to_non_nullable
              as int,
      confirm_until: null == confirm_until
          ? _value.confirm_until
          : confirm_until // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      chat: null == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as Chat,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      admin_chat: freezed == admin_chat
          ? _value.admin_chat
          : admin_chat // ignore: cast_nullable_to_non_nullable
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
      required this.participation_type,
      required this.icon,
      required this.category,
      required this.confirmation_type,
      required this.start_date,
      required this.end_date,
      required this.regularity_type,
      this.times_per_day,
      this.times_per_week,
      final List<int>? confirmation_days,
      required this.author,
      required this.price,
      required this.currency,
      required this.confirmation_description,
      required this.status,
      required this.max_participants,
      required this.confirm_until,
      required this.created_at,
      required this.chat,
      required this.link,
      this.admin_chat})
      : _confirmation_days = confirmation_days,
        super._();

  factory _$ChallengeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChallengeModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String participation_type;
  @override
  final String icon;
  @override
  final String category;
  @override
  final String confirmation_type;
  @override
  final String start_date;
  @override
  final String end_date;
  @override
  final String regularity_type;
  @override
  final int? times_per_day;
  @override
  final int? times_per_week;
  final List<int>? _confirmation_days;
  @override
  List<int>? get confirmation_days {
    final value = _confirmation_days;
    if (value == null) return null;
    if (_confirmation_days is EqualUnmodifiableListView)
      return _confirmation_days;
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
  final String confirmation_description;
  @override
  final String status;
  @override
  final int max_participants;
  @override
  final String confirm_until;
  @override
  final String created_at;
  @override
  final Chat chat;
  @override
  final String link;
  @override
  final Chat? admin_chat;

  @override
  String toString() {
    return 'ChallengeModel(id: $id, name: $name, participation_type: $participation_type, icon: $icon, category: $category, confirmation_type: $confirmation_type, start_date: $start_date, end_date: $end_date, regularity_type: $regularity_type, times_per_day: $times_per_day, times_per_week: $times_per_week, confirmation_days: $confirmation_days, author: $author, price: $price, currency: $currency, confirmation_description: $confirmation_description, status: $status, max_participants: $max_participants, confirm_until: $confirm_until, created_at: $created_at, chat: $chat, link: $link, admin_chat: $admin_chat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChallengeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.participation_type, participation_type) ||
                other.participation_type == participation_type) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.confirmation_type, confirmation_type) ||
                other.confirmation_type == confirmation_type) &&
            (identical(other.start_date, start_date) ||
                other.start_date == start_date) &&
            (identical(other.end_date, end_date) ||
                other.end_date == end_date) &&
            (identical(other.regularity_type, regularity_type) ||
                other.regularity_type == regularity_type) &&
            (identical(other.times_per_day, times_per_day) ||
                other.times_per_day == times_per_day) &&
            (identical(other.times_per_week, times_per_week) ||
                other.times_per_week == times_per_week) &&
            const DeepCollectionEquality()
                .equals(other._confirmation_days, _confirmation_days) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(
                    other.confirmation_description, confirmation_description) ||
                other.confirmation_description == confirmation_description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.max_participants, max_participants) ||
                other.max_participants == max_participants) &&
            (identical(other.confirm_until, confirm_until) ||
                other.confirm_until == confirm_until) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.chat, chat) || other.chat == chat) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.admin_chat, admin_chat) ||
                other.admin_chat == admin_chat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        participation_type,
        icon,
        category,
        confirmation_type,
        start_date,
        end_date,
        regularity_type,
        times_per_day,
        times_per_week,
        const DeepCollectionEquality().hash(_confirmation_days),
        author,
        price,
        currency,
        confirmation_description,
        status,
        max_participants,
        confirm_until,
        created_at,
        chat,
        link,
        admin_chat
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
      required final String participation_type,
      required final String icon,
      required final String category,
      required final String confirmation_type,
      required final String start_date,
      required final String end_date,
      required final String regularity_type,
      final int? times_per_day,
      final int? times_per_week,
      final List<int>? confirmation_days,
      required final Author author,
      required final int price,
      required final String currency,
      required final String confirmation_description,
      required final String status,
      required final int max_participants,
      required final String confirm_until,
      required final String created_at,
      required final Chat chat,
      required final String link,
      final Chat? admin_chat}) = _$ChallengeModelImpl;
  const _ChallengeModel._() : super._();

  factory _ChallengeModel.fromJson(Map<String, dynamic> json) =
      _$ChallengeModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get participation_type;
  @override
  String get icon;
  @override
  String get category;
  @override
  String get confirmation_type;
  @override
  String get start_date;
  @override
  String get end_date;
  @override
  String get regularity_type;
  @override
  int? get times_per_day;
  @override
  int? get times_per_week;
  @override
  List<int>? get confirmation_days;
  @override
  Author get author;
  @override
  int get price;
  @override
  String get currency;
  @override
  String get confirmation_description;
  @override
  String get status;
  @override
  int get max_participants;
  @override
  String get confirm_until;
  @override
  String get created_at;
  @override
  Chat get chat;
  @override
  String get link;
  @override
  Chat? get admin_chat;

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
  String get tg_id => throw _privateConstructorUsedError;
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
      String tg_id,
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
    Object? tg_id = null,
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
      tg_id: null == tg_id
          ? _value.tg_id
          : tg_id // ignore: cast_nullable_to_non_nullable
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
      String tg_id,
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
    Object? tg_id = null,
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
      tg_id: null == tg_id
          ? _value.tg_id
          : tg_id // ignore: cast_nullable_to_non_nullable
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
      required this.tg_id,
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
  final String tg_id;
  @override
  final String name;
  @override
  final int coins;
  @override
  final String? photo;

  @override
  String toString() {
    return 'Author(id: $id, username: $username, tg_id: $tg_id, name: $name, coins: $coins, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.tg_id, tg_id) || other.tg_id == tg_id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.coins, coins) || other.coins == coins) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, tg_id, name, coins, photo);

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
      required final String tg_id,
      required final String name,
      required final int coins,
      final String? photo}) = _$AuthorImpl;

  factory _Author.fromJson(Map<String, dynamic> json) = _$AuthorImpl.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String get tg_id;
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
