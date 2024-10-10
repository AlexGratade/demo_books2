class Livre {
  int _idLivre = 0;
  String _titre = '';
  int _idauteur = 0;



  //Constructeur
  Livre({required int idLivre, required String titre, required int idauteur})
  :  _idLivre = idLivre,
    _titre = titre,
    _idauteur = idauteur;

  //Getters
  int get idLivre => _idLivre;
  String get titre => _titre;
  int get idauteur => _idauteur;

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
    );
  }
}