import 'package:flutter/material.dart';

class AllCommandesClient extends StatefulWidget {
  @override
  _AllCommandesClientState createState() => _AllCommandesClientState();
}

class _AllCommandesClientState extends State<AllCommandesClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text('Commandes'),
        ),
      ),
      body: Container(
        child: Center(
          child: Text('commandes'),
        ),
      ),
    );
  }
}
