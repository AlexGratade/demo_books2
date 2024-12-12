import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/viewModelLivre/LivreViewModel.dart';
import 'AjouterLivreView.dart';
import 'ModifierLivreView.dart';

class LivreListView extends StatefulWidget {
  @override
  _LivreListViewState createState() => _LivreListViewState();
}

class _LivreListViewState extends State<LivreListView> {
  @override
  void initState() {
    super.initState();
    Provider.of<LivreViewModel>(context, listen: false).chargerLivres();
  }

  void _afficherMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des livres'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AjouterLivreView()),
              ).then((_) {
                Provider.of<LivreViewModel>(context, listen: false).chargerLivres();
                _afficherMessage(context, 'Livre ajouté avec succès.');
              });
            },
          ),
        ],
      ),
      body: Consumer<LivreViewModel>(
        builder: (context, livreViewModel, child) {
          if (livreViewModel.livres.isEmpty) {
            return Center(child: Text('Aucun livre trouvé.'));
          }

          return ListView.builder(
            itemCount: livreViewModel.livres.length,
            itemBuilder: (context, index) {
              final livre = livreViewModel.livres[index];
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
                        ).then((_) {
                          Provider.of<LivreViewModel>(context, listen: false)
                              .chargerLivres();
                          _afficherMessage(context, 'Livre modifié avec succès.');
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        Provider.of<LivreViewModel>(context, listen: false)
                            .supprimerLivre(livre.idLivre);
                        _afficherMessage(context, 'Livre supprimé avec succès.');
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
