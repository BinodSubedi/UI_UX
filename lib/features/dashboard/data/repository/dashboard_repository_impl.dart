import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:game_buddy/core/errors/failures.dart';
import 'package:game_buddy/core/network/services/hive_service.dart';
import 'package:game_buddy/core/presentation/view-model/main_events.dart';
import 'package:game_buddy/core/service_locator.dart';
import 'package:game_buddy/features/auth/data/models/user_model.dart';
import 'package:game_buddy/features/dashboard/data/dataSource/add_friend_remote_source.dart';
import 'package:game_buddy/features/dashboard/data/dataSource/get_all_possible_section_remote.dart';
import 'package:game_buddy/features/dashboard/domain/repository/dashboard_repository.dart';

import '../models/user_entity_hive_model.dart';

class DashBoardRepositoryImpl implements DashBoardRepository {
  @override
  Future<Either<Failure, String>> addFriend(String userName, String token) {
    return serviceLocator<AddFriendRemoteSource>().addFriend(token, userName);
  }

  @override
  Future<Either<Failure, List<User>>> getAllPossibleSelection(
      String token) async {
    final ConnectivityResult result =
        await serviceLocator<Connectivity>().checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      // print('Wifi or data');
      final response =
          await serviceLocator<GetAllPossibleSelectionRemoteSource>()
              .getAllPossibleSelection(token);

      response.fold((l) => null, (r) {
        r.forEach((element) {
          serviceLocator<HiveService>()
              .addUsers(UserEntityHiveModel.fromUser(element));
        });
      });

      return response;
    }

    final hivedata = await serviceLocator<HiveService>().getAllUsers();

    List<User> intendedResponse = [];

    hivedata.forEach((element) {
      intendedResponse.add(element.toUser());
    });

    if (intendedResponse.isEmpty) {
      return const Left(CacheException(message: 'Cached data is empty'));
    }

    return Right(intendedResponse);
  }
}
