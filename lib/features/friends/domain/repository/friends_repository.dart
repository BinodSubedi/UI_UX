import 'package:dartz/dartz.dart';
import 'package:game_buddy/core/data/models/friend_model.dart';
import 'package:game_buddy/core/errors/failures.dart';

abstract class FriendsRepository {
  Future<Either<Failure, List<Friend>>> getAllAcceptedFriends(String token);
}
