import 'package:equatable/equatable.dart';
import 'package:todo_app/core/enums/task_status.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final TaskStatus status;
  final DateTime createdAt;

  const TaskEntity({
    required this.id,
    required this.title,
    required this.status,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, title, status, createdAt];
}
