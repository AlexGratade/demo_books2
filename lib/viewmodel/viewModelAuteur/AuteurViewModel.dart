import 'package:flutter/foundation.dart';
import '../../model/Auteur.dart';
import '../../repository/AuteurDatabase.dart';

class AuteurViewModel with ChangeNotifier {

  final AuteurDatabase _auteurDb = AuteurDatabase();
  List<Auteur> _auteurs = [];
  List<Auteur> get auteurs => _auteurs;

  //Recuperer la liste des auteurs
  Future<void> chargerAuteurs() async {
    final List<Map<String, dynamic>> auteurData = await _auteurDb.obtenirTousLesAuteurs();
    _auteurs = auteurData.map((map) => Auteur.fromMap(map)).toList();
    notifyListeners();
  }

  //Ajouter un nouvel auteur
  Future<void> ajouterAuteur(String nomAuteur) async {
    await _auteurDb.ajouterAuteur(nomAuteur);
    await chargerAuteurs();
  }

  //Mettre a jour un auteur
  Future<void> mettreAJourAuteur(int idAuteur, String nomAuteur) async {
    await _auteurDb.mettreAJourAuteur(idAuteur, nomAuteur);
    await chargerAuteurs();
}
  //Supprimer un auteur
  Future<void> supprimerAuteur(int idAuteur) async {
    await _auteurDb.supprimerAuteur(idAuteur);
    await chargerAuteurs();
  }
  }