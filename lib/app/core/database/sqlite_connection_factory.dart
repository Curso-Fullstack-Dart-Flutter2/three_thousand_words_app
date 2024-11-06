import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';

class SqliteConnectionFactory {
  static const _version = 1;
  static const _database_name = 'THEE_THOUSAND_WORD';

  static SqliteConnectionFactory? _instance;
  Database? _database;
  final _lock = Lock();

  SqliteConnectionFactory._();

  factory SqliteConnectionFactory() {
    _instance ??= SqliteConnectionFactory._();

    return _instance!;
  }

  Future<Database> openConnection() async {
    final databasePath = await getDatabasesPath();
    final databasePathFinal = join(databasePath, _database_name);

    if (_database == null) {
      await _lock.synchronized(() async {
        _database ??= await openDatabase(
          databasePathFinal,
          version: _version,
          onConfigure: _onConfigure,
          onCreate: _onCreate,
          onUpgrade: _onUpgrade,
          onDowngrade: _onDowngrade,
        );
      });
    }

    return _database!;
  }

  void closeConnection() {
    _database?.close();
    _database == null;
  }

  Future<void> _onConfigure(Database database) async {
    await database.execute('PRAGMA foreign_keys = ON');
  }
  
  Future<void> _onCreate(Database database, int version) async {}
  Future<void> _onDowngrade(
      Database database, int oldVersion, int version) async {}
  Future<void> _onUpgrade(
      Database database, int oldVersion, int version) async {}
}
