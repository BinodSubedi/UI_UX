import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/errors/failures.dart';
import 'package:http/http.dart' as http;

abstract class SendMsgRemoteSource {
  Future<Either<Failure, String>> sendMsg(
      String msg, String userName, String token);
}

class SendMsgRemoteSourceImpl implements SendMsgRemoteSource {
  @override
  Future<Either<Failure, String>> sendMsg(
      String msg, String userName, String token) async {
    // TODO: implement sendMsg
    final String ipAdd = dotenv.env['IP_URL'] ?? 'http://192.168.101.7:3000';
    try {
      var response = await http
          .post(Uri.parse('$ipAdd/api/v1/users/doConversation'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'authorization': 'Bearer $token'
              },
              body: jsonEncode({'userName': userName, 'message': msg}))
          .then((res) => jsonDecode(res.body));

      if (response['status'] == 'success') {
        return Right(response['message'].toString());
      }

      return Left(Exception(message: response['message'].toString()));
    } catch (err) {
      return Left(Exception(message: err.toString()));
    }
  }
}
