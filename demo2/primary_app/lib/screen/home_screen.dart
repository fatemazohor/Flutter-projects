import 'dart:js_interop_unsafe';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:primary_app/screen/manage_people.dart';
import 'package:primary_app/screen/style_page.dart';
import 'package:primary_app/screen/task.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home page",
            style: TextStyle(
                backgroundColor: Colors.lime, fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              IconButton(
                  onPressed: () => {
                        print("~~~~~~~Delete from home.~~~~~~~~"),
                      },
                  icon: Icon(Icons.delete)),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TaskPage()),
                        ),
                      },
                  child: Icon(Icons.safety_check)),
            ],
          ),
        ),
        drawer: const Drawer(
          width:120,
          backgroundColor: Colors.lightBlue,
        ),
      ),
    );
  }
}
