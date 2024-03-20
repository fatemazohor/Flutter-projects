import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primary_app/util/route.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    if(_formKey.currentState!.validate()){
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoute.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }// move to home

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
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
                      validator: (value){
                        if(value!.isEmpty){
                          return "User name can't be empty.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Password"),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Password can't be empty.";
                          } else if(value.length<6){
                            return "Password length should be 6 or more.";
                          }
                          return null;
                        },
                      onChanged: (value){
                        this.name=value;
                        //reload UI
                        setState(() {
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: ()=>{
                        moveToHome(context),
                      },// ontap
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 40,
                        width: changeButton? 50 : 150,
                        alignment: Alignment.center,
                        child: changeButton ?
                        Icon(Icons.done, color: Colors.white,
                        ) :
                        Text("Login", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(changeButton ? 50 : 150),
                        ),
                      ),

                    ),
                    // ElevatedButton(
                    //   onPressed: () =>
                    //       {Navigator.pushNamed(context, MyRoute.homeRoute)},
                    //   style: ButtonStyle(
                    //       backgroundColor:
                    //           MaterialStateProperty.all(Colors.lightBlue)),
                    //   child: const Icon(Icons.login),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
