import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/extensions/buildcontext_extension.dart';
import 'package:todo_app/core/helper/helper.dart';
import 'package:todo_app/features/task/presentation/getx/controllers/task_controller.dart';

class TaskAdd extends StatelessWidget {
  const TaskAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TaskController(),
        builder: (controller) {
          return SimpleDialog(
            backgroundColor: context.colorScheme.background,
            contentPadding: AppHelper.dialogPadding,
            shape: AppHelper.dialogShape,
            title: Text(
              'Add task',
              style: context.textTheme.labelMedium!.copyWith(
                color: context.colorScheme.onBackground,
              ),
            ),
            children: [
              Form(
                child: TextField(
                  autofocus: true,
                  controller: controller.taskController,
                  decoration: InputDecoration(
                    contentPadding: AppHelper.appPadding,
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color:
                            context.colorScheme.onBackground.withOpacity(0.5),
                      ),
                    ),
                    labelText: 'Task',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.primary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: () {
                  controller.addTask();
                },
                child: Text(
                  'Add',
                  style: context.textTheme.labelMedium!.copyWith(
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
