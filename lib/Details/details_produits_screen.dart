import 'package:flutter/material.dart';

class DetailProduits extends StatefulWidget {
  @override
  _DetailProduitsState createState() => _DetailProduitsState();
}

class _DetailProduitsState extends State<DetailProduits> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.lightBlueAccent;
      }
      return Colors.blue;
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Details'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                child: ListTile(
                  title: Image.asset('assets/burger.jpg'),
                  subtitle: Center(
                    child: Text(
                      'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eius iure harum eveniet sint nemo magni voluptatum quia cumque, culpa labore accusamus amet minus corrupti, laborum eum tempora, modi voluptas nulla!ipsum dolor sit, amet consectetur adipisicing elit. Totam error, ',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 60),
              child: Row(
                children: [
                  TextButton(
                    style: new ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith(getColor),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Acheter',
                      style: TextStyle(fontSize: 23, color: Colors.black),
                    ),
                  ),
                  Spacer(),
                  Card(
                    color: Colors.blue,
                    child: Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_shopping_cart_outlined,
                        ),
                        iconSize: 30.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
