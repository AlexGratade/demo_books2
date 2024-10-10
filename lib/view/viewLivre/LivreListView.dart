import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/viewModelLivre/LivreViewModel.dart';
import 'AjouterLivreView.dart';
import 'ModifierLivreView.dart';

class LivreListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Charger la liste des livres lorsque la vue est construite
    Provider.of<LivreViewModel>(context, listen: false)
        .chargerLivres();

    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des livres'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Ouvrir l'ecran d'ajout d'un livre
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AjouterLivreView()),
              );
            },
          ),
        ],
      ),
      body: Consumer<LivreViewModel>(
        builder: (context, LivreViewModel, child) {
          if (LivreViewModel.livres.isEmpty) {
            return const Center(
                child: CircularProgressIndicator());
          }

          return ListView.builder(
              itemCount: LivreViewModel.livres.length,
              itemBuilder: (context, index) {
                final livre = LivreViewModel.livres[index];
                return ListTile(
                  title: Text(livre.titre),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ModifierLivreView(livre: livre),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          LivreViewModel.supprimerLivre(livre.idLivre);
                        },
                      ),
                    ],
                  ),
                );
              },
          );
        },
      ),
    );
  }
}