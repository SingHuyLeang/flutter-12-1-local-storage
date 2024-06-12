import 'dart:developer';
import 'dart:io';

import 'package:local_storage/model/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteHelper {
  final String dbName = "users.db";
  final String table = "user";
  final String id = "id";
  final String email = "email";
  final String password = "password";

  Future<Database> initDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String location = "";
    if (Platform.isIOS) {
      String username = Platform.environment["USER"] ?? "Unknown User";
      if (!(username == "Unknown User")) {
        location = "/User/$username/Documents";
      }
    } else {
      location = appDir.path;
    }
    return openDatabase(
      "$location/$dbName",
      version: 1,
      onCreate: (db, version) async => await db.execute(
          "CREATE TABLE IF NOT EXISTS $table ( $id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, $email TEXT NOT NULL, $password TEXT NOT NULL )"),
    );
  }

  Future<bool> insertUser(UserModel user) async {
    final db = await initDB();
    int i = -1;
    i =  await db.insert(table, user.fromMap());
    return i > 0;
  }

  Future<bool> select(UserModel user) async {
    final db = await initDB();
    final data = await db.query(
      table,
      columns: [id, email, password],
      where: "$email = ? AND $password = ?",
      whereArgs: [user.email, user.password],
    );
    return data.isNotEmpty;
  }
}
