import 'package:flutter/material.dart';
import 'package:vente/contenue/accueil_screen.dart';
import 'package:vente/contenue/profile_screen.dart';

class ButtonNavigationApp extends StatefulWidget {
  @override
  _ButtonNavigationAppState createState() => _ButtonNavigationAppState();
}

class _ButtonNavigationAppState extends State<ButtonNavigationApp> {
  int selectedIndex = 0;
  Widget _myAcceuilApp = AcceuilApp();
  Widget _myProfilUser = ProfilUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this.selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Accueil"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text("Panier"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          )
        ],
        onTap: (int index) {
          this.onTapHandler(index);
        },
      ),
    );
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this._myAcceuilApp;
    } else {
      return this._myProfilUser;
    }
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
