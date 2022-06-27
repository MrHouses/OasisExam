

import 'package:flutter/material.dart';
import 'package:oasisexam/screens/user_screen.dart';
import 'package:oasisexam/services/remote_service.dart';
import 'package:oasisexam/ui/custom_app_menu.dart';


import '../models/post.dart';

class HomeScreen extends StatefulWidget{
  
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
List <post> ? posts;

  @override
    void initState() {
      super.initState();
      getData();
    }

  getData() async {
    posts = await RemoteService().getposts();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }



  @override
  Widget build(BuildContext context) {
       
    int Usuario = 0;

    return  Scaffold(
      body: 
      Column(
        children: [
        const CustomAppMenu(),
        Text("Publicaciones"),
         posts == null || posts!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, int index) {   
                    return 
                       Container(
                                height: 120,
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
                                        children:  <Widget> [

                                           TextButton(
                                                style: TextButton.styleFrom(
                                                  padding: const EdgeInsets.all(16.0),
                                                  primary: Colors.blue,
                                                  textStyle: const TextStyle(fontSize: 20),
                                                ),
                                                onPressed: () {
                                                    Usuario= posts![index].userId;
                                                     Navigator.pushNamed(( context), '/user/'+Usuario.toString());
                                                },
                                                child: Text("Usuario : "+posts![index].userName),
                                          ),
                                           Text("Titulo : "+posts![index].title),
                                           Text("Publicacion : "+posts![index].body),
                                        ]),
                                  )
                        );
                  }
            ),
        ],
      ),
    );


    
  }
  
  
}

