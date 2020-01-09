import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mascota extends StatelessWidget{
  final nombre;
  final raza;
  final edad;
  final img;
  Mascota({
    this.nombre,this.raza,this.edad,this.img});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: nombre,
        child: InkWell(
          onTap: (){},
          child: GridTile(
            child: Image.asset(img),
            footer: Text(edad.toString()+" | " +raza, textAlign: TextAlign.left, style: TextStyle( fontSize: 18,fontStyle: FontStyle.italic )),
            header: Text(nombre, textAlign: TextAlign.center,style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold)),

          ),
        ),
      ),
    );
  }

}