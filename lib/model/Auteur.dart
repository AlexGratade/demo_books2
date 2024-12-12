class Auteur{
  int _idAuteur = 0;
  String _nomAuteur = '';

  //Constructeur
  Auteur({required idAuteur,required String nomAuteur}){
       _idAuteur = idAuteur;
        _nomAuteur = nomAuteur!;
  }

  //Getters
  int get idAuteur => _idAuteur;
  String get nomAuteur => _nomAuteur;

  //Setters
set nomAuteur(String? nomAuteur) {
    _nomAuteur = nomAuteur!;
  }
  // Méthode pour convertir un Auteur en Map
  Map<String, dynamic> toMap() {
    return {
      'idAuteur': _idAuteur,
      'nomAuteur': _nomAuteur,
    };
  }

  // Méthode pour convertir un Map en Auteur
  factory Auteur.fromMap(Map<String, dynamic> map) {
    return Auteur(
      idAuteur: map['idAuteur'],
      nomAuteur: map['nomAuteur'],
    );
  }
  }