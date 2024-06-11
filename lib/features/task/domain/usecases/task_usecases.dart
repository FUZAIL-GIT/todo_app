import 'package:todo_app/core/resources/data_state.dart';
import 'package:todo_app/features/task/domain/entities/task_entity.dart';
import 'package:todo_app/features/task/domain/repository/task_repository.dart';

class TaskUseCase {
  TaskUseCase(this._taskRepository);
  final TaskRepository _taskRepository;

  Future<DataState<List<TaskEntity>>> fetchAllTask() {
    return _taskRepository.fetchAllTask();
  }

  Future<DataState<TaskEntity>> addTask(TaskEntity taskEntity) {
    return _taskRepository.addTask(taskEntity);
  }

  Future<DataState<TaskEntity>> updateTask(TaskEntity taskEntity) {
    return _taskRepository.updateTask(taskEntity);
  }

  Future<DataState<String>> deleteTask(String taskId) {
    return _taskRepository.deleteTask(taskId);
  }
}
