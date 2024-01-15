import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_buddy/core/data/models/friend_model.dart';

import '../../../../core/domain/entities/friend_entity.dart';
import '../../../../core/errors/failures.dart';
import 'package:http/http.dart' as http;

abstract class GetLatestMsgRemoteDataSource {
  Future<Either<Failure, FriendEntity>> getLatestMsg(
      String userName, String token);
}

class GetLatestMsgRemoteDataSourceImpl implements GetLatestMsgRemoteDataSource {
  @override
  Future<Either<Failure, FriendEntity>> getLatestMsg(
      String userName, String token) async {
    // TODO: implement getLatestMsg
    final String ipAdd = dotenv.env['IP_URL'] ?? 'http://192.168.101.7:3000';
    try {
      var response = await http
          .post(Uri.parse('$ipAdd/api/v1/users/getLatestMsg'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'authorization': 'Bearer $token'
              },
              body: jsonEncode({'userName': userName}))
          .then((res) => jsonDecode(res.body));

      if (response['status'] == 'success') {
        return Right(FriendModel.toEntityDirect(
            Friend.fromJson(response['friendData'])));
      }

      return Left(Exception(message: response['message'].toString()));
    } catch (err) {
      print(err);
      return Left(Exception(message: err.toString()));
    }
  }
}
