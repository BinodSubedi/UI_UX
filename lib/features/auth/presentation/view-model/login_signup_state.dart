import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:game_buddy/core/config/constants/enums.dart';
import 'package:game_buddy/features/auth/domain/entities/user_entity.dart';

class LoginSignupState extends Equatable {
  final LoggedState loginState;
  final UserEntity? user;
  final String? token;

  const LoginSignupState({required this.loginState, this.user, this.token});

  const LoginSignupState.start()
      : loginState = LoggedState.none,
        user = null,
        token = null;

  LoginSignupState copywith({loginState, user, token}) {
    return LoginSignupState(
        loginState: loginState ?? this.loginState,
        user: user ?? this.user,
        token: token ?? this.token);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [user, token, loginState];
}
