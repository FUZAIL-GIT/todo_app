import 'package:flutter/material.dart';
import 'package:todo_app/config/theme/text_theme.dart';

ThemeData light() {
  return ThemeData(
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      onBackground: Colors.black,
      primary: Colors.black,
      onPrimary: Colors.white,
    ),
    textTheme: textTheme,
  );
}
