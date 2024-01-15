import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_buddy/features/auth/data/models/user_model.dart';

import '../../../../core/errors/failures.dart';
import 'package:http/http.dart' as http;
// import '../models/user_model.dart';

abstract class SignupRemoteSource {
  Future<Either<Failure, User>> signup(
      String fullName, String userName, String password);
}

class SignupRemoteSourceImpl implements SignupRemoteSource {
  final String ipAdd = dotenv.env['IP_URL'] ?? 'http://192.168.101.7:3000';

  @override
  Future<Either<Failure, User>> signup(
      String fullName, String userName, String password) async {
    try {
      var response = await http
          .post(Uri.parse('$ipAdd/api/v1/users/signup'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode({
                'fullName': fullName,
                'userName': userName,
                'password': password
              }))
          .then((res) => jsonDecode(res.body));

      // print(response);

      if (response['status'] == 'fail') {
        return left(const Exception(message: 'Signup Failed'));
      }

      //setting jwt token in local storage through flutter secure storage

      // return response['user'];

      return right(User.fromJson(response['user']));
    } catch (err) {
      // print(err);
      return left(Exception(message: 'Signup Failed $err'));
    }
  }
}
