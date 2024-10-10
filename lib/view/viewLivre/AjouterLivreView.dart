import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/viewModelLivre/LivreViewModel.dart';


class AjouterLivreView extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titreLivreController = TextEditingController();
  final TextEditingController _idAuteurController = TextEditingController();

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
              TextFormField(
                controller: _idAuteurController,
                decoration: InputDecoration(
                  labelText: 'ID de l\'auteur',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer l\'ID de l\'auteur';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<LivreViewModel>(context, listen: false)
                        .ajouterLivre(_titreLivreController.text, int.parse(_idAuteurController.text));
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
