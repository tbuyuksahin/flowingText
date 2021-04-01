import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'textStyle.dart';

abstract class AppBarStyle {
  static AppBar textStyleTittle(List<Widget> widget, title) {
    return AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(title, style: TextStyles.textStyleTittle),
        actions: widget);
  }
}
