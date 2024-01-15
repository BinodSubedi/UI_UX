import 'package:dartz/dartz.dart';
import 'package:game_buddy/core/errors/failures.dart';
import '../../data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String username, String password);
  Future<Either<Failure, User>> signup(
      {required String fullName,
      required String username,
      required String password});
  Future<Either<Failure, User>> pushLogin(String token);
}
