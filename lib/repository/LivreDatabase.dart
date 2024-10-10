
import 'Database.dart';

class LivreDatabase {
  final DatabaseClient _dbClient = DatabaseClient();

  //Ajouter un livre
  Future<int> ajouterLivre(String nomLivre, int idAuteur) async {
    final db = await _dbClient.database;
    return await db.insert('LIVRE', {'nomLivre': nomLivre, 'idAuteur': idAuteur});
  }

    //Recuperer tout les livres
  Future<List<Map<String, dynamic>>> obtenirTousLesLivres() async {
    final db = await _dbClient.database;
    return await db.query('LIVRE');
  }

  //Mettre a jour un livre
  Future<int> mettreAJourLivre(int idLivre, String nomLivre, int idAuteur) async {
    final db = await _dbClient.database;
    return await db.update('LIVRE', {'nomLivre': nomLivre, 'idAuteur': idAuteur}, where: 'idLivre = ?', whereArgs: [idLivre]);
  }

  //Supprimer un livre
  Future<int> supprimerLivre(int idLivre) async {
    final db = await _dbClient.database;
    return await db.delete('LIVRE', where: 'idLivre = ?', whereArgs: [idLivre]);
  }
  }