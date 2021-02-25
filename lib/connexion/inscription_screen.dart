import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:vente/connexion/login_screen.dart';

class InscriptionButton extends StatefulWidget {
  @override
  _InscriptionButtonState createState() => _InscriptionButtonState();
}

class _InscriptionButtonState extends State<InscriptionButton> {
  String pswd = '';
  String confPswd = '';
  bool _obscureText = true;

  final _keyForm = GlobalKey<FormState>();

  TextEditingController nomPrenom = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController motDePasse = TextEditingController();

  Future envoyer() async {
    if (_keyForm.currentState.validate()) {
      var url = "http://172.27.110.225/vente_test/registerConnexion.php";
      var response = await http.post(url, body: {
        "nom_prenom": nomPrenom.text,
        "email": email.text,
        "telephone": telephone.text,
        "password": motDePasse.text,
      });
      var data = json.decode(response.body);
      if (data == 200) {
        print('mauvais');
      } else {
        print('bon');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConnexionButton(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _keyForm,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Inscription',
                  style: TextStyle(
                      color: HexColor("#00BCD4"),
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: Container(
                    child: TextFormField(
                      controller: nomPrenom,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Ajouter un nom et prenoms';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Nom & Prénoms'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: Container(
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Ajouter une addresse email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.alternate_email_sharp),
                          hintText: 'Adresse Email'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: Container(
                    child: TextFormField(
                      controller: telephone,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Ajouter un numéro';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone_android),
                          hintText: 'Numéro de Telephone'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: Container(
                    child: TextFormField(
                      controller: motDePasse,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_open_outlined),
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
                      validator: (val) =>
                          val.length < 6 ? 'Mot de passe trop court' : null,
                      onChanged: (val) => pswd = val,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: Container(
                    child: TextFormField(
                      autofocus: false,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_open_outlined),
                        hintText: 'répéter le mot de passe',
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
                      onChanged: (val) => confPswd = val,
                      validator: (val) =>
                          confPswd != pswd ? 'Mot de passe pas conforme' : null,
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
                          envoyer();
                        },
                        child: Text(
                          "S'inscrire",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      )),
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
