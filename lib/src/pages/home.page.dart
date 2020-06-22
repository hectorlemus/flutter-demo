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
              title: Text('Logout'),
              onTap: () => {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(AuthenticationLoggedOut())
              },
            ),
            ListTile(
              title: Text('data'),
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return CounterPage();
                }))
              },
            )
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
