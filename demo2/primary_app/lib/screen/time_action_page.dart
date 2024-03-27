

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primary_app/model/time_action_page.dart';
import 'package:primary_app/service/time_action_service.dart';

class TimeActionPage extends StatefulWidget {
  const TimeActionPage({super.key});

  @override
  State<TimeActionPage> createState() => _TimeActionPageState();
}

class _TimeActionPageState extends State<TimeActionPage> {

  final TimeActionServices _service = TimeActionServices();
  late Future<List<TimeAction>> taskFuture;

  @override
  void initState() {
    super.initState();
    taskFuture = _service.fetchTimeAction();
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Time Action",
      home:Scaffold(
        appBar: AppBar(
          title: const Text("Time Action List"),
        ),
        body: Center(
          child: FutureBuilder<List<TimeAction>>(
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
      ),
    );
  }
  Widget buildTasks(List<TimeAction> timeAction) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(50.0),

      child: ListView.builder(
        itemCount: timeAction.length,
        itemBuilder: (context, index) {
          final time = timeAction[index];

          // print(timeAction);
          return ListTile(
            title: Text(time.orderId!.buyersId!.organization!.toString()),
            subtitle: Text(time.taskId!.name! +"-"+ time.expectedStartDate!),


            contentPadding:const EdgeInsets.all(10.0),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: () {
                  // _navigateToTaskForm(context,task);
                }, icon:const Icon(Icons.edit)),
                IconButton(onPressed: () async{
                  // await _service.deleteTask(task.id!);
                  // _refreshTask();
                }, icon:const Icon(Icons.delete)),
              ],
            ),
          );
        },
      ),
    );
  }





}
