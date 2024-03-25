
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Style extends StatefulWidget {
  const Style({super.key});

  @override
  State<Style> createState() => _StyleState();
}

class _StyleState extends State<Style> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Style",
      home: Scaffold(
        body:Center(
          child: Column(
            children: <Widget>[
              Text("style")
            ],

          ),
        ) ,
      ),
    );
  }
}
