import 'package:dartz/dartz.dart';
import 'package:game_buddy/core/domain/entities/friend_entity.dart';
import 'package:game_buddy/core/errors/failures.dart';

abstract class MessageRepository {
  Future<Either<Failure, FriendEntity>> getLatestMsg(
      String userName, String token);
  Future<Either<Failure, String>> sendMsg(
      String msg, String userName, String token);
}
