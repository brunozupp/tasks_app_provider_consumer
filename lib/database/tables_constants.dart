abstract class TablesConstants {

  static String userTable = '''
    CREATE TABLE IF NOT EXISTS users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT NOT NULL,
      password TEXT NOT NULL
    );
  ''';

  static String taskTable = '''
    CREATE TABLE IF NOT EXISTS tasks(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      userId INTEGER NOT NULL,
      name TEXT NOT NULL,
      description TEXT NOT NULL,
      priority TEXT NOT NULL,
      FOREIGN KEY(userId) REFERENCES users(id)
    );
  ''';

  static List<String> tablesQueries = [userTable,taskTable];
}