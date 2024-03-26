

import 'dart:convert';

import 'package:primary_app/model/task.dart';
import 'package:http/http.dart' as http;
class TaskService {
static const String baseUrl="http://localhost:8098/api/sale/task";

  Future<List<Task>> fetchTask() async {
    // String baseUrl = "http://localhost:8098/api/sale/task";
    final response = await http
        .get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // final response = await http.get(url, headers: {"Content-Type": "application/json"});
      final List body = json.decode(response.body);
      return body.map((e) => Task.fromJson(e)).toList();

      // return Task.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load task');
    }
  }
}