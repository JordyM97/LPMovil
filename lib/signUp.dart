import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String username;
  String password;
  String email;
  String telf;
  final database= Firestore.instance;
  String errorUsernamePassword; // name and password error msg are the same
  String errorEmail;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      body: Center(
        heightFactor: 100,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildLogo(size),
                  Text("DogPrint",style: TextStyle(fontSize: 40),),
                ],
              ),
              buildInputField("Nombre de Usuario", true),
              buildInputField("Contraseña", false),
              buildInputField("Correo Electronico", true),
              buildInputField("Numero de Celular", true),
              buildSignUpButton(size),
              buildLoginText(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLogo(Size size) {
    return Container(
      child: Image.asset(
        "img/log.png",
        height: size.height / 4,
        width: size.width / 3,
      ),
      margin: EdgeInsets.all(20),
    );
  }

  Widget buildInputField(String fieldName, bool visible) {
    return Container(
      child: TextField(
        obscureText: !visible,
        onChanged: (text) {
          setState(() {
            if (fieldName == "Nombre de Usuario")
              this.username = text;
            else if (fieldName == "Contraseña")
              this.password = text;
            else if (fieldName == "Numero de Celular")
              this.telf = text;
          });
        },
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: fieldName,
          hintText: fieldName,
          hintStyle: TextStyle(fontSize: 18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          errorText: fieldName == "Email" ? errorEmail : errorUsernamePassword,
        ),
      ),
      margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
    );
  }

  Widget buildSignUpButton(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: FlatButton(
        onPressed: () {
          createRecord();
          Navigator.pushNamed(context, '/login');
        },
        child: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        shape: StadiumBorder(),
        color: Colors.green,
        splashColor: Colors.greenAccent,
        padding: EdgeInsets.fromLTRB(size.width / 3, 15, size.width / 3, 15),
      ),
    );
  }
  void createRecord() async {
    await database.collection("usuarios")
        .document(username)
        .setData({
      'user': username,
      'pass': password,
      'telf': telf,
    });


  }
  Widget buildLoginText(Size size) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Ya tienes una cuenta?, "),
          InkWell(
            child: Text(
              "Ingresa aqui.",
              style: TextStyle(
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/login');
            },
          )
        ],
      ),
    );
  }
}
