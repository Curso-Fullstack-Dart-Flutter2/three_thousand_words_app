import 'package:sqflite_common/sqlite_api.dart';
import 'package:three_thousand_words/app/core/database/migration/migration.dart';

class MigrationV1 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
        create table wordsLearned(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          word TEXT NOT NULL,
          pronunciation TEXT NOT NULL,
          meaning TEXT NOT NULL
        )
    ''');
  }

  @override
  void update(Batch batch) {}
}
