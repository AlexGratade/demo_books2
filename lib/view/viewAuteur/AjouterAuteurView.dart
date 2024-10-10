import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/viewModelAuteur/AuteurViewModel.dart';

class AjouterAuteurView extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomAuteurController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un auteur'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomAuteurController,
                decoration: InputDecoration(
                  labelText: 'Nom de l\'auteur',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom de l\'auteur';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<AuteurViewModel>(context, listen: false)
                        .ajouterAuteur(_nomAuteurController.text);
                    Navigator.pop(context);
                  }
                },
                child: Text('Ajouter l\'auteur'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}