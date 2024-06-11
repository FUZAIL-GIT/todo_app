import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:todo_app/config/routes/router.dart';
import 'package:todo_app/config/theme/theme.dart';
import 'package:todo_app/core/managers/theme_manager.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ThemeManager(),
      builder: (controller) {
        return ScreenUtilInit(
          designSize: const Size(414, 896),
          minTextAdapt: true,
          builder: (_, __) {
            return MaterialApp.router(
              title: 'TODO_APP',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: controller.themeMode,
              builder: EasyLoading.init(),
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
            );
          },
        );
      },
    );
  }
}
