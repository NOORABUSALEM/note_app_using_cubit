import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String noteTableKey = "Note";
  static final DatabaseHelper _instance = DatabaseHelper._();

  static DatabaseHelper get instance => _instance;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _instance;
  }

  Database? _database;

  Future<Database> get database async {
    _database ??= await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'note.db');
    // open the database
    final database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return database;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE $noteTableKey (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      description TEXT,
      colorCode INTEGER
      )
     ''',
    );
  }
}
