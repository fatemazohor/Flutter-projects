
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManagePeople extends StatelessWidget{
  const ManagePeople({super.key});

  List<Map> fetchPeople(){
    return[
      {"first":"Jim", "last":"Halpert"},
      {"first":"Nim", "last":"Salpert"},
      {"first":"Eim", "last":"Dalpert"},
      {"first":"Gim", "last":"Walpert"},
      {"first":"Aim", "last":"Oalpert"},
    ];
  }

  @override
  Widget build(BuildContext context) {
    var _peopleObject = fetchPeople();
    return MaterialApp(
      home: Scaffold(
        body:
        ListView .builder(
          itemCount: _peopleObject.length,
          itemBuilder: (BuildContext context, int index){
            final person = _peopleObject[index];
            return ListTile(
              title: Text('${person["first"]} ${person["last"]}'),
            );
          },// for loop create
        ),
      ),
    );
  }
}