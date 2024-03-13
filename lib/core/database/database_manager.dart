import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static final DatabaseManager _main = DatabaseManager._internal();

  factory DatabaseManager() {
    return _main;
  }

  DatabaseManager._internal();

  Future<Database> openDb() async {
    var nameDB = dotenv.get("DB_NAME");
    var databasepath = await getDatabasesPath();
    return await openDatabase(
      join(databasepath, nameDB),
      version: 1,
    );
  }

  Future<bool> dbExist(String tableName) async {
    String checkExistTable =
        "SELECT * FROM sqlite_master WHERE name ='$tableName' and type='table'";
    var db = await openDb();
    var result = await db.rawQuery(checkExistTable);
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
