import 'package:sqflite/sql.dart';
import 'Database.dart';

class AuteurDatabase {
  final DatabaseClient _dbClient = DatabaseClient();

  //Ajouter un auteur
  Future<int> ajouterAuteur(String nomAuteur) async {
    final db = await _dbClient.database;
    return await db.insert('AUTEUR', {'nomAuteur': nomAuteur});
  }


  //Recuperer tout les auteurs
  Future<List<Map<String, dynamic>>> obtenirTousLesAuteurs() async {
    final db = await _dbClient.database;
    return await db.query('AUTEUR');
  }

  //Mettre a jour un auteur
  Future<int> mettreAJourAuteur(int idAuteur, String nomAuteur) async {
    final db = await _dbClient.database;
    return await db.update(
        'AUTEUR',
        {'nomAuteur': nomAuteur},
        where: 'idAuteur = ?',
        whereArgs: [idAuteur]);
  }

  //Supprimer un auteur
  Future<int> supprimerAuteur(int idAuteur) async {
    final db = await _dbClient.database;
    return await db.delete('AUTEUR', where: 'idAuteur = ?', whereArgs: [idAuteur]);
  }
  // Liste des auteurs par ordre alphabetique
  Future<List<Map<String, dynamic>>> obtenirAuteursParOrdreAlphabetique() async {
    final db = await _dbClient.database;
    return await db.query(
        'AUTEUR',
        orderBy: 'nomAuteur ASC'
    );
  }
  


}