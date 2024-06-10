import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/core/extensions/buildcontext_extension.dart';
import 'package:todo_app/features/task/domain/entities/task_entity.dart';
import 'package:todo_app/features/task/presentation/pages/task_add.dart';
import 'package:todo_app/features/task/presentation/widgets/task_list.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const TaskAdd();
            },
          );
        },
        label: Text(
          'Add Task ',
          style: context.textTheme.labelMedium!.copyWith(
            color: context.colorScheme.onPrimary,
            fontSize: 18.sp,
            letterSpacing: 18.sp * 0.15,
          ),
        ),
        icon: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: context.colorScheme.primary,
        centerTitle: true,
        title: Text(
          'My Task (20)',
          style: context.textTheme.labelMedium!.copyWith(
            color: context.colorScheme.onPrimary,
            fontSize: 20.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete_sharp,
              color: context.colorScheme.onPrimary,
            ),
          )
        ],
      ),
      body: TaskList(tasks: [
        TaskEntity(
          id: '1',
          title: 'Complete the homework',
          status: TaskStatus.pending,
          createdAt: DateTime.now(),
        ),
        TaskEntity(
          id: '2',
          title: 'Complete the homework',
          status: TaskStatus.done,
          createdAt: DateTime.now(),
        ),
        TaskEntity(
          id: '3',
          title: 'Complete the homework',
          status: TaskStatus.done,
          createdAt: DateTime.now(),
        ),
        TaskEntity(
          id: '3',
          title: 'Complete the homework',
          status: TaskStatus.pending,
          createdAt: DateTime.now(),
        ),
        TaskEntity(
          id: '3',
          title: 'Complete the homework',
          status: TaskStatus.pending,
          createdAt: DateTime.now(),
        ),
        TaskEntity(
          id: '3',
          title: 'Complete the homework',
          status: TaskStatus.pending,
          createdAt: DateTime.now(),
        ),
        TaskEntity(
          id: '3',
          title: 'Complete the homework',
          status: TaskStatus.done,
          createdAt: DateTime.now(),
        ),
        TaskEntity(
          id: '3',
          title: 'Complete the homework',
          status: TaskStatus.pending,
          createdAt: DateTime.now(),
        ),
        TaskEntity(
          id: '3',
          title: 'Complete the homework',
          status: TaskStatus.done,
          createdAt: DateTime.now(),
        ),
      ]),
    );
  }
}
