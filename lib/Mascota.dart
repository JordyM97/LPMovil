import 'package:dogprint/DetallesMascota.dart';
import 'package:flutter/material.dart';

class Mascota extends StatelessWidget{
  final name;
  final raza;
  final edad;
  final img;

  Mascota({
    this.name,this.raza,this.edad,this.img});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: buildCard(context),
      onTap: ()=> Navigator.push(context, new MaterialPageRoute(
          builder: (context)=> DetallesMascota(
            nombre:this.name,
            raza:this.raza,
            edad:this.edad,
            img:this.img,
    ))),
    );
  }
  Widget buildCard(BuildContext context) {
    return Card(

        child: Hero(
          tag: name,
          child: Material(

            child:InkWell(


              child: GridTile(
                child: Image.asset(img),
                footer: Text(edad.toString()+" | " +raza, textAlign: TextAlign.left, style: TextStyle( fontSize: 18,fontStyle: FontStyle.italic )),
                header: Text(name, textAlign: TextAlign.center,style: TextStyle( fontSize: 22, fontWeight: FontWeight.bold)),

              ),
            ),
          ),
        )
    );
  }
}



