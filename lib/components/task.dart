import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/components/progress_bar.dart';

import 'difficuty.dart';

class Task extends StatefulWidget {
  final String taskName;
  final String image;
  final int difficulty;

  Task(this.taskName, this.image, this.difficulty, {super.key});

  int level = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  bool assetOrNetwork(){
    if(widget.image.contains("http")){
      return false;
    }
    return true;
  }

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
                          child: assetOrNetwork() ? Image.asset(
                            widget.image,
                            fit: BoxFit.cover,
                          ) : Image.network(widget.image, fit: BoxFit.cover,),
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
                                widget.level++;
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
                ProgressBar(difficuty: widget.difficulty, level: widget.level),
              ],
            ),
          ],
        ),
      ),
    );
  }
}