
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
  //Recuperer un livre
  Future<Map<String, dynamic>> obtenirLivre(int idLivre) async {
    final db = await _dbClient.database;
    final result = await db.query('LIVRE', where: 'idLivre = ?', whereArgs: [idLivre]);
    return result.first;
  }

  //Mettre a jour un livre
  Future<void> mettreAJourLivre(int idLivre, String titre, int idAuteur) async {
    final db = await _dbClient.database; // Assurez-vous que cette méthode récupère bien l'instance de la base de données

    await db.update(
      'livres',
      {
        'titre': titre,
        'idauteur': idAuteur,
      },
      where: 'idLivre = ?',
      whereArgs: [idLivre],
    );
  }

  //Supprimer un livre
  Future<int> supprimerLivre(int idLivre) async {
    final db = await _dbClient.database;
    return await db.delete('LIVRE', where: 'idLivre = ?', whereArgs: [idLivre]);
  }
  }