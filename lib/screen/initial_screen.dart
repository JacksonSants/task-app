import 'package:flutter/material.dart';
import 'package:task_app/components/task.dart';
import 'package:task_app/data/task_dao.dart';
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
      body: Padding(padding: const EdgeInsets.only(top: 10, bottom: 70),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(), builder: (context, snapshot) {
          List<Task>? items = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            // TODO: Handle this case.
            case ConnectionState.waiting:
            // TODO: Handle this case.
            case ConnectionState.waiting:
            // TODO: Handle this case.
            case ConnectionState.active:
            // TODO: Handle this case.
            case ConnectionState.done:
              if (snapshot.hasData && items != null) {
                if (items.isNotEmpty) {
                  return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Task tasks = items[index];
                        return tasks;
                      });
                }
                return Center(
                  child: Column(
                    children: [
                      Icon(Icons.error_outline, size: 128,),
                      Text("Não há nenhuma tarefa",
                        style: TextStyle(fontSize: 32,),)
                    ],
                  ),
                );
              }
              return Text("Erro ao carregar tarefas.");
              break;
          }
          return Text("Erro desconhecido");
        }),
      ),
      backgroundColor: const Color(0xFFD3F1F8),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (contextNew) =>
                      FormScreen(
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
