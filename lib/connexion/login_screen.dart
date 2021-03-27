import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';

class ConnexionButton extends StatefulWidget {
  @override
  _ConnexionButtonState createState() => _ConnexionButtonState();
}

class _ConnexionButtonState extends State<ConnexionButton> {
  bool _obscureText = true;

  TextEditingController email = TextEditingController();
  TextEditingController motDePasse = TextEditingController();

  bool visible = true;
  final _keyForm = GlobalKey<FormState>();

  String message = '';

  Future login() async {
    if (_keyForm.currentState.validate()) {
      final reponse = await http
          .post("http://172.25.76.81/vente_test/loginConnexion.php", body: {
        "email": email.text,
        "password": motDePasse.text,
      });

      var datauser = json.decode(reponse.body);

      if (datauser.length == 0) {
        setState(() {
          message = "email ou mot de passe incorrect";
        });
      } else {
        if (datauser[0]['role'] == 'admin') {
          Navigator.pushReplacementNamed(context, '/homepageAdmin_screen');
        } else if (datauser[0]['role'] == 'client') {
          Navigator.pushReplacementNamed(context, '/button_navigation_screen');
        }
        setState(() {
          datauser = datauser[0]['email'];
        });
      }
      return datauser;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _keyForm,
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
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Ce champs est vide';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Ce champ est vide';
                        }
                        return null;
                      },
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
                  height: 10,
                ),
                Text(
                  message,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 101,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
