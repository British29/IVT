import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vente/contenue/button_navigation_screen.dart';

class ConnexionButton extends StatefulWidget {
  @override
  _ConnexionButtonState createState() => _ConnexionButtonState();
}

class _ConnexionButtonState extends State<ConnexionButton> {
  bool _obscureText = true;

  TextEditingController email = TextEditingController();
  TextEditingController motDePasse = TextEditingController();

  bool visible = true;

  Future login() async {
    var url = "http://172.27.110.225/vente_test/loginConnexion.php";
    var response = await http.post(url, body: {
      "email": email.text,
      "password": motDePasse.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      print('bon');
      Fluttertoast.showToast(
          msg: "Connexion reussie",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ButtonNavigationApp(),
        ),
      );
    } else {
      print('echec');
      Fluttertoast.showToast(
          msg: "Email ou mot de passe incorrect",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 180,
              ),
              Text(
                'Connectez-vous',
                style: TextStyle(
                    color: HexColor("#00BCD4"),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                child: Container(
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.alternate_email),
                        hintText: 'Votre email'),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                child: Container(
                  child: TextFormField(
                    controller: motDePasse,
                    autofocus: false,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      fillColor: Colors.red,
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Mot de passe',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          semanticLabel: _obscureText ? 'voir' : 'cacher',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: ButtonTheme(
                  buttonColor: HexColor("#00BCD4"),
                  minWidth: MediaQuery.of(context).size.width,
                  height: 55,
                  child: RaisedButton(
                    onPressed: () {
                      login();
                    },
                    child: Text(
                      'Connexion',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 101,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
