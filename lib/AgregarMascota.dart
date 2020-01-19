
import 'package:flutter/material.dart';

class AgregarMascota extends StatefulWidget {

@override
_AgregarMascotaState createState() => _AgregarMascotaState();
}

class _AgregarMascotaState extends State<AgregarMascota> {
  var Especie_Seleccionad="Perros";
  var Raza_Seleccionada="Caniche Toy";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),

      body:buildBody(),



    );
  }

  Widget buildBody() {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow( color: Colors.black54, blurRadius: 1.0)],
          borderRadius: BorderRadius.all(Radius.circular(0)),gradient: LinearGradient(
          begin:Alignment.centerRight,end:Alignment.bottomLeft,
          colors: [Colors.black87,Colors.black54, Colors.black45])
      ),

      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Card(
        elevation: 20 ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 05,
              child:Padding(
                padding: EdgeInsets.fromLTRB(90, 40,90, 90),
                child:FloatingActionButton(
                      heroTag: 4,
                      child: Icon(Icons.add_a_photo),

                 ),
              )
            ),

            buildInputField("Nombre", true),
            buildInputField("Edad", true),
            DropDowEspecie(),
            DropDowRaza(),

          ],
        ),
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
        color: Colors.blue,
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
      value: Especie_Seleccionad,
      icon: Icon(Icons.arrow_downward,color: Colors.green,),
      iconSize: 34,
      elevation: 16,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 18,
      ),
      underline: Container(
        height: 2,
        color: Colors.white70,
      ),
      onChanged: (String newValue) {
        setState(() {
          Especie_Seleccionad = newValue;
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
  Widget buildInputField(String fieldName, bool visible, {bottom = 10.0}) {
    return Container(
//      padding: EdgeInsets.only(left: 20, right: 15),
      child: TextField(
        obscureText: !visible,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: fieldName,
          hintText: fieldName,
          hintStyle: TextStyle(fontSize: 18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: Colors.lightGreen)),

        ),
      ),
      margin: EdgeInsets.fromLTRB(25, 0, 25, bottom),
    );
  }


}
