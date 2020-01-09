
import 'package:dogprint/Mascotas.dart';
import 'package:dogprint/Pets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Profile extends StatefulWidget{
  @override
  ProfileState createState()=> ProfileState();
}
class ProfileState extends State<Profile>{
  var pet=new Pets("Peluche",3,"img/c1.jpg","French Poodle");
  final profileImg='img/c1.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:Column(
        children: <Widget>[
          buildHeader(),
          buildOptions(),
          Divider(),
          Text("Mascotas",style: TextStyle(fontSize: 20), textAlign: TextAlign.justify,),
          Expanded(
            child: Mascotas(),
          )
        ],
      ),


    );

  }
  Widget buildHeader(){
    return Container(
      height: MediaQuery.of(context).size.height/3.5,

      child: Column(
      children: <Widget>[
        Container(
          child: Stack(
            overflow: Overflow.visible,
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('img/bck.jpg'),
                        )
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                top:MediaQuery.of(context).size.height / 18,
                child: Container(                  height: 190, width: 190, decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 6),
                    image: DecorationImage(
                      fit: BoxFit.cover,                      image: AssetImage(profileImg),
                    )                  ),                ),
              ),            ],          ),        ),      ],
    ),);


  }

  _launchCaller() async {
    const url = "tel:+593 91219133";
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget buildOptions(){
    return  Container(
        alignment: Alignment.centerLeft,
        height:  MediaQuery.of(context).size.height /7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
          Text('Jordy M', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 28),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(onPressed:_launchCaller,child: Icon(Icons.call),backgroundColor: Colors.green, tooltip: "Llamar a esta persona",),
              FloatingActionButton(child: Icon(Icons.add,),backgroundColor: Colors.green, tooltip: "Agregar una Mascota",),
              FloatingActionButton(child: Icon(Icons.settings),backgroundColor: Colors.green, tooltip: "Ajustes",),
    ],),
          ],
    ),
    );
 }



}