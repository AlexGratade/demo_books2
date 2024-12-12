//import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/viewModelUser/UserViewModel.dart';
import '../../model/User.dart';

class UserFormView extends StatelessWidget {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final User? user;

  UserFormView({this.user}) {
    final user = this.user;
    if (user != null) {
      _userNameController.text = user.nomUser;
      _roleController.text = user.roleUser;
    }
  }

  void _saveUser(BuildContext context) {
    final userName = _userNameController.text;
    final password = _passwordController.text;
    final role = _roleController.text;
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);

    if (user == null) {
      userViewModel.ajouterUser(userName, password, role);
    } else {
      final updatedUser = User(
        idUser: user!.idUser,
        nomUser: userName,
        prenomUser: user!.prenomUser,
        loginUser: user!.loginUser,
        mdpUser: /*password.isNotEmpty ? BCrypt.hashpw(password, BCrypt.gensalt()) :*/ user!.mdpUser,
        roleUser: role,
      );
      userViewModel.mettreAJourUser(updatedUser);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user == null ? 'Ajouter Utilisateur' : 'Modifier Utilisateur')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _userNameController, decoration: InputDecoration(labelText: 'Nom d\'utilisateur')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Mot de passe'), obscureText: true),
            TextField(controller: _roleController, decoration: InputDecoration(labelText: 'Rôle')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => _saveUser(context), child: Text(user == null ? 'Ajouter' : 'Modifier')),
          ],
        ),
      ),
    );
  }
}