import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static TextStyle get textStyleTittle {
    return TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white);
  }

  static TextStyle get textStyleButton {
    return TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black);
  }
}
