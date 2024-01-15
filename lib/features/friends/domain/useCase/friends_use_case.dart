import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:game_buddy/core/domain/entities/friend_entity.dart';
import 'package:game_buddy/core/service_locator.dart';
import 'package:game_buddy/features/friends/domain/repository/friends_repository.dart';

import '../../../../core/data/models/friend_model.dart';
import '../../../../core/errors/failures.dart';

class FriendsUseCase {
  Future<Either<Failure, List<FriendEntity>>> getAllAcceptedFriends() async {
    String token =
        await serviceLocator<FlutterSecureStorage>().read(key: 'token') ??
            'token';

    final response =
        await serviceLocator<FriendsRepository>().getAllAcceptedFriends(token);

    return response.fold((l) => Left(l),
        (r) => Future.value(Right(FriendModel.toEntityList(r))));
  }
}
