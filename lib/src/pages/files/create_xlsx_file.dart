import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/src/pages/files/create_file_button.dart';
import 'package:flutter_demo/src/pages/files/file_tools.dart';
import 'package:flutter_demo/src/pages/tools.dart';

class CreateXLSXFile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CreateXLSXFile({Key key, @required this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FileButton(
      text: 'Create XLSX File',
      onPressed: _createExcel,
    );
  }

  void _createExcel() async {
    // automatically creates 1 empty sheet: Sheet1
    final excel = Excel.createExcel();
    final sheet = await excel.getDefaultSheet();
    excel.appendRow(sheet, ['Title']);
    excel.appendRow(sheet, ['']);

    excel.appendRow(sheet, ['January', 10]);
    excel.appendRow(sheet, ['February', 90.0]);
    excel.appendRow(sheet, ['March', 100]);

    final List<int> content = await excel.encode();
    await _onWriteFile(content);
  }

  Future<void> _onWriteFile(final List<int> fileContent) async {
    final isPermissionGranted = await requestPermissions;
    final downloadPath = await getDownloadPath;

    if (isPermissionGranted && downloadPath != null) {
      final file = new File('$downloadPath/example.xlsx');
      // Write the file.
      file.writeAsBytesSync(fileContent);
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
