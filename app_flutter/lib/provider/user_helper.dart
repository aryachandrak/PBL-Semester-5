import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserHelper {
  static final UserHelper _instance = UserHelper._internal();
  factory UserHelper() => _instance;
  static Database? _database;

  UserHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'user_data.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            gender TEXT,
            age INTEGER
          )
          '''
        );
      },
    );
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    await db.insert('users', user);
  }
}
