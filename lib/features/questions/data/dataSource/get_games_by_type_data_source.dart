import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/errors/failures.dart';
import 'package:http/http.dart' as http;

abstract class GetGamesRemoteSource {
  Future<Either<Failure, List<String>>> getGamesByType(
      String type, String token);
}

class GetGamesRemoteSourceImpl extends GetGamesRemoteSource {
  @override
  Future<Either<Failure, List<String>>> getGamesByType(
      String type, String token) async {
    final String ipAdd = dotenv.env['IP_URL'] ?? 'http://192.168.101.7:3000';

    try {
      var response = await http.get(
          Uri.parse('$ipAdd/api/v1/users/getGameByType/$type'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'authorization': 'Bearer $token'
          }).then((res) => jsonDecode(res.body));

      List<String> games =
          response['game'].map<String>((el) => el.toString()).toList();

      return Right(games);
    } catch (err) {
      // print(err);
      return Left(Exception(message: err.toString()));
    }
  }
}
