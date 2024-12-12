import 'package:flutter/foundation.dart';
import '../../model/Livre.dart';
import '../../model/Auteur.dart';
import '../../repository/LivreDatabase.dart';

class LivreViewModel with ChangeNotifier {

  final LivreDatabase _livreDb = LivreDatabase();
  List<Livre> _livres = [];
  List<Livre> get livres => _livres;

  //Recuperer la liste des livres
  Future<void> chargerLivres() async {
    final List<Map<String, dynamic>> livreData = await _livreDb.obtenirTousLesLivres();
    _livres = livreData.map((map) => Livre.fromMap(map)).toList();
    notifyListeners();
  }

  //Ajouter un nouveau livre
  Future<void> ajouterLivre(String titre, int idAuteur) async {
    await _livreDb.ajouterLivre(titre, idAuteur);
    await chargerLivres();
  }

  //Mettre a jour un livre
  Future<void> mettreAJourLivre(int idLivre, String titre, int idAuteur) async {
    await _livreDb.mettreAJourLivre(idLivre, titre, idAuteur);
    await chargerLivres();
  }
  //Supprimer un livre
  Future<void> supprimerLivre(int idLivre) async {
    await _livreDb.supprimerLivre(idLivre);
    await chargerLivres();
  }

  obtenirLivre(int livreId) {}
}
