import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:game_buddy/core/service_locator.dart';
import 'package:game_buddy/features/auth/domain/entities/user_entity.dart';
import 'package:game_buddy/features/dashboard/domain/repository/dashboard_repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../auth/data/models/user_model.dart';

class DashBoardUseCase {
  Future<Either<Failure, List<UserEntity>>> getAllPossibleSelection() async {
    final token =
        await serviceLocator<FlutterSecureStorage>().read(key: 'token') ??
            'token';

    Either<Failure, List<User>> response =
        await serviceLocator<DashBoardRepository>()
            .getAllPossibleSelection(token);

    return response.fold((l) => Left(Exception(message: l.message)),
        (r) => Right(UserModel.toEntityListDirect(r)));
  }

  Future<Either<Failure, String>> addFriend(String userName) async {
    final token =
        await serviceLocator<FlutterSecureStorage>().read(key: 'token') ??
            'token';
    return serviceLocator<DashBoardRepository>().addFriend(userName, token);
  }
}
