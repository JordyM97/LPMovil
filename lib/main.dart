import 'package:dogprint/BNavigationBar.dart';
import 'package:dogprint/home.dart';
import 'package:dogprint/login.dart';
import 'package:dogprint/signUp.dart';
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
      routes: {
        '/signUp': (context) => SignUp(),
        '/login': (context) => Login(),
        '/Home': (context) => BNavigationBar(),
      },

      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


