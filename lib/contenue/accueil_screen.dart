import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vente/main.dart';

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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 33,
            ),
            onPressed: () {},
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
              leading: Icon(Icons.home_outlined),
              title: Text('Accueil'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Mes Infos'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_outlined),
              title: Text('Mon Panier'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Déconnexion'),
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
              height: 10,
            ),
            Text(
              'Categories',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
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
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
