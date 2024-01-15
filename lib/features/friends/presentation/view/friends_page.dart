import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_buddy/core/domain/entities/friend_entity.dart';
import 'package:game_buddy/core/presentation/view-model/main_bloc.dart';
import 'package:game_buddy/core/presentation/view-model/main_events.dart';
import 'package:game_buddy/core/presentation/view-model/main_state.dart';
import 'package:sensors_plus/sensors_plus.dart';

class FreindsPage extends StatefulWidget {
  const FreindsPage({super.key});

  @override
  State<FreindsPage> createState() => _FreindsPageState();
}

class _FreindsPageState extends State<FreindsPage> {
  final List<StreamSubscription<dynamic>> _streamSubscription =
      <StreamSubscription<dynamic>>[];

  @override
  void dispose() {
    for (final subscription in _streamSubscription) {
      subscription.cancel();
    }
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MainBloc>().add(GetAllAcceptedFriends());
    context.read<MainBloc>().add(StopGettingMsg());
    _streamSubscription.add(gyroscopeEvents.listen((GyroscopeEvent event) {
      if (event.x < -3 || event.x > 3) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/dashboard', (route) => false);
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
      ),
      body: BlocBuilder<MainBloc, MainState>(
        buildWhen: (previous, current) => previous.friends != current.friends,
        builder: (context, state) {
          return state.friends != null
              ? Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(5.0),
                  child: ListView.builder(
                      itemCount: state.friends!.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 132, 154, 133),
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                    color: Colors.black, width: 2.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  state.friends![index].userName,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.greenAccent),
                                ),
                                IconButton(
                                    onPressed: () {
                                      context.read<MainBloc>().add(
                                          SetCurrentEngagingFriend(
                                              friend: FriendEntity(
                                                  userName: state
                                                      .friends![index]
                                                      .userName)));
                                      Navigator.pushNamed(context, '/message');
                                    },
                                    icon: const Icon(
                                      Icons.message_rounded,
                                      color: Color.fromARGB(255, 38, 228, 178),
                                      size: 30,
                                    ))
                              ],
                            ),
                          )),
                )
              : const Center(
                  child: Text('No friends to show!'),
                );
        },
      ),
    );
  }
}
