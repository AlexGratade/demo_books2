import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/viewModelLivre/LivreViewModel.dart';
import '../../repository/LivreDatabase.dart';

class LivreDetailView extends StatelessWidget {
  final int livreId;

  LivreDetailView({required this.livreId});

  @override
  Widget build(BuildContext context) {
    final livreViewModel = Provider.of<LivreViewModel>(context);
    final livre = livreViewModel.obtenirLivre(livreId);

    if (livre == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Détails du livre'),
        ),
        body: Center(
          child: Text('Livre non trouvé'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du livre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Titre: ${livre.titre}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Auteur: ${livre.auteur.nomAuteur}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description: ${livre.description}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}