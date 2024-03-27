

import 'dart:convert';

import 'package:primary_app/model/time_action_page.dart';
import 'package:http/http.dart' as http;
class TimeActionServices{

  static const String baseUrl = "http://localhost:8098/api/sale/time_action";

  Future<List<TimeAction>> fetchTimeAction() async {
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
      return jsonResponse.map((e) => TimeAction.fromJson(e)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load task');
    }
  }
}