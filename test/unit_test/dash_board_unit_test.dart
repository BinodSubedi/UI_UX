import 'package:dartz/dartz.dart';
import 'package:game_buddy/core/presentation/view-model/main_bloc.dart';
import 'package:game_buddy/core/presentation/view-model/main_events.dart';
import 'package:game_buddy/core/presentation/view-model/main_state.dart';
import 'package:game_buddy/features/auth/domain/entities/user_entity.dart';
import 'package:game_buddy/features/questions/domain/useCase/questions_use_case.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:bloc_test/bloc_test.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:game_buddy/features/dashboard/domain/useCase/dash_board_use_case.dart';
import 'dash_board_unit_test.mocks.dart';
import 'questions_unit_test.mocks.dart';

@GenerateMocks([DashBoardUseCase])
void main() {
  MockDashBoardUseCase mockdashBoardUseCase = MockDashBoardUseCase();
  MainBloc mainBloc = MainBloc(
      duseCase: mockdashBoardUseCase, qusecase: MockQuestionsUseCase());

  when(mockdashBoardUseCase.getAllPossibleSelection()).thenAnswer((_) =>
      Future.value(
          Right([UserEntity(fullName: 'Ben Tennison', userName: 'Qubit')])));

  MainState state = MainState.start();

  blocTest(
    'Get all possible selection',
    build: () => mainBloc,
    act: (bloc) => bloc.add(GetAllPossibleSelection()),
    expect: () => [
      state.copyWith(possibleSelection: [
        UserEntity(fullName: 'Ben Tennison', userName: 'Qubit')
      ])
    ],
  );
}
