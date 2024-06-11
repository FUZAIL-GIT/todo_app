import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/core/extensions/buildcontext_extension.dart';
import 'package:todo_app/core/helper/helper.dart';
import 'package:todo_app/features/task/domain/entities/task_entity.dart';
import 'package:todo_app/features/task/presentation/getx/controllers/task_controller.dart';
import 'package:todo_app/features/task/presentation/widgets/task_card.dart';

class TaskList extends GetView<TaskController> {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TaskController(),
        builder: (controller) {
          return controller.obx(
              (state) {
                return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: AppHelper.appPadding,
                  separatorBuilder: (_, __) => Divider(
                    endIndent: 25,
                    indent: 25,
                    color: context.colorScheme.onBackground.withOpacity(0.5),
                    thickness: 0.5,
                  ),
                  itemCount: state!.length,
                  itemBuilder: (context, index) {
                    TaskEntity task = state[index];
                    return TaskCard(task: task);
                  },
                );
              },
              onLoading: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              onEmpty: const Center(
                child: Text('No Task to show'),
              ),
              onError: (e) {
                return Center(
                  child: Text(e ?? 'Unknown error'),
                );
              });
        });
  }
}
