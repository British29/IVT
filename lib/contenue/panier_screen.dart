import 'package:flutter/material.dart';

class PagePanier extends StatefulWidget {
  @override
  _PagePanierState createState() => _PagePanierState();
}

class _PagePanierState extends State<PagePanier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Mon Panier')),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Text('panier'),
      ),
    );
  }
}
