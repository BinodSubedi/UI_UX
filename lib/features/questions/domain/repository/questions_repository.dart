import 'package:dartz/dartz.dart';
import 'package:game_buddy/core/errors/failures.dart';

abstract class QuestionsRepository {
  Future<Either<Failure, List<String>>> getGamesByType(
      String type, String token);
  Future<Either<Failure, List<List<String>>>> getQuestionsByGame(
      String game, String token);
  Future<Either<Failure, String>> addGame(
      Map<String, dynamic> gameDetails, String token);
  Future<Either<Failure, String>> addGameAnswers(
      List<String> answers, String token);
}
