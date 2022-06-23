import 'package:flutter/material.dart';
import 'package:oasisexam/router/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oasis Social',
      initialRoute: '/home',
      onGenerateRoute: RouteGenerator.generateRouter,
    );
  }
} 