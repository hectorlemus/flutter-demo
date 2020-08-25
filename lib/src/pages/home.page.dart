import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/src/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_demo/src/pages/charts/charts_page.dart';

import './counter_page.dart';
import 'files/files.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(context),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: body(context),
    );
  }

  Widget _drawer(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListTile(
          title: Text('Logout'),
          leading: Icon(Icons.exit_to_app, color: Colors.blue),
          onTap: () => _onLogOut(context),
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return ListView(
      children: <Widget>[
        _option(
          text: 'Couter Page',
          icon: Icons.exposure,
          onTap: () => _navigate(
            CounterPage(),
          ),
        ),
        _option(
          text: 'Charts Page',
          icon: Icons.show_chart,
          onTap: () => _navigate(
            ChartsPage(),
          ),
        ),
        _option(
          text: 'Files',
          icon: Icons.insert_drive_file,
          onTap: () => _navigate(
            FilesPage(),
          ),
        )
      ],
    );
  }

  Widget _option({
    @required String text,
    @required IconData icon,
    @required Function onTap,
  }) {
    return Column(
      children: [
        ListTile(
          title: Text('$text'),
          leading: Icon(icon, color: Colors.blue),
          trailing: Icon(Icons.arrow_forward),
          onTap: onTap,
        ),
        Divider(),
      ],
    );
  }

  void _navigate(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return page;
    }));
  }

  void _onLogOut(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context).add(
      AuthenticationLoggedOut(),
    );
  }
}
