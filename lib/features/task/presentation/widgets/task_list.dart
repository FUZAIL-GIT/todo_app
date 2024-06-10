import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/buildcontext_extension.dart';
import 'package:todo_app/core/helper/helper.dart';
import 'package:todo_app/features/task/domain/entities/task_entity.dart';
import 'package:todo_app/features/task/presentation/widgets/task_card.dart';

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
        return TaskCard(task: task);
      },
    );
  }
}
