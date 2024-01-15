import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/errors/failures.dart';
import 'package:http/http.dart' as http;

abstract class AddGameRemoteSource {
  Future<Either<Failure, String>> addGame(
      Map<String, dynamic> gameDetails, String token);
}

class AddGameRemoteSourceImpl extends AddGameRemoteSource {
  @override
  Future<Either<Failure, String>> addGame(
      Map<String, dynamic> gameDetails, String token) async {
    final String ipAdd = dotenv.env['IP_URL'] ?? 'http://192.168.101.7:3000';
    try {
      var response = await http
          .post(Uri.parse('$ipAdd/api/v1/users/addGame'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'authorization': 'Bearer $token'
              },
              body: jsonEncode({"game": gameDetails}))
          .then((res) => jsonDecode(res.body));

      // print(response);
      // return response;
      if (response['status'] == 'success') {
        return Right(response['status'].toString());
      }

      return Left(Exception(message: response['message'].toString()));
    } catch (err) {
      print(err);
      return Left(Exception(message: err.toString()));
    }
  }
}
