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
      body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(10, (index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  //color: Colors.amberAccent,
                  // decoration: BoxDecoration(
                  //   image: new DecorationImage(image: NetworkImage('https://images.pexels.com/photos/110854/pexels-photo-110854.jpeg'), fit: BoxFit.cover),
                  //   borderRadius: BorderRadius.all(Radius.circular(100))
                  //   ),
                  child: Image.network(
                'https://images.pexels.com/photos/110854/pexels-photo-110854.jpeg',
                fit: BoxFit.cover,
              )
                  // Text(
                  //   'Item $index',
                  //   style: TextStyle(fontSize: 20),
                  // )
                  ),
            );
          })),
    );
  }
}
