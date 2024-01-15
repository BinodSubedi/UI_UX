import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_buddy/core/config/constants/enums.dart';
import 'package:game_buddy/features/auth/domain/entities/user_entity.dart';
import '../../../../core/presentation/view-model/main_bloc.dart';
import '../../../../core/presentation/view-model/main_events.dart';
import '../view-model/login_signup_bloc.dart';
import '../view-model/login_signup_events.dart';
import '../view-model/login_signup_state.dart';

class SignupGeneral extends StatefulWidget {
  const SignupGeneral({super.key});

  @override
  State<SignupGeneral> createState() => _SignupGeneralState();
}

class _SignupGeneralState extends State<SignupGeneral> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<LoginSignupBloc>().add(PushLogin());
  }

  String? _username;

  String? _password;

  bool _hiden = true;

  String? _fullName;

  // final String _type = 'user';

  SizedBox gap = const SizedBox(height: 25.0);

  final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();

  void _changePasswordVisibility() => setState(() {
        _hiden ? _hiden = false : _hiden = true;
      });

  Widget _buildFullNameField() {
    return TextFormField(
      decoration: const InputDecoration(
          hintText: 'Full Name',
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          suffix: Icon(Icons.person)),
      onSaved: (newValue) => _fullName = newValue,
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        suffix: Icon(Icons.phone),
      ),
      keyboardType: TextInputType.text,
      maxLength: 10,
      onSaved: (newValue) => _username = newValue,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          suffix: InkWell(
            onTap: _changePasswordVisibility,
            child: const Icon(Icons.visibility),
          )),
      obscureText: _hiden,
      onSaved: (newValue) => _password = newValue,
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
        onPressed: () {
          _formLogin.currentState!.save();
          if (_fullName != null && _username != null && _password != null) {
            context.read<LoginSignupBloc>().add(Signup(
                user: UserEntity(
                    fullName: _fullName!,
                    password: _password!,
                    userName: _username!)));

            // Navigator.of(context).pushNamed('/dashboard');
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffA88FFF),
            fixedSize: const Size.fromWidth(200)),
        child: const Text(
          'Signup',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ));
  }

  Widget _buildLoginButton() {
    return TextButton(
      // onPressed: () {},
      onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
      child: const Text(
        'Login?',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // double deviceHeight = MediaQuery.of(context).size.height;
    // double fieldsHeight =
    //     MediaQuery.of(context).orientation == Orientation.portrait
    //         ? deviceHeight * 0.5
    //         : deviceHeight * 0.6;

    return Scaffold(
      backgroundColor: const Color(0xffDDF5EB),
      body: BlocListener<LoginSignupBloc, LoginSignupState>(
        listener: (context, state) {
          if (state.loginState == LoggedState.loggedin) {
            if (state.user!.games!.isNotEmpty) {
              context.read<MainBloc>().add(GetUser(user: state.user!));

              Navigator.pushNamedAndRemoveUntil(
                  context, '/dashboard', (route) => false);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/gameTypeSelect', (route) => false);
            }
          }
        },
        child: SafeArea(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xff79D6AD),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                height: 500,
                child: Form(
                  key: _formLogin,
                  child: SingleChildScrollView(
                    child: Container(
                      // alignment: Alignment.center,
                      margin:
                          const EdgeInsets.only(top: 55, left: 10, right: 10),
                      // height: fieldsHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // _buildFullNameField(),
                          _buildFullNameField(),
                          gap,
                          _buildUsernameField(),
                          gap,
                          _buildPasswordField(),
                          gap,
                          _buildSubmitButton(),
                          gap,
                          _buildLoginButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
