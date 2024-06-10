import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/extensions/buildcontext_extension.dart';
import 'package:todo_app/core/helper/helper.dart';

class TaskAdd extends StatelessWidget {
  const TaskAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: context.colorScheme.background,
      contentPadding: AppHelper.dialogPadding,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      title: Text(
        'Add task',
        style: context.textTheme.labelMedium!.copyWith(
          color: context.colorScheme.onBackground,
        ),
      ),
      children: [
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            contentPadding: AppHelper.appPadding,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: context.colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
            labelText: 'Task',
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
            Get.back();
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
  }
}
