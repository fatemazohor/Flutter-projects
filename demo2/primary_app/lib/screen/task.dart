

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primary_app/model/task.dart';
import 'package:primary_app/service/task_service.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TaskService _service= TaskService();
  late Future<List<Task>> taskFuture;

  @override
  void initState() {
    super.initState();
    taskFuture = _service.fetchTask();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Style",
      home: Scaffold(
        body:Center(
          child: Column(
            children: <Widget>[
              Text("Task"),
              FutureBuilder<List<Task>>(future: taskFuture ,
                  builder: (context, snapshot){
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      final tasks = snapshot.data!;
                      return buildTasks(tasks);
                    } else {
                      return const Text("No data available");
                    }
                  })
            ],
          ),
        ) ,
      ),
    );
  }

  Widget buildTasks(List<Task> tasks) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        // debugPrint('tasks: $tasks');

        print(tasks);
        return ListTile(

            title: Text(task.name! ),
        );
        // return Container(
        //   color: Colors.grey.shade300,
        //   margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        //   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        //   height: 100,
        //   width: double.maxFinite,
        //   child: Row(
        //     children: <Widget>[
        //       Expanded(flex: 1, child: Image.network(post.url!)),
        //       SizedBox(width: 5),
        //       Expanded(flex: 3, child: Text(task.name!)),
        //
        //     ],
        //
        //   ),
        // );
      },
    );
  }
}
