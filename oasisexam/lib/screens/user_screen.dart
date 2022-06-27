

import 'package:flutter/material.dart';
import 'package:oasisexam/models/post.dart';
import 'package:oasisexam/ui/custom_app_menu.dart';

import '../models/user.dart';
import '../services/remote_service.dart';


class UserScreen extends StatefulWidget{
  final String userid ;
  const UserScreen({Key? key , required this.userid }) : super(key: key);
  
  @override
  State<UserScreen> createState() => _UserScreenState();
}


class _UserScreenState extends State<UserScreen> {
  int contador = 0;
  List <user> ? userinfo;
  List <post> ? userpost;
  final yourScrollController = ScrollController();
 @override
    void initState() {
      super.initState();
      contador = int.parse(widget.userid);
      getData(contador);
    }

   getData(int userid) async {
    userinfo = await RemoteService().getInfoUser(userid);
       userpost = await RemoteService().getpostsuser(userid);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    
 
 
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              children:  <Widget> [
                const CustomAppMenu(),
                Text("Datos Generales",textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      
                userinfo == null || userinfo!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : 
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, int index) {   
                                return 
                                   Container(
                                            height: 160,
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
                                                       Text("Name : "+userinfo![index].name,textAlign: TextAlign.center,
                                                            overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                                                       Text("Username : "+userinfo![index].userName,textAlign: TextAlign.center,
                                                            overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                                                       Text("Email : "+userinfo![index].email,textAlign: TextAlign.center,
                                                            overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                                                       Text("Address",textAlign: TextAlign.center,
                                                            overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                                                       Text("Street : "+userinfo![index].street,textAlign: TextAlign.center,
                                                            overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                                                       Text("Suite : "+userinfo![index].suite,textAlign: TextAlign.center,
                                                            overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                                                       Text("City : "+userinfo![index].city,textAlign: TextAlign.center,
                                                            overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                                                       Text("Zip-Code : "+userinfo![index].zipcode,textAlign: TextAlign.center,
                                                            overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                                                    ]),
                                              )
                                    );
                              }
                        ),
                  Text("Publicaciones",textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  Row(
                    children: [
                    
                      Expanded(child: 
                           userpost == null || userpost!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scrollbar(
                thickness: 10,
                controller: yourScrollController,
                child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 4),
        ),
                    itemCount: userpost?.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, int index) {   
                          return 
                             Container(
                                      height: 200,
                                    child:
                                        Card(
                                                elevation: 3.0,
                                                color: Color.fromARGB(255, 21, 115, 146),
                                                shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5), 
                                                
                                                side: BorderSide(
                                                color: Color.fromARGB(255, 155, 229, 251).withOpacity(0.2),
                                                width: 1,
                                              ),
                                            ),
                                            child: Column(
                                              children:  <Widget> [
                                                Text("Titulo : "+userpost![index].title,textAlign: TextAlign.center,
                                                            overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color.fromARGB(255, 255, 255, 255),)),
                                                Text("Publicacion : "+userpost![index].body,textAlign: TextAlign.center,
                                                            overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 15,color: Color.fromARGB(255, 255, 255, 255),)),
                                              ]),
                                        )
                              );
                        }
                  ),
              ),
                      )
                    ],
                  )
              ],
            ),
          ),
      ),
        

    );
  }
}
