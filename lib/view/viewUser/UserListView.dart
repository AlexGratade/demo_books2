import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/viewModelUser/UserViewModel.dart';
import '../../model/User.dart';


class UserListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Liste des Utilisateurs')),
      body: ListView.builder(
        itemCount: userViewModel.users.length,
        itemBuilder: (context, index) {
          final user = userViewModel.users[index];
          return ListTile(
            title: Text(user.nomUser),
            subtitle: Text(user.roleUser),
            trailing: userViewModel.currentUser?.roleUser == 'admin'
                ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.edit), onPressed: () {
                  // Navigate to UserFormView for editing
                }),
                IconButton(icon: Icon(Icons.delete), onPressed: () {
                  userViewModel.supprimerUser(user.idUser);
                }),
              ],
            )
                : null,
          );
        },
      ),
      floatingActionButton: userViewModel.currentUser?.roleUser == 'admin'
          ? FloatingActionButton(
        onPressed: () {
          // Navigate to UserFormView for adding
        },
        child: Icon(Icons.add),
      )
          : null,
    );
  }
}