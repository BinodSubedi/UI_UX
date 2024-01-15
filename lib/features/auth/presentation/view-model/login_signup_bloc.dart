import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:game_buddy/core/config/constants/enums.dart';
import 'package:game_buddy/core/errors/failures.dart';
import 'package:game_buddy/core/service_locator.dart';
import 'package:game_buddy/features/auth/domain/entities/user_entity.dart';
import 'package:game_buddy/features/auth/domain/useCase/login_use_case.dart';
import 'package:game_buddy/features/auth/domain/useCase/signup_use_case.dart';

import 'login_signup_events.dart';
import 'login_signup_state.dart';

class LoginSignupBloc extends Bloc<LoginSignupEvents, LoginSignupState> {
  // LoginSignupControllers controllers = LoginSignupControllers();

  late LoginUseCase loginUseCase;
  late SignupUseCase signupUseCase;

  LoginSignupBloc({LoginUseCase? luseCase, SignupUseCase? suseCase})
      : super(LoginSignupState.start()) {
    loginUseCase = luseCase ?? serviceLocator<LoginUseCase>();
    signupUseCase = suseCase ?? serviceLocator<SignupUseCase>();

    on<Login>((event, emit) async {
      print(event.username);
      print(event.password);

      Either<Failure, UserEntity> response =
          await loginUseCase.login(event.username, event.password);

      response.fold((l) => null, (r) {
        // print(r.userName);
        emit(state.copywith(user: r, loginState: LoggedState.loggedin));

        // print(state.loginState);
      });
      return;
    });
    on<Signup>((event, emit) async {
      UserEntity user = event.user;

      Either<Failure, UserEntity> response = await signupUseCase.signup(
          username: user.userName,
          password: user.password!,
          fullName: user.fullName);

      response.fold(
          (l) => emit(state),
          (r) =>
              emit(state.copywith(user: r, loginState: LoggedState.loggedin)));
    });

    on<PushLogin>((event, emit) async {
      if (await serviceLocator<FlutterSecureStorage>().read(key: 'token') !=
          null) {
        Either<Failure, UserEntity> response =
            await serviceLocator<LoginUseCase>().pushLogin();

        response.fold(
            (l) => null,
            (r) => emit(
                state.copywith(user: r, loginState: LoggedState.loggedin)));
      }

      return;
    });

    on<Logout>((event, emit) async {
      emit(const LoginSignupState.start());
      await serviceLocator<FlutterSecureStorage>().delete(key: 'token');
    });
  }
}
