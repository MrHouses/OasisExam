

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
    final yourScrollController = ScrollController();

    return  Scaffold(
      resizeToAvoidBottomInset: false,
      
      body: 
      SingleChildScrollView (
        child: Column(
          children: [
          CustomAppMenu(),
          Text("Publicaciones",textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
           posts == null || posts!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scrollbar(
              thickness: 10,
              controller: yourScrollController,
              child: ListView.builder(
                  itemCount: 100,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, int index) {   
                        return 
                           Container(
                                    height: 144,
                                  child:
                                      Card(
                                              elevation: 3.0,
                                              color: Colors.white,
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
            ),
          ],
        ),
      ),
    );


    
  }
  
  
}

