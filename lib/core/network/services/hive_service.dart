import 'package:game_buddy/features/dashboard/data/models/conversation_hive_model.dart';
import 'package:game_buddy/features/dashboard/data/models/friend_hive_model.dart';
import 'package:game_buddy/features/dashboard/data/models/game_hive_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

import '../../../features/dashboard/data/models/user_entity_hive_model.dart';

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    Hive.registerAdapter(UserEntityHiveModelAdapter());
    Hive.registerAdapter(GameHiveModelAdapter());
    Hive.registerAdapter(FriendHiveModelAdapter());
    Hive.registerAdapter(ConversationHiveModelAdapter());
  }

  //All possible friends Selection

  Future<void> addUsers(UserEntityHiveModel user) async {
    var box = await Hive.openBox<UserEntityHiveModel>('friendsSelection');
    await box.put(user.userName, user);
  }

  Future<List<UserEntityHiveModel>> getAllUsers() async {
    var box = await Hive.openBox<UserEntityHiveModel>('friendsSelection');
    var friendsSelection = box.values.toList();
    box.close();
    return friendsSelection;
  }

  //All the accepted friends

  Future<void> addMyFriends(FriendHiveModel friend) async {
    var box = await Hive.openBox<FriendHiveModel>('myFriends');
    await box.put(friend.userName, friend);
  }

  Future<List<FriendHiveModel>> getAllFriends() async {
    var box = await Hive.openBox<FriendHiveModel>('myFriends');
    var myFriends = box.values.toList();
    box.close();
    return myFriends;
  }
}
