import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:game_buddy/core/network/services/hive_service.dart';
import 'package:game_buddy/features/auth/data/dataSource/login_remote_data_source.dart';
import 'package:game_buddy/features/auth/data/dataSource/signup_remote_source.dart';
import 'package:game_buddy/features/auth/domain/repository/auth_repository.dart';
import 'package:game_buddy/features/auth/domain/useCase/login_use_case.dart';
import 'package:game_buddy/features/auth/domain/useCase/signup_use_case.dart';
import 'package:game_buddy/features/dashboard/data/dataSource/add_friend_remote_source.dart';
import 'package:game_buddy/features/dashboard/data/dataSource/get_all_possible_section_remote.dart';
import 'package:game_buddy/features/dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:game_buddy/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:game_buddy/features/dashboard/domain/useCase/dash_board_use_case.dart';
import 'package:game_buddy/features/friends/data/dataSource/get_all_friends_remote_source.dart';
import 'package:game_buddy/features/friends/data/repository/friends_repository_impl.dart';
import 'package:game_buddy/features/friends/domain/repository/friends_repository.dart';
import 'package:game_buddy/features/friends/domain/useCase/friends_use_case.dart';
import 'package:game_buddy/features/message/data/dataSource/get_latest_msg_remote_source.dart';
import 'package:game_buddy/features/message/data/dataSource/send_msg_remote_source.dart';
import 'package:game_buddy/features/message/data/repository/message_repository_impl.dart';
import 'package:game_buddy/features/message/domain/repository/message_repository.dart';
import 'package:game_buddy/features/message/domain/useCase/message_use_case.dart';
import 'package:game_buddy/features/questions/data/dataSource/add_game_answers.dart';
import 'package:game_buddy/features/questions/data/dataSource/add_game_data_source.dart';
import 'package:game_buddy/features/questions/data/dataSource/get_games_by_type_data_source.dart';
import 'package:game_buddy/features/questions/data/dataSource/get_questions_by_type_data_source.dart';
import 'package:game_buddy/features/questions/data/repository/questions_repository_impl.dart';
import 'package:game_buddy/features/questions/domain/repository/questions_repository.dart';
import 'package:game_buddy/features/questions/domain/useCase/questions_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../features/auth/data/repository/auth_repository_impl.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator
      .registerFactory<LoginRemoteSource>(() => LoginRemoteSourceImpl());

  serviceLocator
      .registerFactory<SignupRemoteSource>(() => SignupRemoteSourceImpl());

  serviceLocator.registerFactory<AuthRepository>(() => AuthRepositoryImpl());

  serviceLocator.registerFactory<LoginUseCase>(() => LoginUseCase());

  serviceLocator.registerFactory<SignupUseCase>(() => SignupUseCase());

  serviceLocator
      .registerFactory<QuestionsRepository>(() => QuestionsRepositoryImpl());

  serviceLocator
      .registerFactory<AddGameRemoteSource>(() => AddGameRemoteSourceImpl());

  serviceLocator.registerFactory<AddGameAnswers>(() => AddGameAnswersImpl());

  serviceLocator
      .registerFactory<GetGamesRemoteSource>(() => GetGamesRemoteSourceImpl());

  serviceLocator
      .registerFactory<GetGamesQuestions>(() => GetGamesQuestionsImpl());

  serviceLocator.registerFactory<QuestionsUseCase>(() => QuestionsUseCase());

  serviceLocator.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());

  serviceLocator.registerLazySingleton<GetAllPossibleSelectionRemoteSource>(
      () => GetAllPossibleSelectionRemoteSourceImpl());

  serviceLocator
      .registerFactory<DashBoardRepository>(() => DashBoardRepositoryImpl());

  serviceLocator.registerLazySingleton<AddFriendRemoteSource>(
      () => AddFriendRemoteSourceImpl());

  serviceLocator.registerFactory<DashBoardUseCase>(() => DashBoardUseCase());

  serviceLocator
      .registerLazySingleton<FriendsRepository>(() => FriendsRepositoryImpl());

  serviceLocator.registerLazySingleton<GetAllFriendsRemoteSource>(
      () => GetAllFriendsRemoteSourceImpl());

  serviceLocator.registerLazySingleton<FriendsUseCase>(() => FriendsUseCase());

  serviceLocator.registerLazySingleton<GetLatestMsgRemoteDataSource>(
      () => GetLatestMsgRemoteDataSourceImpl());

  serviceLocator.registerLazySingleton<SendMsgRemoteSource>(
      () => SendMsgRemoteSourceImpl());

  serviceLocator
      .registerLazySingleton<MessageRepository>(() => MessageRepositoryImpl());

  serviceLocator.registerLazySingleton<MessageUseCase>(() => MessageUseCase());

  serviceLocator.registerFactory<HiveService>(() => HiveService());

  serviceLocator.registerLazySingleton<Connectivity>(() => Connectivity());
}
