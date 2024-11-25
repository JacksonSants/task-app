import 'package:flutter/material.dart';

import 'components/difficuty.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const initialScreen(),
    );
  }
}

class Task extends StatefulWidget {
  final String taskName;
  final String image;
  final int difficulty;

  const Task(this.taskName, this.image, this.difficulty, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(4)),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 200,
                              child: Text(widget.taskName,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      overflow: TextOverflow.ellipsis))),
                          Difficuty(widget.difficulty)
                        ],
                      ),
                      SizedBox(
                        width: 72,
                        height: 72,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {
                              setState(() {
                                level++;
                              });
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Lvl up",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 200,
                          child: LinearProgressIndicator(
                              color: Colors.white,
                              value: (widget.difficulty > 0)
                                  ? (level / widget.difficulty) / 10
                                  : 1)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Nível: $level",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class initialScreen extends StatefulWidget {
  const initialScreen({super.key});

  @override
  State<initialScreen> createState() => _initialScreenState();
}

class _initialScreenState extends State<initialScreen> {
  bool opacity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Task Manager"),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(microseconds: 1000),
        child: ListView(
          children: const [
            Task(
                "Aprender flutter",
                "https://img.freepik.com/vetores-premium/conceito-de-programacao-com-cena-de-pessoas-no-desenho-animado-plano-um-programador-com-uma-xicara-de-cafe_198565-6323.jpg",
                4),
            Task(
                "Aprender React",
                "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/1200px-React-icon.svg.png",
                4),
            Task(
                "Correr 10km",
                "https://images.vexels.com/content/138213/preview/running-sprint-76aa19.png",
                3),
            Task(
                "Aprender java Script",
                "https://skillforge.com/wp-content/uploads/2020/10/javascript.png",
                3),
            Task(
                "Aprender java Script",
                "https://skillforge.com/wp-content/uploads/2020/10/javascript.png",
                3),
            Task(
                "Aprender java Script",
                "https://skillforge.com/wp-content/uploads/2020/10/javascript.png",
                3),
            Task(
                "Aprender java Script",
                "https://skillforge.com/wp-content/uploads/2020/10/javascript.png",
                3),
          ],
        ),
      ),
      backgroundColor: Color(0xFFD3F1F8),
      floatingActionButton: FloatingActionButton(
        backgroundColor: opacity ? Colors.white : Colors.blue,
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        child: Icon(
          Icons.remove_red_eye,
          color: opacity ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
