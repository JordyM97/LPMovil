import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username;
  String password;

  String errorUsernamePassword;
  bool passwordVisibility = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:null,
      body:SafeArea(
        child:    Container(

        child: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow( color: Colors.black54, blurRadius: 0.0)],
              borderRadius: BorderRadius.all(Radius.circular(0)),gradient: LinearGradient(
              begin:Alignment.centerRight,end:Alignment.bottomLeft,
              colors: [Colors.black87,Colors.black54, Colors.black45])),
              child:Container(
                        decoration: BoxDecoration(
                boxShadow: [BoxShadow( color: Colors.white, blurRadius: 10.0)],
                borderRadius: BorderRadius.all(Radius.circular(20)),gradient: LinearGradient(
                begin:Alignment.centerRight,end:Alignment.bottomLeft,
                colors: [Colors.white70,Colors.white54, Colors.white24])),
                  child:Column(

                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            buildLogo(size),
                            Text("DogPrint",style: TextStyle(fontSize: 40),),
                          ],
                        ),
                        buildInputField("Nombre de Usuario", true),
                     buildInputField("Contraseña", passwordVisibility, bottom: 5.0),
                     buildForgotPassword(),
                     buildLoginButton(size),
                     buildSignUpText(size),
            ],
          ),),
        ),
      ),
      )
    );
  }

  Widget buildLogo(Size size) {
    return Container(
      child: Image.asset(
        "img/log.png",
        height: size.height / 4,
        width: size.width / 2,
      ),
//      margin: EdgeInsets.all(20),
    );
  }

  Widget buildInputField(String fieldName, bool visible, {bottom = 20.0}) {
    return Container(
//      padding: EdgeInsets.only(left: 20, right: 15),
      child: TextField(
        obscureText: !visible,
        onChanged: (text) {
          setState(() {
            if (visible)
              this.username = text;
            else
              this.password = text;
          });
        },
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: fieldName,
          hintText: fieldName,
          hintStyle: TextStyle(fontSize: 18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: Colors.lightGreen)),
          errorText: errorUsernamePassword,
          suffixIcon: fieldName == 'Password' ? buildEye(visible) : null,
        ),
      ),
      margin: EdgeInsets.fromLTRB(25, 0, 25, bottom),
    );
  }

  Widget buildLoginButton(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: FlatButton(
        onPressed: ValidarCreedenciales,
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        shape: StadiumBorder(),
        color: Colors.green,
        splashColor: Colors.greenAccent,
        padding: EdgeInsets.fromLTRB(size.width / 3, 15, size.width / 3, 15),
      ),
    );
  }
  ValidarCreedenciales(){
    if(username=="jordy" && password=="123"){
      Navigator.pushNamed(context, '/Home');
    }else{
      return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
            elevation: 20,
            title: Icon(Icons.error_outline,color: Colors.redAccent,),
            content: new Text('Las credenciales no coinciden...'),
      )
      );
    }
  }
  Widget buildSignUpText(Size size) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Todavia no tienes una cuenta? "),
          InkWell(
            child: Text(
              "Registrarse",
              softWrap: true,
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/signUp');
            },
          )
        ],
      ),
    );
  }

  Widget buildEye(bool visible) {
    return IconButton(
        icon: Icon(visible ? Icons.visibility_off : Icons.visibility),
        onPressed: () {
          setState(() {
            passwordVisibility = !passwordVisibility;
          });
        });
  }

  Widget buildForgotPassword() {
    return Container(
      margin: EdgeInsets.only(left: 45),
      child: Align(
          child: InkWell(
            child: Text(
              "¿Olvidaste la contraseña?",
              style: TextStyle(
                color: Color(0xff325da3),
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () => forgotPassword(),
          ),
          alignment: Alignment.centerLeft),
    );
  }

  Future<bool> forgotPassword() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Tranquilo, no pasa nada!'),
        content: new Text('¿Deseas que te enviemos un correo con tu contraseña?'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Si'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
        ],
      ),
    ) ??
        false;
  }

}
