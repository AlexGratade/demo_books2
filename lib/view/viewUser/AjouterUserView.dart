import 'package:flutter/material.dart';

class AjouterUserView extends StatefulWidget {
  @override
  _AjouterUserViewState createState() => _AjouterUserViewState();
}

class _AjouterUserViewState extends State<AjouterUserView> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _mdpController = TextEditingController();
  String _role = 'Utilisateur';

  void _ajouterUtilisateur() {
    final nom = _nomController.text;
    final prenom = _prenomController.text;
    final login = _loginController.text;
    final mdp = _mdpController.text;

    if (nom.isEmpty || prenom.isEmpty || login.isEmpty || mdp.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
      return;
    }

    // Appeler la méthode pour ajouter l'utilisateur à la base de données
    print('Utilisateur ajouté : $nom $prenom ($login, $_role)');

    // Réinitialiser les champs
    _nomController.clear();
    _prenomController.clear();
    _loginController.clear();
    _mdpController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Utilisateur ajouté avec succès')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ajouter un utilisateur')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          TextField(
          controller: _nomController,
          decoration: InputDecoration(labelText: 'Nom'),
        ),
        TextField(
          controller: _prenomController,
          decoration: InputDecoration(labelText: 'Prénom'),
        ),
        TextField(
          controller: _loginController,
          decoration: InputDecoration(labelText: 'Identifiant'),
        ),
        TextField(
          controller: _mdpController,
          decoration: InputDecoration(labelText: 'Mot de passe'),
          obscureText: true,
        ),
        DropdownButton<String>(
          value: _role,
          items: ['Utilisateur', 'Administrateur']
              .map((role) => DropdownMenuItem(
            value: role,
            child: Text(role),
          ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _role = value ?? 'Utilisateur';
            });
          },
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _ajouterUtilisateur,
          child: Text('Ajouter l utilisateur'),
          ),
          ],
        ),
      ),
    );
  }
}
