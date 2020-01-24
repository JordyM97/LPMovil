
import 'package:dogprint/Listas.dart';
import 'package:dogprint/Mascotas.dart';
import 'package:dogprint/User.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class Profile extends StatefulWidget{
  String user;
  Profile({Key key, @required this.user}) : super(key: key);
  @override
  ProfileState createState()=> ProfileState();
}
class ProfileState extends State<Profile>{


  final profileImg='img/c1.jpg';
  @override
  Widget build(BuildContext context) {
    print(widget.user);

    return Scaffold(
      appBar: null,
      body:Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow( color: Colors.black54, blurRadius: 0.0)],
            borderRadius: BorderRadius.all(Radius.circular(0)),gradient: LinearGradient(
            begin:Alignment.centerRight,end:Alignment.bottomLeft,
            colors: [Colors.black87,Colors.black54, Colors.black45])
        ),
        child: Column(
          children: <Widget>[
            buildHeader(),
            buildOptions(),
            Divider(),
            Text("Mascotas",style: TextStyle(fontSize: 20,color: Colors.white,), textAlign: TextAlign.justify,),
            Expanded(
              child: Container(
                child: Mascotas(),
              ),
            )
          ],
        ),
      )


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
                //children: <Widget>[
                 // Flexible(
                  //  child: Container(
                   //   height: MediaQuery.of(context).size.height / 5,         decoration: BoxDecoration(
                    //      image: DecorationImage(                    fit: BoxFit.cover,      image: AssetImage('img/bck.jpg'),
                    //      )),),)],
          ),
              Positioned(
                top:MediaQuery.of(context).size.height / 18,
                child: Container(                  height: 190, width: 190, decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 6),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
          Text(Listas.username, style: TextStyle(fontWeight: FontWeight.bold , fontSize: 28,color: Colors.white),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(heroTag: '1',onPressed:_launchCaller,child: Icon(Icons.call),backgroundColor: Colors.green, tooltip: "Llamar a esta persona",),
              FloatingActionButton(heroTag: '2',onPressed:_agregarMascota,child: Icon(Icons.add,),backgroundColor: Colors.green, tooltip: "Agregar una Mascota",),
              FloatingActionButton(heroTag: '3',onPressed: _showSettings,child: Icon(Icons.settings),backgroundColor: Colors.green, tooltip: "Ajustes",),
    ],),
          ],
    ),
    );
 }void _showSettings(){
    showModalBottomSheet(context: context, builder: (context){
      return Container(
          color: Color(0xFF737373),
          height: 80,
          child: Container(
            child: _options(),
            decoration: BoxDecoration(
            color: Theme.of(context).canvasColor, borderRadius: BorderRadius.only(topLeft: const Radius.circular(10) ,topRight: const Radius.circular(10) )
        ),
      ));
    });
  }
  Column _options(){
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.close),
          title: Text("Salir"),
          onTap: ()=>{
            Navigator.pushNamed(context, '/login'),
          },
        ),

      ],
    );
  }
    _agregarMascota(){
        Navigator.pushNamed(context, '/Agregar');
  }


}