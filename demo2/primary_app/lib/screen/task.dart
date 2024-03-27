import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:primary_app/model/task.dart';
import 'package:primary_app/screen/task_form.dart';
import 'package:primary_app/service/task_service.dart';
import 'package:primary_app/util/route.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TaskService _service = TaskService();
  late Future<List<Task>> taskFuture;

  @override
  void initState() {
    super.initState();
    taskFuture = _service.fetchTask();
  }

  void _navigateToTaskForm(BuildContext context,[Task?task]) async{
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context)=>TaskForm(task:task),
      ),
    );
    // can't take task object to from view
    // await Navigator.pushNamed(context, MyRoute.taskFormRoute);

    // call fetch al task to update view.
    _refreshTask();
  }
  void _refreshTask() {
    setState(() {
      taskFuture = _service.fetchTask();
       // Navigator.pushNamed(context, MyRoute.taskRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Task List"),
        ),
        body: Center(
          child:FutureBuilder<List<Task>>(
              future: taskFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final tasks = snapshot.data!;
                  return buildTasks(tasks);
                }
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _navigateToTaskForm(context),
          tooltip: "Add Task",
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildTasks(List<Task> tasks) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(50.0),

      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
      
          print(tasks);
          return ListTile(
            title: Text(task.name!),
            contentPadding:const EdgeInsets.all(10.0),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: () {
                  _navigateToTaskForm(context,task);
                  }, icon:const Icon(Icons.edit)),
                IconButton(onPressed: () async{
                  await _service.deleteTask(task.id!);
                  _refreshTask();
                }, icon:const Icon(Icons.delete)),
              ],
            ),
          );
        },
      ),
    );
  }
}
