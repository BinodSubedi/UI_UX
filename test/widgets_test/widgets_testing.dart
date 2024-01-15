import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_buddy/core/domain/entities/game_entity.dart';
import 'package:game_buddy/core/presentation/view-model/main_bloc.dart';
import 'package:game_buddy/core/service_locator.dart';
import 'package:game_buddy/features/auth/domain/entities/user_entity.dart';
import 'package:game_buddy/features/auth/presentation/view-model/login_signup_bloc.dart';
import 'package:game_buddy/routes/routes.dart';
import 'package:mockito/mockito.dart';

import '../unit_test/auth_unit_test.mocks.dart';
import '../unit_test/dash_board_unit_test.mocks.dart';

void main() {
  late MockLoginUseCase loginUseCase;
  late MockSignupUseCase mockSignupUseCase;
  late MockDashBoardUseCase mockDashBoardUseCase;

  setUpAll(() async {
    await init();
    loginUseCase = MockLoginUseCase();
    mockSignupUseCase = MockSignupUseCase();
    mockDashBoardUseCase = MockDashBoardUseCase();

    when(loginUseCase.login('Qubit01', 'olaAmigo')).thenAnswer((_) async =>
        Future.value(Right(
            UserEntity(fullName: 'Binod Subedi', userName: 'Qubit01', games: [
          GameEntity(
              gameName: 'Valorant',
              gameType: 'Online-FPS',
              gameDescription: 'Great Game',
              gameImage: 'VALORANT.jpg',
              popularity: 5,
              gameQuestions: [
                "What is your favourite agent?",
                "What is your favourite map?",
                "What is your favourite gun?"
              ])
        ]))));

    when(mockDashBoardUseCase.getAllPossibleSelection())
        .thenAnswer((_) => Future.value(Right([
              UserEntity(
                  fullName: 'Binod Subedi',
                  userName: 'Qubit0001',
                  gamesAnsweres: const [
                    ["Viper", "Pearl", "Vandal"]
                  ],
                  games: [
                    GameEntity(
                        gameName: 'VALORANT',
                        gameType: 'Online-FPS',
                        gameDescription: 'Great game',
                        gameImage: 'VALORANT.jpg',
                        popularity: 5,
                        gameQuestions: [
                          "What is your favourite agent?",
                          "What is your favourite map?",
                          "What is your favourite gun?"
                        ])
                  ])
            ])));
  });

  group('All tests here', () {
    testWidgets('Signup Page widget test', (widgetTester) async {
      await widgetTester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<LoginSignupBloc>(
            create: (context) => LoginSignupBloc(
                luseCase: loginUseCase, suseCase: mockSignupUseCase),
          ),
          BlocProvider<MainBloc>(
            create: (context) => MainBloc(duseCase: mockDashBoardUseCase),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'ZenDots',
            primarySwatch: Colors.green,
          ),
          routes: routes,
        ),
      ));

      await widgetTester.pumpAndSettle(const Duration(seconds: 5));

      expect(find.text('Signup'), findsOneWidget);
      expect(find.text('Login?'), findsOneWidget);
    });

    testWidgets('Login Page test', (widgetTester) async {
      await widgetTester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<LoginSignupBloc>(
            create: (context) => LoginSignupBloc(
                luseCase: loginUseCase, suseCase: mockSignupUseCase),
          ),
          BlocProvider<MainBloc>(
            create: (context) => MainBloc(duseCase: mockDashBoardUseCase),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'ZenDots',
            primarySwatch: Colors.green,
          ),
          routes: routes,
        ),
      ));

      await widgetTester.pumpAndSettle(const Duration(seconds: 5));

      await widgetTester.tap(find.byType(TextButton));

      await widgetTester.pumpAndSettle();

      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('Dashboard testing with Mocking', (widgetTester) async {
      await widgetTester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<LoginSignupBloc>(
            create: (context) => LoginSignupBloc(
                luseCase: loginUseCase, suseCase: mockSignupUseCase),
          ),
          BlocProvider<MainBloc>(
            create: (context) => MainBloc(duseCase: mockDashBoardUseCase),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'ZenDots',
            primarySwatch: Colors.green,
          ),
          routes: routes,
        ),
      ));

      await widgetTester.pumpAndSettle(const Duration(seconds: 5));

      await widgetTester.tap(find.byType(TextButton));

      await widgetTester.pumpAndSettle();

      // expect(find.text('Login'), findsOneWidget);

      // await Future.delayed(const Duration(seconds: 2),
      //     () async => await widgetTester.pumpAndSettle());

      await widgetTester.enterText(find.byType(TextFormField).at(0), 'Qubit01');
      await widgetTester.enterText(
          find.byType(TextFormField).at(1), 'olaAmigo');

      await widgetTester.pumpAndSettle();
      await widgetTester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await widgetTester.tap(find.byType(ElevatedButton));

      await widgetTester.pumpAndSettle(const Duration(seconds: 3));

      // await Future.delayed(const Duration(seconds: 2),
      //     () async => await widgetTester.pumpAndSettle());

      expect(find.text('DashBoard'), findsOneWidget);
    });

    testWidgets('Dashboard testing with Mocking', (widgetTester) async {
      await widgetTester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<LoginSignupBloc>(
            create: (context) => LoginSignupBloc(
                luseCase: loginUseCase, suseCase: mockSignupUseCase),
          ),
          BlocProvider<MainBloc>(
            create: (context) => MainBloc(duseCase: mockDashBoardUseCase),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'ZenDots',
            primarySwatch: Colors.green,
          ),
          routes: routes,
        ),
      ));

      await widgetTester.pumpAndSettle(const Duration(seconds: 5));

      await widgetTester.tap(find.byType(TextButton));

      await widgetTester.pumpAndSettle();

      // expect(find.text('Login'), findsOneWidget);

      // await Future.delayed(const Duration(seconds: 2),
      //     () async => await widgetTester.pumpAndSettle());

      await widgetTester.enterText(find.byType(TextFormField).at(0), 'Qubit01');
      await widgetTester.enterText(
          find.byType(TextFormField).at(1), 'olaAmigo');

      await widgetTester.pumpAndSettle();
      await widgetTester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await widgetTester.tap(find.byType(ElevatedButton));

      await widgetTester.pumpAndSettle(const Duration(seconds: 3));

      // await Future.delayed(const Duration(seconds: 2),
      //     () async => await widgetTester.pumpAndSettle());

      expect(find.text('DashBoard'), findsOneWidget);
    });

    testWidgets('Settings page testing', (widgetTester) async {
      await widgetTester.pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<LoginSignupBloc>(
            create: (context) => LoginSignupBloc(
                luseCase: loginUseCase, suseCase: mockSignupUseCase),
          ),
          BlocProvider<MainBloc>(
            create: (context) => MainBloc(duseCase: mockDashBoardUseCase),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'ZenDots',
            primarySwatch: Colors.green,
          ),
          routes: routes,
        ),
      ));

      await widgetTester.pumpAndSettle(const Duration(seconds: 5));

      await widgetTester.tap(find.byType(TextButton));

      await widgetTester.pumpAndSettle();

      // expect(find.text('Login'), findsOneWidget);

      // await Future.delayed(const Duration(seconds: 2),
      //     () async => await widgetTester.pumpAndSettle());

      await widgetTester.enterText(find.byType(TextFormField).at(0), 'Qubit01');
      await widgetTester.enterText(
          find.byType(TextFormField).at(1), 'olaAmigo');

      await widgetTester.pumpAndSettle();
      await widgetTester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await widgetTester.tap(find.byType(ElevatedButton));

      await widgetTester.pumpAndSettle(const Duration(seconds: 3));

      // await Future.delayed(const Duration(seconds: 2),
      //     () async => await widgetTester.pumpAndSettle());

      // expect(find.text('DashBoard'), findsOneWidget);

      await widgetTester.tap(find.text('Settings'));

      await widgetTester.pumpAndSettle();

      expect(find.text('Log-Out'), findsOneWidget);
    });
  });
}
