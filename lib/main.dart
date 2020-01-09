import 'package:dogprint/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DogPrint',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),

      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


