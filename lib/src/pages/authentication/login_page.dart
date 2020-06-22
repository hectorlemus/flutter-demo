import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_demo/src/bloc/login/login_bloc.dart';
import 'package:flutter_demo/src/repository/user_repository.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}
