import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class CustomAppPost extends StatelessWidget {
  const CustomAppPost ({Key? key}) : super(key: key);
  
    


  @override
  Widget build(BuildContext context) {
    
    return 
       ListView.separated(
              shrinkWrap: true,
              itemCount: 10,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, int index) {   
                    return 
                       Container(
                                height: 75,
                              child:
                                  Card(
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5), 
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
                        );
                  }
            );
  }
  
  
}