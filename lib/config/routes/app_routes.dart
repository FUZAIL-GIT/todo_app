class Routes {
  static const AppPage initial = AppPage(
    path: '/',
    name: 'Initial',
  );
  static const AppPage taskView = AppPage(
    path: '/task-view',
    name: 'TaskView',
  );
  static const AppPage taskAdd = AppPage(
    path: '/task-add',
    name: 'TaskAdd',
  );
}

class AppPage {
  const AppPage({
    required this.path,
    required this.name,
  });
  final String path;
  final String name;
}
