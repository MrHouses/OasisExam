

import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget{
  
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("OasisSocial"),
        elevation: 10.0,
      ),
      body: Center(
          child: Column(
            children: const <Widget> [
              Text("Contador de Clicks",),
              Text("0"),
            ],
          ),
        ),
        floatingActionButton:FloatingActionButton(
          onPressed: () { 
            print("Hola Mundo");
           },
        ),

    );
  }

}