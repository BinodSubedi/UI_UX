import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_buddy/core/network/services/hive_service.dart';
import 'package:game_buddy/core/service_locator.dart';
import 'package:game_buddy/routes/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/presentation/view-model/main_bloc.dart';
import 'features/auth/presentation/view-model/login_signup_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HiveService().init();
  await dotenv.load();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginSignupBloc>(
          create: (context) => LoginSignupBloc(),
        ),
        BlocProvider<MainBloc>(
          create: (context) => MainBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'ZenDots',
          primarySwatch: Colors.green,
        ),
        routes: routes,
      ),
    );
  }
}
