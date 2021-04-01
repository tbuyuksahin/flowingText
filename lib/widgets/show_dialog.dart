import 'package:flowing_text/styles/textStyle.dart';
import 'package:flutter/material.dart';

class AppShowDialog extends StatefulWidget {
  final String title;
  final List<Widget> widget;

  const AppShowDialog({this.title, this.widget});

  @override
  _AppShowDialogState createState() => _AppShowDialogState();
}

class _AppShowDialogState extends State<AppShowDialog> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.settings, size: 30),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Center(
                child: Text(widget.title, style: TextStyles.textStyleButton)),
            actions: widget.widget,
          ),
        );
      },
    );
  }
}
