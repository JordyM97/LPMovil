
import 'package:dogprint/Date.dart';
import 'package:dogprint/Find.dart';
import 'package:dogprint/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BNavigationBar extends StatefulWidget{
  String user;
  BNavigationBar({Key key, @required this.user}) : super(key: key);
  @override
  _BNavigationBat createState()=> _BNavigationBat();
}
class _BNavigationBat extends State<BNavigationBar>{

  int _currentIndex=2;

  final List<Widget> _children=[
    Date(), Find(), Profile(),
  ];
  void onTappedBar(int index){
    setState(() {

      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.green,


          onTap: onTappedBar,
          currentIndex:_currentIndex,
          items:[
            BottomNavigationBarItem(
                icon: new Icon(Icons.favorite,),
                title: new Text('Date',style: TextStyle(color: Colors.white),)),
            BottomNavigationBarItem(
                icon: new Icon(Icons.pets,),
                title: new Text('Find',style: TextStyle(color: Colors.white),)),
            BottomNavigationBarItem(
                icon: new Icon(Icons.person_outline),
                title: new Text('Profile',style: TextStyle(color: Colors.white),)),
          ]
      ),
    );
  }
}