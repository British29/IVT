import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vente/Details/details_produits_screen.dart';
import 'package:vente/categories/chawama_screen.dart';
import 'package:vente/categories/hamburger_screen.dart';
import 'package:vente/categories/pizza_screen.dart';
import 'package:vente/categories/sandwich_screen.dart';
import 'package:vente/contenue/panier_screen.dart';
import 'package:vente/main.dart';

import 'profile_screen.dart';

class AcceuilApp extends StatefulWidget {
  @override
  _AcceuilAppState createState() => _AcceuilAppState();
}

class _AcceuilAppState extends State<AcceuilApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void initState() {
    super.initState();
  }

  void logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyApp(),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Déconnexion'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Voulez vous vraiment vous déconnecter ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Oui',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                logout();
              },
            ),
            TextButton(
              child: Text('Non'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Accueil'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PagePanier(),
                ),
              );
            },
          ),
          Text(
            '$_counter',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search_outlined,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height * 0.07,
                    child: Icon(
                      Icons.person,
                      size: MediaQuery.of(context).size.height * 0.08,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home_outlined,
                size: 32,
                color: Colors.blue,
              ),
              title: Text(
                'Accueil',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AcceuilApp(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                size: 32,
                color: Colors.blue,
              ),
              title: Text(
                'Mes Infos',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilUser(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart_outlined,
                size: 32,
                color: Colors.blue,
              ),
              title: Text(
                'Mon Panier',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PagePanier(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                size: 32,
                color: Colors.red,
              ),
              title: Text(
                'Déconnexion',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                _showMyDialog();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.99,
              child: Carousel(
                dotIncreaseSize: 0.0,
                dotColor: Colors.transparent,
                dotBgColor: Colors.transparent,
                images: [
                  Image.asset('assets/burger.jpg'),
                  Image.asset('assets/pizza.jpg'),
                  Image.asset('assets/sandwich.jpg'),
                  Image.asset('assets/pizza.jpg'),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.99,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: ButtonTheme(
                      buttonColor: Colors.redAccent,
                      child: OutlineButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PizzaCategories(),
                            ),
                          );
                        },
                        highlightedBorderColor: Colors.redAccent,
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                        ),
                        child: Text(
                          'Pizza',
                          style: TextStyle(
                              color: HexColor("#00BCD4"), fontSize: 21),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: ButtonTheme(
                      buttonColor: Colors.white,
                      child: OutlineButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HamburgeurCategories(),
                            ),
                          );
                        },
                        highlightedBorderColor: Colors.cyanAccent,
                        borderSide: BorderSide(
                          color: Colors.cyanAccent,
                        ),
                        child: Text(
                          'Hamburger',
                          style: TextStyle(color: Colors.black, fontSize: 21),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: ButtonTheme(
                      buttonColor: Colors.white,
                      child: OutlineButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChawamaCategories(),
                            ),
                          );
                        },
                        highlightedBorderColor: Colors.cyanAccent,
                        borderSide: BorderSide(
                          color: Colors.yellowAccent,
                        ),
                        child: Text(
                          'Chawama',
                          style: TextStyle(color: Colors.black, fontSize: 21),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: ButtonTheme(
                      buttonColor: Colors.white,
                      child: OutlineButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SandwichCategories(),
                            ),
                          );
                        },
                        highlightedBorderColor: Colors.cyanAccent,
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        child: Text(
                          'Sandwich',
                          style: TextStyle(color: Colors.black, fontSize: 21),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Recommandations',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/burgercopie.jpg',
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                              ),
                              ListTile(
                                title: Text(
                                  'Burger',
                                  style: TextStyle(fontSize: 23),
                                ),
                                trailing: InkWell(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.cyan,
                                    child: Icon(
                                      Icons.add_shopping_cart_outlined,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                  ),
                                  onTap: _incrementCounter,
                                ),
                                subtitle: Center(
                                  child: Text(
                                    '2500',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/burgercopie.jpg',
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                              ),
                              ListTile(
                                title: Text(
                                  'Pizza',
                                  style: TextStyle(fontSize: 23),
                                ),
                                trailing: InkWell(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.cyan,
                                    child: Icon(
                                      Icons.add_shopping_cart_outlined,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                  ),
                                  onTap: _incrementCounter,
                                ),
                                subtitle: Center(
                                  child: Text(
                                    '4500',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/burgercopie.jpg',
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                              ),
                              ListTile(
                                title: Text(
                                  'Burger',
                                  style: TextStyle(fontSize: 23),
                                ),
                                trailing: InkWell(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.cyan,
                                    child: Icon(
                                      Icons.add_shopping_cart_outlined,
                                      color: Colors.black,
                                      size: 35,
                                    ),
                                  ),
                                  onTap: _incrementCounter,
                                ),
                                subtitle: Center(
                                  child: Text(
                                    '3500',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailProduits(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
