import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/viewModelLivre/LivreViewModel.dart';
import '../../model/Livre.dart';
import '../../viewmodel/viewModelAuteur/AuteurViewModel.dart';
import '../../model/Auteur.dart';

class ModifierLivreView extends StatefulWidget {
  final Livre livre;

  ModifierLivreView({required this.livre});

  @override
  _ModifierLivreViewState createState() => _ModifierLivreViewState();
}

class _ModifierLivreViewState extends State<ModifierLivreView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titreLivreController;
  int? _selectedAuteurId;

  @override
  void initState() {
    super.initState();
    _titreLivreController = TextEditingController(text: widget.livre.titre);
    _selectedAuteurId = widget.livre.idauteur; // Pré-sélectionner l'auteur
  }

  @override
  void dispose() {
    _titreLivreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Charger les auteurs
    Provider.of<AuteurViewModel>(context, listen: false).chargerAuteurs();

    return Scaffold(
      appBar: AppBar(title: Text('Modifier le livre')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Consumer<LivreViewModel>(
            builder: (context, livreViewModel, child) {
              return Column(
                children: [
                  TextFormField(
                    controller: _titreLivreController,
                    decoration: InputDecoration(labelText: 'Titre du livre'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer le titre du livre';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField<int>(
                    value: _selectedAuteurId,
                    decoration: InputDecoration(labelText: 'Choisir un auteur'),
                    items: AuteurViewModel().auteurs.map((auteur) {
                      return DropdownMenuItem<int>(
                        value: auteur.idAuteur,
                        child: Text(auteur.nomAuteur), // Assurez-vous d'avoir un champ nom dans Auteur
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedAuteurId = value;
                      });
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
                      if (_formKey.currentState!.validate()) {
                        Provider.of<LivreViewModel>(context, listen: false)
                            .mettreAJourLivre(
                            widget.livre.idLivre!,
                            _titreLivreController.text,
                            _selectedAuteurId!);
                        Navigator.pop(context); // Retour à la liste des livres
                      }
                    },
                    child: Text('Mettre à jour'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
