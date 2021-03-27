import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vente/main.dart';

class ProfilUser extends StatefulWidget {
  @override
  _ProfilUserState createState() => _ProfilUserState();
}

class _ProfilUserState extends State<ProfilUser> {
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
        title: Center(child: Text('Profile')),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              radius: MediaQuery.of(context).size.height * 0.07,
              child: Icon(
                Icons.person,
                size: MediaQuery.of(context).size.height * 0.08,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              padding: EdgeInsets.only(
                top: 1,
                right: 5,
                left: 5,
              ),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Nom',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      '',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ListTile(
                      leading: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                        ),
                      ),
                      title: Center(
                        child: Text(
                          '',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ListTile(
                      leading: Text(
                        'Telephone',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                        ),
                      ),
                      title: Center(
                        child: Text(
                          '',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              width: double.infinity,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Card(
                elevation: 2,
                child: Container(
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.article_outlined,
                                size: 30,
                              ),
                            ),
                            title: Text(
                              'à propos de nous',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      InkWell(
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.policy_outlined,
                                size: 30,
                              ),
                            ),
                            title: Text(
                              "Politique de confidentialité",
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      InkWell(
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.book_rounded,
                                size: 30,
                              ),
                            ),
                            title: Text(
                              'Termes et Conditions',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      InkWell(
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.logout,
                                size: 30,
                              ),
                            ),
                            title: Text(
                              'Deconnexion',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          _showMyDialog();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
