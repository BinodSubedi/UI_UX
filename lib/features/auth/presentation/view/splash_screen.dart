import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/signup');
    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Image.asset(
          'assets/images/logo.png',
          //scale: 0.5,
          //width: 120,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        )));
  }
}
