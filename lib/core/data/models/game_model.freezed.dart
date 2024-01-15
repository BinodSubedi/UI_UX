// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Game _$GameFromJson(Map<String, dynamic> json) {
  return _Game.fromJson(json);
}

/// @nodoc
mixin _$Game {
  String get gameName => throw _privateConstructorUsedError;
  String get gameType => throw _privateConstructorUsedError;
  String get gameDescription => throw _privateConstructorUsedError;
  String get gameImage => throw _privateConstructorUsedError;
  int get popularity => throw _privateConstructorUsedError;
  List<String> get gameQuestions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res, Game>;
  @useResult
  $Res call(
      {String gameName,
      String gameType,
      String gameDescription,
      String gameImage,
      int popularity,
      List<String> gameQuestions});
}

/// @nodoc
class _$GameCopyWithImpl<$Res, $Val extends Game>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameName = null,
    Object? gameType = null,
    Object? gameDescription = null,
    Object? gameImage = null,
    Object? popularity = null,
    Object? gameQuestions = null,
  }) {
    return _then(_value.copyWith(
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      gameType: null == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      gameDescription: null == gameDescription
          ? _value.gameDescription
          : gameDescription // ignore: cast_nullable_to_non_nullable
              as String,
      gameImage: null == gameImage
          ? _value.gameImage
          : gameImage // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int,
      gameQuestions: null == gameQuestions
          ? _value.gameQuestions
          : gameQuestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$$_GameCopyWith(_$_Game value, $Res Function(_$_Game) then) =
      __$$_GameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gameName,
      String gameType,
      String gameDescription,
      String gameImage,
      int popularity,
      List<String> gameQuestions});
}

/// @nodoc
class __$$_GameCopyWithImpl<$Res> extends _$GameCopyWithImpl<$Res, _$_Game>
    implements _$$_GameCopyWith<$Res> {
  __$$_GameCopyWithImpl(_$_Game _value, $Res Function(_$_Game) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameName = null,
    Object? gameType = null,
    Object? gameDescription = null,
    Object? gameImage = null,
    Object? popularity = null,
    Object? gameQuestions = null,
  }) {
    return _then(_$_Game(
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      gameType: null == gameType
          ? _value.gameType
          : gameType // ignore: cast_nullable_to_non_nullable
              as String,
      gameDescription: null == gameDescription
          ? _value.gameDescription
          : gameDescription // ignore: cast_nullable_to_non_nullable
              as String,
      gameImage: null == gameImage
          ? _value.gameImage
          : gameImage // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int,
      gameQuestions: null == gameQuestions
          ? _value._gameQuestions
          : gameQuestions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Game with DiagnosticableTreeMixin implements _Game {
  const _$_Game(
      {required this.gameName,
      required this.gameType,
      required this.gameDescription,
      required this.gameImage,
      required this.popularity,
      required final List<String> gameQuestions})
      : _gameQuestions = gameQuestions;

  factory _$_Game.fromJson(Map<String, dynamic> json) => _$$_GameFromJson(json);

  @override
  final String gameName;
  @override
  final String gameType;
  @override
  final String gameDescription;
  @override
  final String gameImage;
  @override
  final int popularity;
  final List<String> _gameQuestions;
  @override
  List<String> get gameQuestions {
    if (_gameQuestions is EqualUnmodifiableListView) return _gameQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gameQuestions);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Game(gameName: $gameName, gameType: $gameType, gameDescription: $gameDescription, gameImage: $gameImage, popularity: $popularity, gameQuestions: $gameQuestions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Game'))
      ..add(DiagnosticsProperty('gameName', gameName))
      ..add(DiagnosticsProperty('gameType', gameType))
      ..add(DiagnosticsProperty('gameDescription', gameDescription))
      ..add(DiagnosticsProperty('gameImage', gameImage))
      ..add(DiagnosticsProperty('popularity', popularity))
      ..add(DiagnosticsProperty('gameQuestions', gameQuestions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Game &&
            (identical(other.gameName, gameName) ||
                other.gameName == gameName) &&
            (identical(other.gameType, gameType) ||
                other.gameType == gameType) &&
            (identical(other.gameDescription, gameDescription) ||
                other.gameDescription == gameDescription) &&
            (identical(other.gameImage, gameImage) ||
                other.gameImage == gameImage) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            const DeepCollectionEquality()
                .equals(other._gameQuestions, _gameQuestions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gameName,
      gameType,
      gameDescription,
      gameImage,
      popularity,
      const DeepCollectionEquality().hash(_gameQuestions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameCopyWith<_$_Game> get copyWith =>
      __$$_GameCopyWithImpl<_$_Game>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameToJson(
      this,
    );
  }
}

abstract class _Game implements Game {
  const factory _Game(
      {required final String gameName,
      required final String gameType,
      required final String gameDescription,
      required final String gameImage,
      required final int popularity,
      required final List<String> gameQuestions}) = _$_Game;

  factory _Game.fromJson(Map<String, dynamic> json) = _$_Game.fromJson;

  @override
  String get gameName;
  @override
  String get gameType;
  @override
  String get gameDescription;
  @override
  String get gameImage;
  @override
  int get popularity;
  @override
  List<String> get gameQuestions;
  @override
  @JsonKey(ignore: true)
  _$$_GameCopyWith<_$_Game> get copyWith => throw _privateConstructorUsedError;
}
