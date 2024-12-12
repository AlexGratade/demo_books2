import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  static final DatabaseClient _instance = DatabaseClient._internal();
  static Database? _database;

  DatabaseClient._internal();

  factory DatabaseClient() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'bibliotheque.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Création de la table Auteur
    await db.execute('''
      CREATE TABLE AUTEUR(
        idAuteur INTEGER PRIMARY KEY AUTOINCREMENT,
        nomAuteur TEXT NOT NULL
      )
    ''');

    // Création de la table Livre
    await db.execute('''
      CREATE TABLE LIVRE(
        idLivre INTEGER PRIMARY KEY AUTOINCREMENT,
        nomLivre TEXT NOT NULL,
        idAuteur INTEGER,
        FOREIGN KEY(idAuteur) REFERENCES AUTEUR(idAuteur)
      )
    ''');
    await db.execute('''
    CREATE TABLE USERS(
        idUser INT,
        nomUser VARCHAR(50),
    prenomUser VARCHAR(50),
    loginUser VARCHAR(50),
    mdpUser VARCHAR(50),
    roleUser VARCHAR(50),
    PRIMARY KEY(idUser)
    )
    ''');
  }
  /*
// Methode CRUD pour les livres et les auteurs
   Future<int> ajouterAuteur(String nomAuteur) async {
     Database db = await database;
     return await db.insert('AUTEUR', {'nomAuteur': nomAuteur});
   }
  Future<int> ajouterLivre(String nomLivre, int idAuteur) async {
    Database db = await database;
    return await db.insert('LIVRE', {'nomLivre': nomLivre, 'idAuteur': idAuteur});
  }*/
}