// import 'package:game_buddy/models/user_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_buddy/core/domain/entities/friend_entity.dart';

import '../../../features/message/data/models/conversation_model.dart';

part 'friend_model.freezed.dart';
part 'friend_model.g.dart';

@freezed
class Friend with _$Friend {
  // User friend;
  // String status;
  // Conversation? conversation;

  const factory Friend(
      {required dynamic friend,
      required String status,
      required String userName,
      Conversation? conversation}) = _Friend;

  factory Friend.fromJson(Map<String, Object?> json) => _$FriendFromJson(json);
}

class FriendModel {
  final dynamic friend;
  final String status;
  final Conversation? conversation;
  final String userName;

  late final Friend _friend = _friendinstance;

  FriendModel(
      {required this.friend,
      required this.status,
      required this.userName,
      this.conversation});

  Friend get _friendinstance => Friend(
      friend: friend,
      status: status,
      conversation: conversation,
      userName: userName);

  FriendEntity toEntity() => FriendEntity(
      friend: _friend.friend,
      status: _friend.status,
      userName: _friend.userName,
      conversation: ConversationModel.toEntityDirect(_friend.conversation!));

  static toEntityDirect(Friend friend) => FriendEntity(
      friend: friend.friend,
      status: friend.status,
      userName: friend.userName,
      conversation: ConversationModel.toEntityDirect(friend.conversation!));

  static List<FriendEntity> toEntityList(List<Friend> friends) {
    List<FriendEntity> friendEntities = [];
    friends.forEach((friend) {
      friendEntities.add(toEntityDirect(friend));
    });
    return friendEntities;
  }
}
