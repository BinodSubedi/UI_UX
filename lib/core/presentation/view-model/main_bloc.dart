import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_buddy/core/errors/failures.dart';
import 'package:game_buddy/core/presentation/view-model/main_events.dart';

import 'package:game_buddy/core/presentation/view-model/main_state.dart';
import 'package:game_buddy/core/service_locator.dart';
import 'package:game_buddy/features/dashboard/domain/useCase/dash_board_use_case.dart';
import 'package:game_buddy/features/friends/domain/useCase/friends_use_case.dart';
import 'package:game_buddy/features/message/domain/useCase/message_use_case.dart';

import '../../../features/auth/domain/entities/user_entity.dart';
import '../../../features/questions/domain/useCase/questions_use_case.dart';

class MainBloc extends Bloc<MainEvents, MainState> {
  // MainActions actions = MainActions();

  late QuestionsUseCase questionsUseCase;
  late DashBoardUseCase dashBoardUseCase;

  bool fetchingMessages = false;

  MainBloc({QuestionsUseCase? qusecase, DashBoardUseCase? duseCase})
      : super(MainState.start()) {
    questionsUseCase = qusecase ?? serviceLocator<QuestionsUseCase>();
    dashBoardUseCase = duseCase ?? DashBoardUseCase();

    on<GetUser>((event, emit) => emit(state.copyWith(user: event.user)));
    on<SetGameType>(
        (event, emit) => emit(state.copyWith(gameType: event.type)));

    on<GetGamesByType>((event, emit) async {
      try {
        // List<dynamic>? games = await actions.getGamesByType(event.type);
        // print(event.type);
        Either<Failure, List<String>> games =
            await questionsUseCase.getGamesByType(event.type);

        games.fold((l) {
          print(l.message);
        }, (r) {
          emit(state.copyWith(games: r));
        });

        // if (games != null) {
        //   List<String>? list = games.map((e) => e.toString()).toList();
        //   emit(state.copyWith(games: list));
        // } else {
        //   emit(state);
        // }
      } catch (err) {
        print(err);
        emit(state);
      }
    });

    on<SetGame>((event, emit) {
      print(event.game);
      emit(state.copyWith(game: event.game));
    });

    on<GetGameQuestions>((event, emit) async {
      try {
        // dynamic questions = await actions.getGameQuestions(event.game);

        final questions = await questionsUseCase.getQuestionsByGame(event.game);

        questions.fold((l) => print(l.message), (r) {
          // print(r);
          emit(state.copyWith(gamesQuestions: r));
        });

        // List<List<String>> val = questions!
        //     .map((e) => e.map((l) => l.toString()).toList())
        //     .toList() as List<List<String>>;

        // print(questions.runtimeType);

        // if (questions == null) {
        //   return emit(state);
        // }

        // // print(questions);
        // emit(state.copyWith(gamesQuestions: questions));
      } catch (err) {
        print(err);
        emit(state);
      }
    });
    on<AddGame>((event, emit) async {
      // final List<String>? games = state.games;

      List<String> questions = [];

      // print(state.gamesQuestions);

      for (int i = 0; i < 3; i++) {
        // print(state.gamesQuestions![i][0]);
        questions.add(state.gamesQuestions![i][0]);
      }

      Map<String, dynamic> body = {
        "gameName": state.game,
        "gameType": state.gameType,
        "gameQuestions": questions,
        "gameImage": '${state.game!.toUpperCase()}.png',
        "popularity": 5,
        "gameDescription": "great game"
      };

      // await actions.addGame(body);
      // await actions.addGameAnswers(event.answers);

      final gameAdded = await questionsUseCase.addGame(body);

      gameAdded.fold((l) => print(l.message), (r) => null);

      final addAnswer = await questionsUseCase.addGameAnswers(event.answers);

      addAnswer.fold((l) => print(l.message), (r) => null);
    });
    on<GetAllPossibleSelection>((event, emit) async {
      try {
        Either<Failure, List<UserEntity>> allPossibleUsers =
            await dashBoardUseCase.getAllPossibleSelection();

        // if (allPossibleUsers == null) {
        //   return emit(state);
        // }

        // List<User> users = [];

        // allPossibleUsers.forEach((e) {
        //   // List<List<String?>> gameAnswers = [];

        //   // // print(e['gamesAnsweres']);

        //   // if (e['gamesAnsweres'] != null) {
        //   //   e['gamesAnsweres'].forEach((e) {
        //   //     gameAnswers.add(e.map((e) => e.toString()).toList());
        //   //   });
        //   // }

        //   // e['gamesAnsweres'] = gameAnswers;

        //   users.add(User.fromJson(e));
        // });

        // print(users);

        allPossibleUsers.fold((l) {
          print(l.message);
          emit(state);
        }, (r) => emit(state.copyWith(possibleSelection: r)));

        // emit(state.copyWith(possibleSelection: users));
      } catch (err) {
        print(err);
        emit(state);
      }
    });
    on<SendFriendRequest>((event, emit) async {
      try {
        final response =
            await serviceLocator<DashBoardUseCase>().addFriend(event.username);

        response.fold((l) {
          print(l.message);
        }, (r) => null);
      } catch (err) {
        print(err);
      }
    });

    on<GetAllAcceptedFriends>((event, emit) async {
      fetchingMessages = false;
      final response =
          await serviceLocator<FriendsUseCase>().getAllAcceptedFriends();

      response.fold(
          (l) => print(l.message), (r) => emit(state.copyWith(friends: r)));
    });

    on<SendMessage>((event, emit) async {
      final response = await serviceLocator<MessageUseCase>()
          .sendMsg(event.message, state.currentInteractingFriend!.userName);

      response.fold((l) => print(l.message), (r) => null);
    });

    on<GetLatestMsg>((event, emit) async {
      fetchingMessages = true;

      final outerResponse = await serviceLocator<MessageUseCase>()
          .getLatestMsg(state.currentInteractingFriend!.userName);

      outerResponse.fold((l) => print(l.message),
          (r) => emit(state.copyWith(currentInteractingFriend: r)));

      while (fetchingMessages) {
        await Future.delayed(const Duration(seconds: 2), () async {
          final response = await serviceLocator<MessageUseCase>()
              .getLatestMsg(state.currentInteractingFriend!.userName);

          response.fold((l) => print(l.message),
              (r) => emit(state.copyWith(currentInteractingFriend: r)));
        });
      }
    });

    on<StopGettingMsg>((event, emit) => fetchingMessages = false);

    on<SetCurrentEngagingFriend>((event, emit) {
      print(event.friend.userName);
      emit(state.copyWith(currentInteractingFriend: event.friend));
      return;
    });
  }
}
