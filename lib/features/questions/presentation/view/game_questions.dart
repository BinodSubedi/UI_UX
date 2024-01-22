import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/view-model/main_bloc.dart';
import '../../../../core/presentation/view-model/main_events.dart';
import '../../../../core/presentation/view-model/main_state.dart';

List<String> list = <String>['a', 'b', 'c'];

class GameQuestions extends StatefulWidget {
  const GameQuestions({super.key});

  @override
  State<GameQuestions> createState() => _GameQuestionsState();
}

class _GameQuestionsState extends State<GameQuestions> {
  Map<int, String?> values = {
    0: null,
    1: null,
    2: null,
  };
  int counter = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDDF5EB),
      body: SafeArea(child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return state.gamesQuestions != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...state.gamesQuestions!.map((e) {
                        // List<String> list = e.map((e) => e.toString()).toList();

                        // print(state.gamesQuestions.indexOf(e));

                        int pointer = state.gamesQuestions!.indexOf(e);

                        return Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                                color: const Color(0xff57CC99),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff4429A4),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    e[0],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        //letterSpacing: 2,
                                        fontSize: 16),
                                  ),
                                ),
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: DropdownButton<String>(
                                      value: values[pointer] ?? e[1],
                                      icon: const Icon(Icons.arrow_downward),
                                      elevation: 16,
                                      style: const TextStyle(
                                          color: Colors.deepPurple),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          values[pointer] = value!;
                                        });
                                      },
                                      dropdownColor: Colors.orange,
                                      borderRadius: BorderRadius.circular(10),
                                      items:
                                          //  e
                                          //     .sublist(1)
                                          //     .map<DropdownMenuItem<String>>((dynamic items) {
                                          //   return DropdownMenuItem(
                                          //     value: items,
                                          //     child: Text(items.toString()),
                                          //   );
                                          // }).toList()
                                          [
                                        for (int i = 1; i < e.length; i++)
                                          DropdownMenuItem(
                                            value: '${e[i]}',
                                            child: Center(
                                                child: Container(
                                                    width: 150,
                                                    alignment: Alignment.center,
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 10,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Center(
                                                        child: Text(
                                                      e[i],
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14),
                                                    )))),
                                          )
                                      ],
                                    )),
                              ],
                            ));
                      }).toList(),
                      ElevatedButton(
                          onPressed: () {
                            // context.read<MainBloc>().add(
                            //     SubmitAnswers(answers: values.values.toList()));

                            List<String?> answers = values.values.toList();

                            // answers = answers.map((e) {
                            //   return e ??
                            //       state.gamesQuestions[answers.indexOf(e)][1]
                            //           .toString();
                            // }).toList();

                            List<String> newAnswers = [];

                            for (int i = 0; i < 3; i++) {
                              if (answers[i] == null) {
                                answers[i] =
                                    state.gamesQuestions![i][1].toString();
                              }
                              newAnswers.add(answers[i]!);
                            }

                            // print(state.gamesQuestions);

                            // print(answers);

                            context
                                .read<MainBloc>()
                                .add(AddGame(answers: newAnswers));
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/dashboard', (route) => false);
                          },
                          child: const Text('Next'))
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator());
          // const Placeholder();
        },
      )),
    );
  }
}
