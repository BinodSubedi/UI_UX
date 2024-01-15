import 'package:game_buddy/core/data/models/friend_model.dart';
import 'package:game_buddy/features/dashboard/data/models/conversation_hive_model.dart';
import 'package:hive/hive.dart';

part 'friend_hive_model.g.dart';

@HiveType(typeId: 3)
class FriendHiveModel {
  @HiveField(0)
  final dynamic friend;
  @HiveField(1)
  final String status;
  @HiveField(2)
  final String userName;
  @HiveField(3)
  final ConversationHiveModel conversation;

  FriendHiveModel(
      {required this.userName,
      required this.conversation,
      this.friend,
      required this.status});

  Friend toFriend() => Friend(
      friend: friend,
      status: status,
      userName: userName,
      conversation: conversation.toConversation());

  static List<Friend>? toFriendList(List<FriendHiveModel>? val) {
    if (val == null) {
      return null;
    }
    List<Friend> list = [];

    val.forEach((element) {
      list.add(element.toFriend());
    });

    return list;
  }

  static FriendHiveModel toFriendHiveModel(Friend friend) => FriendHiveModel(
      userName: friend.userName,
      conversation:
          ConversationHiveModel.fromConversation(friend.conversation!),
      status: friend.status);

  static List<FriendHiveModel>? toFriendHiveModelList(List<Friend>? friends) {
    if (friends == null) {
      return null;
    }
    List<FriendHiveModel> list = [];

    friends.forEach((element) {
      list.add(toFriendHiveModel(element));
    });
    return list;
  }
}
