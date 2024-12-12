import 'package:demo/model/Auteur.dart';

class Livre {
  int _idLivre;
  String _titre;
  int _idauteur;
  late Auteur _auteur;



  //Constructeur
  Livre({required int idLivre, required String titre, required int idauteur, required auteur})
  :  _idLivre = idLivre,
    _titre = titre,
    _idauteur = idauteur,
    _auteur = auteur;

  //Getters
  int get idLivre => _idLivre;
  String get titre => _titre;
  int get idauteur => _idauteur;
  int get idAuteur => _auteur.idAuteur;
  String get nomAuteur => _auteur.nomAuteur;

  //Setters
  set titre(String value) {
    _titre = value;
  }
  set idauteur(int value) {
    _idauteur = value;
  }

  // Méthode pour convertir un Livre en Map
  Map<String, dynamic> toMap() {
    return {
      'idLivre': _idLivre,
      'titre': _titre,
      'idauteur': _idauteur,
    };
  }

  // Méthode pour convertir un Map en Livre
  factory Livre.fromMap(Map<String, dynamic> map) {
    return Livre(
      idLivre: map['idLivre'],
      titre: map['titre'],
      idauteur: map['idauteur'],
      auteur: Auteur(idAuteur: map['idAuteur'], nomAuteur: map['nomAuteur']),
    );
  }
}