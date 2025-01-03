import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDataBase {
  static var db;

  static final MyDataBase _instance = MyDataBase._();

  MyDataBase._();

  factory MyDataBase() {
    return _instance;
  }

  // Підключаемось до бази, створення SQl-таблиць
  Future<Database> _init() async {
    String path = join(await getDatabasesPath(), "dataB.db");
    print(path);
    Database db = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute("CREATE TABLE sku(id TEXT PRIMARY KEY, name TEXT)");
    });
    return db;
  }

  Future<int?> addMonoExceptions(Map map) async {
    if (db == null) {
      db = await _init();
    }

    return await db.insert("sku", map,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int?> getCount() async {
    if (db == null) {
      db = await _init();
    }

    var _res = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM sku'));
    return _res;
  }
}
