import 'package:flutter/material.dart';

class Date extends StatefulWidget{
  @override
  DateState createState()=> DateState();
}
class DateState extends State<Date>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: new ListView(
          children: <Widget>[
            buildHeader(),
          ], ),
    );
  }
  Widget buildHeader(){
    return Column(
      children: <Widget>[
        Container(
            height: 200, decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('img/dateb.jpg'),
              )
          ),
        ),
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Dating', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 28 ),)
            ],
          ),
        )
      ],

    );
  }
  Widget buildDates(){
    return ListView(
      children: <Widget>[
        buildCard(),
      ],
    );
  }
  Widget buildCard(){

    return Container(
      width: 300,

      child: Column(
        children: <Widget>[
          Text("Cita 1"),
        ],
      ),
    );
  }
}

