import 'dart:async';

import 'package:all_sensors/all_sensors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_buddy/core/presentation/view-model/main_bloc.dart';
import 'package:game_buddy/core/presentation/view-model/main_events.dart';
import 'package:game_buddy/core/presentation/view-model/main_state.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
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
    context.read<MainBloc>().add(GetLatestMsg());
    _streamSubscription.add(proximityEvents!.listen((ProximityEvent event) {
      // print(event.proximity);
      if (event.proximity < 2) {
        Navigator.pop(context);
      }
    }));
  }

  ScrollController scroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController msg = TextEditingController();
    // scroller.animateTo(100,
    //     duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);

    // Stream<GyroscopeEvent> stream = SensorsPlatform.instance.gyroscopeEvents;

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              context.read<MainBloc>().add(StopGettingMsg());
              Navigator.pop(context);
            },
          ),
          title: const Text('Msg'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          BlocBuilder<MainBloc, MainState>(
            buildWhen: (previous, current) =>
                previous.currentInteractingFriend !=
                current.currentInteractingFriend,
            builder: (context, state) {
              if (state.currentInteractingFriend != null) {
                if (state.currentInteractingFriend!.conversation != null) {
                  return Expanded(
                    child: ListView.builder(
                        controller: scroller,
                        itemCount: state.currentInteractingFriend!.conversation!
                            .messages!.length,
                        itemBuilder: (context, index) {
                          List<String> items = state.currentInteractingFriend!
                              .conversation!.messages![index]
                              .split('-');

                          bool me =
                              items[0] == state.currentInteractingFriend!.friend
                                  ? false
                                  : true;

                          // print(me);

                          return me
                              ? Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0))),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10),
                                  margin: EdgeInsets.only(
                                      left: 10.0,
                                      right: screenWidth * 0.6,
                                      top: 20,
                                      bottom: 20),
                                  child: Center(child: Text(items[1])),
                                )
                              : Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.0))),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10),
                                  margin: EdgeInsets.only(
                                      left: screenWidth * 0.6,
                                      right: 25,
                                      top: 20,
                                      bottom: 20),
                                  child: Center(child: Text(items[1])),
                                );
                        }),
                  );
                }
                return const CircularProgressIndicator();
              }
              return const CircularProgressIndicator();
            },
          ),
          TextFormField(
            controller: msg,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 3.0, color: Colors.black)),
                hintText: 'msg......',
                suffix: InkWell(
                  child: const Icon(
                    Icons.send,
                    color: Colors.black,
                  ),
                  onTap: () {
                    if (msg.text != '') {
                      context
                          .read<MainBloc>()
                          .add(SendMessage(message: msg.text));
                      msg.text = '';
                      // scroller.animateTo(scroller.position.maxScrollExtent,
                      //     duration: const Duration(milliseconds: 600),
                      //     curve: Curves.linear);
                      scroller.jumpTo(scroller.position.maxScrollExtent);
                    }
                  },
                )),
          )
        ]));
  }
}
