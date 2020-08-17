import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/bloc/authentication/authentication_bloc.dart';

import './counter_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(context),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Center(
          child: Text('Home'),
        ),
      ),
    );
  }

  Widget _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _drawerOption(
            text: 'Couter Page',
            icon: Icons.exposure,
            onTap: () => _goToCounterPage(context),
          ),
          _drawerOption(
            text: 'Logout',
            icon: Icons.exit_to_app,
            onTap: () => _onLogOut(context),
          ),
        ],
      ),
    );
  }

  Widget _drawerOption({
    @required String text,
    @required IconData icon,
    @required Function onTap,
  }) {
    return ListTile(
      title: Text('$text'),
      leading: Icon(icon, color: Colors.blue),
      onTap: onTap,
    );
  }

  void _goToCounterPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return CounterPage();
    }));
  }

  void _onLogOut(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context).add(
      AuthenticationLoggedOut(),
    );
  }
}
