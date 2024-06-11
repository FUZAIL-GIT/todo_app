import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/core/managers/theme_manager.dart';
import 'package:todo_app/core/services/local_storage_service.dart';
import 'package:todo_app/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put(ThemeManager()).initThemeMode();
  await LocalStorage.init();
  initializeDependencies();
  runApp(
    const TodoApp(),
  );
}
