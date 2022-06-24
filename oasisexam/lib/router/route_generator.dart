import 'package:flutter/material.dart';
import 'package:oasisexam/screens/home_screen.dart';
import 'package:oasisexam/screens/user_screen.dart';

class RouteGenerator{
  static Route <dynamic> generateRouter (RouteSettings settings){
    
    switch(settings.name)
    {
      case '/home':
      return 
      _fadeRoute(HomeScreen(),"/home");

      case '/user':
      return 
      _fadeRoute(UserScreen(id: 1,),"/user");

      default: 
       return _fadeRoute(HomeScreen(),"/home");
    }

  }

  static PageRoute _fadeRoute(Widget child, String route_name)
  {
    return PageRouteBuilder(
      pageBuilder: (_,__,___) => child,
      transitionDuration: Duration(microseconds: 200),
      settings: RouteSettings(name:route_name),
      transitionsBuilder: (_,animation,__,___)  => 
      FadeTransition(
        opacity: animation ,
        child: child,
        ),
      
    );
  }

}