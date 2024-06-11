import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/config/routes/router.dart';
import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/core/resources/data_state.dart';
import 'package:todo_app/core/utils/toaster/toaster.dart';
import 'package:todo_app/dependency_injection.dart';
import 'package:todo_app/features/task/domain/entities/task_entity.dart';
import 'package:todo_app/features/task/domain/usecases/task_usecases.dart';
import 'package:uuid/uuid.dart';

class TaskController extends GetxController with StateMixin<List<TaskEntity>> {
  final TextEditingController taskController = TextEditingController();
  int get taskLength => state?.length ?? 0;
  // fetch task
  Future<void> fetchTask({bool isForceUpdate = false}) async {
    if (!isForceUpdate) {
      change(null, status: RxStatus.loading());
    }
    DataState<List<TaskEntity>> response =
        await locator<TaskUseCase>().fetchAllTask();
    if (response is DataSuccess) {
      if (response.data!.isNotEmpty) {
        change(response.data, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
    } else {
      change(null, status: RxStatus.error(response.error?.errorMessage));
    }
  }

  //delete task
  Future<void> deleteTask(String taskId) async {
    final response = await locator<TaskUseCase>().deleteTask(taskId);
    if (response is DataSuccess) {
      fetchTask(isForceUpdate: true);
      AppUtils.showToast(
        message: 'Task deleted successfully',
        toastType: ToastType.success,
      );
    } else {
      AppUtils.showToast(
          message: response.error?.errorMessage ?? 'Unknown error',
          toastType: ToastType.error);
    }
  }

// add task
  Future<void> updateTaskStatus(TaskEntity task) async {
    final response = await locator<TaskUseCase>().updateTask(
      TaskEntity(
        id: task.id,
        title: task.title,
        status: TaskStatus.done,
        createdAt: task.createdAt,
      ),
    );
    if (response is DataSuccess) {
      fetchTask(isForceUpdate: true);
      AppUtils.showToast(
        message: 'Task mark as completed',
        toastType: ToastType.success,
      );
    } else {
      AppUtils.showToast(
          message: response.error?.errorMessage ?? 'Unknown error',
          toastType: ToastType.error);
    }
  }

// add task
  Future<void> addTask() async {
    if (taskController.text.isNotEmpty) {
      final response = await locator<TaskUseCase>().addTask(
        TaskEntity(
          id: const Uuid().v1(),
          title: taskController.text,
          status: TaskStatus.pending,
          createdAt: DateTime.now(),
        ),
      );
      if (response is DataSuccess) {
        fetchTask(isForceUpdate: true);
        taskController.clear();
        AppRouter.router.pop();
        AppUtils.showToast(
          message: 'Task added successfully',
          toastType: ToastType.success,
        );
      } else {
        AppUtils.showToast(
            message: response.error?.errorMessage ?? 'Unknown error',
            toastType: ToastType.error);
      }
    } else {
      AppUtils.showToast(
          message: 'Please fill the task field', toastType: ToastType.error);
    }
  }

  @override
  void onReady() async {
    await fetchTask();
    super.onReady();
  }
}
