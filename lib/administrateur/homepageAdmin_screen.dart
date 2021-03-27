import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vente/administrateur/ajouterMenu_screen.dart';
import 'package:vente/administrateur/allCommande_screen.dart';
import 'package:vente/main.dart';

class HomePageAdmin extends StatefulWidget {
  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
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
        backgroundColor: Colors.red,
        title: Center(
          child: Text('Administrateur'),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                color: Colors.redAccent,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.add_rounded,
                size: 32,
                color: Colors.black,
              ),
              title: Text(
                'Ajouter un menu',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AjouterMenu(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.restaurant_menu_outlined,
                size: 32,
                color: Colors.black,
              ),
              title: Text(
                'Commandes',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllCommandesClient(),
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
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                _showMyDialog();
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(child: Text('Administrateur')),
      ),
    );
  }
}
