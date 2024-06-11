import 'package:todo_app/core/resources/data_state.dart';
import 'package:todo_app/features/task/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<DataState<List<TaskEntity>>> fetchAllTask();
  Future<DataState<TaskEntity>> updateTask(TaskEntity taskEntity);
  Future<DataState<TaskEntity>> addTask(TaskEntity taskEntity);
  Future<DataState<String>> deleteTask(String taskId);
}
