import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/extensions/buildcontext_extension.dart';
import 'package:todo_app/core/helper/helper.dart';
import 'package:todo_app/core/managers/theme_manager.dart';
import 'package:todo_app/features/task/presentation/getx/controllers/task_controller.dart';
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
        leading: IconButton(
          color: context.colorScheme.onPrimary,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                contentPadding: AppHelper.dialogPadding,
                shape: AppHelper.dialogShape,
                children: [
                  Get.find<ThemeManager>().getThemeModeSwitch(context)
                ],
              ),
            );
          },
          icon: const Icon(
            Icons.dark_mode_rounded,
          ),
        ),
        title: GetBuilder(
          init: TaskController(),
          builder: (controller) {
            return Text(
              'My Task (${controller.taskLength})',
              style: context.textTheme.labelMedium!.copyWith(
                color: context.colorScheme.onPrimary,
                fontSize: 20.sp,
              ),
            );
          },
        ),
      ),
      body: const TaskList(),
    );
  }
}
