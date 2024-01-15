import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:game_buddy/core/data/models/friend_model.dart';
import 'package:game_buddy/core/errors/failures.dart';
import 'package:game_buddy/core/network/services/hive_service.dart';
import 'package:game_buddy/core/service_locator.dart';
import 'package:game_buddy/features/dashboard/data/models/friend_hive_model.dart';
import 'package:game_buddy/features/friends/data/dataSource/get_all_friends_remote_source.dart';
import 'package:game_buddy/features/friends/domain/repository/friends_repository.dart';

class FriendsRepositoryImpl implements FriendsRepository {
  @override
  Future<Either<Failure, List<Friend>>> getAllAcceptedFriends(
      String token) async {
    ConnectivityResult result =
        await serviceLocator<Connectivity>().checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      final response = await serviceLocator<GetAllFriendsRemoteSource>()
          .getAllAcceptedFriends(token);

      response.fold((l) => null, (r) {
        r.forEach((element) {
          serviceLocator<HiveService>()
              .addMyFriends(FriendHiveModel.toFriendHiveModel(element));
        });
      });

      return response;
    }

    final hiveData = await serviceLocator<HiveService>().getAllFriends();

    final intendedResponse = FriendHiveModel.toFriendList(hiveData);

    if (intendedResponse == null) {
      return const Left(CacheException(message: 'Empty cached data'));
    }

    print('intended response');

    return Right(intendedResponse);
  }
}
