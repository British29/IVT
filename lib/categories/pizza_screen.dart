import 'package:flutter/material.dart';

class PizzaCategories extends StatefulWidget {
  @override
  _PizzaCategoriesState createState() => _PizzaCategoriesState();
}

class _PizzaCategoriesState extends State<PizzaCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Pizza'),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            10,
            (index) {
              return Card(
                elevation: 5,
                child: ListView(
                  children: [
                    Image.asset(
                      'assets/burgercopie.jpg',
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    ListTile(
                      title: Text(
                        'Burger',
                        style: TextStyle(fontSize: 24),
                      ),
                      trailing: InkWell(
                        child: CircleAvatar(
                          backgroundColor: Colors.cyan,
                          child: Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.black,
                            size: 37,
                          ),
                        ),
                      ),
                      subtitle: Center(
                        child: Text(
                          '3500',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
