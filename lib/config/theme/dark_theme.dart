import 'package:flutter/material.dart';
import 'package:todo_app/config/theme/text_theme.dart';

ThemeData dark() {
  return ThemeData(
    colorScheme: const ColorScheme.dark(
      background: Color(0xff373737),
      primary: Color(0xff1D1D1D),
      tertiary: Color(0xff00C443),
      secondary: Color(0xff00C443),
      onPrimary: Color(0xffF3F3F3),
      onSecondary: Color(0xffF3F3F3),
      onSurface: Color(0xffF3F3F3),
    ),
    textTheme: textTheme,
  );
}
