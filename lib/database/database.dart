import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DATABASE {
  static final DATABASE _db = DATABASE._internal();
  DATABASE._internal();
  static DATABASE get instance => _db;
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _init();
    return _database!;
  }

  Future<Database> _init() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'save_your_train.db'),
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE exercises(exerciseName TEXT PRIMARY KEY, exerciseDescription TEXT);",
        );       
        // TODO: add histories table
      },
      version: 5,
    );
  }
}
