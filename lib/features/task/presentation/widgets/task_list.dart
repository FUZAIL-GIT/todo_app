import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/core/extensions/buildcontext_extension.dart';
import 'package:todo_app/core/helper/helper.dart';
import 'package:todo_app/features/task/domain/entities/task_entity.dart';

class TaskList extends StatelessWidget {
  final List<TaskEntity> tasks;
  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: AppHelper.appPadding,
      separatorBuilder: (_, __) => Divider(
        endIndent: 25,
        indent: 25,
        color: context.colorScheme.onBackground.withOpacity(0.5),
        thickness: 0.5,
      ),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          leading: getTaskStatusIcon(task.status),
          title: Text(task.title),
          subtitle: getTaskStatusText(context, status: task.status),
          trailing: IconButton(
            onPressed: () {},
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

  Text getTaskStatusText(BuildContext context, {required TaskStatus status}) {
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
        return Text(
          'Mark as done',
          style: context.textTheme.labelMedium!.copyWith(
            color: Colors.blue,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            decorationStyle: TextDecorationStyle.solid,
          ),
        );
    }
  }
}
