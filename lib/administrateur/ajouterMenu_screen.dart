import 'package:flutter/material.dart';

class AjouterMenu extends StatefulWidget {
  @override
  _AjouterMenuState createState() => _AjouterMenuState();
}

class _AjouterMenuState extends State<AjouterMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text('Ajouter Menu'),
        ),
      ),
      body: Container(
        child: Center(
          child: Text('Ajouter Menu'),
        ),
      ),
    );
  }
}
