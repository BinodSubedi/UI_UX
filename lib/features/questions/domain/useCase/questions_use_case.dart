import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:game_buddy/core/service_locator.dart';
import 'package:game_buddy/features/questions/domain/repository/questions_repository.dart';

import '../../../../core/errors/failures.dart';

class QuestionsUseCase {
  Future<Either<Failure, List<String>>> getGamesByType(String type) async {
    String token =
        await serviceLocator<FlutterSecureStorage>().read(key: 'token') ??
            'token';
    final response =
        await serviceLocator<QuestionsRepository>().getGamesByType(type, token);

    final Future<Either<Failure, List<String>>> returner = response.fold(
        (l) => Future.value(Left(l)), (r) => Future.value(Right(r)));

    return returner;
  }

  Future<Either<Failure, List<List<String>>>> getQuestionsByGame(
      String game) async {
    String token =
        await serviceLocator<FlutterSecureStorage>().read(key: 'token') ??
            'token';
    final response = await serviceLocator<QuestionsRepository>()
        .getQuestionsByGame(game, token);

    final Future<Either<Failure, List<List<String>>>> returner = response.fold(
        (l) => Future.value(Left(l)), (r) => Future.value(Right(r)));

    return returner;
  }

  Future<Either<Failure, String>> addGame(
      Map<String, dynamic> gameDetails) async {
    String token =
        await serviceLocator<FlutterSecureStorage>().read(key: 'token') ??
            'token';
    final response =
        await serviceLocator<QuestionsRepository>().addGame(gameDetails, token);

    final Future<Either<Failure, String>> returner = response.fold(
        (l) => Future.value(Left(l)), (r) => Future.value(Right(r)));

    return returner;
  }

  Future<Either<Failure, String>> addGameAnswers(List<String> answers) async {
    String token =
        await serviceLocator<FlutterSecureStorage>().read(key: 'token') ??
            'token';
    final response = await serviceLocator<QuestionsRepository>()
        .addGameAnswers(answers, token);

    final Future<Either<Failure, String>> returner = response.fold(
        (l) => Future.value(Left(l)), (r) => Future.value(Right(r)));

    return returner;
  }
}
