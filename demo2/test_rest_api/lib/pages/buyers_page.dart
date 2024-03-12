import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyerPage extends StatelessWidget{
  const BuyerPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Text("Buyers"),

     ),
      body: const Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Buyer data")
            ],
        ),
      ),
    );
  }


}