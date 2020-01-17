
import 'package:flutter/material.dart';

class DetallesMascota extends StatefulWidget {
final nombre;
final raza;
final edad;
final img;

DetallesMascota(
    {this.nombre,
      this.img,
      this.raza,
      this.edad});

@override
_DetallesMascotaState createState() => _DetallesMascotaState();
}

class _DetallesMascotaState extends State<DetallesMascota> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),

      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: buildCard(),
              flex: 6,
            ),
            Expanded(
              flex: 4,
              child: buildDescription(),
            ),
          ],
        ),
      ),



    );
  }

  Widget buildCard() {
    return Card(
      elevation: 10,
      margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
//        width: MediaQuery.of(context).size.width -50,
//        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Image.asset(
                  widget.img,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width - 80,
                ),
                padding: EdgeInsets.all(20),
              ),
              flex: 7,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text("${widget.raza}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white)),
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                              color: Color(0xff36004f),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }


  Widget buildProduct() {
    return Container(
      height: 200.0,
      child: GridTile(
        child: Container(
          color: Colors.white,
          child: Image.asset(
            widget.img,
            fit: BoxFit.fitHeight,
          ),
        ),
        footer: Container(
          color: Colors.white,
          child: ListTile(
            leading: Text(widget.nombre,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
            title: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "\$${widget.raza}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
                Expanded(
                  child: Text("\$${widget.edad}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.w800, color: Colors.red)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget buildDescription() {
    return ListTile(
      title: Text("${widget.nombre}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
      subtitle: Text("\n\n${widget.edad} Años"),
    );
  }
}
