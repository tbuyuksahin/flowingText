import 'package:flowing_text/styles/textStyle.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final int speedFactor;
  final String title;

  const AppButton({this.speedFactor = 100, this.title});

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        color: Colors.amber,
        child: Text(widget.title, style: TextStyles.textStyleButton),
        onPressed: () {
          setState(() {
            widget.speedFactor;
          });
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
