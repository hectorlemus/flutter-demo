import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/bloc/authentication/authentication_bloc.dart';

import './counter_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Couter Page'),
              leading: Icon(Icons.exposure),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return CounterPage();
                }))
              },
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.exit_to_app),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(AuthenticationLoggedOut())
              },
            ),
          ],
        ),
      ),
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
}
