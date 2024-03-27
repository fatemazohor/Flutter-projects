import 'package:flutter/material.dart';
import 'package:primary_app/model/task.dart';
import 'package:primary_app/service/task_service.dart';

class TaskForm extends StatefulWidget {
  final Task? task;

  const TaskForm({super.key, this.task});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final TaskService taskService = TaskService();
  final _formKey = GlobalKey<FormState>();

  late int? id;
  late String? name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.task != null) {
      id = widget.task!.id;
      name = widget.task!.name;
    } else {
      id = null;
      name = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? "Add Task" : "Edit Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: name,
                decoration: const InputDecoration(labelText: "Task Name"),
                onChanged: (value) => setState(() {
                  name = value;
                }),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter Task name' : null,
              ),
              const SizedBox(width: 10.0,height: 5.0,),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Task task = Task(id: id, name: name);
                      try {
                        if (widget.task == null) {
                          await taskService.createTask(task);
                        } else {
                          await taskService.updateTask(task);
                        }
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      } catch (e) {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Failed to save doctor')),
                        );
                      }
                    }
                  },
                  child: Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
