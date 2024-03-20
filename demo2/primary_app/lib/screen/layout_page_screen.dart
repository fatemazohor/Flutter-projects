import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primary_app/screen/home_screen.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // browser tab site name
      title: "LayoutPage",
      home: Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.menu),
            tooltip: "Search",
            onPressed: null,
          ),
          title: const Center(
            child: Text("Layout Page"),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("Main layout screen"),
              Image.asset("assets/images/logo_mychat.png",
                  width: 120, height: 120, fit: BoxFit.cover),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(hintText: "User Name"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Password"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Home()))
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.lightBlue)
                      ),
                      child: const Icon(Icons.login),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(),
      ),
    );
  }
}
