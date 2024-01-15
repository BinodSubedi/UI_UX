import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:game_buddy/core/errors/failures.dart';
import 'package:game_buddy/core/service_locator.dart';
import 'package:game_buddy/features/auth/data/models/user_model.dart';
import 'package:game_buddy/features/auth/domain/entities/user_entity.dart';
import 'package:game_buddy/features/auth/domain/repository/auth_repository.dart';

class SignupUseCase {
  Future<Either<Failure, UserEntity>> signup(
      {required username,
      required String password,
      required String fullName}) async {
    final response = await serviceLocator<AuthRepository>()
        .signup(fullName: fullName, username: username, password: password);

    final Future<Either<Failure, UserEntity>> returner =
        response.fold((l) => Future.value(Left(l)), (r) async {
      await serviceLocator<FlutterSecureStorage>()
          .write(key: 'token', value: r.token);
      return Future.value(Right(UserModel.toEntityDirect(r)));
    });

    return returner;
  }
}
