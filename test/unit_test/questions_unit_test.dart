import 'package:dartz/dartz.dart';
import 'package:game_buddy/core/presentation/view-model/main_bloc.dart';
import 'package:game_buddy/core/presentation/view-model/main_events.dart';
import 'package:game_buddy/core/presentation/view-model/main_state.dart';
import 'package:game_buddy/features/questions/domain/useCase/questions_use_case.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';

import 'questions_unit_test.mocks.dart';

@GenerateMocks([QuestionsUseCase])
void main() {
  MockQuestionsUseCase mockQuestionsUseCase = MockQuestionsUseCase();
  MainBloc mainBloc = MainBloc(qusecase: mockQuestionsUseCase);

  when(mockQuestionsUseCase.getGamesByType('Online-Fps'))
      .thenAnswer((_) => Future.value(const Right(['Valorant', 'CSGO'])));

  when(mockQuestionsUseCase.addGameAnswers(['vandal', 'Jett', 'Pearl']))
      .thenAnswer((_) => Future.value(const Right('success')));

  MainState state = MainState.start();

  blocTest(
    'Getting answers',
    build: () => mainBloc,
    act: (bloc) => bloc.add(GetGamesByType(type: 'Online-Fps')),
    expect: () => [
      state.copyWith(games: ['vandal', 'Jett', 'Pearl'])
    ],
  );
}
