import 'package:flutter/material.dart';

class MyTheme {
  static const Color brown = Color(0xFF5a2b04);
  static const Color background = Color(0xFFdbd2c3);
  static const Color textcolor = Color(0xFF8f7056);
  static const Color splashback = Color(0xFF701F0F);

  static TextStyle basicTextStyle(
      {double? size, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: size ?? 20,
      fontFamily: 'Jost',
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: 0.10,
    );
  }

  static TextStyle moonTextStyle(
      {double? size, Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: size ?? 20,
      fontFamily: 'MoonDream',
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: 0.10,
    );
  }
}
