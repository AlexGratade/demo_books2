import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/viewModelLivre/LivreViewModel.dart';
import '../../viewmodel/viewModelAuteur/AuteurViewModel.dart'; // Assurez-vous d'importer ce fichier

class AjouterLivreView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titreLivreController = TextEditingController();
  int? _selectedAuteurId; // Pour stocker l'ID de l'auteur sélectionné

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un livre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titreLivreController,
                decoration: InputDecoration(
                  labelText: 'Titre du livre',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le titre du livre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              // Liste déroulante pour sélectionner l'auteur
              DropdownButtonFormField<int>(
                decoration: InputDecoration(labelText: 'Sélectionner un auteur'),
                value: _selectedAuteurId,
                items: Provider.of<AuteurViewModel>(context)
                    .auteurs
                    .map((auteur) => DropdownMenuItem<int>(
                  value: auteur.idAuteur,
                  child: Text(auteur.nomAuteur),
                ))
                    .toList(),
                onChanged: (value) {
                  _selectedAuteurId = value; // Met à jour l'ID de l'auteur sélectionné
                },
                validator: (value) {
                  if (value == null) {
                    return 'Veuillez sélectionner un auteur';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _selectedAuteurId != null) {
                    Provider.of<LivreViewModel>(context, listen: false)
                        .ajouterLivre(_titreLivreController.text, _selectedAuteurId!);
                    Navigator.pop(context);
                  }
                },
                child: Text('Ajouter le livre'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
