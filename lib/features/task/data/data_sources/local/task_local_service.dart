import 'dart:developer';

import 'package:todo_app/core/resources/data_state.dart';
import 'package:todo_app/core/services/local_storage_service.dart';
import 'package:todo_app/features/task/data/models/task_model.dart';
import 'package:todo_app/features/task/domain/entities/task_entity.dart';

class TaskLocalService {
  final LocalStorage _localStorage;
  TaskLocalService(this._localStorage);

  Future<DataState<List<TaskEntity>>> fetchAllTask() async {
    try {
      List<TaskModel> taskList = await _localStorage.fetchAllTasks();
      return DataSuccess(taskList);
    } catch (e, s) {
      log(e.toString(),
          error: e, stackTrace: s, name: 'TaskLocalService/fetchAllTask');
      return DataFailed(
        AppException(
          e.toString(),
          'UNKNOW_ERROR',
        ),
      );
    }
  }

  Future<DataState<TaskEntity>> addTask(TaskEntity taskEntity) async {
    try {
      await _localStorage.createTask(
        TaskModel(
          id: taskEntity.id,
          title: taskEntity.title,
          status: taskEntity.status,
          createdAt: taskEntity.createdAt,
        ),
      );
      // return same entity if no runtime error caught
      return DataSuccess(taskEntity);
    } catch (e, s) {
      log(e.toString(),
          error: e, stackTrace: s, name: 'TaskLocalService/addTask');
      return DataFailed(
        AppException(
          e.toString(),
          'UNKNOW_ERROR',
        ),
      );
    }
  }

  Future<DataState<TaskEntity>> updateTask(TaskEntity taskEntity) async {
    try {
      await _localStorage.updateTask(
        TaskModel(
          id: taskEntity.id,
          title: taskEntity.title,
          status: taskEntity.status,
          createdAt: taskEntity.createdAt,
        ),
      );
      // return same entity if no runtime error caught
      return DataSuccess(taskEntity);
    } catch (e, s) {
      log(e.toString(),
          error: e, stackTrace: s, name: 'TaskLocalService/updateTask');
      return DataFailed(
        AppException(
          e.toString(),
          'UNKNOW_ERROR',
        ),
      );
    }
  }

  Future<DataState<String>> deleteTask(String taskId) async {
    try {
      await _localStorage.deleteTask(taskId);
      // return same entity if no runtime error caught
      return DataSuccess(taskId);
    } catch (e, s) {
      log(e.toString(),
          error: e, stackTrace: s, name: 'TaskLocalService/updateTask');
      return DataFailed(
        AppException(
          e.toString(),
          'UNKNOW_ERROR',
        ),
      );
    }
  }
}
