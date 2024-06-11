import 'package:flutter/material.dart';
import 'package:todo_app/config/theme/dark_theme.dart';
import 'package:todo_app/config/theme/light_theme.dart';

class AppTheme {
  static ThemeData get lightTheme => light();
  static ThemeData get darkTheme => dark();
}
