import 'package:demo/view/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/viewModelAuteur/AuteurViewModel.dart';
import 'viewmodel/viewModelLivre/LivreViewModel.dart';
import 'viewmodel/viewModelUser/UserViewModel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuteurViewModel>(create: (context) => AuteurViewModel()),
        ChangeNotifierProvider<LivreViewModel>(create: (context) => LivreViewModel()),
        ChangeNotifierProvider<UserViewModel>(create: (context) => UserViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bibliothèque Numérique',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}