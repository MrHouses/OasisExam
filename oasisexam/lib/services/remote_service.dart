import 'dart:convert';
import 'package:oasisexam/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:oasisexam/models/user.dart';
class RemoteService{

  // ignore: non_constant_identifier_names
  Future <List<post>?> getposts() async {

    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    final response = await http.get(uri);
    List <post> posts = [];
    if(response.statusCode == 200)
    {

   //print(response.body);
    var uriusers = Uri.parse("https://jsonplaceholder.typicode.com/users");
    final responseusers = await http.get(uriusers);

    String bodyuser =responseusers.body;
    final jsonuser = jsonDecode(bodyuser);
      
    String bodypost =response.body;
    final jsonpost = jsonDecode(bodypost);

      for (var Item in jsonpost) {
        String username = "";
        for (var element in jsonuser) {
          if(Item["userId"] == element["id"])
          {
            username = element["username"];
          }
        }
        post newpost = post(Item["userId"] ,username, Item["id"],Item["title"],Item["body"]);
        posts.add(newpost);
      }

      
       
      return posts;
    } else 
    {
      throw Exception("ErrorEnJson");
    }

  }


  Future <List<user>?> getInfoUser(int id) async {

    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users/"+id.toString());

    final response = await http.get(uri);
    List <user> users = [];
    if(response.statusCode == 200)
    {
    String bodypost ="[" + response.body + "]";
    final jsonpost = jsonDecode(bodypost);

      for (var Item in jsonpost) {
        String username = "";
        user newuser = user(
          Item["id"],
          Item["name"],
          Item["username"],
          Item["email"],
          Item["address"]["street"],
          Item["address"]["suite"],
          Item["address"]["city"],
          Item["address"]["zipcode"],
          Item["phone"],
          Item["website"]
          );
        users.add(newuser);
      }

      
       
      return users;
    } else 
    {
      throw Exception("ErrorEnJson");
    }

  }
 
}