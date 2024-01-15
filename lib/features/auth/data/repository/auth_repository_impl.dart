import 'package:dartz/dartz.dart';
import 'package:game_buddy/core/errors/failures.dart';
import 'package:game_buddy/core/service_locator.dart';
import 'package:game_buddy/features/auth/data/dataSource/login_remote_data_source.dart';
import 'package:game_buddy/features/auth/data/dataSource/signup_remote_source.dart';
import 'package:game_buddy/features/auth/data/models/user_model.dart';
import 'package:game_buddy/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, User>> login(String userName, String password) {
    // TODO: implement login
    return serviceLocator<LoginRemoteSource>().login(userName, password);
  }

  @override
  Future<Either<Failure, User>> signup(
      {required String fullName,
      required String username,
      required String password}) {
    // TODO: implement signup
    return serviceLocator<SignupRemoteSource>()
        .signup(fullName, username, password);
  }

  @override
  Future<Either<Failure, User>> pushLogin(String token) {
    return serviceLocator<LoginRemoteSource>().pushLogin(token);
  }
}
