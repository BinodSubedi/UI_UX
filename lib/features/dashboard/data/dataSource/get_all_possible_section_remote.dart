import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_buddy/features/auth/data/models/user_model.dart';

import '../../../../core/errors/failures.dart';
import 'package:http/http.dart' as http;

abstract class GetAllPossibleSelectionRemoteSource {
  Future<Either<Failure, List<User>>> getAllPossibleSelection(String token);
}

class GetAllPossibleSelectionRemoteSourceImpl
    extends GetAllPossibleSelectionRemoteSource {
  @override
  Future<Either<Failure, List<User>>> getAllPossibleSelection(
      String token) async {
    final String ipAdd = dotenv.env['IP_URL'] ?? 'http://192.168.101.7:3000';
    try {
      var response = await http.get(
          Uri.parse('$ipAdd/api/v1/users/getAllPossibleSelection'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'authorization': 'Bearer $token'
          }).then((res) => jsonDecode(res.body));

      // print(response);

      // return response['users'];

      if (response['status'] == 'fail') {
        return Left(Exception(message: response['message'].toString()));
      }

      List<User> users =
          response['users'].map<User>((el) => User.fromJson(el)).toList();

      return Right(users);
    } catch (err) {
      print(err);
      return Left(Exception(message: err.toString()));
    }
  }
}
