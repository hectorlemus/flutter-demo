import 'package:flutter/material.dart';

void successAlert({
  @required final GlobalKey<ScaffoldState> scaffoldKey,
  @required final String title,
  @required final String subTitle,
}) {
  _viewAlert(
    scaffoldKey: scaffoldKey,
    color: Colors.green,
    title: title,
    subTitle: subTitle,
  );
}

void errorAlert({
  @required final GlobalKey<ScaffoldState> scaffoldKey,
  @required final String title,
  @required final String subTitle,
}) {
  _viewAlert(
    scaffoldKey: scaffoldKey,
    color: Colors.red,
    title: title,
    subTitle: subTitle,
  );
}

void _viewAlert({
  @required final GlobalKey<ScaffoldState> scaffoldKey,
  @required final Color color,
  @required final String title,
  @required final String subTitle,
}) {
  final snackBar = SnackBar(
    backgroundColor: color,
    content: ListTile(
      title: Text('$title'),
      subtitle: Text('$subTitle'),
    ),
  );
  scaffoldKey.currentState.showSnackBar(snackBar);
}
