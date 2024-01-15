import '../../../features/message/domain/entities/conversation_entity.dart';

class FriendEntity {
  final dynamic friend;
  final String? status;
  final ConversationEntity? conversation;
  final String userName;

  FriendEntity(
      {this.friend, this.status, required this.userName, this.conversation});
}
