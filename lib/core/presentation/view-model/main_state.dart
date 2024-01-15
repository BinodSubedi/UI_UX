import 'package:equatable/equatable.dart';
import 'package:game_buddy/core/domain/entities/friend_entity.dart';
import 'package:game_buddy/features/auth/domain/entities/user_entity.dart';

class MainState extends Equatable {
  final UserEntity? user;
  final List<String>? games;
  final List<List<String>>? gamesQuestions;
  final String? gameType;
  final String? game;
  final List<UserEntity>? possibleSelection;
  final List<FriendEntity>? friends;
  final FriendEntity? currentInteractingFriend;

  MainState(
      {required this.user,
      this.games,
      this.gamesQuestions,
      this.gameType,
      this.game,
      this.possibleSelection,
      this.friends,
      this.currentInteractingFriend});

  MainState.start()
      : user = null,
        friends = null,
        games = null,
        gamesQuestions = null,
        gameType = null,
        game = null,
        currentInteractingFriend = null,
        possibleSelection = null;

  //copywith
  MainState copyWith(
      {UserEntity? user,
      List<String>? games,
      List<List<String>>? gamesQuestions,
      String? gameType,
      String? game,
      List<FriendEntity>? friends,
      List<UserEntity>? possibleSelection,
      FriendEntity? currentInteractingFriend}) {
    return MainState(
        user: user ?? this.user,
        games: games ?? this.games,
        gamesQuestions: gamesQuestions ?? this.gamesQuestions,
        gameType: gameType ?? this.gameType,
        game: game ?? this.game,
        possibleSelection: possibleSelection ?? this.possibleSelection,
        friends: friends ?? this.friends,
        currentInteractingFriend:
            currentInteractingFriend ?? this.currentInteractingFriend);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        gamesQuestions,
        gameType,
        game,
        friends,
        currentInteractingFriend,
        friends,
        user,
        games,
        possibleSelection
      ];
}
