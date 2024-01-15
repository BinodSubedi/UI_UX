class GameEntity {
  final String gameName;
  final String gameType;
  final String gameDescription;
  final String gameImage;
  final int popularity;
  final List<String> gameQuestions;

  GameEntity(
      {required this.gameName,
      required this.gameType,
      required this.gameDescription,
      required this.gameImage,
      required this.popularity,
      required this.gameQuestions});
}
