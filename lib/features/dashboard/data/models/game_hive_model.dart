import 'package:hive/hive.dart';

import '../../../../core/data/models/game_model.dart';

part 'game_hive_model.g.dart';

@HiveType(typeId: 2)
class GameHiveModel {
  @HiveField(0)
  final String gameName;

  @HiveField(1)
  final String gameType;

  @HiveField(2)
  final String gameDescription;

  @HiveField(3)
  final String gameImage;

  @HiveField(4)
  final int popularity;

  @HiveField(5)
  final List<String> gameQuestions;

  GameHiveModel(
      {required this.gameName,
      required this.gameType,
      required this.gameDescription,
      required this.gameImage,
      required this.popularity,
      required this.gameQuestions});

  Game toGame() => Game(
      gameName: gameName,
      gameType: gameType,
      gameDescription: gameDescription,
      gameImage: gameImage,
      popularity: popularity,
      gameQuestions: gameQuestions);

  static List<Game>? toGames(List<GameHiveModel>? vals) {
    if (vals == null) {
      return null;
    }

    List<Game> list = [];

    vals.forEach((element) {
      list.add(element.toGame());
    });

    return list;
  }

  static GameHiveModel toGameHiveModel(Game g) => GameHiveModel(
      gameName: g.gameName,
      gameType: g.gameType,
      gameDescription: g.gameDescription,
      gameImage: g.gameImage,
      popularity: g.popularity,
      gameQuestions: g.gameQuestions);

  static List<GameHiveModel>? toGameHiveModelList(List<Game>? gs) {
    if (gs == null) {
      return null;
    }

    List<GameHiveModel> list = [];
    gs.forEach((element) {
      list.add(toGameHiveModel(element));
    });
    return list;
  }
}
