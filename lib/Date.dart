
import 'package:dogprint/Listas.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
class Date extends StatefulWidget{
  @override
  DateState createState()=> DateState();
}
class DateState extends State<Date>{
  String Raza_Seleccionada;
  String Especie_Seleccionado="Perros";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow( color: Colors.black54, blurRadius: 0.0)],
              borderRadius: BorderRadius.all(Radius.circular(0)),gradient: LinearGradient(
              begin:Alignment.centerLeft,end:Alignment.bottomRight,
              colors: [Colors.black87,Colors.black54, Colors.black45])
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                buildHeader(),
                buildFilters(),
                buildDates(),
              ],
            ),
          )


      ),
    );
  }
  Widget buildHeader(){
    return Column(
      children: <Widget>[
       // Container(
         //   height: 180, decoration: BoxDecoration(
           //   image: DecorationImage(                fit: BoxFit.fill, image: AssetImage('img/dateb.jpg'), )), ),

            Row(

              children: <Widget>[
                Icon(Icons.favorite,size: 30,color: Colors.green,semanticLabel:"hola",),
                Text('Dating', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 48,color: Colors.white ),)
              ],

        )
      ]
    );
  }
  Widget buildFilters(){
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 20, 20, 90),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          DropDowEspecie(),
          DropDowRaza(),


        ],
      ),

    );
  }
  Widget DropDowRaza(){
    return DropdownButton<String>(
      value: Raza_Seleccionada,
      icon: Icon(Icons.arrow_downward,color: Colors.green,),
      iconSize: 34,
      elevation: 16,
      style: TextStyle(
          color: Colors.green,
          fontSize: 18,
      ),
      underline: Container(
        height: 2,
        color: Colors.white70,
      ),
      onChanged: (String newValue) {
        setState(() {
          Raza_Seleccionada = newValue;
        });
      },
      items: <String>['Caniche Toy', 'Pastor Alemnan', 'Poodle']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
          .toList(),
    );
  }
  Widget DropDowEspecie(){
    return DropdownButton<String>(
      hint: Text("Perro"),
      value: Especie_Seleccionado,
      icon: Icon(Icons.arrow_downward,color: Colors.green,),
      iconSize: 34,
      elevation: 16,
      style: TextStyle(
        color: Colors.green,
        fontSize: 18,
      ),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (String newValue) {
        setState(() {
          Especie_Seleccionado = newValue;
        });
      },
      items: <String>['Perros', 'Gatos']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      })
          .toList(),
    );
  }
  Widget buildDates(){
    PageController controller= PageController(viewportFraction: 0.9,initialPage: 1);
    List<Widget> dates= new List<Widget>();
    List list=Listas().list;
    for(int i=0;i<list.length;i++){
      if(list[i]["especie"]==Especie_Seleccionado) {
        var carta = Padding(
          padding: EdgeInsets.all(5),
          child: Container(

            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(color: Colors.black38, blurRadius: 5.0)
                      ]
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.network(
                    list[i]["img"],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black]
                      )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(list[i]["name"], style: TextStyle(fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),),
                      Text(list[i]["edad"].toString() + " Años",
                        style: TextStyle(fontSize: 20, color: Colors.white),),


                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(bottom: 10, right: 20),
                        child: Text(list[i]["dueño"],
                          style: TextStyle(fontSize: 25, color: Colors.white),
                          textAlign: TextAlign.center,),
                      ),
                      GestureDetector(onTap: _launchCaller,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            decoration: BoxDecoration(borderRadius: BorderRadius
                                .circular(40), color: Colors.green,

                                boxShadow: [
                                  BoxShadow(color: Colors.white, blurRadius: 10)
                                ]),
                            child: Icon(Icons.call, color: Colors.white,
                              size: 50,),
                          )
                      ),

                    ],
                  ),
                ),


              ],
            ),
          ),
        );
        dates.add(carta);
      }
    }


    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/2,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
         children: dates ,
      ),
    );
  }
  _launchCaller() async {
    var url = "tel:+593 91219133";
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

