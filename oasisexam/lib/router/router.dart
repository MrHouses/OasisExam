import 'package:fluro/fluro.dart';
import 'package:oasisexam/screens/home_screen.dart';
import 'package:oasisexam/screens/user_screen.dart';

class Flurorouter{
  static final FluroRouter router = FluroRouter();

  static final Handler _counterHandrel = Handler(
    handlerFunc: (context,params) => HomeScreen()
    );

  static final Handler _counterHome = Handler(
    handlerFunc: (context,params) => HomeScreen()
    );

static final Handler _counterUser = Handler(
    handlerFunc: (context,params) { 
      print(params['userid']?[0]);
      return UserScreen(userid: params['userid']?[0] ?? '1');}
    );
  static void configureRoutes(){

    router.define(
      '/',
      handler: _counterHandrel,
      transitionType: TransitionType.none
    );

    router.define(
      '/home',
      handler: _counterHome,
      transitionType: TransitionType.none
    );

      router.define(
      '/user/:userid',
      handler: _counterUser,
      transitionType: TransitionType.none
    );

    router.define(
      '/user',
      handler: _counterUser,
      transitionType: TransitionType.none
    );


  }

  
}