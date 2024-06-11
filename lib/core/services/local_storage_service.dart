import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:todo_app/features/task/data/models/task_model.dart';

class LocalStorage {
  static const String fileName = "tasks";
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> localFile() async {
    final path = await _localPath;
    return File('$path/$fileName.json');
  }

  static Future<void> init() async {
    final file = await localFile();
    await file.create();
    var content = await file.readAsString();
    content.isEmpty ? file.writeAsString("") : null;
  }

  Future<void> createTask(TaskModel taskModel) async {
    final file = await localFile();
    await file.create();
    var content = await file.readAsString();
    List tasks = content != "" ? jsonDecode(content) : [];
    tasks.add(taskModel.toJson());
    file.writeAsString(jsonEncode(tasks));
  }

  Future<List<TaskModel>> fetchAllTasks() async {
    final file = await localFile();
    var content = await file.readAsString();
    if (content.isNotEmpty && content != "") {
      List response = jsonDecode(content);
      List<TaskModel> tasks =
          response.map((e) => TaskModel.fromJson(e)).toList();
      return tasks;
    } else {
      return [];
    }
  }

  void deleteDb() async {
    final file = await localFile();
    file.delete();
  }

  Future<void> deleteTask(String id) async {
    final file = await localFile();
    var content = await file.readAsString();
    List response = jsonDecode(content);
    List<TaskModel> tasks = response.map((e) => TaskModel.fromJson(e)).toList();
    tasks.removeWhere((e) => e.id == id);
    file.writeAsString(jsonEncode(tasks.map((e) => e.toJson()).toList()));
  }

  Future<void> updateTask(TaskModel task) async {
    final file = await localFile();
    var content = await file.readAsString();
    List response = jsonDecode(content);
    List<TaskModel> tasks = response.map((e) => TaskModel.fromJson(e)).toList();

    for (var i = 0; i < tasks.length; i++) {
      if (tasks[i].id == task.id) {
        tasks.removeAt(i);
        tasks.insert(i, task);
        file.writeAsString(jsonEncode(tasks.map((e) => e.toJson()).toList()));
      }
    }
  }
}
