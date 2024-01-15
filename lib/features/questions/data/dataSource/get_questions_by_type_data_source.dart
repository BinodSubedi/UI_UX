import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/errors/failures.dart';

import 'package:http/http.dart' as http;

abstract class GetGamesQuestions {
  Future<Either<Failure, List<List<String>>>> getQuestionsByGame(
      String game, String token);
}

class GetGamesQuestionsImpl extends GetGamesQuestions {
  @override
  Future<Either<Failure, List<List<String>>>> getQuestionsByGame(
      String game, String token) async {
    try {
      final String ipAdd = dotenv.env['IP_URL'] ?? 'http://192.168.101.7:3000';
      var response = await http.get(
          Uri.parse('$ipAdd/api/v1/users/getAllQuestions/$game'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'authorization': 'Bearer $token'
          }).then((res) => jsonDecode(res.body));

      List<List<String>> questions = [];

      response['questions'].forEach((el) {
        questions.add(el.map<String>((el) => el.toString()).toList());
      });

      // print(questions);

      // return response['questions'];
      return Right(questions);
    } catch (err, stk) {
      print(err);
      print(stk);
      return Left(Exception(message: err.toString()));
    }
  }
}
