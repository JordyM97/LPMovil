import 'package:dogprint/Listas.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Find extends StatefulWidget{
  @override
  FindState createState()=> FindState();
}
class FindState extends State<Find>{
    String raza_Seleccionada;
    String especie_Seleccionado= "Perros";
    String busqueda_Seleccionado="Raza";
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: null,
        body: Container(
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 0.0)],
                borderRadius: BorderRadius.all(Radius.circular(0)),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft, end: Alignment.bottomRight,
                    colors: [Colors.black87, Colors.black54, Colors.black45])
            ),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  buildHeader(),
                  buildFilters(),
                  Expanded(
                    child:buildFeed(),
                  )
                ],
              ),
            )


        ),
      );
  }
    Widget buildHeader() {
      return Column(
          children: <Widget>[
            // Container(
            //   height: 180, decoration: BoxDecoration(
            //   image: DecorationImage(                fit: BoxFit.fill, image: AssetImage('img/dateb.jpg'), )), ),

            Row(

              children: <Widget>[
                Icon(Icons.pets, size: 30,
                  color: Colors.green,
                  semanticLabel: "hola",),
                Text('Find', style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 48,
                    color: Colors.white),),
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/5),
                  child: dropDowBusqueda(),

                  ),
              ],

            )
          ]
      );
    }
    Widget buildFilters() {
      return Padding(
        padding: EdgeInsets.fromLTRB(5, 20, 20, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            dropDowEspecie(),
            dropDowRaza(),


          ],
        ),

      );
    }

    Widget dropDowRaza() {
      return DropdownButton<String>(
        value: raza_Seleccionada,
        icon: Icon(Icons.arrow_downward, color: Colors.green,),
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
            raza_Seleccionada = newValue;
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
    Widget dropDowEspecie() {
      return DropdownButton<String>(
        hint: Text("Perro"),
        value: especie_Seleccionado,
        icon: Icon(Icons.arrow_downward, color: Colors.green,),
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
            especie_Seleccionado = newValue;
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
    Widget dropDowBusqueda() {
      return DropdownButton<String>(
        value: busqueda_Seleccionado,
        icon: Icon(Icons.pets, color: Colors.green,),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(
          color: Colors.green,
          fontSize: 18,
        ),
        underline: Container(
          height: 3,
          color: Colors.white,
        ),
        onChanged: (String newValue) {
          setState(() {
            busqueda_Seleccionado = newValue;
          });
        },
        items: <String>['Raza', 'Abandonados', 'Perdidos']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        })
            .toList(),
      );
    }
    Widget buildFeed() {
      PageController controller = PageController(
          viewportFraction: 0.9, initialPage: 1);
      List<Widget> dates = new List<Widget>();
      List list = Listas().list;
      for (int i = 0; i < list.length; i++) {
        if (list[i]["especie"] == especie_Seleccionado) {
          var carta = Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [                         BoxShadow(color: Colors.black38, blurRadius: 5.0)                        ]
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius
                                      .circular(40), color: Colors.green,

                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white, blurRadius: 10)
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
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery.of(context).size.height/2,
        child: PageView(
          controller: controller,
          scrollDirection: Axis.vertical,
          children: dates,
        ),
      );
    }
  }
    _launchCaller() async {
      var url = "tel:+593 91219133";
      if (await UrlLauncher.canLaunch(url)) {
        await UrlLauncher.launch(url);
      } else {
        throw 'Could not launch $url';
      }

  Widget buildSwiper() {
    List<String> imgs = [
      'img/d1.jpeg',
      'img/f1.jpg',
      'img/p1.jpg',
      'img/b1.jpg',
    ];

    return Swiper(
      outer: false,
      itemBuilder: (context, i) {
        return Image.asset(imgs[i], fit: BoxFit.fill,);
      },
      autoplay: true,
      duration: 300,
      pagination: new SwiperPagination(margin: new EdgeInsets.all(5.0)),
      itemCount: imgs.length,
    );
  }
  Widget buildImgCarousel() {
    return Container(
      child: new Carousel(
        boxFit: BoxFit.contain,
        images: [
          AssetImage('img/d1.jpeg'),
          AssetImage('img/f1.jpg'),
          AssetImage('img/p1.jpg'),
          AssetImage('img/b1.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 2.0,
        indicatorBgPadding: 5.0,
        // dotColor: Colors.blue,
      ),
    );
  }
}
