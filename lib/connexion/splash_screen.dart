import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vente/connexion/inscription_screen.dart';
import 'package:vente/connexion/login_screen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: HexColor("#00BCD4"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 180),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Image.asset('assets/logoS.png'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  'Manger à gogo',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                child: ButtonTheme(
                  buttonColor: Colors.white,
                  minWidth: MediaQuery.of(context).size.width,
                  height: 55,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConnexionButton(),
                        ),
                      );
                    },
                    child: Text(
                      'Se Connecter',
                      style:
                          TextStyle(color: HexColor("#00BCD4"), fontSize: 21),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 55,
                  child: OutlineButton(
                    disabledBorderColor: Colors.red,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InscriptionButton(),
                        ),
                      );
                    },
                    highlightedBorderColor: Colors.redAccent,
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    child: Text(
                      "S'inscrire",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
