import 'package:game_buddy/features/auth/data/models/user_model.dart';
import 'package:game_buddy/features/auth/domain/entities/user_entity.dart';
import 'package:game_buddy/features/dashboard/data/models/friend_hive_model.dart';
import 'package:game_buddy/features/dashboard/data/models/game_hive_model.dart';
import 'package:hive/hive.dart';

import '../../../../core/data/models/friend_model.dart';
import '../../../../core/data/models/game_model.dart';

part 'user_entity_hive_model.g.dart';

@HiveType(typeId: 1)
class UserEntityHiveModel {
  @HiveField(0)
  final String fullName;

  @HiveField(1)
  final String? password;

  @HiveField(2)
  final String userName;

  @HiveField(3)
  final List<List<String>>? gamesAnsweres;

  @HiveField(4)
  final String? passwordChangedAt;

  @HiveField(5)
  final List<GameHiveModel>? games;

  @HiveField(6)
  final List<FriendHiveModel>? friends;

  @HiveField(7)
  final String? token;

  UserEntityHiveModel(
      {required this.fullName,
      required this.userName,
      this.friends,
      this.games,
      this.gamesAnsweres,
      this.password,
      this.passwordChangedAt,
      this.token});

  User toUser() => User(
      fullName: fullName,
      password: password,
      userName: userName,
      friends: FriendHiveModel.toFriendList(friends),
      games: GameHiveModel.toGames(games),
      gamesAnsweres: gamesAnsweres);

  static UserEntityHiveModel fromUser(User user) => UserEntityHiveModel(
      fullName: user.fullName,
      userName: user.userName,
      games: GameHiveModel.toGameHiveModelList(user.games),
      gamesAnsweres: user.gamesAnsweres,
      friends: FriendHiveModel.toFriendHiveModelList(user.friends));

  static List<UserEntityHiveModel> fromUserList(List<User> user) {
    List<UserEntityHiveModel> list = [];

    user.forEach((element) {
      list.add(fromUser(element));
    });

    return list;
  }
}
