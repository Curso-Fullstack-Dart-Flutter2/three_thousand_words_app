import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:synchronized/synchronized.dart';
import 'package:three_thousand_words/app/core/database/sqlite_migation_factory.dart';

class SqliteConnectionFactory {
  static const _version = 1;
  static const _databaseName = 'TRHEE_THOUSAND_WORD_DB';

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
    final databasePathFinal = join(databasePath, _databaseName);

    log('* Opening database at path: $databasePath');
    log('* Database path final: $databasePathFinal');

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

  Future<void> _onCreate(Database database, int version) async {
    final batch = database.batch();
    final migrations = SqliteMigationFactory().getCreateMigration();

    for (var migration in migrations) {
      migration.create(batch);
    }

    batch.commit();
  }

  Future<void> _onUpgrade(
      Database database, int oldVersion, int version) async {
    final batch = database.batch();
    final migrations = SqliteMigationFactory().getUpgradeMigration(oldVersion);

    for (var migration in migrations) {
      migration.create(batch);
    }

    batch.commit();
  }

  Future<void> _onDowngrade(
      Database database, int oldVersion, int version) async {}
}
