import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/files/create_file.dart';

class FilesPage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Files page'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ListView(
        children: [
          _createTXTFile(),
        ],
      ),
    );
  }

  Widget _createTXTFile() {
    return CreateTXTFile(scaffoldKey: _scaffoldKey);
  }
}
