import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/errors/failures.dart';
import '../../../auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AddFriendRemoteSource {
  Future<Either<Failure, String>> addFriend(String token, String userName);
}

class AddFriendRemoteSourceImpl implements AddFriendRemoteSource {
  @override
  Future<Either<Failure, String>> addFriend(
      String token, String userName) async {
    final String ipAdd = dotenv.env['IP_URL'] ?? 'http://192.168.101.7:3000';
    try {
      var response = await http
          .post(Uri.parse('$ipAdd/api/v1/users/addFriend'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'authorization': 'Bearer $token'
              },
              body: jsonEncode({"userName": userName}))
          .then((res) => jsonDecode(res.body));

      // return response['status'];

      if (response['status'] == 'fail') {
        return Left(Exception(message: response['message'].toString()));
      }

      return Right(response['status'].toString());
    } catch (err) {
      return Left(Exception(message: err.toString()));
    }
  }
}
