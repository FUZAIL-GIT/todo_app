import 'package:get_it/get_it.dart';
import 'package:todo_app/core/services/local_storage_service.dart';
import 'package:todo_app/features/task/data/data_sources/local/task_local_service.dart';
import 'package:todo_app/features/task/data/repository/task_repo_impl.dart';
import 'package:todo_app/features/task/domain/repository/task_repository.dart';
import 'package:todo_app/features/task/domain/usecases/task_usecases.dart';

GetIt locator = GetIt.instance;

void initializeDependencies() {
  locator
    ..registerSingleton<LocalStorage>(
      LocalStorage(),
    )
    ..registerSingleton<TaskLocalService>(
      TaskLocalService(
        locator<LocalStorage>(),
      ),
    )
    ..registerSingleton<TaskRepository>(
      TaskRepoImplementation(
        locator<TaskLocalService>(),
      ),
    )
    ..registerSingleton<TaskUseCase>(
      TaskUseCase(
        locator<TaskRepository>(),
      ),
    );
}
