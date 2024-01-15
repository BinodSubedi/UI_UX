import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/view-model/main_bloc.dart';
import '../../../../core/presentation/view-model/main_events.dart';

class GameTypeSelect extends StatelessWidget {
  const GameTypeSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                context
                    .read<MainBloc>()
                    .add(GetGamesByType(type: 'Online-FPS'));
                context.read<MainBloc>().add(SetGameType(type: 'Online-FPS'));
                Navigator.pushReplacementNamed(context, '/gameSelect');
              },
              child: const Text(
                'Online-FPS',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                context
                    .read<MainBloc>()
                    .add(GetGamesByType(type: 'Offline-FPS'));

                context.read<MainBloc>().add(SetGameType(type: 'Offline-FPS'));

                Navigator.pushReplacementNamed(context, '/gameSelect');
              },
              child: const Text(
                'Offline-FPS',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
