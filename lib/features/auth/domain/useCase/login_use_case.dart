import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:game_buddy/core/errors/failures.dart';
import 'package:game_buddy/core/service_locator.dart';
import 'package:game_buddy/features/auth/data/models/user_model.dart';
import 'package:game_buddy/features/auth/domain/entities/user_entity.dart';
import 'package:game_buddy/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  Future<Either<Failure, UserEntity>> login(
      String username, String password) async {
    final response =
        await serviceLocator<AuthRepository>().login(username, password);

    final Future<Either<Failure, UserEntity>> returner =
        response.fold((l) => Future.value(Left(l)), (r) async {
      // print(r.token);
      await serviceLocator<FlutterSecureStorage>()
          .write(key: 'token', value: r.token);
      return Future.value(Right(UserModel.toEntityDirect(r)));
    });

    return returner;
  }

  Future<Either<Failure, UserEntity>> pushLogin() async {
    String? token =
        await serviceLocator<FlutterSecureStorage>().read(key: 'token');

    final response = await serviceLocator<AuthRepository>().pushLogin(token!);

    final Future<Either<Failure, UserEntity>> returner =
        response.fold((l) => Future.value(Left(l)), (r) async {
      // print(r.token);
      // await serviceLocator<FlutterSecureStorage>()
      //     .write(key: 'token', value: r.token);
      return Future.value(Right(UserModel.toEntityDirect(r)));
    });

    return returner;
  }
}
