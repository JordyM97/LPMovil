
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
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black54,
          child: Column(
            children: <Widget>[
                Expanded(
                  child: buildCard(),
                  flex: 6,
                ),
              ],
          ),
        ),
      ),



    );
  }

  Widget buildCard() {
    return Card(
      elevation: 10,
      margin: EdgeInsets.fromLTRB(20, 60, 20, 60),
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
              flex: 5,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text("${widget.nombre}",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900), ),
                        Divider(thickness:3,indent: 6,endIndent: 6,),
                        buildText("${widget.raza}",Colors.green),
                        buildText("${widget.edad} Años",Colors.green),
                        Divider(thickness:5,indent: 3,endIndent: 3,),
                        GestureDetector(onTap: (()=>{
                            Reportar()
                          }),child: buildText("Reportar como Perdido",Colors.redAccent))
                      ],
                    ),
                  ),
                ],
              ),
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
  Reportar(){
     return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
          elevation: 20,
          title: Icon(Icons.error_outline,color: Colors.redAccent,),
          content: new Text('Desear reportarlo como perdido?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Si"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
    );
  }
  Widget buildText(String texto,Color _color){
    return Container(
      child: Text(texto,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,fontSize: 20)),
      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(15)),
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
