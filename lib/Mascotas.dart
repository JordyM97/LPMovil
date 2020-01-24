import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogprint/Listas.dart';
import 'package:dogprint/Mascota.dart';
import 'package:flutter/cupertino.dart';

class Mascotas extends StatefulWidget{
  @override
  MascotasState createState()=> MascotasState();
}
class MascotasState extends State<Mascotas>{
  final database= Firestore.instance;
  final list=[
    {
      "name": "Peluche",
      "raza": "French Poodle",
      "edad": 8,
      "img": "img/d1.jpeg",
      "dueño":"jordy"
    },{
      "name": "Chin Chin",
      "raza": "Caniche Toy",
      "edad": 2,
      "img": "img/b1.jpg",
      "dueño":"jordy"
    },
  ];
  List lista;
  @override
  Widget build(BuildContext context) {
    database.collection("perros").where("dueño", isEqualTo: Listas.username).snapshots()
        .listen((data) => {
          lista=data.documents.toList()
    }
        );
    return GridView.builder(
        itemCount: lista.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Mascota(
            name: lista[index]['name'],
            edad: lista[index]['edad'],
            img: lista[index]['img'],
            raza: lista[index]['raza'],
            );
        });


  }
}