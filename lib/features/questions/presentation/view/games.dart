import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/view-model/main_bloc.dart';
import '../../../../core/presentation/view-model/main_events.dart';
import '../../../../core/presentation/view-model/main_state.dart';

class Games extends StatelessWidget {
  const Games({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:
              BlocBuilder<MainBloc, MainState>(buildWhen: (previous, current) {
        return current.games != previous.games;
      }, builder: (context, state) {
        return state.games != null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...state.games!
                        .map((e) => ElevatedButton(
                              child: Text(e),
                              onPressed: () {
                                context.read<MainBloc>().add(SetGame(game: e));

                                context
                                    .read<MainBloc>()
                                    .add(GetGameQuestions(game: e));

                                Navigator.pushReplacementNamed(
                                    context, '/gameQuestions');
                              },
                            ))
                        .toList()
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator());
      })),
    );
  }
}
