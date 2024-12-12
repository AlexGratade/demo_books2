import 'package:flutter/material.dart';

class ModifierUserView extends StatefulWidget {
  final int userId;
  final String nomInitial;
  final String prenomInitial;
  final String loginInitial;
  final String roleInitial;

  ModifierUserView({
    required this.userId,
    required this.nomInitial,
    required this.prenomInitial,
    required this.loginInitial,
    required this.roleInitial,
  });

  @override
  _ModifierUserViewState createState() => _ModifierUserViewState();
}

class _ModifierUserViewState extends State<ModifierUserView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomController;
  late TextEditingController _prenomController;
  late TextEditingController _loginController;
  String _role = 'Utilisateur';

  @override
  void initState() {
    super.initState();
    _nomController = TextEditingController(text: widget.nomInitial);
    _prenomController = TextEditingController(text: widget.prenomInitial);
    _loginController = TextEditingController(text: widget.loginInitial);
    _role = widget.roleInitial;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modifier l\'utilisateur')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomController,
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _prenomController,
                decoration: InputDecoration(labelText: 'Prénom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le prénom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _loginController,
                decoration: InputDecoration(labelText: 'Identifiant'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer l\'identifiant';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _role,
                decoration: InputDecoration(labelText: 'Rôle'),
                items: ['Utilisateur', 'Administrateur']
                    .map((role) => DropdownMenuItem(
                  value: role,
                  child: Text(role),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _role = value!;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Veuillez sélectionner un rôle';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Appeler la méthode de mise à jour
                    print(
                        'Utilisateur mis à jour : ${widget.userId}, ${_nomController.text}, ${_prenomController.text}, ${_loginController.text}, $_role');
                    Navigator.pop(context);
                  }
                },
                child: Text('Mettre à jour'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
