import 'dart:js_interop_unsafe';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:primary_app/screen/manage_people.dart';

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
                  onPressed: () =>
                  {
                    print("~~~~~~~Delete from home.~~~~~~~~"),
                  },
                  icon: Icon(Icons.delete)),
              ElevatedButton(
                  onPressed: () =>
                  {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                        ManagePeople();
                    ),
                    ),
                  },
                  child: Icon(Icons.safety_check)
              ),
              // Dismissible(background:Container(color: Colors.blueAccent),
              //     secondaryBackground: Container(color: Colors.amber),
              //     onDismissed: (direction){
              //   print("you swipe $direction");
              //     }
              //     ,key: key, child: Text("h")
              // ),
            ],
          ),
        ),
      ),
      initialRoute: "/",
      routes: {
        // MyRoute.ManagePeopeRoute: (context) => const ManagePeople()
        Route.Ma
      },
    );
  }
}
