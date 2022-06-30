import 'package:flutter/cupertino.dart';
import 'package:qido_colaboradores/model/usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  static const String databaseName = "database.db";
  static Database db;

  static Future<Database> initizateDb() async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    return db?? await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await createTables(db);
        });
  }

  static Future<void> createTables(Database database) async{
    await database.execute("CREATE TABLE Usuario(id INTEGER PRIMARY KEY ,name TEXT NOT NULL,"
        "email TEXT NOT NULL,token TEXT NOT NULL)");
  }

  static Future<int> createItem(Usuario usuario) async {
    int result = 0;
    final db = await SqliteService.initizateDb();
    final id = await db.insert(
        'Usuario', usuario.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Delete an note by id
  Future<void> deleteItem(String id) async {
    final db = await SqliteService.initizateDb();
    try {
      await db.delete("Usuario", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  // Read all notes
  static Future<Usuario> getItems() async {
    final db = await SqliteService.initizateDb();

    final List<Map<String, Object>> queryResult = await db.query('Usuario');
    return queryResult.map((e) => Usuario.fromMap(e)).isEmpty ? null : queryResult.map((e) => Usuario.fromMap(e)).toList()[0];
  }

}