import 'package:dartz/dartz.dart';
import 'package:game_buddy/core/domain/entities/friend_entity.dart';
import 'package:game_buddy/core/errors/failures.dart';
import 'package:game_buddy/core/presentation/view-model/main_events.dart';
import 'package:game_buddy/core/service_locator.dart';
import 'package:game_buddy/features/message/data/dataSource/get_latest_msg_remote_source.dart';
import 'package:game_buddy/features/message/data/dataSource/send_msg_remote_source.dart';
import 'package:game_buddy/features/message/domain/repository/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  @override
  Future<Either<Failure, FriendEntity>> getLatestMsg(
      String userName, String token) {
    // TODO: implement getLatestMsg
    return serviceLocator<GetLatestMsgRemoteDataSource>()
        .getLatestMsg(userName, token);
  }

  @override
  Future<Either<Failure, String>> sendMsg(
      String msg, String userName, String token) {
    // TODO: implement sendMsg
    return serviceLocator<SendMsgRemoteSource>().sendMsg(msg, userName, token);
  }
}
