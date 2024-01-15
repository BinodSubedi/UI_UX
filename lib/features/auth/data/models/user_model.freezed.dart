// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get fullName => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  List<List<String>>? get gamesAnsweres => throw _privateConstructorUsedError;
  String? get passwordChangedAt => throw _privateConstructorUsedError;
  List<Game>? get games => throw _privateConstructorUsedError;
  List<Friend>? get friends => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String fullName,
      String? password,
      String userName,
      List<List<String>>? gamesAnsweres,
      String? passwordChangedAt,
      List<Game>? games,
      List<Friend>? friends,
      String? token});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? password = freezed,
    Object? userName = null,
    Object? gamesAnsweres = freezed,
    Object? passwordChangedAt = freezed,
    Object? games = freezed,
    Object? friends = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      gamesAnsweres: freezed == gamesAnsweres
          ? _value.gamesAnsweres
          : gamesAnsweres // ignore: cast_nullable_to_non_nullable
              as List<List<String>>?,
      passwordChangedAt: freezed == passwordChangedAt
          ? _value.passwordChangedAt
          : passwordChangedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      games: freezed == games
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>?,
      friends: freezed == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<Friend>?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fullName,
      String? password,
      String userName,
      List<List<String>>? gamesAnsweres,
      String? passwordChangedAt,
      List<Game>? games,
      List<Friend>? friends,
      String? token});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? password = freezed,
    Object? userName = null,
    Object? gamesAnsweres = freezed,
    Object? passwordChangedAt = freezed,
    Object? games = freezed,
    Object? friends = freezed,
    Object? token = freezed,
  }) {
    return _then(_$_User(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      gamesAnsweres: freezed == gamesAnsweres
          ? _value._gamesAnsweres
          : gamesAnsweres // ignore: cast_nullable_to_non_nullable
              as List<List<String>>?,
      passwordChangedAt: freezed == passwordChangedAt
          ? _value.passwordChangedAt
          : passwordChangedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      games: freezed == games
          ? _value._games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>?,
      friends: freezed == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<Friend>?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User(
      {required this.fullName,
      this.password,
      required this.userName,
      final List<List<String>>? gamesAnsweres,
      this.passwordChangedAt,
      final List<Game>? games,
      final List<Friend>? friends,
      this.token})
      : _gamesAnsweres = gamesAnsweres,
        _games = games,
        _friends = friends;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String fullName;
  @override
  final String? password;
  @override
  final String userName;
  final List<List<String>>? _gamesAnsweres;
  @override
  List<List<String>>? get gamesAnsweres {
    final value = _gamesAnsweres;
    if (value == null) return null;
    if (_gamesAnsweres is EqualUnmodifiableListView) return _gamesAnsweres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? passwordChangedAt;
  final List<Game>? _games;
  @override
  List<Game>? get games {
    final value = _games;
    if (value == null) return null;
    if (_games is EqualUnmodifiableListView) return _games;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Friend>? _friends;
  @override
  List<Friend>? get friends {
    final value = _friends;
    if (value == null) return null;
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? token;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(fullName: $fullName, password: $password, userName: $userName, gamesAnsweres: $gamesAnsweres, passwordChangedAt: $passwordChangedAt, games: $games, friends: $friends, token: $token)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('fullName', fullName))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('gamesAnsweres', gamesAnsweres))
      ..add(DiagnosticsProperty('passwordChangedAt', passwordChangedAt))
      ..add(DiagnosticsProperty('games', games))
      ..add(DiagnosticsProperty('friends', friends))
      ..add(DiagnosticsProperty('token', token));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            const DeepCollectionEquality()
                .equals(other._gamesAnsweres, _gamesAnsweres) &&
            (identical(other.passwordChangedAt, passwordChangedAt) ||
                other.passwordChangedAt == passwordChangedAt) &&
            const DeepCollectionEquality().equals(other._games, _games) &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fullName,
      password,
      userName,
      const DeepCollectionEquality().hash(_gamesAnsweres),
      passwordChangedAt,
      const DeepCollectionEquality().hash(_games),
      const DeepCollectionEquality().hash(_friends),
      token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String fullName,
      final String? password,
      required final String userName,
      final List<List<String>>? gamesAnsweres,
      final String? passwordChangedAt,
      final List<Game>? games,
      final List<Friend>? friends,
      final String? token}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get fullName;
  @override
  String? get password;
  @override
  String get userName;
  @override
  List<List<String>>? get gamesAnsweres;
  @override
  String? get passwordChangedAt;
  @override
  List<Game>? get games;
  @override
  List<Friend>? get friends;
  @override
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
