import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_buddy/features/auth/presentation/view-model/login_signup_bloc.dart';
import 'package:game_buddy/features/auth/presentation/view-model/login_signup_events.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                context.read<LoginSignupBloc>().add(Logout());
                Navigator.pushNamedAndRemoveUntil(
                    context, '/signup', (route) => false);
              },
              child: const SizedBox(
                height: 40,
                width: double.maxFinite,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: Center(child: Text('Log-Out')),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
