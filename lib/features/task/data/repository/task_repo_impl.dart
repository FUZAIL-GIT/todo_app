import 'package:todo_app/core/resources/data_state.dart';
import 'package:todo_app/features/task/data/data_sources/local/task_local_service.dart';
import 'package:todo_app/features/task/domain/entities/task_entity.dart';
import 'package:todo_app/features/task/domain/repository/task_repository.dart';

class TaskRepoImplementation implements TaskRepository {
  TaskRepoImplementation(this._taskLocalService);
  final TaskLocalService _taskLocalService;
  @override
  Future<DataState<TaskEntity>> addTask(TaskEntity taskEntity) async {
    return await _taskLocalService.addTask(taskEntity);
  }

  @override
  Future<DataState<List<TaskEntity>>> fetchAllTask() {
    return _taskLocalService.fetchAllTask();
  }

  @override
  Future<DataState<TaskEntity>> updateTask(TaskEntity taskEntity) {
    return _taskLocalService.updateTask(taskEntity);
  }

  @override
  Future<DataState<String>> deleteTask(String taskid) {
    return _taskLocalService.deleteTask(taskid);
  }
}
