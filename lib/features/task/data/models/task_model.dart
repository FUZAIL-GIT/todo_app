import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/features/task/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required super.id,
    required super.title,
    required super.status,
    required super.createdAt,
  });
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      status: TaskStatus.values
          .firstWhere((element) => element.name == json['status']),
      createdAt: DateTime.fromMicrosecondsSinceEpoch(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'status': status.name,
      'createdAt': createdAt.microsecondsSinceEpoch,
    };
  }
}
