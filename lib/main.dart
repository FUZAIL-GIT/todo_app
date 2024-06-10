import 'package:flutter/material.dart';
import 'package:todo_app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const TodoApp(),
  );
}
