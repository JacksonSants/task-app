import 'package:sqflite/sqflite.dart';
import 'package:task_app/components/task.dart';
import 'package:task_app/data/database.dart';

class TaskDao {
  static const String tableSql = "CREATE TABLE $_tablename("
      "$_name TEXT"
      "$_difficulty INTEGER"
      "$_image TEXT)";

  static const String _tablename = "Task";
  static const String _name = "name";
  static const String _difficulty = "difficulty";
  static const String _image = "image";

  Map<String, dynamic> toMap(Task task){
    print("Convertendo tarefa em map");
    final Map<String, dynamic> taskMap = Map();
    taskMap[_name] = task.taskName;
    taskMap[_difficulty] = task.difficulty;
    taskMap[_image] = task.image;
    print("Mapa de tarefas: $task");
    return taskMap;
  }

  save(Task task) async {
    print("Iniciando save");
    final Database db = await getDatabase();
    var itemExists = find(task.taskName);
    Map<String, dynamic> taskMap = toMap(task);

    if (itemExists.toString().isEmpty) {
      print("Tarefa não encontrada.");
      return await db.insert(_tablename, taskMap);
    } else {
      print("Tarefa já existe. Atualizando as informações...");
      return await db.update(
          _tablename,
          taskMap,
          where: "$_name = ?",
          whereArgs: [task.taskName]);
    }
  }

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    print("Convertendo toList:");
    final List<Task> tasks = [];

    for (Map<String, dynamic> linha in taskMap) {
      final Task task = Task(linha[_name], linha[_image], linha[_difficulty]);
      tasks.add(task);
    }

    print("Linhas de tarefas: $tasks");
    return tasks;
  }

  Future<List<Task>> findAll() async {
    print("Acessando fndAll");

    final Database bd = await getDatabase();
    final List<Map<String, dynamic>> result = await bd.query(_tablename);
    print("Procurando dados no banco de daodos... encontrado: $result");

    return toList(result);
  }

  Future<List<Task>> find(String taskName) async {
    print("Acessando find");

    final Database bd = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bd.query(_tablename, where: "$_name = ?", whereArgs: [taskName]);

    print("Tarefa encontrada. ${toList(result)}");
    return toList(result);
  }

  delete(String taskName) async {
    print("Deletando tarefa");
    final Database db = await getDatabase();
    return db.delete(
        _tablename,
        where: "$_name = ?",
        whereArgs: [taskName]);
  }
}
