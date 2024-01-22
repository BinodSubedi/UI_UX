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
      backgroundColor: const Color(0xffDDF5EB),
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
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff57CC99)),
                            onPressed: () {
                              context.read<MainBloc>().add(SetGame(game: e));

                              context
                                  .read<MainBloc>()
                                  .add(GetGameQuestions(game: e));

                              Navigator.pushReplacementNamed(
                                  context, '/gameQuestions');
                            },
                            child: Text(e,
                                style: const TextStyle(
                                    color: Color(0xff994900),
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))))
                        .toList()
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator());
      })),
    );
  }
}
