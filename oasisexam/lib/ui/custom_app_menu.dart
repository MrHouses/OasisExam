import 'package:flutter/material.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      width: double.infinity,      
      color: Colors.white,
      child: Row(
        children: [
          TextButton(

                  onPressed: () { 
                       Navigator.pushNamed(( context), '/home');
           }, child: Padding(padding: const EdgeInsets.all(10.0),
           child: Text("Home"),),
        ),

      ]),
    );
  }
}