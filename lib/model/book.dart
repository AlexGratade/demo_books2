class Book {
  int _auteurid = 0;
  String _titre = "";
  double _prix = 0.0;
  String _date = "";

  Book({required int auteurid, required String titre, required double prix, required String date}) {
    _auteurid = auteurid;
    _titre = titre;
    _prix = prix;
    _date = date;
  }

  int get auteurid => _auteurid;
  String get titre => _titre;
  double get prix => _prix;
  String get date => _date;

  set auteurid(int value) {
    _auteurid = value;
  }

  set titre(String value) {
    _titre = value;
  }

  set prix(double value) {
    _prix = value;
  }

  set date(String value) {
    _date = value;
  }

  // Méthode pour convertir un Map en Book
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      auteurid: map['auteurid'],
      titre: map['titre'],
      prix: map['prix'],
      date: map['date'],
    );
  }

  // Méthode pour convertir un Book en Map
  Map<String, dynamic> toMap() {
    return {
      'auteurid': _auteurid,
      'titre': _titre,
      'prix': _prix,
      'date': _date,
    };
  }
}