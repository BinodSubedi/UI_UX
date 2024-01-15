import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:game_buddy/features/message/domain/repository/message_repository.dart';

import '../../../../core/domain/entities/friend_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/service_locator.dart';

class MessageUseCase {
  Future<Either<Failure, FriendEntity>> getLatestMsg(String userName) async {
    String token =
        await serviceLocator<FlutterSecureStorage>().read(key: 'token') ??
            'token';

    return serviceLocator<MessageRepository>().getLatestMsg(userName, token);
  }

  Future<Either<Failure, String>> sendMsg(String msg, String userName) async {
    String token =
        await serviceLocator<FlutterSecureStorage>().read(key: 'token') ??
            'token';

    return serviceLocator<MessageRepository>().sendMsg(msg, userName, token);
  }
}
