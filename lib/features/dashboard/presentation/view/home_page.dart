import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/view-model/main_bloc.dart';
import '../../../../core/presentation/view-model/main_events.dart';
import '../../../../core/presentation/view-model/main_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  bool done = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MainBloc>().add(GetAllPossibleSelection());
  }

  void indexIncreaser(int length) {
    setState(() {
      // print(length);
      // print(index);
      if (index == length - 1) {
        done = true;
        return;
      } else {
        index++;
      }
    });
  }

  void indexDecreaser() {
    setState(() {
      if (index > 0) {
        index--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<MainBloc, MainState>(
        buildWhen: (previous, current) {
          return current.possibleSelection != previous.possibleSelection;
        },
        builder: (context, state) {
          return !done &&
                  state.possibleSelection != null &&
                  state.possibleSelection!.isNotEmpty
              ? Center(
                  child: SingleChildScrollView(
                    child: Card(
                      color: Colors.greenAccent,
                      margin: const EdgeInsets.only(
                          bottom: 10.0, left: 8.0, right: 8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(
                                      top: 10.0, bottom: 5),
                                  child: Image.asset(
                                    'assets/images/${state.possibleSelection![index].games![0].gameName}.jpg',
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    width: 340,
                                  )),
                              Text(
                                state.possibleSelection![index].games![0]
                                    .gameName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              // const SizedBox(
                              //   height: 40,
                              // ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 7.0),
                                child: Column(
                                  children: [
                                    Text(
                                        '${state.possibleSelection![index].games![0].gameQuestions[0].split(' ').last.toUpperCase()} => ${state.possibleSelection![index].gamesAnsweres![0][0]}'),
                                    Text(
                                        '${state.possibleSelection![index].games![0].gameQuestions[1].split(' ').last.toUpperCase()} => ${state.possibleSelection![index].gamesAnsweres![0][1]}'),
                                    Text(
                                        '${state.possibleSelection![index].games![0].gameQuestions[2].split(' ').last.toUpperCase()} => ${state.possibleSelection![index].gamesAnsweres![0][2]}'),
                                  ],
                                ),
                              ),

                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      // Icons.check_circle,

                                      icon: const Icon(
                                        Icons.check_circle,
                                        // color: Colors.blue,
                                        size: 42,
                                      ),
                                      onPressed: () {
                                        context.read<MainBloc>().add(
                                            SendFriendRequest(
                                                username: state
                                                    .possibleSelection![index]
                                                    .userName));
                                        print(state.possibleSelection![index]
                                            .userName);
                                        indexIncreaser(
                                            state.possibleSelection!.length);
                                      },
                                    ),
                                    IconButton(
                                      // Icons.cancel,
                                      // color: Colors.redAccent,
                                      // size: 40,
                                      icon: const Icon(
                                        Icons.cancel,
                                        color: Colors.redAccent,
                                        size: 42,
                                      ),
                                      onPressed: () => indexIncreaser(
                                          state.possibleSelection!.length),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: Text('No Match Found!'),
                );
        },
      ),
    );
  }
}
