import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/data/models/friend_model.dart';
import '../../../../core/errors/failures.dart';

import 'package:http/http.dart' as http;

abstract class GetAllFriendsRemoteSource {
  Future<Either<Failure, List<Friend>>> getAllAcceptedFriends(String token);
}

class GetAllFriendsRemoteSourceImpl implements GetAllFriendsRemoteSource {
  final String ipAdd = dotenv.env['IP_URL'] ?? 'http://192.168.101.7:3000';

  @override
  Future<Either<Failure, List<Friend>>> getAllAcceptedFriends(
      String token) async {
    try {
      var response = await http.get(
          Uri.parse('$ipAdd/api/v1/users/getAceptedFriends'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'authorization': 'Bearer $token'
          }).then((res) => jsonDecode(res.body));

      if (response['status'] == 'fail') {
        return Left(Exception(message: response['message'].toString()));
      }

      List<Friend> friends =
          response['friends'].map<Friend>((el) => Friend.fromJson(el)).toList();

      return Right(friends);
    } catch (err) {
      // print(err);
      return Left(Exception(message: err.toString()));
    }
  }
}
