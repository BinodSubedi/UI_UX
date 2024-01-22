import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/view-model/main_bloc.dart';
import '../../../../core/presentation/view-model/main_events.dart';

class GameTypeSelect extends StatelessWidget {
  const GameTypeSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffDDF5EB),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<MainBloc>()
                        .add(GetGamesByType(type: 'Online-FPS'));
                    context
                        .read<MainBloc>()
                        .add(SetGameType(type: 'Online-FPS'));
                    Navigator.pushReplacementNamed(context, '/gameSelect');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff57CC99)),
                  child: const Text(
                    'Online-FPS',
                    style: TextStyle(
                        color: Color(0xff994900),
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<MainBloc>()
                        .add(GetGamesByType(type: 'Offline-FPS'));

                    context
                        .read<MainBloc>()
                        .add(SetGameType(type: 'Offline-FPS'));

                    Navigator.pushReplacementNamed(context, '/gameSelect');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff57CC99)),
                  child: const Text(
                    'Offline-FPS',
                    style: TextStyle(
                        color: Color(0xff994900),
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
