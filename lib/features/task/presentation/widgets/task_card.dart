import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/core/extensions/buildcontext_extension.dart';
import 'package:todo_app/features/task/domain/entities/task_entity.dart';
import 'package:todo_app/features/task/presentation/getx/controllers/task_controller.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TaskController(),
      builder: (controller) {
        return ListTile(
          leading: getTaskStatusIcon(task.status),
          title: Text(task.title),
          subtitle: getTaskStatusText(
            context,
            status: task.status,
            onAction: () {
              controller.updateTaskStatus(task);
            },
          ),
          trailing: IconButton(
            onPressed: () {
              controller.deleteTask(task.id);
            },
            icon: Icon(
              Icons.delete,
              color: context.colorScheme.error,
            ),
          ),
          onTap: () {},
        );
      },
    );
  }

  Icon getTaskStatusIcon(TaskStatus status) {
    switch (status) {
      case TaskStatus.done:
        return const Icon(Icons.check_circle, color: Colors.green);
      case TaskStatus.pending:
        return const Icon(Icons.pending_actions_rounded);
    }
  }

  Widget getTaskStatusText(BuildContext context,
      {required TaskStatus status, VoidCallback? onAction}) {
    switch (status) {
      case TaskStatus.done:
        return Text(
          'Completed',
          style: context.textTheme.labelMedium!.copyWith(
            color: Colors.green,
            fontWeight: FontWeight.normal,
          ),
        );
      case TaskStatus.pending:
        return InkWell(
          onTap: onAction,
          child: Text(
            'Mark as done',
            style: context.textTheme.labelMedium!.copyWith(
              color: Colors.blue,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              decorationStyle: TextDecorationStyle.solid,
            ),
          ),
        );
    }
  }
}
