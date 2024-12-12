import 'package:flutter/material.dart';
import 'viewAuteur/AuteurListView.dart';
import 'viewLivre/LivreListView.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Par défaut, on affiche la vue des auteurs
  Widget _currentView = AuteurListView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bibliothèque Numérique'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Gestion des Auteurs'),
              onTap: () {
                setState(() {
                  _currentView = AuteurListView();
                });
                Navigator.pop(context); // Ferme le drawer après la sélection
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Gestion des Livres'),
              onTap: () {
                setState(() {
                  _currentView = LivreListView();
                });
                Navigator.pop(context); // Ferme le drawer après la sélection
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Déconnexion'),
              onTap: () {
                // Déconnectez l'utilisateur
                Navigator.pop(context); // Ferme le drawer après la sélection
              },
            )
          ],
        ),
      ),
      body: _currentView,
    );
  }
}