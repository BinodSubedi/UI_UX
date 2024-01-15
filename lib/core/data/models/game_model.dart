import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_buddy/core/domain/entities/game_entity.dart';

part 'game_model.freezed.dart';
part 'game_model.g.dart';

@freezed
class Game with _$Game {
  // final String gameName;
  // final String gameType;
  // final String gameDescription;
  // final String gameImage;
  // final int popularity;
  // final List<String> gameQuestions;

  const factory Game(
      {required String gameName,
      required String gameType,
      required String gameDescription,
      required String gameImage,
      required int popularity,
      required List<String> gameQuestions}) = _Game;

  factory Game.fromJson(Map<String, Object?> json) => _$GameFromJson(json);
}

class GameModel {
  final String gameName;
  final String gameType;
  final String gameDescription;
  final String gameImage;
  final int popularity;
  final List<String> gameQuestions;

  late final Game _game = _gameinstance;

  GameModel(
      {required this.gameName,
      required this.gameType,
      required this.gameDescription,
      required this.gameImage,
      required this.popularity,
      required this.gameQuestions});

  Game get _gameinstance => Game(
      gameName: gameName,
      gameType: gameType,
      gameDescription: gameDescription,
      gameImage: gameImage,
      popularity: popularity,
      gameQuestions: gameQuestions);

  GameEntity toEntity() => GameEntity(
      gameName: _game.gameName,
      gameType: _game.gameType,
      gameDescription: _game.gameDescription,
      gameImage: _game.gameImage,
      popularity: _game.popularity,
      gameQuestions: _game.gameQuestions);

  static GameEntity toEntityDirect(Game game) => GameEntity(
      gameName: game.gameName,
      gameType: game.gameType,
      gameDescription: game.gameDescription,
      gameImage: game.gameImage,
      popularity: game.popularity,
      gameQuestions: game.gameQuestions);

  static List<GameEntity> toEntityList(List<Game> games) {
    List<GameEntity> gameEntities = [];
    games.forEach((game) {
      gameEntities.add(toEntityDirect(game));
    });
    return gameEntities;
  }

  static GameModel fromJson(Map<String, dynamic> json) {
    Game game = Game.fromJson(json);

    return GameModel(
        gameName: game.gameName,
        gameType: game.gameType,
        gameDescription: game.gameDescription,
        gameImage: game.gameImage,
        popularity: game.popularity,
        gameQuestions: game.gameQuestions);
  }
}
