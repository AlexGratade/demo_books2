import '../model/User.dart';
import 'Database.dart';
//import 'package:bcrypt/bcrypt.dart';

class UserDatabase {
  final DatabaseClient _dbClient = DatabaseClient();

  Future<List<User>> obtenirToutLesUsers() async {
    final db = await _dbClient.database;
    final List<Map<String, dynamic>> result = await db.query('USERS');

    return result
        .map((userMap) => User(
      idUser: userMap['idUser'],
      nomUser: userMap['nomUser'],
      prenomUser: userMap['prenomUser'],
      loginUser: userMap['loginUser'],
      mdpUser: userMap['mdpUser'],
      roleUser: userMap['roleUser'],
    ))
        .toList();
  }

  // Ajouter un user
  Future<int> ajouterUser(User user, {
    required String nomUser,
    required String prenomUser,
    required String loginUser,
    required String mdpUser,
    required String roleUser,
  }) async {
    final db = await _dbClient.database;

    //String hashedPassword = BCrypt.hashpw(mdpUser, BCrypt.gensalt());

    return await db.insert('USERS', {
      'nomUser': nomUser,
      'prenomUser': prenomUser,
      'loginUser': loginUser,
      'mdpUser': mdpUser,
      'roleUser': roleUser,
    });
  }

  Future<int> mettreAJourUser(int idUser, String nomUser, String prenomUser, String loginUser, String mdpUser, String roleUser) async {
    final db = await _dbClient.database;

    Map<String, dynamic> values = {
      'nomUser': nomUser,
      'prenomUser': prenomUser,
      'loginUser': loginUser,
      'roleUser': roleUser,
    };

    if (mdpUser.isNotEmpty) {
     // String hashedPassword = BCrypt.hashpw(mdpUser, BCrypt.gensalt());
      values['mdpUser'] = mdpUser;
    }

    return await db.update('USERS', values, where: 'idUser = ?', whereArgs: [idUser]);
  }

  Future<int> deleteUser(int idUser) async {
    final db = await _dbClient.database;
    return await db.delete('USERS', where: 'idUser = ?', whereArgs: [idUser]);
  }

  Future<User?> getUserByLogin(String loginUser) async {
    final db = await _dbClient.database;
    final List<Map<String, dynamic>> result = await db.query(
      'USERS',
      where: 'loginUser = ?',
      whereArgs: [loginUser],
    );
    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null;
  }
}