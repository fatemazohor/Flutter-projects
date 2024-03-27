import 'dart:convert';

import 'package:primary_app/model/task.dart';
import 'package:http/http.dart' as http;

class TaskService {
  static const String baseUrl = "http://localhost:8098/api/sale/task";

  Future<List<Task>> fetchTask() async {
    // String baseUrl = "http://localhost:8098/api/sale/task";
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // this 1st version work .
      // final List body = json.decode(response.body);
      // return body.map((e) => Task.fromJson(e)).toList();
      // this 2nd version work
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((e) => Task.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load task');
    }
  }

  // crate new task----------
  Future<Task> createTask(Task task) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );
    if (response.statusCode == 200) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception("Falied to create task");
    }
  }

  // update Task-------
  Future<Task> updateTask(Task task) async {
    final response = await http.put(
      Uri.parse('${baseUrl}/${task.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );
    if (response.statusCode == 200) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception("Falied to create task");
    }
  }

  // delete task-----------
  Future<void> deleteTask(int id) async {
    final response =await http.delete(Uri.parse('${baseUrl}/${id}'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete doctor');
    }
  }
}
