import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vente/contenue/panier_screen.dart';
import 'package:vente/main.dart';

import 'profile_screen.dart';

class AcceuilApp extends StatefulWidget {
  @override
  _AcceuilAppState createState() => _AcceuilAppState();
}

class _AcceuilAppState extends State<AcceuilApp> {
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
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Déconnexion'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Text('This is a demo alert dialog.'),
                Text('Voulez vous vraiment vous déconnecter ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Oui'),
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
        title: Center(child: Text('Accueil')),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 33,
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
          IconButton(
            icon: Icon(
              Icons.search_outlined,
              color: Colors.white,
              size: 33,
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
              child: Text(''),
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                        fontSize: 25,
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
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: ButtonTheme(
                      buttonColor: Colors.redAccent,
                      child: OutlineButton(
                        onPressed: () {},
                        highlightedBorderColor: Colors.redAccent,
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                        ),
                        child: Text(
                          'Chanter',
                          style: TextStyle(
                              color: HexColor("#00BCD4"), fontSize: 21),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: ButtonTheme(
                      buttonColor: Colors.white,
                      child: OutlineButton(
                        onPressed: () {},
                        highlightedBorderColor: Colors.cyanAccent,
                        borderSide: BorderSide(
                          color: Colors.cyanAccent,
                        ),
                        child: Text(
                          'Manger',
                          style: TextStyle(color: Colors.black, fontSize: 21),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: ButtonTheme(
                      buttonColor: Colors.white,
                      child: OutlineButton(
                        onPressed: () {},
                        highlightedBorderColor: Colors.cyanAccent,
                        borderSide: BorderSide(
                          color: Colors.yellowAccent,
                        ),
                        child: Text(
                          'Danser',
                          style: TextStyle(color: Colors.black, fontSize: 21),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: ButtonTheme(
                      buttonColor: Colors.white,
                      child: OutlineButton(
                        onPressed: () {},
                        highlightedBorderColor: Colors.cyanAccent,
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        child: Text(
                          'Boire',
                          style: TextStyle(color: Colors.black, fontSize: 21),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 10, right: 10),
                    child: ButtonTheme(
                      buttonColor: Colors.white,
                      child: OutlineButton(
                        onPressed: () {},
                        highlightedBorderColor: Colors.cyanAccent,
                        borderSide: BorderSide(
                          color: Colors.greenAccent,
                        ),
                        child: Text(
                          'Regarder',
                          style: TextStyle(color: Colors.black, fontSize: 21),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      left: 10,
                    ),
                    child: ButtonTheme(
                      buttonColor: Colors.white,
                      child: OutlineButton(
                        onPressed: () {},
                        highlightedBorderColor: Colors.cyanAccent,
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                        child: Text(
                          'Amuser',
                          style: TextStyle(color: Colors.black, fontSize: 21),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.99,
              child: Carousel(
                images: [
                  Image.asset('assets/burger.jpg'),
                  Image.asset('assets/pizza.jpg'),
                  Image.asset('assets/sandwich.jpg'),
                  Image.asset('assets/pizza.jpg'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Vos Commandes",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Card(
                    elevation: 8,
                    child: ListView(
                      
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
