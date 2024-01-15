import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/models/friend_model.dart';
import '../../../../core/data/models/game_model.dart';
// import '../../../../core/models/friend_model.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User(
      {required String fullName,
      String? password,
      required String userName,
      List<List<String>>? gamesAnsweres,
      String? passwordChangedAt,
      List<Game>? games,
      List<Friend>? friends,
      String? token}) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

class UserModel {
  final String fullName;
  final String? password;
  final String userName;
  final List<List<String>>? gamesAnsweres;
  final String? passwordChangedAt;
  final List<Game>? games;
  final List<Friend>? friends;

  late final User _user = _userinstance;

  UserModel(
      {required this.fullName,
      this.password,
      required this.userName,
      this.gamesAnsweres,
      this.passwordChangedAt,
      this.games,
      this.friends});

  User get _userinstance => User(
      fullName: fullName,
      password: password,
      userName: userName,
      gamesAnsweres: gamesAnsweres,
      passwordChangedAt: passwordChangedAt,
      games: games,
      friends: friends);

  UserEntity toEntity() => UserEntity(
      fullName: _user.fullName,
      password: _user.password,
      userName: _user.userName,
      gamesAnsweres: _user.gamesAnsweres,
      passwordChangedAt: _user.passwordChangedAt,
      games: GameModel.toEntityList(_user.games!),
      friends: FriendModel.toEntityList(_user.friends!));

  static UserEntity toEntityDirect(User user) => UserEntity(
      fullName: user.fullName,
      password: user.password,
      userName: user.userName,
      gamesAnsweres: user.gamesAnsweres,
      passwordChangedAt: user.passwordChangedAt,
      games: GameModel.toEntityList(user.games!),
      friends: FriendModel.toEntityList(user.friends!));

  static List<UserEntity> toEntityListDirect(List<User> users) {
    List<UserEntity> list = [];

    users.forEach((element) => list.add(toEntityDirect(element)));

    return list;
  }
}
