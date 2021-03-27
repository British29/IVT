import 'package:flutter/material.dart';
import 'package:vente/administrateur/homepageAdmin_screen.dart';
import 'package:vente/connexion/inscription_screen.dart';
import 'package:vente/connexion/login_screen.dart';
import 'package:vente/connexion/splash_screen.dart';
import 'package:vente/contenue/button_navigation_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Pageview(),
      routes: <String, WidgetBuilder>{
        '/homepageAdmin_screen': (BuildContext context) => new HomePageAdmin(),
        '/button_navigation_screen': (BuildContext context) =>
            new ButtonNavigationApp(),
      },
    );
  }
}

class Pageview extends StatefulWidget {
  @override
  _PageviewState createState() => _PageviewState();
}

class _PageviewState extends State<Pageview> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        SplashPage(),
        ConnexionButton(),
        InscriptionButton(),
      ],
    );
  }
}
