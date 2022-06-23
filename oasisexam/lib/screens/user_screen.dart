

import 'package:flutter/material.dart';
import 'package:oasisexam/ui/custom_app_menu.dart';


class UserScreen extends StatefulWidget{
  
  const UserScreen({Key? key}) : super(key: key);
  
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int contador = 0;
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: Column(
            children:  <Widget> [
              const CustomAppMenu(),
              const Spacer(),
              const Text("Contador de Clicks user",),
              Text("$contador"),
              TextButton(
                  onPressed: () { 
                          setState(() {
                  contador++;
              });
           }, child: Padding(padding: const EdgeInsets.all(10.0),
           child: Text("Incrementar"),),
        ),
            ],
          ),
        ),
        

    );
  }
}