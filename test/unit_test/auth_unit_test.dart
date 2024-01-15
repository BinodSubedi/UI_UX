// import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:game_buddy/core/config/constants/enums.dart';
import 'package:game_buddy/features/auth/domain/entities/user_entity.dart';
import 'package:game_buddy/features/auth/domain/useCase/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_buddy/features/auth/domain/useCase/signup_use_case.dart';
import 'package:game_buddy/features/auth/presentation/view-model/login_signup_bloc.dart';
import 'package:game_buddy/features/auth/presentation/view-model/login_signup_events.dart';
import 'package:game_buddy/features/auth/presentation/view-model/login_signup_state.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:bloc_test/bloc_test.dart';

import 'auth_unit_test.mocks.dart';

@GenerateMocks([LoginUseCase, SignupUseCase])
void main() {
  MockLoginUseCase mockUseCase = MockLoginUseCase();
  MockSignupUseCase mockSignUseCase = MockSignupUseCase();
  LoginSignupBloc loginSignupBloc =
      LoginSignupBloc(luseCase: mockUseCase, suseCase: mockSignUseCase);

  group('login and signup with right credentials', () {
    final expectedValue =
        UserEntity(fullName: 'Binod', password: 'oww', userName: 'username');
    when(mockUseCase.login('Qubit', 'Hello'))
        .thenAnswer((_) async => Future.value(Right(expectedValue)));

    final signupExpected =
        UserEntity(fullName: 'Binod', password: 'password', userName: 'Qubit');

    when(mockSignUseCase.signup(
            username: 'Qubit', password: 'password', fullName: 'Binod'))
        .thenAnswer((_) async => Future.value(Right(signupExpected)));

    blocTest('login with right credentials',
        build: () => loginSignupBloc,
        act: (bloc) => bloc.add(Login(username: 'Qubit', password: 'Hello')),
        expect: () => [
              LoginSignupState(
                  loginState: LoggedState.loggedin, user: expectedValue)
            ]);

    blocTest(
      'signup with correct credentials',
      build: () => loginSignupBloc,
      act: (bloc) => bloc.add(Signup(
          user: UserEntity(
              fullName: 'Binod', password: 'password', userName: 'Qubit'))),
      expect: () => [
        LoginSignupState(
            loginState: LoggedState.loggedin,
            user: UserEntity(
                fullName: 'Binod', password: 'password', userName: 'Qubit'))
      ],
    );
  });
}
