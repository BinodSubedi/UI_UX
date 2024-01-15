import 'package:dartz/dartz.dart';
import 'package:game_buddy/core/errors/failures.dart';
import 'package:game_buddy/features/auth/data/models/user_model.dart';

abstract class DashBoardRepository {
  Future<Either<Failure, List<User>>> getAllPossibleSelection(String token);
  Future<Either<Failure, String>> addFriend(String userName, String token);
}
