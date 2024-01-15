import 'package:game_buddy/core/domain/entities/friend_entity.dart';
import 'package:game_buddy/core/presentation/view-model/main_state.dart';
import 'package:game_buddy/features/auth/domain/entities/user_entity.dart';

class MainEvents {}

class GetUser extends MainEvents {
  final UserEntity user;
  GetUser({required this.user});
}

class SetGameType extends MainEvents {
  final String type;
  SetGameType({required this.type});
}

class SetGame extends MainEvents {
  final String game;
  SetGame({required this.game});
}

class GetGamesByType extends MainEvents {
  final String type;
  GetGamesByType({required this.type});
}

class GetGameQuestions extends MainEvents {
  final String game;
  GetGameQuestions({required this.game});
}

class GetAllPossibleSelection extends MainEvents {}

class AddGame extends MainEvents {
  final List<String> answers;
  AddGame({required this.answers});
}

class SendFriendRequest extends MainEvents {
  final String username;
  SendFriendRequest({required this.username});
}

class SendMessage extends MainEvents {
  final String message;
  SendMessage({required this.message});
}

class GetAllAcceptedFriends extends MainEvents {}

class GetLatestMsg extends MainEvents {}

class SetCurrentEngagingFriend extends MainEvents {
  FriendEntity friend;

  SetCurrentEngagingFriend({required this.friend});
}

class StopGettingMsg extends MainEvents {}
