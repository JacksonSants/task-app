import 'package:flutter/material.dart';
import 'package:task_app/data/task_inherited.dart';
import 'package:task_app/screen/task_form.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          "Task Manager",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 10, bottom: 70),
        children: TaskInherited.of(context).taskList,
      ),
      backgroundColor: const Color(0xFFD3F1F8),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) => FormScreen(
                    taskContext: context,
                      )));
        },
        child: const Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
    );
  }
}
