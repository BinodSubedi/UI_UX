import 'package:equatable/equatable.dart';

import '../../../../core/domain/entities/friend_entity.dart';
import '../../../../core/domain/entities/game_entity.dart';

class UserEntity extends Equatable {
  String fullName;
  String? password;
  String userName;
  List<List<String>>? gamesAnsweres;
  String? passwordChangedAt;
  List<GameEntity>? games;
  List<FriendEntity>? friends;

  UserEntity(
      {required this.fullName,
      this.password,
      required this.userName,
      this.gamesAnsweres,
      this.passwordChangedAt,
      this.games,
      this.friends});

  @override
  // TODO: implement props
  List<Object?> get props => [userName];
}
