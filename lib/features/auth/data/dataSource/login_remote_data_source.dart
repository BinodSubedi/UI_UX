import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_buddy/core/errors/failures.dart';
import 'package:game_buddy/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteSource {
  Future<Either<Failure, User>> login(String username, String password);
  Future<Either<Failure, User>> pushLogin(String token);
}

class LoginRemoteSourceImpl implements LoginRemoteSource {
  final String ipAdd = dotenv.env['IP_URL'] ?? 'http://192.168.101.7:3000';

  @override
  Future<Either<Failure, User>> login(String username, String password) async {
    try {
      var response = await http
          .post(Uri.parse('$ipAdd/api/v1/users/login'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode({'userName': username, 'password': password}))
          .then((res) => jsonDecode(res.body));

      if (response['status'] == 'fail') {
        return Left(Exception(message: response['message']));
      }
      return Right(User.fromJson(response['user']));

      //setting jwt token in local storage through flutter secure storage
    } catch (err) {
      return Left(Exception(message: 'Login Failed $err'));
    }
  }

  @override
  Future<Either<Failure, User>> pushLogin(String token) async {
    try {
      var response = await http.get(Uri.parse('$ipAdd/api/v1/users/pushLogin'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token'
          }).then((res) => jsonDecode(res.body));

      if (response['status'] == 'fail') {
        return Left(Exception(message: response['message']));
      }
      return Right(User.fromJson(response['user']));

      //setting jwt token in local storage through flutter secure storage
    } catch (err) {
      return Left(Exception(message: 'Login Failed $err'));
    }
  }
}
