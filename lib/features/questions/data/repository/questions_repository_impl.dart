import 'package:dartz/dartz.dart';
import 'package:game_buddy/core/errors/failures.dart';
import 'package:game_buddy/core/service_locator.dart';
import 'package:game_buddy/features/questions/data/dataSource/add_game_answers.dart';
import 'package:game_buddy/features/questions/data/dataSource/add_game_data_source.dart';
import 'package:game_buddy/features/questions/data/dataSource/get_games_by_type_data_source.dart';
import 'package:game_buddy/features/questions/data/dataSource/get_questions_by_type_data_source.dart';
import 'package:game_buddy/features/questions/domain/repository/questions_repository.dart';

class QuestionsRepositoryImpl implements QuestionsRepository {
  @override
  Future<Either<Failure, String>> addGame(
      Map<String, dynamic> gameDetails, String token) {
    // TODO: implement addGame
    return serviceLocator<AddGameRemoteSource>().addGame(gameDetails, token);
  }

  @override
  Future<Either<Failure, String>> addGameAnswers(
      List<String> answers, String token) {
    // TODO: implement addGameAnswers
    return serviceLocator<AddGameAnswers>().addGameAnswers(answers, token);
  }

  @override
  Future<Either<Failure, List<String>>> getGamesByType(
      String type, String token) {
    // TODO: implement getGamesByType
    return serviceLocator<GetGamesRemoteSource>().getGamesByType(type, token);
  }

  @override
  Future<Either<Failure, List<List<String>>>> getQuestionsByGame(
      String game, String token) {
    // TODO: implement getQuestionsByGame
    return serviceLocator<GetGamesQuestions>().getQuestionsByGame(game, token);
  }
}
