import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/files/file_tools.dart';
import 'package:flutter_demo/src/pages/tools.dart';

class CreateTXTFile extends StatelessWidget {
  final scaffoldKey;

  const CreateTXTFile({Key key, @required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 6.0,
      color: Colors.blue,
      onPressed: _onWriteFile,
      child: Text(
        'Create TXT File',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<void> _onWriteFile() async {
    final isPermissionGranted = await requestPermissions;
    final downloadPath = await getDownloadPath;

    if (isPermissionGranted && downloadPath != null) {
      final file = new File('$downloadPath/example.txt');
      // Write the file.
      await file.writeAsString('Hello from Fluttter aplication.');
      _successAlert(file.path);
    } else {
      _errorAlert();
    }
  }

  void _successAlert(final String filePath) {
    successAlert(
      scaffoldKey: scaffoldKey,
      title: 'Successfully generated file!',
      subTitle: 'The file is in: $filePath',
    );
  }

  void _errorAlert() {
    errorAlert(
      scaffoldKey: scaffoldKey,
      title: 'An error occurred while trying to generate the file.',
      subTitle: 'Check permissions or try again later.',
    );
  }
}
