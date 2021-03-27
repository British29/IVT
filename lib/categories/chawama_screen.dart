import 'package:flutter/material.dart';

class ChawamaCategories extends StatefulWidget {
  @override
  _ChawamaCategoriesState createState() => _ChawamaCategoriesState();
}

class _ChawamaCategoriesState extends State<ChawamaCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Chawama'),
        ),
      ),
      body: Container(
        child: Center(
          child: Text('Chawama'),
        ),
      ),
    );
  }
}
