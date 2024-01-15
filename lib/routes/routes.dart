import 'package:flutter/material.dart';
import 'package:game_buddy/features/dashboard/presentation/view/dashboard_page.dart';
import 'package:game_buddy/features/auth/presentation/view/splash_screen.dart';
import 'package:game_buddy/features/message/presentation/view/message_page.dart';
import '../features/auth/presentation/view/login_page.dart';
import '../features/auth/presentation/view/signup_page.dart';
import '../features/questions/presentation/view/game_questions.dart';
import '../features/questions/presentation/view/game_type_select.dart';
import '../features/questions/presentation/view/games.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const SplashScreen(),
  '/signup': (context) => const SignupGeneral(),
  '/login': (context) => const LoginGeneral(),
  '/dashboard': (context) => const DashBoard(),
  '/gameTypeSelect': (context) => const GameTypeSelect(),
  '/gameSelect': (context) => const Games(),
  '/gameQuestions': (context) => const GameQuestions(),
  '/message': (context) => const MessagePage()
};
