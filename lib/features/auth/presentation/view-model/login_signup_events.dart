import 'package:game_buddy/features/auth/domain/entities/user_entity.dart';

class LoginSignupEvents {
  const LoginSignupEvents();
}

class Login extends LoginSignupEvents {
  final String username;
  final String password;
  Login({required this.username, required this.password});
}

class Signup extends LoginSignupEvents {
  UserEntity user;
  Signup({required this.user});
}

class PushLogin extends LoginSignupEvents {}

class Logout extends LoginSignupEvents {}
