import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/viewModelAuteur/AuteurViewModel.dart';
import 'AjouterAuteurView.dart';
import 'ModifierAuteurView.dart';


class AuteurListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Changer la liste des auteurs lorsque la vue est construite
    Provider.of<AuteurViewModel>(context, listen: false)
        .chargerAuteurs();

    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des auteurs'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Ouvrir l'ecran d'ajout d'un auteur
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AjouterAuteurView()),
              );
            },
          ),
        ],
      ),
      body: Consumer<AuteurViewModel>(
        builder: (context, AuteurViewModel, child) {
          if (AuteurViewModel.auteurs.isEmpty) {
            return const Center(
                child: CircularProgressIndicator());
          }

          return ListView.builder(
              itemCount: AuteurViewModel.auteurs.length,
              itemBuilder: (context, index) {
                final auteur = AuteurViewModel.auteurs[index];
                return ListTile(
                  title: Text(auteur.nomAuteur),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ModifierAuteurView(auteur: auteur),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          //Supprimer l'auteur
                          AuteurViewModel.supprimerAuteur(auteur.idAuteur!);
                        },
                      )
                    ],
                  ),
                );
              }
          );
        },
      ),
    );
  }
}

