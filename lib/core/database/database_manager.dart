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

  Future<void> createAllTable() async {
    var tableName = dotenv.get("TABLE_QUESTION");
    var tableName2 = dotenv.get("TABLE_ASSESSMENT");
    var tableName3 = dotenv.get("TABLE_QUESTION_ITEM");
    var tableName4 = dotenv.get("TABLE_REMEMBER_ITEM");
    var tableName5 = dotenv.get("TABLE_ANSWER_ITEM");
    var tableName6 = dotenv.get("TABLE_PARTICIPANT");
    var nameDB = dotenv.get("DB_NAME");
    print(nameDB);
    var databasepath = await getDatabasesPath();
    var db = await openDatabase(
      join(databasepath, nameDB),
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },
      version: 1,
    );
    var batch = db.batch();
    batch.execute(
        "CREATE TABLE $tableName( id TEXT PRIMARY KEY NOT NULL, name TEXT NOT NULL)");
    batch.execute("""CREATE TABLE $tableName2 (
          id TEXT PRIMARY KEY NOT NULL,
          name TEXT NULL,
          assessment_date TEXT NULL,
          description TEXT NULL,
          type TEXT NULL,
          role_assessor TEXT NULL,
          role_assessor_name TEXT NULL,
          role_participant INTEGER NULL,
          role_participant_name TEXT NULL,
          departement_id TEXT NULL,
          departement_name TEXT NULL,
          site_location_id TEXT NULL,
          site_location_name TEXT NULL,
          image TEXT NULL,
          assessors TEXT NULL,
          created_at TEXT NULL,
          updated_at TEXT NULL,
          downloaded_at TEXT NULL,
          has_responses INTEGER NULL
        )""");
    batch.execute("""CREATE TABLE $tableName3 (
          id_question TEXT NOT NULL,
          questionid TEXT NOT NULL,
          section TEXT NULL,
          number TEXT NULL,
          type TEXT NULL,
          question_name TEXT NULL,
          scoring INTEGER NULL,
          FOREIGN KEY (id_question) REFERENCES $tableName(id)
        )""");
    batch.execute(
        "CREATE TABLE $tableName4 (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT NULL, pass TEXT  NULL)");
    batch.execute("""CREATE TABLE $tableName5 (
                      question_id TEXT NOT NULL,
                      optionid TEXT NOT NULL,
                      option_name TEXT NULL,
                      points INTEGER NULL,
                      flag INTEGER NULL,
                      site_location_ids TEXT NULL,
                      FOREIGN KEY (question_id) REFERENCES $tableName3(id_question))
                        """);
    batch.execute("""CREATE TABLE $tableName6 (
          id_assessment TEXT NOT NULL,
          nik TEXT NOT NULL,
          name TEXT NOT NULL,
          departement TEXT NOT NULL,
          departement_id TEXT NOT NULL,
          role TEXT NOT NULL,
          role_id INTEGER NULL,
          site_location TEXT NOT NULL,
          site_location_id TEXT NULL,
          total_assessment INTEGER NULL,
          last_assessment TEXT NULL,
          image_profile TEXT NULL,
          created_at TEXT NULL,
          FOREIGN KEY (id_assessment) REFERENCES $tableName2(id)
        )""");
    await batch.commit();
    db.close();
  }

  Future<bool> dbExist() async {
    var tableName = dotenv.get("TABLE_QUESTION");

    String checkExistTable =
        "SELECT name FROM sqlite_master WHERE type ='table' AND name = '$tableName';";
    var db = await openDb();
    var result = await db.rawQuery(checkExistTable);

    if (result.isNotEmpty) {
      db.close();
      return true;
    } else {
      return false;
    }
  }
}
