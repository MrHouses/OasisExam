import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CustomAppPost extends StatelessWidget {
  const CustomAppPost ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      Column(
              children :<Widget> [
                Container(
                height: 200,
              child:
                  Card(
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // if you need this
                          side: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: const <Widget> [
                            Text("@USER"),
                            Text("Titulo"),
                            Text("Esta es una publicacion de demostrracion para el examen"),
                        ]),
                  )
                )
                ,
                
            ]);
  }
}