import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tasks_app_provider_consumer/database/tables_constants.dart';

class ClientSqlite {

  // Inicio - Parte do singleton
  ClientSqlite.privateConstructor();

  static final ClientSqlite _instance = ClientSqlite.privateConstructor();

  factory ClientSqlite() {
    return _instance;
  }
  // Fim - Parte do singleton

  Database? _database;

  Future<Database?> get database async {
    if(_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {

    final databasePath = await getDatabasesPath();

    final path = join(databasePath, 'tasksapp.db');

    // await deleteDatabase(path);

    final database = await openDatabase(
      path, 
      version: 1,
      onCreate: (db,version) async {

        for (var i = 0; i < TablesConstants.tablesQueries.length; i++) {
          await db.execute(TablesConstants.tablesQueries[i]); 
        }

      }
    );

    // print("TABELAS CRIADAS");
    // final tables = await database.rawQuery('SELECT * FROM sqlite_master ORDER BY name;');
    // tables.forEach((element) {
    //   print(element);
    // });

    // final tables = await database.rawQuery('SELECT * FROM tasks;');
    // tables.forEach((element) {
    //   print(element);
    // });

    return database;
  }

  static String get getSql => TablesConstants.userTable + TablesConstants.taskTable;
}