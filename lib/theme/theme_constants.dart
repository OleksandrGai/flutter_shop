import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade200,
    primary: Colors.black,
    secondary: Colors.grey.shade200,
  ),
);
ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.black,
      primary: Colors.white,
      secondary: Colors.white,
    ));
