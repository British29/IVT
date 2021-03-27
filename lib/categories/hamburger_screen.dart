import 'package:flutter/material.dart';

class HamburgeurCategories extends StatefulWidget {
  @override
  _HamburgeurCategoriesState createState() => _HamburgeurCategoriesState();
}

class _HamburgeurCategoriesState extends State<HamburgeurCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Hamburger'),
        ),
      ),
      body: Container(
        child: Text('Categories Hamburger'),
      ),
    );
  }
}
