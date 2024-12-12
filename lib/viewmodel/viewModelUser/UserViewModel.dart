import 'package:flutter/foundation.dart';
import '../../model/User.dart';
import '../../repository/UserDatabase.dart';
import 'package:bcrypt/bcrypt.dart';

class UserViewModel with ChangeNotifier {
  final UserDatabase _userDb = UserDatabase();
  List<User> _users = [];
  List<User> get users => _users;
  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<bool> login(String userName, String password) async {
    final user = await _userDb.getUserByLogin(userName);
    if (user != null && BCrypt.checkpw(password, user.mdpUser)) {
      _currentUser = user;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    _currentUser = null;
    notifyListeners();
  }

  Future<void> ajouterUser(String userName, String password, String role) async {
    final hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
    final user = User(idUser: 0, nomUser: userName, prenomUser: '', mdpUser: hashedPassword, roleUser: role, loginUser: '');
    await _userDb.ajouterUser(
      user,
      nomUser: user.nomUser,
      prenomUser: user.prenomUser,
      loginUser: user.loginUser,
      mdpUser: user.mdpUser,
      roleUser: user.roleUser,
    );
    notifyListeners();
  }

  Future<void> mettreAJourUser(User user) async {
    await _userDb.mettreAJourUser(
      user.idUser,
      user.nomUser,
      user.prenomUser,
      user.loginUser,
      user.mdpUser,
      user.roleUser,
    );
    notifyListeners();
  }

  Future<void> supprimerUser(int idUser) async {
    await _userDb.deleteUser(idUser);
    notifyListeners();
  }
}