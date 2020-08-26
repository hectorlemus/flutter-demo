import 'package:flutter/material.dart';

class FileButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const FileButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  })  : assert(text != null, onPressed != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 6.0,
      color: Colors.blue,
      onPressed: onPressed,
      child: Text(
        '$text',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
