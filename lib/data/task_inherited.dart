import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task(
        "Aprender flutter.",
        "assets/images/flutter.png",
        4),
    Task(
        "Aprender React.",
        "assets/images/react.png",
        4),
    Task(
        "Percorrer 10km de bicicleta.",
        "assets/images/ciclismo.jpg",
        3),
    Task(
        "Aprender java Script",
        "assets/images/js.png",
        3),
  ];

  void newTask(String taskName, String imageURL, int difficulty){
    return taskList.add(Task(taskName, imageURL, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
