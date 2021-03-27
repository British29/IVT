import 'package:flutter/material.dart';

class SandwichCategories extends StatefulWidget {
  @override
  _SandwichCategoriesState createState() => _SandwichCategoriesState();
}

class _SandwichCategoriesState extends State<SandwichCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Sandwich'),
        ),
      ),
      body: Container(
        child: Center(
          child: Text('Sandwich'),
        ),
      ),
    );
  }
}
