import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Find extends StatefulWidget{
  @override
  FindState createState()=> FindState();
}
class FindState extends State<Find>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
            Expanded(
                child: buildSwiper(),
                flex: 2,
              ),
              Flexible(
                child: Text(
                  "Categorias",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 ),
                ),
              ),
              Flexible(
                child: buildSubcategories(),
                flex: 1,
                fit: FlexFit.tight,
              ),
              Expanded(
                child: Text("contenido"),
              ),
            ]
        ),


    );
  }
  Widget buildSubcategories() {
    return Container(
//      height: MediaQuery.of(context).size.height / 8,
      child: ListView(

        scrollDirection: Axis.horizontal,
        children: <Widget>[
          buildSingleSubcategory(
            imgLocation: "img/log.png",
            imgCaption: "Buscar por Raza",

          ),
          buildSingleSubcategory(
            imgLocation: "img/log.png",
            imgCaption: "Buscar Abandonados",
          ),
          buildSingleSubcategory(
            imgLocation: "img/log.png",
            imgCaption: "Buscar Perdidos",
          ),

        ],
      ),
    );
  }
  Widget buildSingleSubcategory({String imgLocation, String imgCaption}) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        splashColor: Colors.lightBlueAccent,

        onTap: () {},
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 1, 10, 1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                imgLocation,
                scale: 5.5,
                //width: 80,
                height: 80,
              ),
              Text(
                imgCaption,
                textAlign: TextAlign.center,

              )
            ],
          ),
        ),
      ),
    );
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
