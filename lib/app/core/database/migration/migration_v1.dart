import 'package:sqflite_common/sqlite_api.dart';
import 'package:three_thousand_words/app/core/database/migration/migration.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
        CREATE TABLE words (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          word TEXT NOT NULL,
          pronunciation TEXT,
          meaning TEXT,
        )
    ''');
  }

  @override
  void update(Batch batch) {}
}
