import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/config/routes/app_routes.dart';
import 'package:todo_app/features/task/presentation/pages/task_add.dart';
import 'package:todo_app/features/task/presentation/pages/task_view.dart';

typedef R = AppRouter;

class AppRouter {
  static GoRouter get router => _router;
  // GoRouter configuration
  static final _router = GoRouter(
    // observers: [locator<FirebaseAnalyticsService>().observer],
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: Routes.initial.path,
        name: Routes.initial.name,
        builder: (context, state) => const TaskView(),
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const TaskView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: Routes.taskAdd.path,
        name: Routes.taskAdd.name,
        builder: (context, state) => const TaskAdd(),
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const TaskAdd(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
