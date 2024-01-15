import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../../../core/errors/failures.dart';

abstract class AddGameAnswers {
  Future<Either<Failure, String>> addGameAnswers(
      List<String> answers, String token);
}

class AddGameAnswersImpl extends AddGameAnswers {
  @override
  Future<Either<Failure, String>> addGameAnswers(
      List<String> answers, String token) async {
    final String ipAdd = dotenv.env['IP_URL'] ?? 'http://192.168.101.7:3000';

    try {
      var response = await http
          .post(Uri.parse('$ipAdd/api/v1/users/addGameAnswers'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                'authorization': 'Bearer $token'
              },
              body: jsonEncode({"answers": answers}))
          .then((res) => jsonDecode(res.body));

      // print(response);

      if (response['status'] != 'success') {
        return left(Exception(message: response['message'].toString()));
      }

      return right(response['status'].toString());
    } catch (err) {
      print(err);
      return left(Exception(message: err.toString()));
    }
  }
}
