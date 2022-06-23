

import 'package:flutter/material.dart';
import 'package:oasisexam/ui/custom_app_menu.dart';
import 'package:oasisexam/ui/custom_app_post.dart';

class HomeScreen extends StatefulWidget{
  
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int contador = 0;
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: Column(
            children:  <Widget> [
              const CustomAppMenu(),
              const CustomAppPost(),
              const Text("Contador de Clicks te",),
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