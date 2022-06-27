import 'package:flutter/material.dart';
import 'package:oasisexam/router/router.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oasis Social',
      initialRoute: '/home',
      onGenerateRoute: Flurorouter.router.generator
    );
  }
} 