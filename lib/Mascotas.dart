import 'package:dogprint/Mascota.dart';
import 'package:flutter/cupertino.dart';

class Mascotas extends StatefulWidget{
  @override
  MascotasState createState()=> MascotasState();
}
class MascotasState extends State<Mascotas>{
  final list=[
    {
      "name": "Peluche",
      "raza": "French Poodle",
      "edad": 8,
      "img": "img/d1.jpeg"
    },{
      "name": "Chin Chin",
      "raza": "Caniche Toy",
      "edad": 2,
      "img": "img/b1.jpg"
    },{
      "name": "Firulais",
      "raza": "Pastor Aleman",
      "edad": 4,
      "img": "img/p1.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Mascota(
            name: list[index]['name'],
            edad: list[index]['edad'],
            img: list[index]['img'],
            raza: list[index]['raza'],
            );
        });


  }
}