

import 'package:flutter/material.dart';
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
 @override
    void initState() {
      super.initState();
      contador = int.parse(widget.userid);
      getData(contador);
    }

   getData(int userid) async {
    userinfo = await RemoteService().getInfoUser(userid);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: Column(
            children:  <Widget> [
              const CustomAppMenu(),
              Text("Datos Generales"),

              userinfo == null || userinfo!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, int index) {   
                    return 
                       Container(
                                height: 150,
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
                                           Text("Name : "+userinfo![index].name),
                                           Text("Username : "+userinfo![index].userName),
                                           Text("Email : "+userinfo![index].email),
                                           Text("Address :"),
                                           Text("Street : "+userinfo![index].street),
                                           Text("Suite : "+userinfo![index].suite),
                                           Text("City : "+userinfo![index].city),
                                           Text("Zip-Code : "+userinfo![index].zipcode),
                                        ]),
                                  )
                        );
                  }
            ),
            ],
          ),
        ),
        

    );
  }
}
