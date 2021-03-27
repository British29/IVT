import 'package:flutter/material.dart';
import 'package:vente/contenue/accueil_screen.dart';
import 'package:vente/contenue/panier_screen.dart';
import 'package:vente/contenue/profile_screen.dart';

class ButtonNavigationApp extends StatefulWidget {
  @override
  _ButtonNavigationAppState createState() => _ButtonNavigationAppState();
}

class _ButtonNavigationAppState extends State<ButtonNavigationApp> {
  int selectedIndex = 0;
  Widget _myAcceuilApp = AcceuilApp();
  Widget _myPagePanier = PagePanier();
  Widget _myProfilUser = ProfilUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.getBody(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.cyan,
        currentIndex: this.selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 32,
            ),
            title: Text("Accueil"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 32,
            ),
            title: Text("Panier"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 32,
            ),
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
    } else if (this.selectedIndex == 1) {
      return this._myPagePanier;
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
